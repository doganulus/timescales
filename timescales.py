import os
import sys

from collections import namedtuple

from properties.bounded_absence import *
from properties.bounded_universality import *
from properties.bounded_recurrence import *
from properties.bounded_response import *


def eliminate_stuttering(rows, cap=None):

    if cap == None:
        cap = sys.maxsize

    prev = rows[0]
    nrows = [rows[0]]

    for row in rows[1:-1]:
        if (row.data != prev.data) or (prev.time - nrows[-1].time >= cap):
            nrows += [prev]
        prev = row

    nrows += [rows[-1]]

    return nrows[1:]


def forward_persistance(rows):

    prev = rows[0]
    nrows = [rows[0]]

    for row in rows[1:]:
        if (row.data != prev.data):
            nrows += [row]
        else:
            nrows += [None]
        prev = row

    return nrows


def forward_eliminate_stuttering(rows, cap=None):

    if cap == None:
        cap = sys.maxsize

    prev = rows[0]
    nrows = [rows[0]]

    for row in rows[1:]:
        if (row.data != prev.data) or (prev.time - nrows[-1].time >= cap):
            nrows += [row]
        prev = row

    return nrows


def write_spec(spec, filename, directory=""):
    spec = '''---
name : "{name}"
pattern : "{spec}"
'''.format(name=filename, spec=spec)

    with open(os.path.join(directory, '{filename}.yaml'.format(filename=filename)), 'w') as f:
        f.write(spec)


def write_trace(rows, filename, directory="", format='csv'):

    if format == 'csv':
        import csv
        with open(os.path.join(directory, '{filename}.csv'.format(filename=filename)), 'w') as f:
            w = csv.writer(f)
            w.writerows([["time"] + [f for f in rows[0].data._fields]])
            w.writerows([[row.time] + [d for d in row.data] for row in rows])

    elif format == 'json':
        import json

        try:
            os.remove(os.path.join(
                directory, '{filename}.jsonl'.format(filename=filename)))
        except OSError:
            pass

        with open(os.path.join(directory, '{filename}.jsonl'.format(filename=filename)), 'a') as f:
            for row in rows:
                if(row != None):
                    obj = dict(time=row.time)
                    obj.update(row.data._asdict())
                    json.dump(obj, f)
                    f.write('\n')
                else:
                    json.dump(dict(), f)
                    f.write('\n')

    else:
        raise ValueError(
            "Unknown output format. Please see the help for supported output formats.")


def generate(property, lower_bound, upper_bound, min_recur, max_recur, duration, limit_stutter, failing_end):

    past_spec = ""
    future_spec = ""
    rows = []

    if property == "absence_after_q":
        past_spec = bounded_absence_after_q.generate_past_formula(upper_bound)
        future_spec = bounded_absence_after_q.generate_future_formula(
            upper_bound)
        rows = bounded_absence_after_q.generate_trace(
            upper_bound, duration, failing_end)

    elif property == "absence_before_r":
        past_spec = bounded_absence_before_r.generate_past_formula(upper_bound)
        future_spec = bounded_absence_before_r.generate_future_formula(
            upper_bound)
        rows = bounded_absence_before_r.generate_trace(
            upper_bound, duration, failing_end)

    elif property == "absence_between_q_and_r":
        past_spec = bounded_absence_between_q_and_r.generate_past_formula(
            lower_bound, upper_bound)
        future_spec = bounded_absence_between_q_and_r.generate_future_formula(
            lower_bound, upper_bound)
        rows = bounded_absence_between_q_and_r.generate_trace(
            lower_bound, upper_bound, duration, failing_end)

    elif property == "always_after_q":
        past_spec = bounded_universality_after_q.generate_past_formula(
            upper_bound)
        future_spec = bounded_universality_after_q.generate_future_formula(
            upper_bound)
        rows = bounded_universality_after_q.generate_trace(
            upper_bound, duration, failing_end)

    elif property == "always_before_r":
        past_spec = bounded_universality_before_r.generate_past_formula(
            upper_bound)
        future_spec = bounded_universality_before_r.generate_future_formula(
            upper_bound)
        rows = bounded_universality_before_r.generate_trace(
            upper_bound, duration, failing_end)

    elif property == "always_between_q_and_r":
        past_spec = bounded_universality_between_q_and_r.generate_past_formula(
            lower_bound, upper_bound)
        future_spec = bounded_universality_between_q_and_r.generate_future_formula(
            lower_bound, upper_bound)
        rows = bounded_universality_between_q_and_r.generate_trace(
            lower_bound, upper_bound, duration, failing_end)

    elif property == "recurrence_globally":
        past_spec = bounded_recurrence_globally.generate_past_formula(
            upper_bound)
        future_spec = bounded_recurrence_globally.generate_future_formula(
            upper_bound)
        rows = bounded_recurrence_globally.generate_trace(
            upper_bound, duration, failing_end)

    elif property == "recurrence_between_q_and_r":
        past_spec = bounded_recurrence_between_q_and_r.generate_past_formula(
            upper_bound)
        future_spec = bounded_recurrence_between_q_and_r.generate_future_formula(
            upper_bound)
        rows = bounded_recurrence_between_q_and_r.generate_trace(
            upper_bound, duration, min_recur, max_recur, failing_end)

    elif property == "response_globally":
        past_spec = bounded_response_globally.generate_past_formula(
            lower_bound, upper_bound)
        future_spec = bounded_response_globally.generate_future_formula(
            lower_bound, upper_bound)
        rows = bounded_response_globally.generate_trace(
            lower_bound, upper_bound, duration, failing_end)

    elif property == "response_between_q_and_r":
        past_spec = bounded_response_between_q_and_r.generate_past_formula(
            lower_bound, upper_bound)
        future_spec = bounded_response_between_q_and_r.generate_future_formula(
            lower_bound, upper_bound)
        rows = bounded_response_between_q_and_r.generate_trace(
            lower_bound, upper_bound, min_recur, max_recur, duration, failing_end)

    else:
        raise ValueError(
            "Unknown property. Please see the help for supported properties.")

    if limit_stutter == -1:
        rows = forward_eliminate_stuttering(rows, None)  # Maximum condensation
    elif limit_stutter == 0:
        pass  # No condensation
    elif limit_stutter == 1:
        rows = forward_persistance(rows)  # Minimum condensation
    elif limit_stutter >= 2:
        rows = forward_eliminate_stuttering(
            rows, limit_stutter)  # Limited condensation
    else:
        raise ValueError(
            "Illegal value for condensation. Must be -1, 0, 1, or 2+")

    return past_spec, future_spec, rows
