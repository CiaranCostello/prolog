:- begin_tests(assignment1).
:- consult(exercise1).
/*
  test(add):-
    add(0, s(0), s(0)),
    add(s(s(0)), p(0), s(0)),
    add(p(p(p(0))), s(s(0)), p(0)).
*/

  test(reduce_mixed_signs):-
    add2(s(p(s(0))), 0, s(0)),
    add2(s(p(s(p(0)))), 0, 0).

  test(reduce_binary_addition):-
    add2(s(s(0) + s(0)), 0, s(s(s(0)))),
    add2(p(s(s(0)) + p(0)), 0, 0).

  test(reduce_unary_minus):-
    add2(-s(0), 0, p(0)),
    add2(s(s(-p(0))), 0, s(s(s(0)))).

  test(reduce_unary_in_complex_term):-
    add2(s((-p(0) + p(p(0)))), 0, 0),
    add2(p(p(0) + p(-p(0))), 0, p(p(0))).

  test(minus):-
    minus(s(s(0) + s(0)), p(p(p(0)))),
    minus(-s(s(p(0) + s(0))), s(s(0))).

  % the expressions from the assignment sheet
  test(ex1) :-
    add2(s(0)+s(s(0)), s(s(0)), s(s(s(s(s(0)))))),
    add2(0, s(0)+s(s(0)), s(s(s(0)))),
    add2(s(s(0)), s(0)+s(s(0)),  s(s(s(s(s(0)))))),
    add2(s(0)+s(0), s(0+s(s(0))), s(s(s(s(s(0)))))).

  test(ex2) :-
    add2(p(s(0)), s(s(0)),  s(s(0))),
    add2(0, s(p(0)), 0),
    add2(p(0)+s(s(0)),s(s(0)),s(s(s(0)))),
    add2(p(0), p(0)+s(p(0)), p(p(0))).

  test(ex3) :-
    minus(0, 0),
    minus(s(0), p(0)),
    minus(s(s(0)), p(p(0))),
    minus(s(p(0)), 0),
    minus(p(s(p(0))), s(0)).

  test(ex4) :-
    add2(-p(s(0)), s(s(0)), s(s(0))),
    add2(p(0)+s(s(0)), -s(s(0)), p(0)).

  test(ex5) :-
    subtract(p(s(0)), s(s(0)),  p(p(0))),
    subtract(p(0), -s(s(0)), s(0)).

  test(ex6) :-
    add2(-(s(0)-p(0)),s(0), p(0)),
    subtract(p(0), p(s(0))-s(s(0)), s(0)).

:- end_tests(assignment1).
