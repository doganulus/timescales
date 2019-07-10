import re
import csv
import yaml

from pathlib import Path
from monitors import mtl

for tracefile in Path('./smallsuite').glob('**/*.csv'):

    specfile = Path(tracefile.parent).joinpath(tracefile.stem + ".yaml")
    spec = yaml.safe_load(open(specfile))

    pattern = spec["pattern"]
    #
    # Syntax hacks between tools since python-monitors use a slightly different syntax
    # Future --> Past
    #
    pattern = re.sub("\[:", "[0:", pattern)
    pattern = re.sub(':\]', ':100000000]', pattern)
    pattern = re.sub(':', ',', pattern)
    pattern = re.sub('eventually', 'once', pattern)
    pattern = re.sub('until', 'since', pattern)
    #
    #
    #
    monitor = mtl.monitor(pattern)
    passed = True

    with open(tracefile) as trace:
        trace_reader = csv.DictReader(trace, delimiter=',')
        for row in reversed(list(trace_reader)):
            rowd = dict([(k, int(v))for k, v in row.items()])
            output = monitor.update(**rowd)
            if not output:            
                passed = False
                print("Error at {}".format(rowd['time']))
                break
    
    if passed:
        print("Property {} passed.".format(tracefile.stem))
    else:
        print("Property {} failed.".format(tracefile.stem))


