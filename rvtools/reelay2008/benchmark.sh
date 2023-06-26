#!/bin/bash
hyperfine \
    --warmup 3 \
    --runs 25 \
    --export-json "/timescales/results/reelay2008.discrete.1M.$(date +%s).json" \
    --command-name AbsentAQ10 \
        "ryjson1 -x 'historically((once[:10]{q}) -> ((not{p}) since {q}))' /timescales/fullsuite/AbsentAQ/Discrete/1M/AbsentAQ10.jsonl" \
    --command-name AbsentAQ100 \
        "ryjson1 -x 'historically((once[:100]{q}) -> ((not{p}) since {q}))' /timescales/fullsuite/AbsentAQ/Discrete/1M/AbsentAQ100.jsonl" \
    --command-name AbsentAQ1000 \
        "ryjson1 -x 'historically((once[:1000]{q}) -> ((not{p}) since {q}))' /timescales/fullsuite/AbsentAQ/Discrete/1M/AbsentAQ1000.jsonl" \
    --command-name AbsentBQR10 \
        "ryjson1 -x 'historically({r} && !{q} && once{q}) -> ((not{p}) since[3:10] {q})' /timescales/fullsuite/AbsentBQR/Discrete/1M/AbsentBQR10.jsonl" \
    --command-name AbsentBQR100 \
        "ryjson1 -x 'historically({r} && !{q} && once{q}) -> ((not{p}) since[30:100] {q})' /timescales/fullsuite/AbsentBQR/Discrete/1M/AbsentBQR100.jsonl" \
    --command-name AbsentBQR1000 \
        "ryjson1 -x 'historically({r} && !{q} && once{q}) -> ((not{p}) since[300:1000] {q})' /timescales/fullsuite/AbsentBQR/Discrete/1M/AbsentBQR1000.jsonl" \
    --command-name AbsentBR10 \
        "ryjson1 -x 'historically({r} -> (historically[:10](not{p})))' /timescales/fullsuite/AbsentBR/Discrete/1M/AbsentBR10.jsonl" \
    --command-name AbsentBR100 \
        "ryjson1 -x 'historically({r} -> (historically[:100](not{p})))' /timescales/fullsuite/AbsentBR/Discrete/1M/AbsentBR100.jsonl" \
    --command-name AbsentBR1000 \
        "ryjson1 -x 'historically({r} -> (historically[:1000](not{p})))' /timescales/fullsuite/AbsentBR/Discrete/1M/AbsentBR1000.jsonl" \
    --command-name AlwaysAQ10 \
        "ryjson1 -x 'historically((once[:10]{q}) -> ({p} since {q}))' /timescales/fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ10.jsonl" \
    --command-name AlwaysAQ100 \
        "ryjson1 -x 'historically((once[:100]{q}) -> ({p} since {q}))' /timescales/fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ100.jsonl" \
    --command-name AlwaysAQ1000 \
        "ryjson1 -x 'historically((once[:1000]{q}) -> ({p} since {q}))' /timescales/fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ1000.jsonl" \
    --command-name AlwaysBQR10 \
        "ryjson1 -x 'historically(({r} && !{q} && once{q}) -> ({p} since[3:10] {q}))' /timescales/fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR10.jsonl" \
    --command-name AlwaysBQR100 \
        "ryjson1 -x 'historically(({r} && !{q} && once{q}) -> ({p} since[30:100] {q}))' /timescales/fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR100.jsonl" \
    --command-name AlwaysBQR1000 \
        "ryjson1 -x 'historically(({r} && !{q} && once{q}) -> ({p} since[300:1000] {q}))' /timescales/fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR1000.jsonl" \
    --command-name AlwaysBR10 \
        "ryjson1 -x 'historically({r} -> (historically[:10]{p}))' /timescales/fullsuite/AlwaysBR/Discrete/1M/AlwaysBR10.jsonl" \
    --command-name AlwaysBR100 \
        "ryjson1 -x 'historically({r} -> (historically[:100]{p}))' /timescales/fullsuite/AlwaysBR/Discrete/1M/AlwaysBR100.jsonl" \
    --command-name AlwaysBR1000 \
        "ryjson1 -x 'historically({r} -> (historically[:1000]{p}))' /timescales/fullsuite/AlwaysBR/Discrete/1M/AlwaysBR1000.jsonl" \
    --command-name RecurBQR10 \
        "ryjson1 -x 'historically(({r} && !{q} && once{q}) -> ((once[:10]({p} or {q})) since {q}))' /timescales/fullsuite/RecurBQR/Discrete/1M/RecurBQR10.jsonl" \
    --command-name RecurBQR100 \
        "ryjson1 -x 'historically(({r} && !{q} && once{q}) -> ((once[:100]({p} or {q})) since {q}))' /timescales/fullsuite/RecurBQR/Discrete/1M/RecurBQR100.jsonl" \
    --command-name RecurBQR1000 \
        "ryjson1 -x 'historically(({r} && !{q} && once{q}) -> ((once[:1000]({p} or {q})) since {q}))' /timescales/fullsuite/RecurBQR/Discrete/1M/RecurBQR1000.jsonl" \
    --command-name RecurGLB10 \
        "ryjson1 -x 'historically(once[:10]{p})' /timescales/fullsuite/RecurGLB/Discrete/1M/RecurGLB10.jsonl" \
    --command-name RecurGLB100 \
        "ryjson1 -x 'historically(once[:100]{p})' /timescales/fullsuite/RecurGLB/Discrete/1M/RecurGLB100.jsonl" \
    --command-name RecurGLB1000 \
        "ryjson1 -x 'historically(once[:1000]{p})' /timescales/fullsuite/RecurGLB/Discrete/1M/RecurGLB1000.jsonl" \
    --command-name RespondBQR10 \
        "ryjson1 -x 'historically(({r} && !{q} && once{q}) -> ( (({s} -> once[3:10]{p}) and not((not {s}) since[10:] {p})) since {q}))' /timescales/fullsuite/RespondBQR/Discrete/1M/RespondBQR10.jsonl" \
    --command-name RespondBQR100 \
        "ryjson1 -x 'historically(({r} && !{q} && once{q}) -> ( (({s} -> once[30:100]{p}) and not((not {s}) since[100:] {p})) since {q}))' /timescales/fullsuite/RespondBQR/Discrete/1M/RespondBQR100.jsonl" \
    --command-name RespondBQR1000 \
        "ryjson1 -x 'historically(({r} && !{q} && once{q}) -> ( (({s} -> once[300:1000]{p}) and not((not {s}) since[1000:] {p})) since {q}))' /timescales/fullsuite/RespondBQR/Discrete/1M/RespondBQR1000.jsonl" \
    --command-name RespondGLB10 \
        "ryjson1 -x 'historically(({s} -> once[3:10]{p}) and not((not {s}) since[10:] {p}))' /timescales/fullsuite/RespondGLB/Discrete/1M/RespondGLB10.jsonl" \
    --command-name RespondGLB100 \
        "ryjson1 -x 'historically(({s} -> once[30:100]{p}) and not((not {s}) since[100:] {p}))' /timescales/fullsuite/RespondGLB/Discrete/1M/RespondGLB100.jsonl" \
    --command-name RespondGLB1000 \
        "ryjson1 -x 'historically(({s} -> once[300:1000]{p}) and not((not {s}) since[1000:] {p}))' /timescales/fullsuite/RespondGLB/Discrete/1M/RespondGLB1000.jsonl"
