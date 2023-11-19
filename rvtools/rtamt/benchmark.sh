hyperfine \
    --warmup 1 \
    --runs 2 \
    --export-json "/timescales/results/rtamt.discrete.1M.$(date +%s).json" \
    --command-name AbsentAQ10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:10] q)) -> ((not p since q))' --filepath /timescales/fullsuite/AbsentAQ/Discrete/1M/AbsentAQ10.jsonl" \
    --command-name AbsentAQ100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:100] q)) -> ((not p since q))' --filepath /timescales/fullsuite/AbsentAQ/Discrete/1M/AbsentAQ100.jsonl" \
    --command-name AbsentAQ1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:1000] q)) -> ((not p since q))' --filepath /timescales/fullsuite/AbsentAQ/Discrete/1M/AbsentAQ1000.jsonl" \
    --command-name AbsentBQR10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(r and !q and once q) -> ((not p) since[3:10]  q)' --filepath /timescales/fullsuite/AbsentBQR/Discrete/1M/AbsentBQR10.jsonl" \
    --command-name AbsentBQR100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(r and !q and once q) -> ((not p) since[30:100]  q)' --filepath /timescales/fullsuite/AbsentBQR/Discrete/1M/AbsentBQR100.jsonl" \
    --command-name AbsentBQR1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(r and !q and once q) -> ((not p) since[300:1000]  q)' --filepath /timescales/fullsuite/AbsentBQR/Discrete/1M/AbsentBQR1000.jsonl" \
    --command-name AbsentBR10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(r -> (historically[0:10](not p)))' --filepath /timescales/fullsuite/AbsentBR/Discrete/1M/AbsentBR10.jsonl" \
    --command-name AbsentBR100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(r -> (historically[0:100](not p)))' --filepath /timescales/fullsuite/AbsentBR/Discrete/1M/AbsentBR100.jsonl" \
    --command-name AbsentBR1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(r -> (historically[0:1000](not p)))' --filepath /timescales/fullsuite/AbsentBR/Discrete/1M/AbsentBR1000.jsonl" \
    --command-name AlwaysAQ10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:10] q) -> (p since q))' --filepath /timescales/fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ10.jsonl" \
    --command-name AlwaysAQ100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:100] q) -> (p since q))' --filepath /timescales/fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ100.jsonl" \
    --command-name AlwaysAQ1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:1000] q) -> (p since q))' --filepath /timescales/fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ1000.jsonl" \
    --command-name AlwaysBQR10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r and !q and once q) -> (p since[3:10]  q))' --filepath /timescales/fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR10.jsonl" \
    --command-name AlwaysBQR100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r and !q and once q) -> (p since[30:100]  q))' --filepath /timescales/fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR100.jsonl" \
    --command-name AlwaysBQR1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r and !q and once q) -> (p since[300:1000]  q))' --filepath /timescales/fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR1000.jsonl" \
    --command-name AlwaysBR10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(r -> (historically[0:10] p))' --filepath /timescales/fullsuite/AlwaysBR/Discrete/1M/AlwaysBR10.jsonl" \
    --command-name AlwaysBR100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(r -> (historically[0:100] p))' --filepath /timescales/fullsuite/AlwaysBR/Discrete/1M/AlwaysBR100.jsonl" \
    --command-name AlwaysBR1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(r -> (historically[0:1000] p))' --filepath /timescales/fullsuite/AlwaysBR/Discrete/1M/AlwaysBR1000.jsonl" \
    --command-name RecurBQR10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r and !q and once q) -> ((once[0:10](p or q)) since q))' --filepath /timescales/fullsuite/RecurBQR/Discrete/1M/RecurBQR10.jsonl" \
    --command-name RecurBQR100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r and !q and once q) -> ((once[0:100](p or q)) since q))' --filepath /timescales/fullsuite/RecurBQR/Discrete/1M/RecurBQR100.jsonl" \
    --command-name RecurBQR1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r and !q and once q) -> ((once[0:1000](p or q)) since q))' --filepath /timescales/fullsuite/RecurBQR/Discrete/1M/RecurBQR1000.jsonl" \
    --command-name RecurGLB10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(once[0:10] p)' --filepath /timescales/fullsuite/RecurGLB/Discrete/1M/RecurGLB10.jsonl" \
    --command-name RecurGLB100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(once[0:100] p)' --filepath /timescales/fullsuite/RecurGLB/Discrete/1M/RecurGLB100.jsonl" \
    --command-name RecurGLB1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(once[0:1000] p)' --filepath /timescales/fullsuite/RecurGLB/Discrete/1M/RecurGLB1000.jsonl" \
