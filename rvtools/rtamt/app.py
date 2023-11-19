#!/usr/bin/env python3

import sys
import argparse

import rtamt
import json
# import simdjson as json

from rtamt.syntax.ast.parser.stl.specification_parser import StlAst
from rtamt.semantics.stl.discrete_time.online.interpreter import StlDiscreteTimeOnlineInterpreter

def monitor(formula, filepath, robustness=False, dense=True):

    if dense:
        spec = rtamt.StlDenseTimeSpecification()
    else:
        spec = rtamt.StlDiscreteTimeSpecification()
    
    if robustness:
        spec.declare_var('p', 'float')
        spec.declare_var('q', 'float')
        spec.declare_var('r', 'float')
        spec.declare_var('z', 'float')
        spec.declare_var('out', 'float')
    else: 
        spec.declare_var('p', 'int')
        spec.declare_var('q', 'int')
        spec.declare_var('r', 'int')
        spec.declare_var('z', 'int')
        spec.declare_var('out', 'int')

    spec.set_var_io_type('p', 'input')
    spec.set_var_io_type('q', 'input')
    spec.set_var_io_type('r', 'input')
    spec.set_var_io_type('z', 'input')

    print(formula)

    spec.spec = 'out = {}'.format(formula)
    spec.parse()

    with open(filepath, 'r') as file:
        for line in file:
            obj = json.loads(line.strip())
            rob = spec.update(obj["time"], obj.items())

    print(rob)

def main(argv):

    parser = argparse.ArgumentParser(
        description='timescales is a benchmark generator for metric temporal logic properties',
        formatter_class=argparse.RawTextHelpFormatter)
    
    parser.add_argument(
        '-f', '--formula',
        help='''define the specification''',
        metavar='STRING')
    
    parser.add_argument(
        '--filepath',
        help='''define the log filepath''',
        metavar='PATH')

    parser.add_argument(
        '-r', '--robustness',
        help='''enable robust time monitoring (default: false)''',
        action="store_true",
        default=False)

    parser.add_argument(
        '-v', '--dense',
        help='''enable dense time monitoring (default: false)''',
        action="store_true",
        default=False)

    args = parser.parse_args()

    monitor(args.formula, args.filepath, args.robustness, args.dense)


if __name__ == '__main__':
    main(sys.argv)
