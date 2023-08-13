#!/bin/bash
hyperfine \
    --warmup 3 \
    --runs 25 \
    --export-json "results/montre.discrete.1M.$(date +%s).json" \
    --command-name AbsentAQ10 \
        "montre -b '<:q:>;(p:>|(!p:>)%(0,9))' -f fullsuite/AbsentAQ/Discrete/1M/AbsentAQ10.txt >> /dev/null 2>&1" \
    --command-name AbsentAQ100 \
        "montre -b '<:q:>;(p:>|(!p:>)%(0,99))' -f fullsuite/AbsentAQ/Discrete/1M/AbsentAQ100.txt >> /dev/null 2>&1" \
    --command-name AbsentAQ1000 \
        "montre -b '<:q:>;(p:>|(!p:>)%(0,999))' -f fullsuite/AbsentAQ/Discrete/1M/AbsentAQ1000.txt >> /dev/null 2>&1" \
    --command-name AbsentBR10 \
        "montre -b '(<:p|(<:!p)%(0,9));<:r:>' -f fullsuite/AbsentBR/Discrete/1M/AbsentBR10.txt >> /dev/null 2>&1" \
    --command-name AbsentBR100 \
        "montre -b '(<:p|(<:!p)%(0,99));<:r:>' -f fullsuite/AbsentBR/Discrete/1M/AbsentBR100.txt >> /dev/null 2>&1" \
    --command-name AbsentBR1000 \
        "montre -b '(<:p|(<:!p)%(0,999));<:r:>' -f fullsuite/AbsentBR/Discrete/1M/AbsentBR1000.txt >> /dev/null 2>&1" \
    --command-name AbsentBQR10 \
        "montre -b '<:q:>;(p|(!p&&!q&&!r)%(0,2)|(!p&&!q&&!r)%(11,1000000));<:r:>' -f fullsuite/AbsentBQR/Discrete/1M/AbsentBQR10.txt >> /dev/null 2>&1" \
    --command-name AbsentBQR100 \
        "montre -b '<:q:>;(p|(!p&&!q&&!r)%(0,29)|(!p&&!q&&!r)%(101,1000000));<:r:>' -f fullsuite/AbsentBQR/Discrete/1M/AbsentBQR100.txt >> /dev/null 2>&1" \
    --command-name AbsentBQR1000 \
        "montre -b '<:q:>;(p|(!p&&!q&&!r)%(0,299)|(!p&&!q&&!r)%(1001,1000000));<:r:>' -f fullsuite/AbsentBQR/Discrete/1M/AbsentBQR1000.txt >> /dev/null 2>&1" \
    --command-name AlwaysAQ10 \
        "montre -b '<:q:>;(p:>|(!p:>)%(0,9))' -f fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ10.txt >> /dev/null 2>&1" \
    --command-name AlwaysAQ100 \
        "montre -b '<:q:>;(p:>|(!p:>)%(0,99))' -f fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ100.txt >> /dev/null 2>&1" \
    --command-name AlwaysAQ1000 \
        "montre -b '<:q:>;(p:>|(!p:>)%(0,999))' -f fullsuite/AlwaysAQ/Discrete/1M/AlwaysAQ1000.txt >> /dev/null 2>&1" \
    --command-name AlwaysBR10 \
        "montre -b '(<:p|(<:!p)%(0,9));<:r:>' -f fullsuite/AlwaysBR/Discrete/1M/AlwaysBR10.txt >> /dev/null 2>&1" \
    --command-name AlwaysBR100 \
        "montre -b '(<:p|(<:!p)%(0,99));<:r:>' -f fullsuite/AlwaysBR/Discrete/1M/AlwaysBR100.txt >> /dev/null 2>&1" \
    --command-name AlwaysBR1000 \
        "montre -b '(<:p|(<:!p)%(0,999));<:r:>' -f fullsuite/AlwaysBR/Discrete/1M/AlwaysBR1000.txt >> /dev/null 2>&1" \
    --command-name AlwaysBQR10 \
        "montre -b '<:q:>;(p|(!p&&!q&&!r)%(0,2)|(!p&&!q&&!r)%(11,1000000));<:r:>' -f fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR10.txt >> /dev/null 2>&1" \
    --command-name AlwaysBQR100 \
        "montre -b '<:q:>;(p|(!p&&!q&&!r)%(0,29)|(!p&&!q&&!r)%(101,1000000));<:r:>' -f fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR100.txt >> /dev/null 2>&1" \
    --command-name AlwaysBQR1000 \
        "montre -b '<:q:>;(p|(!p&&!q&&!r)%(0,299)|(!p&&!q&&!r)%(1001,1000000));<:r:>' -f fullsuite/AlwaysBQR/Discrete/1M/AlwaysBQR1000.txt >> /dev/null 2>&1" \
    --command-name RecurGLB10 \
        "montre -b '<:p;(!p:>)%(11,1000000)' -f fullsuite/RecurGLB/Discrete/1M/RecurGLB10.txt >> /dev/null 2>&1" \
    --command-name RecurGLB100 \
        "montre -b '<:p;(!p:>)%(101,1000000)' -f fullsuite/RecurGLB/Discrete/1M/RecurGLB100.txt >> /dev/null 2>&1" \
    --command-name RecurGLB1000 \
        "montre -b '<:p;(!p:>)%(1001,1000000)' -f fullsuite/RecurGLB/Discrete/1M/RecurGLB1000.txt >> /dev/null 2>&1" \
    --command-name RecurBQR10 \
        "montre -b '<:!q;<:p:>;((!p&&!r):>)%(11,1000000);<:r:>' -f fullsuite/RecurBQR/Discrete/1M/RecurBQR10.txt >> /dev/null 2>&1" \
    --command-name RecurBQR100 \
        "montre -b '<:!q;<:p:>;((!p&&!r):>)%(101,1000000);<:r:>' -f fullsuite/RecurBQR/Discrete/1M/RecurBQR100.txt >> /dev/null 2>&1" \
    --command-name RecurBQR1000 \
        "montre -b '<:!q;<:p:>;((!p&&!r):>)%(1001,1000000);<:r:>' -f fullsuite/RecurBQR/Discrete/1M/RecurBQR1000.txt >> /dev/null 2>&1" \
    --command-name RespondGLB10 \
        "montre -b '(<:p:>;(!s)%(0,2);<:s:>)|(<:p:>;(!s:>)%(11,1000000))' -f fullsuite/RespondGLB/Discrete/1M/RespondGLB10.txt >> /dev/null 2>&1" \
    --command-name RespondGLB100 \
        "montre -b '(<:p:>;(!s)%(0,29);<:s:>)|(<:p:>;(!s:>)%(101,1000000))' -f fullsuite/RespondGLB/Discrete/1M/RespondGLB100.txt >> /dev/null 2>&1" \
    --command-name RespondGLB1000 \
        "montre -b '(<:p:>;(!s)%(0,299);<:s:>)|(<:p:>;(!s:>)%(1001,1000000))' -f fullsuite/RespondGLB/Discrete/1M/RespondGLB1000.txt >> /dev/null 2>&1" \
    --command-name RespondBQR10 \
        "montre -b '<:!q;((<:p:>;(!s)%(0,2);<:s:>)|(<:p:>;(!s:>)%(11,1000000)));!r:>' -f fullsuite/RespondBQR/Discrete/1M/RespondBQR10.txt >> /dev/null 2>&1" \
    --command-name RespondBQR100 \
        "montre -b '<:!q;((<:p:>;(!s)%(0,29);<:s:>)|(<:p:>;(!s:>)%(101,1000000)));!r:>' -f fullsuite/RespondBQR/Discrete/1M/RespondBQR100.txt >> /dev/null 2>&1" \
    --command-name RespondBQR1000 \
        "montre -b '<:!q;((<:p:>;(!s)%(0,299);<:s:>)|(<:p:>;(!s:>)%(1001,1000000)));!r:>' -f fullsuite/RespondBQR/Discrete/1M/RespondBQR1000.txt >> /dev/null 2>&1" \






