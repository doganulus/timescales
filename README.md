## timescales

`timescales` is a benchmark generator bundle for Metric Temporal Logic (MTL) monitoring tools. The included benchmark generator `reelay_benchgen`, which is originally developed for the monitoring tool [Reelay](https://github.com/doganulus/reelay). It generates a past MTL specification (in standard YAML format) and an input trace (in standard CSV format) that satisfies the formula at every time point. A set of parametrized temporal properties and challenging cases is available through the interface. Please see the help and [documentation](https://github.com/runtime-verification/benchmark-challenge-2018/blob/master/MTL/timescales/doc/timescales-crv2018.pdf) for more information.

The purpose of these benchmarks is to measure the performance and scalability of MTL monitoring tools with respect to large timing bounds in the specification over some typical and extreme cases. Ideally, the performance of real-time monitoring tools should remain constant when the base time unit has changed. This is due to that different (parts of) systems use different time scales up to orders of magnitude and the specification of slower systems contain large timing bounds.

## use

The bundle `timescales` includes a Makefile to demonstrate the generation of benchmarks. For each supported property, the command `make small` generates a benchmark that contains a specification with small timing bounds and a short trace. On the other hand, the command `make large` generates three benchmarks for each property with increasingly larger time bounds (1x, 10x, 100x) over traces with a length of 1 million. The large suite has a size of 400MB and is not included in the distribution. The customization of benchmark generation can be done easily using the interface of `reelay_benchgen`.

## help

The Python script `reelay_benchgen` is the benchmark generator of `timescales`. The full interface of the benchmark generator is as follows:

    usage: reelay_benchgen [-h] [-d N] [-l N] [-u N] [--min-recur N]
                           [--max-recur N] [--name STRING] [--limit-stutter N]
                           [--no-failing-end] [--output-dir DIR]
                           property
     
    reelay-benchgen is a benchmark generator for metric temporal logic properties
     
    positional arguments:
      property            Supported properties are below:
                              absence_after_q                   UBOUND
                              absence_before_r                  UBOUND
                              absence_between_q_and_r    LBOUND UBOUND
     
                              always_after_q                    UBOUND
                              always_before_r                   UBOUND
                              always_between_q_and_r     LBOUND UBOUND
     
                              recurrence_globally               UBOUND
                              recurrence_between_q_and_r        UBOUND MIN_RECUR MAX_RECUR
     
                              response_globally          LBOUND UBOUND
                              response_between_q_and_r   LBOUND UBOUND MIN_RECUR MAX_RECUR
     
                              challenge_pandq            LBOUND UBOUND
                              challenge_delay            LBOUND UBOUND
     
    optional arguments:
      -h, --help          show this help message and exit
      -d N, --duration N  define the approximate duration for the trace
      -l N, --lbound N    define the lower bound for the property if available for the property
      -u N, --ubound N    define the upper bound for the property if available for the property
      --min-recur N       define the minimum number of recurrence in the trace if available for the property
      --max-recur N       define the maximum number of recurrence in the trace if available for the property
      --name STRING       define the name of specification (default: MySpec)
      --limit-stutter N   define the maximum amount of stuttering in the trace (default: 0 -- No limit)
      --no-failing-end    disable appending a sequence to the trace to make the spec fail (default: Enabled)
      --output-dir DIR    use existing DIR as the directory to write output files in