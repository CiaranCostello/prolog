:- begin_tests(ai2).

test(all_true):-
	lcRule([a,b],[[a],[b,c]]),
	lcRule([a,b],[[a,b,c],[c]]),
	lcRule([a,b,c],[[a,d],[d,b,c]]),
	lcRule([a,a],[[b],[c,b]]).

test(none_true) :-
	\+lcRule([a,d],[[a,b,c],[c]]),
	\+lcRule([b,a],[[a],[b,c]]).

:- end_tests(ai2).