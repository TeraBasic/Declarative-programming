union([],X,X).
union([E|X],Y,[E|Z]):-
    union(X,Y,Z).
eq(X,X).


exist(E,E).
exist(E,[E|_]).
exist(E,[A|L]):-
      dif(E,A),
      exist(E,L).

inexist(_,[]).
%inexist(E,[F|_]).
inexist(E,[F|L]):-
    dif(E,F),
    inexist(E,L).

notexist(_,[]).
notexist(X,[E|L]):-
    notexist(X,L),
    dif(X,E).

intersect1([],_,[]).
intersect1([E|R],[F|B],[E|C]):-
    E is F,
    intersect1(R,B,C).
intersect1([E|R],[F|B],C):-
    dif(E,F),
    intersect1(R,B,C).

intersect([],_,[]). 
intersect([_|A],B,C):-
    %exist(E,B) is false,
    intersect(A,B,C).
intersect([E|A],B,[E|C]):-
    exist(E,B),
    intersect(A,B,C).

delta([],_,[]).   
delta([E|L],B,C):-
    exist(E,B),
    delta(L,B,C).
delta([E|L],B,[E|C]):-
    inexist(E,B),
    delta(L,B,C).
delta2(X,Y,Z):-
    delta(X,Y,Z1),
    delta(Y,X,Z2),
    union(Z1,Z2,Z).

append([], L, L).
append([H|T1], L2, [H|T3]) :- append(T1, L2, T3).

compress([],[]).
compress([E|L],R):-
	compress(L,R),
    exist(E,R).
   
compress([E|L],[E|R]):-
     compress(L,R),
    notexist(E,R).
   

