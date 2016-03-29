%member(Element, List) true if Element is contained in List

%all(A, B) true if all elements in list A are members of list B
all([],_).
all([H|T],L) :- member(H,L), all(T,L).

%nonmember(Element, List) true if Element is not in List
nonmember(_,[]).
nonmember(X,[H|T]) :- X\=H, nonmember(X,T).

%logical consequence
%true if C list of all logical consequences of list KB
cn(C,KB) :- cn([],C,KB).
cn(TempC,C,KB) :- member([H|B],KB), all(B,TempC), nonmember(H,TempC), cn([H|TempC],C,KB).
cn(C,C,_).

lc(X,KB) :- cn(C,KB), member(X,C).

%get predicates from List ie [a, b, c] returns [[b], [c]]
preds([], []).
preds([H|List], Preds) :- extract(List, Preds).
extract([], []).
extract([H|Rest], [[H]|Preds]) :- extract(Rest, Preds).

%lcRule(List,KB).
%empty list
lcRule([], _).

lcRule([H|Rest], KB) :- extract(Rest, Preds), append(KB, Preds, NewKB), lc(H, NewKB).

%lcRule([a, Lista] , KB) true if 
% a == Lista
% a true for some lc of KB
% 
