#!/usr/bin/env python3

import argparse
import timescales
import os

def generate_suite(duration, failing_end, persistent, output_dir):
        
        if not output_dir:
            output_dir = '.'
        output_dir = os.path.abspath(output_dir)
        os.makedirs(output_dir, exist_ok=True)

        rows = timescales.bounded_absence_after_q.generate_trace(
            upper_bound=10, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AbsentAQ",
            directory=output_dir,            
            persistent=persistent
            )
        
        rows = timescales.bounded_absence_before_r.generate_trace(
            upper_bound=10, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AbsentBR",
            directory=output_dir,            
            persistent=persistent
            )

        rows = timescales.bounded_absence_between_q_and_r.generate_trace(
            lower_bound=3, 
            upper_bound=10, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AbsentBQR",
            directory=output_dir,            
            persistent=persistent
            )

        rows = timescales.bounded_universality_after_q.generate_trace(
            upper_bound=10, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AlwaysAQ",
            directory=output_dir,            
            persistent=persistent
            )

        rows = timescales.bounded_universality_before_r.generate_trace(
            upper_bound=10, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AlwaysBR",
            directory=output_dir,            
            persistent=persistent
            )

        rows = timescales.bounded_universality_between_q_and_r.generate_trace(
            lower_bound=3, 
            upper_bound=10, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AlwaysBQR",
            directory=output_dir,            
            persistent=persistent
            )

        rows = timescales.bounded_recurrence_globally.generate_trace(
            upper_bound=10, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="RecurGLB",
            directory=output_dir,            
            persistent=persistent
            )

        rows = timescales.bounded_recurrence_between_q_and_r.generate_trace(
            upper_bound=10, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="RecurBQR",
            directory=output_dir,            
            persistent=persistent
            )

        rows = timescales.bounded_response_globally.generate_trace(
            lower_bound=3, 
            upper_bound=10, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="RespondGLB",
            directory=output_dir,            
            persistent=persistent
            )

        rows = timescales.bounded_response_between_q_and_r.generate_trace(
            lower_bound=3, 
            upper_bound=10, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="RespondBQR",
            directory=output_dir,            
            persistent=persistent
            )

def main():

    parser = argparse.ArgumentParser(
        description='timescales is a benchmark generator for metric temporal logic properties',
        formatter_class=argparse.RawTextHelpFormatter)

    parser.add_argument(
        '-d', '--duration',
        help='''define the approximate duration for the trace''',
        default=10000,
        type=int,
        metavar='N'
        )
    parser.add_argument(
        '-p', '--persistent',
        help='''enable persistent (delta-encoded) trace generation''',
        action="store_true",
        default=False
        )
    parser.add_argument('--failing-end',
        help='''enable appending a sequence to the trace to make the spec fail (default: false)''',
        action="store_true",
        default=False
        )
    parser.add_argument('--output-dir',
        help='''use existing DIR as the directory to write output files in (default: current)''',
        default='',
        metavar='DIR'
        )

    args = parser.parse_args()

    generate_suite(
        args.duration, 
        failing_end=args.failing_end, 
        persistent=args.persistent, 
        output_dir=args.output_dir
    )

if __name__ == '__main__':
    main()
