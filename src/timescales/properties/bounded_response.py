import random

from collections import namedtuple

TimedData = namedtuple('TimedData', ["time", 'data'])


class bounded_response_globally:

    @staticmethod
    def generate_past_formula(lower_bound, upper_bound):
        return "historically(({{s}} -> once[{a}:{b}] {{p}}) and not( not({{s}}) since[{b}:] {{p}}))".format(a=lower_bound, b=upper_bound)

    @staticmethod
    def generate_future_formula(lower_bound, upper_bound):
        return "always({{p}} -> eventually[{a}:{b}] {{s}})".format(a=lower_bound, b=upper_bound)

    @staticmethod
    def generate_trace(lower_bound, upper_bound, duration=1000, failing_end=True):

        Data = namedtuple('Data', ['p', 's'])

        time = 0
        rows = []

        while time < duration:

            rows += [TimedData(time=time, data=Data(p=True, s=False))]
            time += 1

            # Draws a random number between lower and upper bounds
            k = random.randint(lower_bound+1, upper_bound)

            for j in range(k-1):
                rows += [TimedData(time=time, data=Data(p=False, s=False))]
                time += 1

            rows += [TimedData(time=time, data=Data(p=False, s=True))]
            time += 1

        if failing_end:

            rows += [TimedData(time=time, data=Data(p=True, s=False))]
            time += 1
            for j in range(upper_bound):
                rows += [TimedData(time=time, data=Data(p=False, s=False))]
                time += 1

        return rows


class bounded_response_between_q_and_r:

    @staticmethod
    def generate_past_formula(lower_bound, upper_bound):
        return "historically(({{r}} && !{{q}} && once {{q}}) -> ( (({{s}} -> once[{a}:{b}] {{p}}) and not( not({{s}}) since[{b}:] {{p}})) since {{q}}))".format(a=lower_bound, b=upper_bound)

    @staticmethod
    def generate_future_formula(lower_bound, upper_bound):
        return "always(({{q}} && !{{r}} && eventually {{r}}) -> ({{p}} -> (!{{r}} until[{a}:{b}] ({{s}} and !{{r}})) until {{r}}))".format(a=lower_bound, b=upper_bound)

    @staticmethod
    def generate_trace(lower_bound, upper_bound, min_recur=True, max_recur=7, duration=1000, failing_end=True):

        Data = namedtuple('Data', ['q', 'p', 's', 'r'])

        time = 0
        rows = []

        while time < duration:

            rows += [TimedData(time=time, data=Data(q=True,
                                                    p=False, s=False, r=False))]
            time += 1

            rows += [TimedData(time=time,
                               data=Data(q=False, p=False, s=False, r=False))]
            time += 1

            for i in range(0, random.randint(min_recur, max_recur)):

                rows += [TimedData(time=time,
                                   data=Data(q=False, p=True, s=False, r=False))]
                time += 1

                # Draws a random number between lower and upper bounds
                k = random.randint(lower_bound+1, upper_bound)

                for j in range(k-1):
                    rows += [TimedData(time=time,
                                       data=Data(q=False, p=False, s=False, r=False))]
                    time += 1

                rows += [TimedData(time=time,
                                   data=Data(q=False, p=False, s=True, r=False))]
                time += 1

                rows += [TimedData(time=time,
                                   data=Data(q=False, p=False, s=False, r=False))]
                time += 1

            rows += [TimedData(time=time,
                               data=Data(q=False, p=False, s=False, r=True))]
            time += 1

        if failing_end:

            rows += [TimedData(time=time, data=Data(q=True,
                                                    p=False, s=False, r=False))]
            time += 1

            rows += [TimedData(time=time,
                               data=Data(q=False, p=True, s=False, r=False))]
            time += 1

            for j in range(upper_bound+1):
                rows += [TimedData(time=time,
                                   data=Data(q=False, p=False, s=False, r=False))]
                time += 1

            rows += [TimedData(time=time,
                               data=Data(q=False, p=False, s=False, r=True))]
            time += 1

        return rows
