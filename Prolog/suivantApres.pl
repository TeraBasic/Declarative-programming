% % % % % % % % % % % % % % % % % % % % % % % % %
% Programme à écrire (main) :
%   lire une requête suivantApres sur des nombres bâtons (o, u, uu, uuu, ..., uuuuuuuuu)
%   exécuter la requête
%   afficher les résultats
% 
% le programme principal, la lecture, l'ecriture et le lancement de l'exécution sont donnés
%
% il ne reste plus qu'à ecrire le prédicat suivantApres avec le profil attendu :
% suivantApres(en entrée un nombre bâtons, en sortie un nombre bâtons)
% le prédicat suivant est donné en extension en listant l'ensemble des cas
% le prédicat suivantApres ne doit pas être une relation en extension 
% le prédicat suivantApres doit utiliser le prédicat suivant
% % % % % % % % % % % % % % % % % % % % % % % % % 

suivant(o,u).
suivant(u,uu).
suivant(uu,uuu).
suivant(uuu,uuuu).
suivant(uuuu,uuuuu).
suivant(uuuuu,uuuuuu).
suivant(uuuuuu,uuuuuuu).
suivant(uuuuuuu,uuuuuuuu).
suivant(uuuuuuuu,uuuuuuuuu).


  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%% debut de votre code ici %%%
suivantApres(Y,X) :-
    suivant(Y,Z),
    suivant(Z,X).

  %%% fin de votre code  ici  %%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


main :- 
  writeln('Votre requête ? (ex. |: suivantApres(u,X).   )'),
  read(Entree),
  findall(Entree,Entree,Resultats),
  write('Liste des résultats : '),
  writeln(Resultats).

:- main, halt.