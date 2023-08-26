#!/bin/bash
hyperfine \
    --warmup 3 \
    --runs 25 \
    --export-json "results/reelay2008.discrete.untimed.1M.$(date +%s).json" \
    --command-name AbsentAQ10 \
        "ryjson -x 'historically((once{q}) -> ((not{p}) since {q}))' fullsuite/AbsentAQ/Discrete/1M/AbsentAQ10.jsonl" \
    --command-name AbsentAQ100 \
        "ryjson -x 'historically((once{q}) -> ((not{p}) since {q}))' fullsuite/AbsentAQ/Discrete/1M/AbsentAQ100.jsonl" \
    --command-name AbsentAQ1000 \
        "ryjson -x 'historically((once{q}) -> ((not{p}) since {q}))' fullsuite/AbsentAQ/Discrete/1M/AbsentAQ1000.jsonl" \
    --command-name AbsentBQR10 \
        "ryjson -x 'historically({r} && !{q} && once{q}) -> ((not{p}) since {q})' fullsuite/AbsentBQR/Discrete/1M/AbsentBQR10.jsonl" \
    --command-name AbsentBQR100 \
        "ryjson -x 'historically({r} && !{q} && once{q}) -> ((not{p}) since {q})' fullsuite/AbsentBQR/Discrete/1M/AbsentBQR100.jsonl" \
    --command-name AbsentBQR1000 \
        "ryjson -x 'historically({r} && !{q} && once{q}) -> ((not{p}) since {q})' fullsuite/AbsentBQR/Discrete/1M/AbsentBQR1000.jsonl" \
    --command-name AbsentBR10 \
        "ryjson -x 'historically({r} -> (historically(not{p})))' fullsuite/AbsentBR/Discrete/1M/AbsentBR10.jsonl" \
    --command-name AbsentBR100 \
        "ryjson -x 'historically({r} -> (historically(not{p})))' fullsuite/AbsentBR/Discrete/1M/AbsentBR100.jsonl" \
    --command-name AbsentBR1000 \
        "ryjson -x 'historically({r} -> (historically(not{p})))' fullsuite/AbsentBR/Discrete/1M/AbsentBR1000.jsonl" \
    --command-name AlwaysAQ10 \
        "ryjson -x 'historically((once{q}) -> ({p} since {q}))' fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ10.jsonl" \
    --command-name AlwaysAQ100 \
        "ryjson -x 'historically((once{q}) -> ({p} since {q}))' fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ100.jsonl" \
    --command-name AlwaysAQ1000 \
        "ryjson -x 'historically((once{q}) -> ({p} since {q}))' fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ1000.jsonl" \
    --command-name AlwaysBQR10 \
        "ryjson -x 'historically(({r} && !{q} && once{q}) -> ({p} since {q}))' fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR10.jsonl" \
    --command-name AlwaysBQR100 \
        "ryjson -x 'historically(({r} && !{q} && once{q}) -> ({p} since {q}))' fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR100.jsonl" \
    --command-name AlwaysBQR1000 \
        "ryjson -x 'historically(({r} && !{q} && once{q}) -> ({p} since {q}))' fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR1000.jsonl" \
    --command-name AlwaysBR10 \
        "ryjson -x 'historically({r} -> (historically{p}))' fullsuite/AlwaysBR/Discrete/1M/AlwaysBR10.jsonl" \
    --command-name AlwaysBR100 \
        "ryjson -x 'historically({r} -> (historically{p}))' fullsuite/AlwaysBR/Discrete/1M/AlwaysBR100.jsonl" \
    --command-name AlwaysBR1000 \
        "ryjson -x 'historically({r} -> (historically{p}))' fullsuite/AlwaysBR/Discrete/1M/AlwaysBR1000.jsonl" \
    --command-name RecurBQR10 \
        "ryjson -x 'historically(({r} && !{q} && once{q}) -> ((once({p} or {q})) since {q}))' fullsuite/RecurBQR/Discrete/1M/RecurBQR10.jsonl" \
    --command-name RecurBQR100 \
        "ryjson -x 'historically(({r} && !{q} && once{q}) -> ((once({p} or {q})) since {q}))' fullsuite/RecurBQR/Discrete/1M/RecurBQR100.jsonl" \
    --command-name RecurBQR1000 \
        "ryjson -x 'historically(({r} && !{q} && once{q}) -> ((once({p} or {q})) since {q}))' fullsuite/RecurBQR/Discrete/1M/RecurBQR1000.jsonl" \
    --command-name RecurGLB10 \
        "ryjson -x 'historically(once{p})' fullsuite/RecurGLB/Discrete/1M/RecurGLB10.jsonl" \
    --command-name RecurGLB100 \
        "ryjson -x 'historically(once{p})' fullsuite/RecurGLB/Discrete/1M/RecurGLB100.jsonl" \
    --command-name RecurGLB1000 \
        "ryjson -x 'historically(once{p})' fullsuite/RecurGLB/Discrete/1M/RecurGLB1000.jsonl" \
    --command-name RespondBQR10 \
        "ryjson -x 'historically(({r} && !{q} && once{q}) -> ( (({s} -> once{p}) and not((not {s}) since {p})) since {q}))' fullsuite/RespondBQR/Discrete/1M/RespondBQR10.jsonl" \
    --command-name RespondBQR100 \
        "ryjson -x 'historically(({r} && !{q} && once{q}) -> ( (({s} -> once{p}) and not((not {s}) since {p})) since {q}))' fullsuite/RespondBQR/Discrete/1M/RespondBQR100.jsonl" \
    --command-name RespondBQR1000 \
        "ryjson -x 'historically(({r} && !{q} && once{q}) -> ( (({s} -> once{p}) and not((not {s}) since {p})) since {q}))' fullsuite/RespondBQR/Discrete/1M/RespondBQR1000.jsonl" \
    --command-name RespondGLB10 \
        "ryjson -x 'historically(({s} -> once{p}) and not((not {s}) since {p}))' fullsuite/RespondGLB/Discrete/1M/RespondGLB10.jsonl" \
    --command-name RespondGLB100 \
        "ryjson -x 'historically(({s} -> once{p}) and not((not {s}) since {p}))' fullsuite/RespondGLB/Discrete/1M/RespondGLB100.jsonl" \
    --command-name RespondGLB1000 \
        "ryjson -x 'historically(({s} -> once{p}) and not((not {s}) since {p}))' fullsuite/RespondGLB/Discrete/1M/RespondGLB1000.jsonl"
