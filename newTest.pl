:- begin_tests(assignment2).
:- consult(lab2part3).

test(all_true):-
	s(3, [3], []),
	s(3, [2,1], []),
	s(3, [1,2], []),
	s(3, [1,1,1], []).

test(none_true) :-
	s(3, [1,1,1,1], []).

:- end_tests(assignment2).