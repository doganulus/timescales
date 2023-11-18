#!/bin/bash
hyperfine \
    --warmup 2 \
    --runs 10 \
    --export-json "results/reelay2008.discrete.1M.$(date +%s).json" \
    --command-name AbsentAQ10 \
        "ryjson -xr 'historically((once[:10]{q > 0}) -> ((not{p > 0}) since {q > 0}))' fullsuite/AbsentAQ/Discrete/1M/AbsentAQ10.rbt.jsonl" \
    --command-name AbsentAQ100 \
        "ryjson -xr 'historically((once[:100]{q > 0}) -> ((not{p > 0}) since {q > 0}))' fullsuite/AbsentAQ/Discrete/1M/AbsentAQ100.rbt.jsonl" \
    --command-name AbsentAQ1000 \
        "ryjson -xr 'historically((once[:1000]{q > 0}) -> ((not{p > 0}) since {q > 0}))' fullsuite/AbsentAQ/Discrete/1M/AbsentAQ1000.rbt.jsonl" \
    --command-name AbsentBQR10 \
        "ryjson -xr 'historically({r > 0} && !{q > 0} && once{q > 0}) -> ((not{p > 0}) since[3:10] {q > 0})' fullsuite/AbsentBQR/Discrete/1M/AbsentBQR10.rbt.jsonl" \
    --command-name AbsentBQR100 \
        "ryjson -xr 'historically({r > 0} && !{q > 0} && once{q > 0}) -> ((not{p > 0}) since[30:100] {q > 0})' fullsuite/AbsentBQR/Discrete/1M/AbsentBQR100.rbt.jsonl" \
    --command-name AbsentBQR1000 \
        "ryjson -xr 'historically({r > 0} && !{q > 0} && once{q > 0}) -> ((not{p > 0}) since[300:1000] {q > 0})' fullsuite/AbsentBQR/Discrete/1M/AbsentBQR1000.rbt.jsonl" \
    --command-name AbsentBR10 \
        "ryjson -xr 'historically({r > 0} -> (historically[:10](not{p > 0})))' fullsuite/AbsentBR/Discrete/1M/AbsentBR10.rbt.jsonl" \
    --command-name AbsentBR100 \
        "ryjson -xr 'historically({r > 0} -> (historically[:100](not{p > 0})))' fullsuite/AbsentBR/Discrete/1M/AbsentBR100.rbt.jsonl" \
    --command-name AbsentBR1000 \
        "ryjson -xr 'historically({r > 0} -> (historically[:1000](not{p > 0})))' fullsuite/AbsentBR/Discrete/1M/AbsentBR1000.rbt.jsonl" \
    --command-name AlwaysAQ10 \
        "ryjson -xr 'historically((once[:10]{q > 0}) -> ({p > 0} since {q > 0}))' fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ10.rbt.jsonl" \
    --command-name AlwaysAQ100 \
        "ryjson -xr 'historically((once[:100]{q > 0}) -> ({p > 0} since {q > 0}))' fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ100.rbt.jsonl" \
    --command-name AlwaysAQ1000 \
        "ryjson -xr 'historically((once[:1000]{q > 0}) -> ({p > 0} since {q > 0}))' fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ1000.rbt.jsonl" \
    --command-name AlwaysBQR10 \
        "ryjson -xr 'historically(({r > 0} && !{q > 0} && once{q > 0}) -> ({p > 0} since[3:10] {q > 0}))' fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR10.rbt.jsonl" \
    --command-name AlwaysBQR100 \
        "ryjson -xr 'historically(({r > 0} && !{q > 0} && once{q > 0}) -> ({p > 0} since[30:100] {q > 0}))' fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR100.rbt.jsonl" \
    --command-name AlwaysBQR1000 \
        "ryjson -xr 'historically(({r > 0} && !{q > 0} && once{q > 0}) -> ({p > 0} since[300:1000] {q > 0}))' fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR1000.rbt.jsonl" \
    --command-name AlwaysBR10 \
        "ryjson -xr 'historically({r > 0} -> (historically[:10]{p > 0}))' fullsuite/AlwaysBR/Discrete/1M/AlwaysBR10.rbt.jsonl" \
    --command-name AlwaysBR100 \
        "ryjson -xr 'historically({r > 0} -> (historically[:100]{p > 0}))' fullsuite/AlwaysBR/Discrete/1M/AlwaysBR100.rbt.jsonl" \
    --command-name AlwaysBR1000 \
        "ryjson -xr 'historically({r > 0} -> (historically[:1000]{p > 0}))' fullsuite/AlwaysBR/Discrete/1M/AlwaysBR1000.rbt.jsonl" \
    --command-name RecurBQR10 \
        "ryjson -xr 'historically(({r > 0} && !{q > 0} && once{q > 0}) -> ((once[:10]({p > 0} or {q > 0})) since {q > 0}))' fullsuite/RecurBQR/Discrete/1M/RecurBQR10.rbt.jsonl" \
    --command-name RecurBQR100 \
        "ryjson -xr 'historically(({r > 0} && !{q > 0} && once{q > 0}) -> ((once[:100]({p > 0} or {q > 0})) since {q > 0}))' fullsuite/RecurBQR/Discrete/1M/RecurBQR100.rbt.jsonl" \
    --command-name RecurBQR1000 \
        "ryjson -xr 'historically(({r > 0} && !{q > 0} && once{q > 0}) -> ((once[:1000]({p > 0} or {q > 0})) since {q > 0}))' fullsuite/RecurBQR/Discrete/1M/RecurBQR1000.rbt.jsonl" \
    --command-name RecurGLB10 \
        "ryjson -xr 'historically(once[:10]{p > 0})' fullsuite/RecurGLB/Discrete/1M/RecurGLB10.rbt.jsonl" \
    --command-name RecurGLB100 \
        "ryjson -xr 'historically(once[:100]{p > 0})' fullsuite/RecurGLB/Discrete/1M/RecurGLB100.rbt.jsonl" \
    --command-name RecurGLB1000 \
        "ryjson -xr 'historically(once[:1000]{p > 0})' fullsuite/RecurGLB/Discrete/1M/RecurGLB1000.rbt.jsonl" \
    --command-name RespondBQR10 \
        "ryjson -xr 'historically(({r > 0} && !{q > 0} && once{q > 0}) -> ( (({z > 0} -> once[3:10]{p > 0}) and not((not {z > 0}) since[10:] {p > 0})) since {q > 0}))' fullsuite/RespondBQR/Discrete/1M/RespondBQR10.rbt.jsonl" \
    --command-name RespondBQR100 \
        "ryjson -xr 'historically(({r > 0} && !{q > 0} && once{q > 0}) -> ( (({z > 0} -> once[30:100]{p > 0}) and not((not {z > 0}) since[100:] {p > 0})) since {q > 0}))' fullsuite/RespondBQR/Discrete/1M/RespondBQR100.rbt.jsonl" \
    --command-name RespondBQR1000 \
        "ryjson -xr 'historically(({r > 0} && !{q > 0} && once{q > 0}) -> ( (({z > 0} -> once[300:1000]{p > 0}) and not((not {z > 0}) since[1000:] {p > 0})) since {q > 0}))' fullsuite/RespondBQR/Discrete/1M/RespondBQR1000.rbt.jsonl" \
    --command-name RespondGLB10 \
        "ryjson -xr 'historically(({z > 0} -> once[3:10]{p > 0}) and not((not {z > 0}) since[10:] {p > 0}))' fullsuite/RespondGLB/Discrete/1M/RespondGLB10.rbt.jsonl" \
    --command-name RespondGLB100 \
        "ryjson -xr 'historically(({z > 0} -> once[30:100]{p > 0}) and not((not {z > 0}) since[100:] {p > 0}))' fullsuite/RespondGLB/Discrete/1M/RespondGLB100.rbt.jsonl" \
    --command-name RespondGLB1000 \
        "ryjson -xr 'historically(({z > 0} -> once[300:1000]{p > 0}) and not((not {z > 0}) since[1000:] {p > 0}))' fullsuite/RespondGLB/Discrete/1M/RespondGLB1000.rbt.jsonl"
