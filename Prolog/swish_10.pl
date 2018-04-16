delta([],_,[]).
delta([E|R],[F|B],[E,F|C]):-
    dif(E,F),
    delta(R,B,C).
delta([E|R],[F|B],C):-
    E is F,
    delta(R,B,C).

generer([],[]).
generer([_|L],R):-
    generer(L,R).  
generer([E|L],[E|R]):-
    generer(L,R).

suppr(_,[],[]).
suppr(X,[X|L],R):-
    suppr(X,L,R).
suppr(X,[E|L],[E|R]):-
    dif(X,E),
    suppr(X,L,R).

suppr1(X,[X|L],L).
suppr1(X,[E|L],[E|R]):-
    dif(X,E),
    suppr1(X,L,R).

