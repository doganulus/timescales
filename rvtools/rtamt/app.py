#!/usr/bin/env python3

import sys
import argparse

import rtamt
import json
# import simdjson as json

from rtamt.syntax.ast.parser.stl.specification_parser import StlAst
from rtamt.semantics.stl.discrete_time.online.interpreter import StlDiscreteTimeOnlineInterpreter

def discrete_time_monitor(formula, filepath):

    spec = rtamt.StlDiscreteTimeSpecification()
    spec.declare_var('p', 'float')
    spec.declare_var('q', 'float')
    spec.declare_var('r', 'float')
    spec.declare_var('s', 'float')
    spec.declare_var('out', 'float')

    spec.set_var_io_type('p', 'input')
    spec.set_var_io_type('q', 'input')
    spec.set_var_io_type('r', 'input')
    spec.set_var_io_type('s', 'input')

    print(formula)

    spec.spec = 'out = {}'.format(formula)
    spec.parse()

    with open(filepath, 'r') as file:
        for line in file:
            obj = json.loads(line.strip())
            rob = spec.update(obj["time"], obj.items())

def main(argv):

    parser = argparse.ArgumentParser(
        description='timescales is a benchmark generator for metric temporal logic properties',
        formatter_class=argparse.RawTextHelpFormatter)
    
    parser.add_argument('-f','--formula',
                        help='''define the specification''',
                        metavar='STRING')
    
    parser.add_argument('--filepath',
                        help='''define the log filepath''',
                        metavar='PATH')
    
    args = parser.parse_args()

    discrete_time_monitor(args.formula, args.filepath)


if __name__ == '__main__':
    main(sys.argv)
