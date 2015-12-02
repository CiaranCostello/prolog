mkList(0, []).
mkList(Num, [Num | L]) :- N is Num - 1, N >= 0, mkList(N, L).

s(0) --> [].
s(C) --> { mkList(C, L), member(X, L), C0 is C - X }, [X], s(C0).