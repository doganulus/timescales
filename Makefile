DIR = .

all: small

small:
	mkdir -p ${DIR}/smallsuite

	./timescales absence_after_q --ubound 10 --duration 10000 --name AbsentAQ --output-dir ${DIR}/smallsuite
	./timescales absence_before_r --ubound 10 --duration 10000 --name AbsentBR --output-dir ${DIR}/smallsuite
	./timescales absence_between_q_and_r --lbound 3 --ubound 10 --duration 10000 --name AbsentBQR --output-dir ${DIR}/smallsuite

	./timescales always_after_q --ubound 10 --duration 1000 --name AlwaysAQ --output-dir ${DIR}/smallsuite
	./timescales always_before_r --ubound 10 --duration 1000 --name AlwaysBR --output-dir ${DIR}/smallsuite
	./timescales always_between_q_and_r --lbound 3 --ubound 10 --duration 10000 --name AlwaysBQR --output-dir ${DIR}/smallsuite

	./timescales recurrence_globally --lbound 3 --ubound 10 --duration 10000 --name RecurGLB --output-dir ${DIR}/smallsuite
	./timescales recurrence_between_q_and_r --lbound 3 --ubound 10 --duration 10000 --name RecurBQR --output-dir ${DIR}/smallsuite

	./timescales response_globally --lbound 3 --ubound 10 --duration 10000 --name RespondGLB --output-dir ${DIR}/smallsuite
	./timescales response_between_q_and_r --lbound 3 --ubound 10 --duration 10000 --name RespondBQR --output-dir ${DIR}/smallsuite

large:
	mkdir -p ${DIR}/largesuite/AbsentAQ	
	./timescales absence_after_q --ubound 10 --duration 1000000 --name AbsentAQ10 --output-dir ${DIR}/largesuite/AbsentAQ
	./timescales absence_after_q --ubound 100 --duration 1000000 --name AbsentAQ100 --output-dir ${DIR}/largesuite/AbsentAQ
	./timescales absence_after_q --ubound 1000 --duration 1000000 --name AbsentAQ1000 --output-dir ${DIR}/largesuite/AbsentAQ

	mkdir -p ${DIR}/largesuite/AbsentBR
	./timescales absence_before_r --ubound 10 --duration 1000000 --name AbsentBR10 --output-dir ${DIR}/largesuite/AbsentBR
	./timescales absence_before_r --ubound 100 --duration 1000000 --name AbsentBR100 --output-dir ${DIR}/largesuite/AbsentBR
	./timescales absence_before_r --ubound 1000 --duration 1000000 --name AbsentBR1000 --output-dir ${DIR}/largesuite/AbsentBR

	mkdir -p ${DIR}/largesuite/AbsentBQR
	./timescales absence_between_q_and_r --lbound 3 --ubound 10 --duration 1000000 --name AbsentBQR10 --output-dir ${DIR}/largesuite/AbsentBQR
	./timescales absence_between_q_and_r --lbound 30 --ubound 100 --duration 1000000 --name AbsentBQR100 --output-dir ${DIR}/largesuite/AbsentBQR
	./timescales absence_between_q_and_r --lbound 300 --ubound 1000 --duration 1000000 --name AbsentBQR1000 --output-dir ${DIR}/largesuite/AbsentBQR

	mkdir -p ${DIR}/largesuite/AlwaysAQ
	./timescales always_after_q --ubound 10 --duration 1000000 --name AlwaysAQ10 --output-dir ${DIR}/largesuite/AlwaysAQ
	./timescales always_after_q --ubound 100 --duration 1000000 --name AlwaysAQ100 --output-dir ${DIR}/largesuite/AlwaysAQ
	./timescales always_after_q --ubound 1000 --duration 1000000 --name AlwaysAQ1000 --output-dir ${DIR}/largesuite/AlwaysAQ

	mkdir -p ${DIR}/largesuite/AlwaysBR
	./timescales always_before_r --ubound 10 --duration 1000000 --name AlwaysBR10 --output-dir ${DIR}/largesuite/AlwaysBR
	./timescales always_before_r --ubound 100 --duration 1000000 --name AlwaysBR100 --output-dir ${DIR}/largesuite/AlwaysBR
	./timescales always_before_r --ubound 1000 --duration 1000000 --name AlwaysBR100 --output-dir ${DIR}/largesuite/AlwaysBR

	mkdir -p ${DIR}/largesuite/AlwaysBQR
	./timescales always_between_q_and_r --lbound 3 --ubound 10 --duration 1000000 --name AlwaysBQR10 --output-dir ${DIR}/largesuite/AlwaysBQR
	./timescales always_between_q_and_r --lbound 30 --ubound 100 --duration 1000000 --name AlwaysBQR100 --output-dir ${DIR}/largesuite/AlwaysBQR
	./timescales always_between_q_and_r --lbound 300 --ubound 1000 --duration 1000000 --name AlwaysBQR1000 --output-dir ${DIR}/largesuite/AlwaysBQR

	mkdir -p ${DIR}/largesuite/RecurGLB
	./timescales recurrence_globally --lbound 3 --ubound 10 --duration 1000000 --name RecurGLB10 --output-dir ${DIR}/largesuite/RecurGLB
	./timescales recurrence_globally --lbound 30 --ubound 100 --duration 1000000 --name RecurGLB100 --output-dir ${DIR}/largesuite/RecurGLB
	./timescales recurrence_globally --lbound 300 --ubound 1000 --duration 1000000 --name RecurGLB1000 --output-dir ${DIR}/largesuite/RecurGLB

	mkdir -p ${DIR}/largesuite/RecurBQR
	./timescales recurrence_between_q_and_r --lbound 3 --ubound 10 --duration 1000000 --name RecurBQR10 --output-dir ${DIR}/largesuite/RecurBQR
	./timescales recurrence_between_q_and_r --lbound 30 --ubound 100 --duration 1000000 --name RecurBQR100 --output-dir ${DIR}/largesuite/RecurBQR
	./timescales recurrence_between_q_and_r --lbound 300 --ubound 1000 --duration 1000000 --name RecurBQR1000 --output-dir ${DIR}/largesuite/RecurBQR

	mkdir -p ${DIR}/largesuite/RespondGLB
	./timescales response_globally --lbound 3 --ubound 10 --duration 1000000 --name RespondGLB10 --output-dir ${DIR}/largesuite/RespondGLB
	./timescales response_globally --lbound 30 --ubound 100 --duration 1000000 --name RespondGLB100 --output-dir ${DIR}/largesuite/RespondGLB
	./timescales response_globally --lbound 300 --ubound 1000 --duration 1000000 --name RespondGLB1000 --output-dir ${DIR}/largesuite/RespondGLB

	mkdir -p ${DIR}/largesuite/RespondBQR
	./timescales response_between_q_and_r --lbound 3 --ubound 10 --duration 1000000 --name RespondBQR10 --output-dir ${DIR}/largesuite/RespondBQR
	./timescales response_between_q_and_r --lbound 30 --ubound 100 --duration 1000000 --name RespondBQR100 --output-dir ${DIR}/largesuite/RespondBQR
	./timescales response_between_q_and_r --lbound 300 --ubound 1000 --duration 1000000 --name RespondBQR1000 --output-dir ${DIR}/largesuite/RespondBQR

full: full-100K full-100K-10 full-100K-100 full-1M

full-100K:
	mkdir -p ${DIR}/fullsuite/AbsentAQ/Discrete/100K
	./timescales absence_after_q --ubound 10 --duration 100000 --name AbsentAQ10  --output-dir ${DIR}/fullsuite/AbsentAQ/Discrete/100K
	./timescales absence_after_q --ubound 100 --duration 100000 --name AbsentAQ100  --output-dir ${DIR}/fullsuite/AbsentAQ/Discrete/100K
	./timescales absence_after_q --ubound 1000 --duration 100000 --name AbsentAQ1000  --output-dir ${DIR}/fullsuite/AbsentAQ/Discrete/100K

	mkdir -p ${DIR}/fullsuite/AbsentBR/Discrete/100K
	./timescales absence_before_r --ubound 10 --duration 100000 --name AbsentBR10  --output-dir ${DIR}/fullsuite/AbsentBR/Discrete/100K
	./timescales absence_before_r --ubound 100 --duration 100000 --name AbsentBR100  --output-dir ${DIR}/fullsuite/AbsentBR/Discrete/100K
	./timescales absence_before_r --ubound 1000 --duration 100000 --name AbsentBR1000  --output-dir ${DIR}/fullsuite/AbsentBR/Discrete/100K

	mkdir -p ${DIR}/fullsuite/AbsentBQR/Discrete/100K
	./timescales absence_between_q_and_r --lbound 3 --ubound 10 --duration 100000 --name AbsentBQR10  --output-dir ${DIR}/fullsuite/AbsentBQR/Discrete/100K
	./timescales absence_between_q_and_r --lbound 30 --ubound 100 --duration 100000 --name AbsentBQR100  --output-dir ${DIR}/fullsuite/AbsentBQR/Discrete/100K
	./timescales absence_between_q_and_r --lbound 300 --ubound 1000 --duration 100000 --name AbsentBQR1000  --output-dir ${DIR}/fullsuite/AbsentBQR/Discrete/100K

	mkdir -p ${DIR}/fullsuite/AlwaysAQ/Discrete/100K
	./timescales always_after_q --ubound 10 --duration 100000 --name AlwaysAQ10  --output-dir ${DIR}/fullsuite/AlwaysAQ/Discrete/100K
	./timescales always_after_q --ubound 100 --duration 100000 --name AlwaysAQ100  --output-dir ${DIR}/fullsuite/AlwaysAQ/Discrete/100K
	./timescales always_after_q --ubound 1000 --duration 100000 --name AlwaysAQ1000  --output-dir ${DIR}/fullsuite/AlwaysAQ/Discrete/100K

	mkdir -p ${DIR}/fullsuite/AlwaysBR/Discrete/100K
	./timescales always_before_r --ubound 10 --duration 100000 --name AlwaysBR10  --output-dir ${DIR}/fullsuite/AlwaysBR/Discrete/100K
	./timescales always_before_r --ubound 100 --duration 100000 --name AlwaysBR100  --output-dir ${DIR}/fullsuite/AlwaysBR/Discrete/100K
	./timescales always_before_r --ubound 1000 --duration 100000 --name AlwaysBR100  --output-dir ${DIR}/fullsuite/AlwaysBR/Discrete/100K

	mkdir -p ${DIR}/fullsuite/AlwaysBQR/Discrete/100K
	./timescales always_between_q_and_r --lbound 3 --ubound 10 --duration 100000 --name AlwaysBQR10 --output-dir ${DIR}/fullsuite/AlwaysBQR/Discrete/100K
	./timescales always_between_q_and_r --lbound 30 --ubound 100 --duration 100000 --name AlwaysBQR100 --output-dir ${DIR}/fullsuite/AlwaysBQR/Discrete/100K
	./timescales always_between_q_and_r --lbound 300 --ubound 1000 --duration 100000 --name AlwaysBQR1000 --output-dir ${DIR}/fullsuite/AlwaysBQR/Discrete/100K

	mkdir -p ${DIR}/fullsuite/RecurGLB/Discrete/100K
	./timescales recurrence_globally --lbound 3 --ubound 10 --duration 100000 --name RecurGLB10 --output-dir ${DIR}/fullsuite/RecurGLB/Discrete/100K
	./timescales recurrence_globally --lbound 30 --ubound 100 --duration 100000 --name RecurGLB100 --output-dir ${DIR}/fullsuite/RecurGLB/Discrete/100K
	./timescales recurrence_globally --lbound 300 --ubound 1000 --duration 100000 --name RecurGLB1000 --output-dir ${DIR}/fullsuite/RecurGLB/Discrete/100K

	mkdir -p ${DIR}/fullsuite/RecurBQR/Discrete/100K
	./timescales recurrence_between_q_and_r --lbound 3 --ubound 10 --duration 100000 --name RecurBQR10 --output-dir ${DIR}/fullsuite/RecurBQR/Discrete/100K
	./timescales recurrence_between_q_and_r --lbound 30 --ubound 100 --duration 100000 --name RecurBQR100 --output-dir ${DIR}/fullsuite/RecurBQR/Discrete/100K
	./timescales recurrence_between_q_and_r --lbound 300 --ubound 1000 --duration 100000 --name RecurBQR1000 --output-dir ${DIR}/fullsuite/RecurBQR/Discrete/100K

	mkdir -p ${DIR}/fullsuite/RespondGLB/Discrete/100K
	./timescales response_globally --lbound 3 --ubound 10 --duration 100000 --name RespondGLB10 --output-dir ${DIR}/fullsuite/RespondGLB/Discrete/100K
	./timescales response_globally --lbound 30 --ubound 100 --duration 100000 --name RespondGLB100 --output-dir ${DIR}/fullsuite/RespondGLB/Discrete/100K
	./timescales response_globally --lbound 300 --ubound 1000 --duration 100000 --name RespondGLB1000 --output-dir ${DIR}/fullsuite/RespondGLB/Discrete/100K

	mkdir -p ${DIR}/fullsuite/RespondBQR/Discrete/100K
	./timescales response_between_q_and_r --lbound 3 --ubound 10 --duration 100000 --name RespondBQR10 --output-dir ${DIR}/fullsuite/RespondBQR/Discrete/100K
	./timescales response_between_q_and_r --lbound 30 --ubound 100 --duration 100000 --name RespondBQR100 --output-dir ${DIR}/fullsuite/RespondBQR/Discrete/100K
	./timescales response_between_q_and_r --lbound 300 --ubound 1000 --duration 100000 --name RespondBQR1000 --output-dir ${DIR}/fullsuite/RespondBQR/Discrete/100K

full-100K-10:
	mkdir -p ${DIR}/fullsuite/AbsentAQ/Dense10/100K
	./timescales absence_after_q --ubound 10 --duration 100000 --name AbsentAQ10 --condense 10 --output-dir ${DIR}/fullsuite/AbsentAQ/Dense10/100K
	./timescales absence_after_q --ubound 100 --duration 100000 --name AbsentAQ100 --condense 10 --output-dir ${DIR}/fullsuite/AbsentAQ/Dense10/100K
	./timescales absence_after_q --ubound 1000 --duration 100000 --name AbsentAQ1000 --condense 10 --output-dir ${DIR}/fullsuite/AbsentAQ/Dense10/100K

	mkdir -p ${DIR}/fullsuite/AbsentBR/Dense10/100K
	./timescales absence_before_r --ubound 10 --duration 100000 --name AbsentBR10 --condense 10 --output-dir ${DIR}/fullsuite/AbsentBR/Dense10/100K
	./timescales absence_before_r --ubound 100 --duration 100000 --name AbsentBR100 --condense 10 --output-dir ${DIR}/fullsuite/AbsentBR/Dense10/100K
	./timescales absence_before_r --ubound 1000 --duration 100000 --name AbsentBR1000 --condense 10 --output-dir ${DIR}/fullsuite/AbsentBR/Dense10/100K

	mkdir -p ${DIR}/fullsuite/AbsentBQR/Dense10/100K
	./timescales absence_between_q_and_r --lbound 3 --ubound 10 --duration 100000 --name AbsentBQR10 --condense 10 --output-dir ${DIR}/fullsuite/AbsentBQR/Dense10/100K
	./timescales absence_between_q_and_r --lbound 30 --ubound 100 --duration 100000 --name AbsentBQR100 --condense 10 --output-dir ${DIR}/fullsuite/AbsentBQR/Dense10/100K
	./timescales absence_between_q_and_r --lbound 300 --ubound 1000 --duration 100000 --name AbsentBQR1000 --condense 10 --output-dir ${DIR}/fullsuite/AbsentBQR/Dense10/100K

	mkdir -p ${DIR}/fullsuite/AlwaysAQ/Dense10/100K
	./timescales always_after_q --ubound 10 --duration 100000 --name AlwaysAQ10 --condense 10 --output-dir ${DIR}/fullsuite/AlwaysAQ/Dense10/100K
	./timescales always_after_q --ubound 100 --duration 100000 --name AlwaysAQ100 --condense 10 --output-dir ${DIR}/fullsuite/AlwaysAQ/Dense10/100K
	./timescales always_after_q --ubound 1000 --duration 100000 --name AlwaysAQ1000 --condense 10 --output-dir ${DIR}/fullsuite/AlwaysAQ/Dense10/100K

	mkdir -p ${DIR}/fullsuite/AlwaysBR/Dense10/100K
	./timescales always_before_r --ubound 10 --duration 100000 --name AlwaysBR10 --condense 10 --output-dir ${DIR}/fullsuite/AlwaysBR/Dense10/100K
	./timescales always_before_r --ubound 100 --duration 100000 --name AlwaysBR100 --condense 10 --output-dir ${DIR}/fullsuite/AlwaysBR/Dense10/100K
	./timescales always_before_r --ubound 1000 --duration 100000 --name AlwaysBR100 --condense 10 --output-dir ${DIR}/fullsuite/AlwaysBR/Dense10/100K

	mkdir -p ${DIR}/fullsuite/AlwaysBQR/Dense10/100K
	./timescales always_between_q_and_r --lbound 3 --ubound 10 --duration 100000 --name AlwaysBQR10 --condense 10 --output-dir ${DIR}/fullsuite/AlwaysBQR/Dense10/100K
	./timescales always_between_q_and_r --lbound 30 --ubound 100 --duration 100000 --name AlwaysBQR100 --condense 10 --output-dir ${DIR}/fullsuite/AlwaysBQR/Dense10/100K
	./timescales always_between_q_and_r --lbound 300 --ubound 1000 --duration 100000 --name AlwaysBQR1000 --condense 10 --output-dir ${DIR}/fullsuite/AlwaysBQR/Dense10/100K

	mkdir -p ${DIR}/fullsuite/RecurGLB/Dense10/100K
	./timescales recurrence_globally --lbound 3 --ubound 10 --duration 100000 --name RecurGLB10 --condense 10 --output-dir ${DIR}/fullsuite/RecurGLB/Dense10/100K
	./timescales recurrence_globally --lbound 30 --ubound 100 --duration 100000 --name RecurGLB100 --condense 10 --output-dir ${DIR}/fullsuite/RecurGLB/Dense10/100K
	./timescales recurrence_globally --lbound 300 --ubound 1000 --duration 100000 --name RecurGLB1000 --condense 10 --output-dir ${DIR}/fullsuite/RecurGLB/Dense10/100K

	mkdir -p ${DIR}/fullsuite/RecurBQR/Dense10/100K
	./timescales recurrence_between_q_and_r --lbound 3 --ubound 10 --duration 100000 --name RecurBQR10 --condense 10 --output-dir ${DIR}/fullsuite/RecurBQR/Dense10/100K
	./timescales recurrence_between_q_and_r --lbound 30 --ubound 100 --duration 100000 --name RecurBQR100 --condense 10 --output-dir ${DIR}/fullsuite/RecurBQR/Dense10/100K
	./timescales recurrence_between_q_and_r --lbound 300 --ubound 1000 --duration 100000 --name RecurBQR1000 --condense 10 --output-dir ${DIR}/fullsuite/RecurBQR/Dense10/100K

	mkdir -p ${DIR}/fullsuite/RespondGLB/Dense10/100K
	./timescales response_globally --lbound 3 --ubound 10 --duration 100000 --name RespondGLB10 --condense 10 --output-dir ${DIR}/fullsuite/RespondGLB/Dense10/100K
	./timescales response_globally --lbound 30 --ubound 100 --duration 100000 --name RespondGLB100 --condense 10 --output-dir ${DIR}/fullsuite/RespondGLB/Dense10/100K
	./timescales response_globally --lbound 300 --ubound 1000 --duration 100000 --name RespondGLB1000 --condense 10 --output-dir ${DIR}/fullsuite/RespondGLB/Dense10/100K

	mkdir -p ${DIR}/fullsuite/RespondBQR/Dense10/100K
	./timescales response_between_q_and_r --lbound 3 --ubound 10 --duration 100000 --name RespondBQR10 --condense 10 --output-dir ${DIR}/fullsuite/RespondBQR/Dense10/100K
	./timescales response_between_q_and_r --lbound 30 --ubound 100 --duration 100000 --name RespondBQR100 --condense 10 --output-dir ${DIR}/fullsuite/RespondBQR/Dense10/100K
	./timescales response_between_q_and_r --lbound 300 --ubound 1000 --duration 100000 --name RespondBQR1000 --condense 10 --output-dir ${DIR}/fullsuite/RespondBQR/Dense10/100K

full-100K-100:
	mkdir -p ${DIR}/fullsuite/AbsentAQ/Dense100/100K
	./timescales absence_after_q --ubound 10 --duration 100000 --name AbsentAQ10 --condense 100 --output-dir ${DIR}/fullsuite/AbsentAQ/Dense100/100K
	./timescales absence_after_q --ubound 100 --duration 100000 --name AbsentAQ100 --condense 100 --output-dir ${DIR}/fullsuite/AbsentAQ/Dense100/100K
	./timescales absence_after_q --ubound 1000 --duration 100000 --name AbsentAQ1000 --condense 100 --output-dir ${DIR}/fullsuite/AbsentAQ/Dense100/100K

	mkdir -p ${DIR}/fullsuite/AbsentBR/Dense100/100K
	./timescales absence_before_r --ubound 10 --duration 100000 --name AbsentBR10 --condense 100 --output-dir ${DIR}/fullsuite/AbsentBR/Dense100/100K
	./timescales absence_before_r --ubound 100 --duration 100000 --name AbsentBR100 --condense 100 --output-dir ${DIR}/fullsuite/AbsentBR/Dense100/100K
	./timescales absence_before_r --ubound 1000 --duration 100000 --name AbsentBR1000 --condense 100 --output-dir ${DIR}/fullsuite/AbsentBR/Dense100/100K

	mkdir -p ${DIR}/fullsuite/AbsentBQR/Dense100/100K
	./timescales absence_between_q_and_r --lbound 3 --ubound 10 --duration 100000 --name AbsentBQR10 --condense 100 --output-dir ${DIR}/fullsuite/AbsentBQR/Dense100/100K
	./timescales absence_between_q_and_r --lbound 30 --ubound 100 --duration 100000 --name AbsentBQR100 --condense 100 --output-dir ${DIR}/fullsuite/AbsentBQR/Dense100/100K
	./timescales absence_between_q_and_r --lbound 300 --ubound 1000 --duration 100000 --name AbsentBQR1000 --condense 100 --output-dir ${DIR}/fullsuite/AbsentBQR/Dense100/100K

	mkdir -p ${DIR}/fullsuite/AlwaysAQ/Dense100/100K
	./timescales always_after_q --ubound 10 --duration 100000 --name AlwaysAQ10 --condense 100 --output-dir ${DIR}/fullsuite/AlwaysAQ/Dense100/100K
	./timescales always_after_q --ubound 100 --duration 100000 --name AlwaysAQ100 --condense 100 --output-dir ${DIR}/fullsuite/AlwaysAQ/Dense100/100K
	./timescales always_after_q --ubound 1000 --duration 100000 --name AlwaysAQ1000 --condense 100 --output-dir ${DIR}/fullsuite/AlwaysAQ/Dense100/100K

	mkdir -p ${DIR}/fullsuite/AlwaysBR/Dense100/100K
	./timescales always_before_r --ubound 10 --duration 100000 --name AlwaysBR10 --condense 100 --output-dir ${DIR}/fullsuite/AlwaysBR/Dense100/100K
	./timescales always_before_r --ubound 100 --duration 100000 --name AlwaysBR100 --condense 100 --output-dir ${DIR}/fullsuite/AlwaysBR/Dense100/100K
	./timescales always_before_r --ubound 1000 --duration 100000 --name AlwaysBR100 --condense 100 --output-dir ${DIR}/fullsuite/AlwaysBR/Dense100/100K

	mkdir -p ${DIR}/fullsuite/AlwaysBQR/Dense100/100K
	./timescales always_between_q_and_r --lbound 3 --ubound 10 --duration 100000 --name AlwaysBQR10 --condense 100 --output-dir ${DIR}/fullsuite/AlwaysBQR/Dense100/100K
	./timescales always_between_q_and_r --lbound 30 --ubound 100 --duration 100000 --name AlwaysBQR100 --condense 100 --output-dir ${DIR}/fullsuite/AlwaysBQR/Dense100/100K
	./timescales always_between_q_and_r --lbound 300 --ubound 1000 --duration 100000 --name AlwaysBQR1000 --condense 100 --output-dir ${DIR}/fullsuite/AlwaysBQR/Dense100/100K

	mkdir -p ${DIR}/fullsuite/RecurGLB/Dense100/100K
	./timescales recurrence_globally --lbound 3 --ubound 10 --duration 100000 --name RecurGLB10 --condense 100 --output-dir ${DIR}/fullsuite/RecurGLB/Dense100/100K
	./timescales recurrence_globally --lbound 30 --ubound 100 --duration 100000 --name RecurGLB100 --condense 100 --output-dir ${DIR}/fullsuite/RecurGLB/Dense100/100K
	./timescales recurrence_globally --lbound 300 --ubound 1000 --duration 100000 --name RecurGLB1000 --condense 100 --output-dir ${DIR}/fullsuite/RecurGLB/Dense100/100K

	mkdir -p ${DIR}/fullsuite/RecurBQR/Dense100/100K
	./timescales recurrence_between_q_and_r --lbound 3 --ubound 10 --duration 100000 --name RecurBQR10 --condense 100 --output-dir ${DIR}/fullsuite/RecurBQR/Dense100/100K
	./timescales recurrence_between_q_and_r --lbound 30 --ubound 100 --duration 100000 --name RecurBQR100 --condense 100 --output-dir ${DIR}/fullsuite/RecurBQR/Dense100/100K
	./timescales recurrence_between_q_and_r --lbound 300 --ubound 1000 --duration 100000 --name RecurBQR1000 --condense 100 --output-dir ${DIR}/fullsuite/RecurBQR/Dense100/100K

	mkdir -p ${DIR}/fullsuite/RespondGLB/Dense100/100K
	./timescales response_globally --lbound 3 --ubound 10 --duration 100000 --name RespondGLB10 --condense 100 --output-dir ${DIR}/fullsuite/RespondGLB/Dense100/100K
	./timescales response_globally --lbound 30 --ubound 100 --duration 100000 --name RespondGLB100 --condense 100 --output-dir ${DIR}/fullsuite/RespondGLB/Dense100/100K
	./timescales response_globally --lbound 300 --ubound 1000 --duration 100000 --name RespondGLB1000 --condense 100 --output-dir ${DIR}/fullsuite/RespondGLB/Dense100/100K

	mkdir -p ${DIR}/fullsuite/RespondBQR/Dense100/100K
	./timescales response_between_q_and_r --lbound 3 --ubound 10 --duration 100000 --name RespondBQR10 --condense 100 --output-dir ${DIR}/fullsuite/RespondBQR/Dense100/100K
	./timescales response_between_q_and_r --lbound 30 --ubound 100 --duration 100000 --name RespondBQR100 --condense 100 --output-dir ${DIR}/fullsuite/RespondBQR/Dense100/100K
	./timescales response_between_q_and_r --lbound 300 --ubound 1000 --duration 100000 --name RespondBQR1000 --condense 100 --output-dir ${DIR}/fullsuite/RespondBQR/Dense100/100K

full-1M:
	mkdir -p ${DIR}/fullsuite/AbsentAQ/1M
	./timescales absence_after_q --ubound 10 --duration 1000000 --name AbsentAQ10 --output-dir ${DIR}/fullsuite/AbsentAQ/1M
	./timescales absence_after_q --ubound 100 --duration 1000000 --name AbsentAQ100 --output-dir ${DIR}/fullsuite/AbsentAQ/1M
	./timescales absence_after_q --ubound 1000 --duration 1000000 --name AbsentAQ1000 --output-dir ${DIR}/fullsuite/AbsentAQ/1M

	mkdir -p ${DIR}/fullsuite/AbsentBR/1M
	./timescales absence_before_r --ubound 10 --duration 1000000 --name AbsentBR10 --output-dir ${DIR}/fullsuite/AbsentBR/1M
	./timescales absence_before_r --ubound 100 --duration 1000000 --name AbsentBR100 --output-dir ${DIR}/fullsuite/AbsentBR/1M
	./timescales absence_before_r --ubound 1000 --duration 1000000 --name AbsentBR1000 --output-dir ${DIR}/fullsuite/AbsentBR/1M

	mkdir -p ${DIR}/fullsuite/AbsentBQR/1M
	./timescales absence_between_q_and_r --lbound 3 --ubound 10 --duration 1000000 --name AbsentBQR10 --output-dir ${DIR}/fullsuite/AbsentBQR/1M
	./timescales absence_between_q_and_r --lbound 30 --ubound 100 --duration 1000000 --name AbsentBQR100 --output-dir ${DIR}/fullsuite/AbsentBQR/1M
	./timescales absence_between_q_and_r --lbound 300 --ubound 1000 --duration 1000000 --name AbsentBQR1000 --output-dir ${DIR}/fullsuite/AbsentBQR/1M

	mkdir -p ${DIR}/fullsuite/AlwaysAQ/1M
	./timescales always_after_q --ubound 10 --duration 1000000 --name AlwaysAQ10 --output-dir ${DIR}/fullsuite/AlwaysAQ/1M
	./timescales always_after_q --ubound 100 --duration 1000000 --name AlwaysAQ100 --output-dir ${DIR}/fullsuite/AlwaysAQ/1M
	./timescales always_after_q --ubound 1000 --duration 1000000 --name AlwaysAQ1000 --output-dir ${DIR}/fullsuite/AlwaysAQ/1M

	mkdir -p ${DIR}/fullsuite/AlwaysBR/1M
	./timescales always_before_r --ubound 10 --duration 1000000 --name AlwaysBR10 --output-dir ${DIR}/fullsuite/AlwaysBR/1M
	./timescales always_before_r --ubound 100 --duration 1000000 --name AlwaysBR100 --output-dir ${DIR}/fullsuite/AlwaysBR/1M
	./timescales always_before_r --ubound 1000 --duration 1000000 --name AlwaysBR100 --output-dir ${DIR}/fullsuite/AlwaysBR/1M

	mkdir -p ${DIR}/fullsuite/AlwaysBQR/1M
	./timescales always_between_q_and_r --lbound 3 --ubound 10 --duration 1000000 --name AlwaysBQR10 --output-dir ${DIR}/fullsuite/AlwaysBQR/1M
	./timescales always_between_q_and_r --lbound 30 --ubound 100 --duration 1000000 --name AlwaysBQR100 --output-dir ${DIR}/fullsuite/AlwaysBQR/1M
	./timescales always_between_q_and_r --lbound 300 --ubound 1000 --duration 1000000 --name AlwaysBQR1000 --output-dir ${DIR}/fullsuite/AlwaysBQR/1M

	mkdir -p ${DIR}/fullsuite/RecurGLB/1M
	./timescales recurrence_globally --lbound 3 --ubound 10 --duration 1000000 --name RecurGLB10 --output-dir ${DIR}/fullsuite/RecurGLB/1M
	./timescales recurrence_globally --lbound 30 --ubound 100 --duration 1000000 --name RecurGLB100 --output-dir ${DIR}/fullsuite/RecurGLB/1M
	./timescales recurrence_globally --lbound 300 --ubound 1000 --duration 1000000 --name RecurGLB1000 --output-dir ${DIR}/fullsuite/RecurGLB/1M

	mkdir -p ${DIR}/fullsuite/RecurBQR/1M
	./timescales recurrence_between_q_and_r --lbound 3 --ubound 10 --duration 1000000 --name RecurBQR10 --output-dir ${DIR}/fullsuite/RecurBQR/1M
	./timescales recurrence_between_q_and_r --lbound 30 --ubound 100 --duration 1000000 --name RecurBQR100 --output-dir ${DIR}/fullsuite/RecurBQR/1M
	./timescales recurrence_between_q_and_r --lbound 300 --ubound 1000 --duration 1000000 --name RecurBQR1000 --output-dir ${DIR}/fullsuite/RecurBQR/1M

	mkdir -p ${DIR}/fullsuite/RespondGLB/1M
	./timescales response_globally --lbound 3 --ubound 10 --duration 1000000 --name RespondGLB10 --output-dir ${DIR}/fullsuite/RespondGLB/1M
	./timescales response_globally --lbound 30 --ubound 100 --duration 1000000 --name RespondGLB100 --output-dir ${DIR}/fullsuite/RespondGLB/1M
	./timescales response_globally --lbound 300 --ubound 1000 --duration 1000000 --name RespondGLB1000 --output-dir ${DIR}/fullsuite/RespondGLB/1M

	mkdir -p ${DIR}/fullsuite/RespondBQR/1M
	./timescales response_between_q_and_r --lbound 3 --ubound 10 --duration 1000000 --name RespondBQR10 --output-dir ${DIR}/fullsuite/RespondBQR/1M
	./timescales response_between_q_and_r --lbound 30 --ubound 100 --duration 1000000 --name RespondBQR100 --output-dir ${DIR}/fullsuite/RespondBQR/1M
	./timescales response_between_q_and_r --lbound 300 --ubound 1000 --duration 1000000 --name RespondBQR1000 --output-dir ${DIR}/fullsuite/RespondBQR/1M

clean:
	rm -rf ${DIR}/smallsuite ${DIR}/largesuite ${DIR}/fullsuite