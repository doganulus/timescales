import random
from collections import namedtuple

TimedData = namedtuple('TimedData', ["time", 'data'])


class bounded_recurrence_globally(object):

    # @staticmethod
    # def generate_future_formula(lower, upper):
    # 	return "always( eventually[{a},{b}](p))".format(a=lower, b=upper)

    @staticmethod
    def generate_past_formula(upper_bound):
        return "historically(once[:{b}]({{p}}))".format(b=upper_bound)

    @staticmethod
    def generate_future_formula(upper_bound):
        return "always(eventually[:{b}]({{p}}))".format(b=upper_bound)

    @staticmethod
    def generate_trace(upper_bound, duration=1000, failing_end=True):

        Data = namedtuple('Data', ['p'])

        time = 0
        rows = []

        rows += [TimedData(time=time, data=Data(p=True))]
        time += 1

        while time < duration:

            # Draws a random number between lower and upper bounds
            k = random.randint(1, upper_bound)

            for j in range(k-1):
                rows += [TimedData(time=time, data=Data(p=False))]
                time += 1

            rows += [TimedData(time=time, data=Data(p=True))]
            time += 1

        if failing_end:
            for j in range(upper_bound+1):
                rows += [TimedData(time=time, data=Data(p=False))]
                time += 1

            # rows += [TimedData(time=time, data=Data(p=True))]
            # time += 1

        return rows


class bounded_recurrence_between_q_and_r:

    @staticmethod
    def generate_past_formula(upper_bound):
        return "historically(({{r}} && !{{q}} && once {{q}}) -> ((once[:{b}]({{p}} or {{q}})) since {{q}}))".format(b=upper_bound)

    @staticmethod
    def generate_future_formula(upper_bound):
        return "always(({{q}} && !{{r}} && eventually {{r}}) -> ((eventually[:{b}]({{p}} or {{r}})) until {{r}}))".format(b=upper_bound)

    @staticmethod
    def generate_trace(upper_bound, duration=1000, min_recur=True, max_recur=7, failing_end=True):

        Data = namedtuple('Data', ['q', 'p', 'r'])

        time = 0
        rows = []

        while time < duration:

            rows += [TimedData(time=time, data=Data(q=True, p=False, r=False))]
            time += 1

            for i in range(0, random.randint(min_recur, max_recur)):

                # Draws a random number between 0 and the specified time parameter
                k = random.randint(1, upper_bound)

                for j in range(k-1):
                    rows += [TimedData(time=time,
                                       data=Data(q=False, p=False, r=False))]
                    time += 1

                rows += [TimedData(time=time,
                                   data=Data(q=False, p=True, r=False))]
                time += 1

            for j in range(k-1):
                rows += [TimedData(time=time,
                                   data=Data(q=False, p=False, r=False))]
                time += 1

            rows += [TimedData(time=time, data=Data(q=False, p=False, r=True))]
            time += 1

            for j in range(k-1):
                rows += [TimedData(time=time,
                                   data=Data(q=False, p=False, r=False))]
                time += 1

        if failing_end:
            rows += [TimedData(time=time, data=Data(q=True, p=False, r=False))]
            time += 1
            for j in range(upper_bound+1):
                rows += [TimedData(time=time,
                                   data=Data(q=False, p=False, r=False))]
                time += 1
            rows += [TimedData(time=time, data=Data(q=False, p=False, r=True))]
            time += 1
        return rows
