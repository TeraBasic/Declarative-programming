%%
suivant(o,u).
suivant(u,uu).
suivant(uu,uuu).
suivant(uuu,uuuu).
suivant(uuuu,uuuuu).
suivant(uuuuu,uuuuuu).
suivant(uuuuuu,uuuuuuu).
suivant(uuuuuuu,uuuuuuuu).
suivant(uuuuuuuu,uuuuuuuuu).

fusionne(o,X,X).
fusionne(X,Y,Z) :-suivant(X1,X),suivant(Y,Y1),fusionne(X1,Y1,Z).
%%    

%%
gt(X,Y):-
  {X>Y}.

insertion([],X,[X]).
insertion([E|L],X,[X,E|L]):-
   gt(E,X).
insertion([E|L],X,[E|T]):-
  gt(X,E),
  insertion(L,X,T).
%%

%%
proximus(o,i).
proximus(i,ii).
proximus(ii,iii).
proximus(iii,iv).
proximus(iv,v).
proximus(v,vi).
proximus(vi,vii).
proximus(vii,viii).
proximus(viii,ix).

addendum(o,X,X).
addendum(X,Y,Z):-
    proximus(X1,X),
    addendum(X1,Y,Z1),
    proximus(Z1,Z).

%%