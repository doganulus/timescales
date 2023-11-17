hyperfine \
    --warmup 1 \
    --runs 2 \
    --export-json "/timescales/results/rtamt.discrete.1M.$(date +%s).json" \
    --command-name AbsentAQ10 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:10](q > 0))) -> ((not (p > 0) since (q > 0)))' --filepath /timescales/fullsuite/AbsentAQ/Discrete/1M/AbsentAQ10.rbt.jsonl" \
    --command-name AbsentAQ100 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:100](q > 0))) -> ((not (p > 0) since (q > 0)))' --filepath /timescales/fullsuite/AbsentAQ/Discrete/1M/AbsentAQ100.rbt.jsonl" \
    --command-name AbsentAQ1000 \
        "python3 /timescales/rvtools/rtamt/app.py --formula 'historically((once[0:1000](q > 0))) -> ((not (p > 0) since (q > 0)))' --filepath /timescales/fullsuite/AbsentAQ/Discrete/1M/AbsentAQ1000.rbt.jsonl" \