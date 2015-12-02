:-use_module(library(dif)).

s --> u(Count),[2],v(Count).

u(0) --> [].
u(succ(Count)) --> [0],u(Count).
u(Count) --> [1],u(Count).

v(0) --> [].
v(succ(Count)) --> [1],v(Count).
v(Count) --> [0],(Count).