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


def write_csv_trace(rows, filename, directory=""):
    import csv
    with open(os.path.join(directory, '{filename}.csv'.format(filename=filename)), 'w') as f:
        w = csv.writer(f)
        w.writerows([["time"] + [f for f in rows[0].data._fields]])
        w.writerows([[row.time] + [d for d in row.data] for row in rows])


def write_json_trace(rows, filename, directory="", persistent=True, with_time=True):
    import json
    try:
        os.remove(os.path.join(
            directory, '{filename}.jsonl'.format(filename=filename)))
    except OSError:
        pass

    with open(os.path.join(directory, '{filename}.jsonl'.format(filename=filename)), 'a') as f:
        previous = dict()
        for row in rows:
            if with_time:
                obj = dict(time=row.time)
            else:
                obj = dict()

            if not persistent:
                obj.update(row.data._asdict())
            else:
                current = row.data._asdict()
                current_diff = {(k,  current[k]) for k in current.keys()
                                if not k in previous or previous[k] != current[k]}
                obj.update(current_diff)
                previous = current
            json.dump(obj, f)
            f.write('\n')


def write_flatbuffers_trace(rows, filename, directory="", persistent=True, with_time=True):
    import flatbuffers
    from serialization.Timescales import Message, NullableInt64, NullableBool

    try:
        os.remove(os.path.join(
            directory, '{filename}.bin'.format(filename=filename)))
    except OSError:
        pass

    with open(os.path.join(directory, '{filename}.bin'.format(filename=filename)), 'w+b') as f:
        previous = dict()
        for row in rows:
            builder = flatbuffers.Builder(512)
            Message.MessageStart(builder)

            if with_time:
                Message.MessageAddTime(
                    builder, NullableInt64.CreateNullableInt64(builder, row.time))

            if not persistent:
                current = row.data._asdict()
                if 'p' in current:
                    Message.MessageAddPropP(
                        builder, NullableBool.CreateNullableBool(builder, current['p']))
                if 'q' in current:
                    Message.MessageAddPropQ(
                        builder, NullableBool.CreateNullableBool(builder, current['q']))
                if 'r' in current:
                    Message.MessageAddPropR(
                        builder, NullableBool.CreateNullableBool(builder, current['r']))
                if 's' in current:
                    Message.MessageAddPropS(
                        builder, NullableBool.CreateNullableBool(builder, current['s']))
            else:
                current = row.data._asdict()
                if 'p' in current and (not 'p' in previous or current['p'] != previous['p']):
                    Message.MessageAddPropP(
                        builder, NullableBool.CreateNullableBool(builder, current['p']))
                if 'q' in current and (not 'q' in previous or current['q'] != previous['q']):
                    Message.MessageAddPropQ(
                        builder, NullableBool.CreateNullableBool(builder, current['q']))
                if 'r' in current and (not 'r' in previous or current['r'] != previous['r']):
                    Message.MessageAddPropR(
                        builder, NullableBool.CreateNullableBool(builder, current['r']))
                if 's' in current and (not 's' in previous or current['s'] != previous['s']):
                    Message.MessageAddPropS(
                        builder, NullableBool.CreateNullableBool(builder, current['s']))

                previous = current

            msg = Message.MessageEnd(builder)
            builder.FinishSizePrefixed(msg)
            buf = builder.Output()
            f.write(buf)


def write_protobuf_trace(rows, filename, directory="", persistent=True, with_time=True):
    import serialization.Timescales_pb2 as Timescales
    import struct

    try:
        os.remove(os.path.join(
            directory, '{filename}.bin'.format(filename=filename)))
    except OSError:
        pass

    with open(os.path.join(directory, '{filename}.bin'.format(filename=filename)), 'w+b') as f:
        previous = dict()
        for row in rows:
            msg = Timescales.Message()
            if with_time:
                msg.time = row.time

            if not persistent:
                current = row.data._asdict()
                if 'p' in current:
                    msg.p = current['p']
                if 'q' in current:
                    msg.q = current['q']
                if 'r' in current:
                    msg.r = current['r']
                if 's' in current:
                    msg.s = current['s']
            else:
                current = row.data._asdict()
                if 'p' in current and (not 'p' in previous or current['p'] != previous['p']):
                    msg.p = current['p']
                if 'q' in current and (not 'q' in previous or current['q'] != previous['q']):
                    msg.q = current['q']
                if 'r' in current and (not 'r' in previous or current['r'] != previous['r']):
                    msg.r = current['r']
                if 's' in current and (not 's' in previous or current['s'] != previous['s']):
                    msg.s = current['s']

            # Pack little-endian UInt32
            protobuf = msg.SerializeToString()
            buf_length = struct.pack('<I', len(protobuf))

            f.write(buf_length + protobuf)


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
    elif limit_stutter >= 1:
        rows = forward_eliminate_stuttering(
            rows, limit_stutter)  # Limited condensation
    else:
        raise ValueError(
            "Illegal value for condensation. Must be -1, 0, 1+")

    return past_spec, future_spec, rows
