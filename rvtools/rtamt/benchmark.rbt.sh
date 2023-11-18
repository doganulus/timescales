hyperfine \
    --warmup 1 \
    --runs 2 \
    --export-json "/timescales/results/rtamt.discrete.1M.$(date +%s).json" \
    --command-name AbsentAQ10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:10](q > 0))) -> ((not (p > 0) since (q > 0)))' --filepath /timescales/fullsuiteAbsentAQ/Discrete/1M/AbsentAQ10.rbt.jsonl" \
    --command-name AbsentAQ100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:100](q > 0))) -> ((not (p > 0) since (q > 0)))' --filepath /timescales/fullsuiteAbsentAQ/Discrete/1M/AbsentAQ100.rbt.jsonl" \
    --command-name AbsentAQ1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:1000](q > 0))) -> ((not (p > 0) since (q > 0)))' --filepath /timescales/fullsuiteAbsentAQ/Discrete/1M/AbsentAQ1000.rbt.jsonl" \
    --command-name AbsentBQR10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r > 0) && !(q > 0) && once(q > 0)) -> ((not(p > 0)) since[3:10] (q > 0))' --filepath /timescales/fullsuiteAbsentBQR/Discrete/1M/AbsentBQR10.rbt.jsonl" \
    --command-name AbsentBQR100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r > 0) && !(q > 0) && once(q > 0)) -> ((not(p > 0)) since[30:100] (q > 0))' --filepath /timescales/fullsuiteAbsentBQR/Discrete/1M/AbsentBQR100.rbt.jsonl" \
    --command-name AbsentBQR1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r > 0) && !(q > 0) && once(q > 0)) -> ((not(p > 0)) since[300:1000] (q > 0))' --filepath /timescales/fullsuiteAbsentBQR/Discrete/1M/AbsentBQR1000.rbt.jsonl" \
    --command-name AbsentBR10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r > 0) -> (historically[0:10](not(p > 0))))' --filepath /timescales/fullsuiteAbsentBR/Discrete/1M/AbsentBR10.rbt.jsonl" \
    --command-name AbsentBR100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r > 0) -> (historically[0:100](not(p > 0))))' --filepath /timescales/fullsuiteAbsentBR/Discrete/1M/AbsentBR100.rbt.jsonl" \
    --command-name AbsentBR1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r > 0) -> (historically[0:1000](not(p > 0))))' --filepath /timescales/fullsuiteAbsentBR/Discrete/1M/AbsentBR1000.rbt.jsonl" \
    --command-name AlwaysAQ10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:10](q > 0)) -> ((p > 0) since (q > 0)))' --filepath /timescales/fullsuiteAlwaysAQ/Discrete/1M/AlwaysAQ10.rbt.jsonl" \
    --command-name AlwaysAQ100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:100](q > 0)) -> ((p > 0) since (q > 0)))' --filepath /timescales/fullsuiteAlwaysAQ/Discrete/1M/AlwaysAQ100.rbt.jsonl" \
    --command-name AlwaysAQ1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:1000](q > 0)) -> ((p > 0) since (q > 0)))' --filepath /timescales/fullsuiteAlwaysAQ/Discrete/1M/AlwaysAQ1000.rbt.jsonl" \
    --command-name AlwaysBQR10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(((r > 0) && !(q > 0) && once(q > 0)) -> ((p > 0) since[3:10] (q > 0)))' --filepath /timescales/fullsuiteAlwaysBQR/Discrete/1M/AlwaysBQR10.rbt.jsonl" \
    --command-name AlwaysBQR100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(((r > 0) && !(q > 0) && once(q > 0)) -> ((p > 0) since[30:100] (q > 0)))' --filepath /timescales/fullsuiteAlwaysBQR/Discrete/1M/AlwaysBQR100.rbt.jsonl" \
    --command-name AlwaysBQR1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(((r > 0) && !(q > 0) && once(q > 0)) -> ((p > 0) since[300:1000] (q > 0)))' --filepath /timescales/fullsuiteAlwaysBQR/Discrete/1M/AlwaysBQR1000.rbt.jsonl" \
    --command-name AlwaysBR10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r > 0) -> (historically[0:10](p > 0)))' --filepath /timescales/fullsuiteAlwaysBR/Discrete/1M/AlwaysBR10.rbt.jsonl" \
    --command-name AlwaysBR100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r > 0) -> (historically[0:100](p > 0)))' --filepath /timescales/fullsuiteAlwaysBR/Discrete/1M/AlwaysBR100.rbt.jsonl" \
    --command-name AlwaysBR1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((r > 0) -> (historically[0:1000](p > 0)))' --filepath /timescales/fullsuiteAlwaysBR/Discrete/1M/AlwaysBR1000.rbt.jsonl" \
    --command-name RecurBQR10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(((r > 0) && !(q > 0) && once(q > 0)) -> ((once[0:10]((p > 0) or (q > 0))) since (q > 0)))' --filepath /timescales/fullsuiteRecurBQR/Discrete/1M/RecurBQR10.rbt.jsonl" \
    --command-name RecurBQR100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(((r > 0) && !(q > 0) && once(q > 0)) -> ((once[0:100]((p > 0) or (q > 0))) since (q > 0)))' --filepath /timescales/fullsuiteRecurBQR/Discrete/1M/RecurBQR100.rbt.jsonl" \
    --command-name RecurBQR1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(((r > 0) && !(q > 0) && once(q > 0)) -> ((once[0:1000]((p > 0) or (q > 0))) since (q > 0)))' --filepath /timescales/fullsuiteRecurBQR/Discrete/1M/RecurBQR1000.rbt.jsonl" \
    --command-name RecurGLB10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(once[0:10](p > 0))' --filepath /timescales/fullsuiteRecurGLB/Discrete/1M/RecurGLB10.rbt.jsonl" \
    --command-name RecurGLB100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(once[0:100](p > 0))' --filepath /timescales/fullsuiteRecurGLB/Discrete/1M/RecurGLB100.rbt.jsonl" \
    --command-name RecurGLB1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(once[0:1000](p > 0))' --filepath /timescales/fullsuiteRecurGLB/Discrete/1M/RecurGLB1000.rbt.jsonl" \
    --command-name RespondBQR10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(((r > 0) && !(q > 0) && once(q > 0)) -> ( (((z > 0) -> once[3:10](p > 0)) and not((not (z > 0)) since[10:10000] (p > 0))) since (q > 0)))' --filepath /timescales/fullsuiteRespondBQR/Discrete/1M/RespondBQR10.rbt.jsonl" \
    --command-name RespondBQR100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(((r > 0) && !(q > 0) && once(q > 0)) -> ( (((z > 0) -> once[30:100](p > 0)) and not((not (z > 0)) since[100:10000] (p > 0))) since (q > 0)))' --filepath /timescales/fullsuiteRespondBQR/Discrete/1M/RespondBQR100.rbt.jsonl" \
    --command-name RespondBQR1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(((r > 0) && !(q > 0) && once(q > 0)) -> ( (((z > 0) -> once[300:1000](p > 0)) and not((not (z > 0)) since[1000:10000] (p > 0))) since (q > 0)))' --filepath /timescales/fullsuiteRespondBQR/Discrete/1M/RespondBQR1000.rbt.jsonl" \
    --command-name RespondGLB10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(((z > 0) -> once[3:10](p > 0)) and not((not (z > 0)) since[10:10000] (p > 0)))' --filepath /timescales/fullsuiteRespondGLB/Discrete/1M/RespondGLB10.rbt.jsonl" \
    --command-name RespondGLB100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(((z > 0) -> once[30:100](p > 0)) and not((not (z > 0)) since[100:10000] (p > 0)))' --filepath /timescales/fullsuiteRespondGLB/Discrete/1M/RespondGLB100.rbt.jsonl" \
    --command-name RespondGLB1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically(((z > 0) -> once[300:1000](p > 0)) and not((not (z > 0)) since[1000:10000] (p > 0)))' --filepath /timescales/fullsuiteRespondGLB/Discrete/1M/RespondGLB1000.rbt.jsonl"
