## timescales

`timescales` is a benchmark generator for Metric Temporal Logic (MTL) monitoring tools. It is originally developed for the monitoring tool [Reelay](https://github.com/doganulus/reelay) but distributed standalone. It generates an MTL specification (as a standard YAML file) and an input trace (as a standard CSV file) that satisfies the formula at every time point. For the benchmark generation, a set of predefined timed properties are available through the interface. Please see the help and documentation for more information.

The purpose of these benchmarks is to measure the performance and scalability of MTL monitoring tools with respect to large timing bounds in the specification over some typical cases. Ideally, the performance of real-time monitoring tools should remain constant when the base time unit has changed. This is due to that different (parts of) systems use different time scales up to orders of magnitude and the specification of slower systems contain large timing bounds.

## use

The generator `timescales` includes a Makefile to demonstrate the generation of benchmarks. For each supported property, the command `make small` generates a benchmark that contains a specification with small timing bounds and a short trace. On the other hand, the command `make large` generates three benchmarks for each property with increasingly larger time bounds (1x, 10x, 100x) over traces with a length of 1 million. The large suite has a size of 400MB and is not included in the distribution. Finally the command `make full` extends the large suite by dense time behaviors. The large suite has a size of 550MB and is not included in the distribution. Besides these default benchkmark suites, the customization of benchmark generation can be done easily using the command line interface of `timescales`.

## help

The full interface of the benchmark generator `timescales` is as follows:

    usage: timescales [-h] [-d N] [-l N] [-u N] [--min-recur N] [--max-recur N]
                      [--name STRING] [--condense N] [--failing-end] [--future]
                      [--output-dir DIR]
                      property
                      
    timescales is a benchmark generator for metric temporal logic properties
         
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
     
    optional arguments:
      -h, --help          show this help message and exit
      -d N, --duration N  define the approximate duration for the trace
      -l N, --lbound N    define the lower bound for the property if available for the property
      -u N, --ubound N    define the upper bound for the property if available for the property
      --min-recur N       define the minimum number of recurrence in the trace if available for the property
      --max-recur N       define the maximum number of recurrence in the trace if available for the property
      --name STRING       define the name of specification (default: spec)
      --condense N        define the maximum amount of condensation in the generated trace (default: 0)
      --failing-end       disable appending a sequence to the trace to make the spec fail (default: false)
      --future            generate a future MTL formula (default: past)
      --output-dir DIR    use existing DIR as the directory to write output files in (default: current)
