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
            filename="AbsentAQ10",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_absence_after_q.generate_trace(
            upper_bound=100, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AbsentAQ100",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_absence_after_q.generate_trace(
            upper_bound=1000, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AbsentAQ1000",
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
            filename="AbsentBR10",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_absence_before_r.generate_trace(
            upper_bound=100, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AbsentBR100",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_absence_before_r.generate_trace(
            upper_bound=1000, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AbsentBR1000",
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
            filename="AbsentBQR10",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_absence_between_q_and_r.generate_trace(
            lower_bound=30, 
            upper_bound=100, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AbsentBQR100",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_absence_between_q_and_r.generate_trace(
            lower_bound=300, 
            upper_bound=1000, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AbsentBQR1000",
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
            filename="AlwaysAQ10",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_universality_after_q.generate_trace(
            upper_bound=100, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AlwaysAQ100",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_universality_after_q.generate_trace(
            upper_bound=1000, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AlwaysAQ1000",
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
            filename="AlwaysBR10",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_universality_before_r.generate_trace(
            upper_bound=100, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AlwaysBR100",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_universality_before_r.generate_trace(
            upper_bound=1000, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AlwaysBR1000",
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
            filename="AlwaysBQR10",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_universality_between_q_and_r.generate_trace(
            lower_bound=30, 
            upper_bound=100, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AlwaysBQR100",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_universality_between_q_and_r.generate_trace(
            lower_bound=300, 
            upper_bound=1000, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="AlwaysBQR1000",
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
            filename="RecurGLB10",
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
            filename="RecurGLB100",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_recurrence_globally.generate_trace(
            upper_bound=1000, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="RecurGLB1000",
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
            filename="RecurBQR10",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_recurrence_between_q_and_r.generate_trace(
            upper_bound=100, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="RecurBQR100",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_recurrence_between_q_and_r.generate_trace(
            upper_bound=1000, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="RecurBQR1000",
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
            filename="RespondGLB10",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_response_globally.generate_trace(
            lower_bound=30, 
            upper_bound=100, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="RespondGLB100",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_response_globally.generate_trace(
            lower_bound=300, 
            upper_bound=1000, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="RespondGLB1000",
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
            filename="RespondBQR10",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_response_between_q_and_r.generate_trace(
            lower_bound=30, 
            upper_bound=100, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="RespondBQR100",
            directory=output_dir,            
            persistent=persistent
            )
        rows = timescales.bounded_response_between_q_and_r.generate_trace(
            lower_bound=300, 
            upper_bound=1000, 
            duration=duration, 
            failing_end=failing_end
            )
        timescales.write_json_trace(
            rows, 
            filename="RespondBQR1000",
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
        default=1000000,
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
