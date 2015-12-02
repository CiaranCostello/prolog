child(anna,bridget).
child(bridget, caroline).
child(caroline,donna).
child(donna,emily).

descend(X,Y) :- child(X,Y).
descend(X,Y) :- child(X,Z), descend(Z,Y).

numeral(0).
numeral(succ(X)):- numeral(X).

dope_as_shit(taytay).
cool_song(X) :- written_by_tay(X).
written_by_tay(22).
written_by_tay(15).