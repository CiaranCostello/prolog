numeral(0).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(-X) :- numeral(X).
numeral(X-Y) :- numeral(X), numeral(Y).

add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).
add(p(X),Y,p(Z)) :- add(X,Y,Z).

eval(X, Y) :- sign_eval(X, A), p_eval(A, I), s_eval(A, J), combine(I, J, Y).

sign_eval(0, 0).
sign_eval(-X, Y) :- minus(X, A), sign_eval(A, Y).
sign_eval(s(X), s(Y)) :- sign_eval(X, Y).
sign_eval(p(X), p(Y)) :- sign_eval(X, Y).
sign_eval(X + Y, Z) :- sign_eval(X,A), sign_eval(Y,B), add(A, B, V), sign_eval(V, Z).
sign_eval(X - Y, Z) :- sign_eval(X,A), sign_eval(Y,B), subtract(A, B, Z).

p_eval(0,0).
p_eval(p(X), p(Y)) :- p_eval(X, Y).
p_eval(s(X), Y) :- p_eval(X, Y).

s_eval(0,0).
s_eval(s(X), s(Y)) :- s_eval(X, Y).
s_eval(p(X), Y) :- s_eval(X, Y).

combine(0, X, X).
combine(X, 0, X).
combine(p(X), s(Y), Z) :- combine(X, Y, Z).
combine(s(X), p(Y), Z) :- combine(X, Y, Z).

add2(X, Y, Z) :- eval(X, A), eval(Y, B), add(A, B, C), eval(C, Z).

minus(X, Y) :- eval(X, A) , min(A, Y).

min(0,0).
min(s(X), p(Y)) :- min(X, Y).
min(p(X), s(Y)) :- min(X, Y).

subtract(X, Y, Z) :- minus(Y, A), add2(X, A, Z).