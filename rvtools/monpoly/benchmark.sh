#!/bin/bash
hyperfine \
    --warmup 2 \
    --runs 10 \
    --export-json "results/monpoly.discrete.1M.$(date +%s).json" \
    --command-name AbsentAQ10 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AbsentAQ10.mtl -log fullsuite/AbsentAQ/Discrete/1M/AbsentAQ10.monpoly.log > /dev/null 2>&1" \
    --command-name AbsentAQ100 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AbsentAQ100.mtl -log fullsuite/AbsentAQ/Discrete/1M/AbsentAQ100.monpoly.log > /dev/null 2>&1" \
    --command-name AbsentAQ1000 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AbsentAQ1000.mtl -log fullsuite/AbsentAQ/Discrete/1M/AbsentAQ1000.monpoly.log > /dev/null 2>&1" \
    --command-name AbsentBQR10 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AbsentBQR10.mtl -log fullsuite/AbsentBQR/Discrete/1M/AbsentBQR10.monpoly.log > /dev/null 2>&1" \
    --command-name AbsentBQR100 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AbsentBQR100.mtl -log fullsuite/AbsentBQR/Discrete/1M/AbsentBQR100.monpoly.log > /dev/null 2>&1" \
    --command-name AbsentBQR1000 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AbsentBQR1000.mtl -log fullsuite/AbsentBQR/Discrete/1M/AbsentBQR1000.monpoly.log > /dev/null 2>&1" \
    --command-name AbsentBR10 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AbsentBR10.mtl -log fullsuite/AbsentBR/Discrete/1M/AbsentBR10.monpoly.log > /dev/null 2>&1" \
    --command-name AbsentBR100 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AbsentBR100.mtl -log fullsuite/AbsentBR/Discrete/1M/AbsentBR100.monpoly.log > /dev/null 2>&1" \
    --command-name AlwaysBR1000 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AlwaysBR1000.mtl -log fullsuite/AlwaysBR/Discrete/1M/AlwaysBR1000.monpoly.log > /dev/null 2>&1" \
    --command-name AlwaysAQ10 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AlwaysAQ10.mtl -log fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ10.monpoly.log > /dev/null 2>&1" \
    --command-name AlwaysAQ100 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AlwaysAQ100.mtl -log fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ100.monpoly.log > /dev/null 2>&1" \
    --command-name AlwaysAQ1000 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AlwaysAQ1000.mtl -log fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ1000.monpoly.log > /dev/null 2>&1" \
    --command-name AlwaysBQR10 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AlwaysBQR10.mtl -log fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR10.monpoly.log > /dev/null 2>&1" \
    --command-name AlwaysBQR100 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AlwaysBQR100.mtl -log fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR100.monpoly.log > /dev/null 2>&1" \
    --command-name AlwaysBQR1000 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AlwaysBQR1000.mtl -log fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR1000.monpoly.log > /dev/null 2>&1" \
    --command-name AlwaysBR10 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AlwaysBR10.mtl -log fullsuite/AlwaysBR/Discrete/1M/AlwaysBR10.monpoly.log > /dev/null 2>&1" \
    --command-name AlwaysBR100 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AlwaysBR100.mtl -log fullsuite/AlwaysBR/Discrete/1M/AlwaysBR100.monpoly.log > /dev/null 2>&1" \
    --command-name AlwaysBR1000 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/AlwaysBR1000.mtl -log fullsuite/AlwaysBR/Discrete/1M/AlwaysBR1000.monpoly.log > /dev/null 2>&1" \
    --command-name RecurBQR10 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/RecurBQR10.mtl -log fullsuite/RecurBQR/Discrete/1M/RecurBQR10.monpoly.log > /dev/null 2>&1" \
    --command-name RecurBQR100 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/RecurBQR100.mtl -log fullsuite/RecurBQR/Discrete/1M/RecurBQR100.monpoly.log > /dev/null 2>&1" \
    --command-name RecurBQR1000 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/RecurBQR1000.mtl -log fullsuite/RecurBQR/Discrete/1M/RecurBQR1000.monpoly.log > /dev/null 2>&1" \
    --command-name RecurGLB10 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/RecurGLB10.mtl -log fullsuite/RecurGLB/Discrete/1M/RecurGLB10.monpoly.log > /dev/null 2>&1" \
    --command-name RecurGLB100 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/RecurGLB100.mtl -log fullsuite/RecurGLB/Discrete/1M/RecurGLB100.monpoly.log > /dev/null 2>&1" \
    --command-name RecurGLB1000 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/RecurGLB1000.mtl -log fullsuite/RecurGLB/Discrete/1M/RecurGLB1000.monpoly.log > /dev/null 2>&1" \
    --command-name RespondBQR10 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/RespondBQR10.mtl -log fullsuite/RespondBQR/Discrete/1M/RespondBQR10.monpoly.log > /dev/null 2>&1" \
    --command-name RespondBQR100 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/RespondBQR100.mtl -log fullsuite/RespondBQR/Discrete/1M/RespondBQR100.monpoly.log > /dev/null 2>&1" \
    --command-name RespondBQR1000 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/RespondBQR1000.mtl -log fullsuite/RespondBQR/Discrete/1M/RespondBQR1000.monpoly.log > /dev/null 2>&1" \
    --command-name RespondGLB10 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/RespondGLB10.mtl -log fullsuite/RespondGLB/Discrete/1M/RespondGLB10.monpoly.log > /dev/null 2>&1" \
    --command-name RespondGLB100 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/RespondGLB100.mtl -log fullsuite/RespondGLB/Discrete/1M/RespondGLB100.monpoly.log > /dev/null 2>&1" \
    --command-name RespondGLB1000 \
        "monpoly -sig rvtools/monpoly/resources/timescales.sig -formula rvtools/monpoly/resources/RespondGLB1000.mtl -log fullsuite/RespondGLB/Discrete/1M/RespondGLB1000.monpoly.log > /dev/null 2>&1" \
