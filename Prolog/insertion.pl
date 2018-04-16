% % % % % % % % % % % % % % % % % % % % % % % % %
% Programme à écrire (main) :
%   lire une liste (dans l'ordre croissant)
%   lire un entier
%   insérer l'entier dans la liste ("à sa place", ordre croissant)
%   afficher la liste résultat
%
% le programme principal, les lectures et
% l'ecriture sont donnés
%
% il ne reste plus qu'à ecrire le prédicat qui fait l'insertion de l'entier
% profil attendu :
% insere(en entrée une liste, en entrée un entier, en sortie une liste)
% pour tester >, vous pourrez utiliser le prédicat gt(X,Y) qui teste si X>Y
% % % % % % % % % % % % % % % % % % % % % % % % %

gt(X,Y):-
  {X>Y}.


  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%% debut de votre code ici %%%
insertion([],X,[X]).
insertion([E|L],X,[X,E|L]):-
   gt(E,X).
insertion([E|L],X,[E|T]):-
  gt(X,E),
  insertion(L,X,T).

  %%% fin de votre code  ici  %%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


lireListe([E|L]):-
  readln([E|_]),
  lireListe(L).
lireListe([]).

ecrireListe([]).
ecrireListe([E|L]):-
  writeln(E),
  ecrireListe(L).

main :-
  writeln('Votre liste ? (un entier par ligne, une ligne blanche à la fin)'),
  lireListe(Entree),
  writeln('Votre entier à insérer ?'),
  readln([N|_]),
  insertion(Entree,N,Sortie),
  write('Liste résultat : '),
  ecrireListe(Sortie).
:- use_module(library(clpq)), main, halt.
