import random

from collections import namedtuple

TimedData = namedtuple('TimedData', ["time", 'data'])


class bounded_universality_after_q:

    @staticmethod
    def generate_past_formula(upper_bound):
        return "historically((once[:{b}]({{q}})) -> ({{p}} since {{q}}))".format(b=upper_bound)

    @staticmethod
    def generate_future_formula(upper_bound):
        return "always({{q}} -> (always[:{b}] {{p}}))".format(b=upper_bound)

    @staticmethod
    def generate_trace(upper_bound, duration=1000, failing_end=True):

        Data = namedtuple('Data', ['q', 'p'])

        time = 0
        rows = []

        while time < duration:

            rows += [TimedData(time=time, data=Data(q=True, p=True))]
            time += 1

            # Draws a random number between 0 and the specified time parameter

            for j in range(upper_bound):
                rows += [TimedData(time=time, data=Data(q=False, p=True))]
                time += 1

            for j in range(upper_bound):
                rows += [TimedData(time=time, data=Data(q=False,
                                                        p=bool(random.randint(0, 1))))]
                time += 1

        if failing_end:

            rows += [TimedData(time=time, data=Data(q=True, p=False))]
            time += 1
            for j in range(upper_bound-1):
                rows += [TimedData(time=time, data=Data(q=False, p=True))]
                time += 1
            rows += [TimedData(time=time, data=Data(q=False, p=False))]
            time += 1

        return rows


class bounded_universality_before_r:

    @staticmethod
    def generate_past_formula(upper_bound):
        return "historically({{r}} -> (historically[:{b}]({{p}})))".format(b=upper_bound)

    @staticmethod
    def generate_future_formula(upper_bound):
        return "always((eventually[:{b}]({{r}})) -> ({{p}} until {{r}}))".format(b=upper_bound)

    @staticmethod
    def generate_trace(upper_bound, duration=1000, failing_end=True):

        Data = namedtuple('Data', ['p', 'r'])

        time = 0
        rows = []

        while time < duration:

            for j in range(upper_bound):
                rows += [TimedData(time=time,
                                   data=Data(p=bool(random.randint(0, 1)), r=False))]
                time += 1

            for j in range(upper_bound):
                rows += [TimedData(time=time, data=Data(p=True, r=False))]
                time += 1

            rows += [TimedData(time=time, data=Data(p=True, r=True))]
            time += 1

        if failing_end:

            rows += [TimedData(time=time, data=Data(p=False, r=False))]
            time += 1

            for j in range(upper_bound-1):
                rows += [TimedData(time=time, data=Data(p=True, r=False))]
                time += 1

            rows += [TimedData(time=time, data=Data(p=True, r=True))]
            time += 1

        return rows


class bounded_universality_between_q_and_r:

    @staticmethod
    def generate_past_formula(lower_bound, upper_bound):
        return "historically(({{r}} && !{{q}} && once {{q}}) -> ({{p}} since[{a}:{b}] {{q}}))".format(a=lower_bound, b=upper_bound)

    @staticmethod
    def generate_future_formula(lower_bound, upper_bound):
        return "always(({{q}} && !{{r}} && eventually {{r}}) -> ({{p}} until[{a}:{b}] {{r}}))".format(a=lower_bound, b=upper_bound)

    @staticmethod
    def generate_trace(lower_bound, upper_bound, duration=1000, failing_end=True):

        Data = namedtuple('Data', ['q', 'p', 'r'])

        rows = []
        time = 0

        while time < duration:

            rows += [TimedData(time=time, data=Data(q=True, p=True, r=False))]
            time += 1

            # Draws a random number between 0 and the specified time parameter
            k = random.randint(lower_bound, upper_bound-1)

            for j in range(k):
                rows += [TimedData(time=time,
                                   data=Data(q=False, p=True, r=False))]
                time += 1

            rows += [TimedData(time=time, data=Data(q=False, p=True, r=True))]
            time += 1

            rows += [TimedData(time=time,
                               data=Data(q=False, p=False, r=False))]
            time += 1

        if failing_end:
            rows += [TimedData(time=time, data=Data(q=True, p=True, r=False))]
            time += 1
            for j in range(upper_bound+1):
                rows += [TimedData(time=time,
                                   data=Data(q=False, p=True, r=False))]
                time += 1
            rows += [TimedData(time=time, data=Data(q=False, p=True, r=True))]
            time += 1

        return rows
