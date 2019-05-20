grammar MetricTemporalLogic;

main: child=expr EOF;

expr: child = atom                                      # Atomic

	| NOT child = expr                                  # Negation 
	| left = expr LAND right = expr                     # Conjunction
	| left = expr LOR right = expr                      # Disjunction
	| left = expr IMPLIES right = expr                  # Implication

	| PRE child = expr                                  # Pre
	| SOMETIME_P child = expr                           # SometimeP
	| ALWAYS_P child = expr                             # AlwaysP
	| left = expr SINCE right = expr                    # Since
	| SOMETIME_P bound=timeBound child = expr           # TimedSometimeP
	| ALWAYS_P bound=timeBound child = expr             # TimedAlwaysP
	| left = expr SINCE bound=timeBound right = expr    # TimedSince

	| NEXT child = expr                                 # Next
	| SOMETIME_F child = expr                           # SometimeF
	| ALWAYS_F child = expr                             # AlwaysF
	| left = expr UNTIL right = expr                    # Until
	| SOMETIME_F bound=timeBound child = expr           # TimedSometimeF
	| ALWAYS_F bound=timeBound child = expr             # TimedAlwaysF
	| left = expr UNTIL bound=timeBound right = expr    # TimedUntil

	| '(' child = expr ')'                              # Grouping
    ;

atom:	  name  = IDENTIFIER							# NamedAtom
	| '$' index = NUMBER								# PositionalProp
	| '$' index = NUMBER op = REL_OP constant = NUMBER	# PositionalPred;

timeBound : '[' (l = NUMBER)? ':' (u = NUMBER)? (scale = TIMESCALE)? ']';

NOT 		: '!'  	| 'not' 	| 'NOT';
LOR			: '||' 	| 'or' 		| 'OR';
LAND		: '&&' 	| 'and' 	| 'AND';
IMPLIES 	: '->' 	| 'implies' | 'IMPLIES';

PRE 		: 'Y' 	| 'pre' | 'PRE' | 'previously' | 'PREVIOUSLY';
SOMETIME_P 	: 'P' 	| 'once' | 'ONCE' | 'past_eventually' | 'PAST_EVENTUALLY' ;
ALWAYS_P 	: 'H' 	| 'historically' | 'HISTORICALLY' | 'past_always' | 'PAST_ALWAYS';
SINCE 		: 'S' 	| 'since' | 'SINCE';

NEXT 		: 'X' 	| 'next' | 'NEXT' ;
SOMETIME_F 	: 'F' 	| 'eventually' | 'EVENTUALLY';
ALWAYS_F 	: 'G' 	| 'always' | 'ALWAYS' | 'globally' | 'GLOBALLY';
UNTIL 		: 'U' 	| 'until' | 'UNTIL';

IDENTIFIER: [_a-zA-Z][_a-zA-Z0-9]*;

REL_OP: '<' | '<=' | '>' | '>=';

TIMESCALE: 'h' | 'm' | 's' | 'ms' | 'us' | 'ns';

NUMBER: DIGITS ('.' DIGITS)?;

DIGITS: [0-9]+;

WS: [ \r\n\t]+ -> channel (HIDDEN);