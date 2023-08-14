#!/bin/bash
hyperfine \
    --warmup 1 \
    --runs 2 \
    --export-json "/timescales/results/dejavu.discrete.1M.$(date +%s).json" \
    --command-name Access \
        "dejavu /examples/access/prop1.qtl /examples/access/log4.csv > /dev/null 2>&1" \
    --command-name File \
        "dejavu /examples/file/prop.qtl /examples/file/log4.csv > /dev/null 2>&1" \
    --command-name LocksBasic \
        "dejavu /examples/locks/basic/prop.qtl /examples/locks/basic/log4.csv > /dev/null 2>&1" \
    --command-name LocksDataraces \
        "dejavu /examples/locks/dataraces/prop.qtl /examples/locks/dataraces/log4.csv > /dev/null 2>&1" \
    --command-name LocksDeadlocks \
        "dejavu /examples/locks/deadlocks/prop.qtl /examples/locks/deadlocks/log4.csv > /dev/null 2>&1" \
    --command-name TelemetryProp1 \
        "dejavu /examples/telemetry/prop1.qtl /examples/telemetry/biglog1000k.csv > /dev/null 2>&1" \
    --command-name TelemetryProp2 \
        "dejavu /examples/telemetry/prop2.qtl /examples/telemetry/biglog1000k.csv > /dev/null 2>&1" \
