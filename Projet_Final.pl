%effectuer les dérivation subtraction
derivaSub([E1,E2],[E3]):-
     E3 is E2 -E1.
derivaSub([E1,E2|L1],[E3|L2]):-
    E3 is E2 -E1,
    derivaSub([E2|L1],L2).
%effectuer les dérivation division
drivaDiv([E1,E2],[E3]):-
    E3 is E2/E1.
drivaDiv([E1,E2|L],[E3|L2]):-
    E3 is E2/E1,
    drivaDiv([E2|L],L2).
%vérifier les suites constantes
constante([_]).
constante([E1,E1|L]):-
    constante([E1|L]).
%vérifier les suites répétantes avec 2 nombres
repetant2([_,_]).
repetant2([E1,E2,E1,E2|L]):-   
    repetant2([E1,E2|L]).
%vérifier les suites répétantes avec 3 nombres
repetant3([_,_,_]).
repetant3([E1,E2,E3,E1,E2,E3|L]):-   
    repetant3([E1,E2,E3|L]).
%premier element d'une liste
elementPre([E|_],E).
%dernier element d'une liste
elementDer([E],E).           
elementDer([_|L],E):-
    elementDer(L,E).
%deuxième element d'une liste
elementDeux([_,E|_],E).
%calcul S3
calcul([E],E).
calcul([E1|L],Er):-
    calcul(L,Er1),
    Er is E1*Er1.

%calcul nombre de la suite
calculNombre([],0).
calculNombre([_|L],N):-
    calculNombre(L,N1),
    N is N1+1.
%supprimer le dernier element d'une liste
supprimerDer1([E,_],[E]).
supprimerDer1([E|L],[E|K]):-
    supprimerDer1(L,K).
%supprimer les 2 derniers elements d'une liste
supprimerDer2([_,_],[]).
supprimerDer2([E|L],[E|K]):-
    supprimerDer2(L,K).
%S3
complet(ListeIn,Out):-
    derivaSub(ListeIn,ListeSub),
    drivaDiv(ListeSub,ListeDiv),
    constante(ListeDiv),
    elementPre(ListeDiv,E1),
    elementDer(ListeIn,E2),
    calcul(ListeDiv,E3),
    Out is E2+E3*E1.
    %numConstant,dernier element ListeIn,liste out
%S2
complet(ListeIn,Out):-
    derivaSub(ListeIn,ListeSub),
    derivaSub(ListeSub,ListeSub2),
    constante(ListeSub2),
    elementDer(ListeSub,E1),
    elementDer(ListeIn,E2),
    Out is E2+E1+1.
%S1 pour les suites répétantes avec 2 nombres
complet(ListeIn,Out):-
    calculNombre(ListeIn,N),
    1 is mod(N, 2),
    derivaSub(ListeIn,ListeSub),
    repetant2(ListeSub),
    elementPre(ListeSub,E1),
    elementDer(ListeIn,E2),
    Out is E2+E1.
complet(ListeIn,Out):-
    calculNombre(ListeIn,N),
    0 is mod(N,2),
    supprimerDer1(ListeIn,ListeIn1),
    derivaSub(ListeIn1,ListeSub),
    repetant2(ListeSub),
    elementDer(ListeSub,E1),
    elementDer(ListeIn,E2),
    Out is E2 + E1.
    
%S1 pour les suites répétantes avec 3 nombres
complet(ListeIn,Out):-
    calculNombre(ListeIn,N),
    1 is mod(N, 3),
    derivaSub(ListeIn,ListeSub),
    repetant3(ListeSub),
    elementPre(ListeSub,E1),
    elementDer(ListeIn,E2),
    Out is E2+E1.

complet(ListeIn,Out):-
    calculNombre(ListeIn,N),
    2 is mod(N, 3),
    supprimerDer1(ListeIn,ListeIn1),
    derivaSub(ListeIn1,ListeSub),
    repetant3(ListeSub),
    elementDeux(ListeSub,E1),
    elementDer(ListeIn,E2),
    Out is E2+E1.

complet(ListeIn,Out):-
    calculNombre(ListeIn,N),
    0 is mod(N, 3),
    supprimerDer2(ListeIn,ListeIn1),
    derivaSub(ListeIn1,ListeSub),
    repetant3(ListeSub),
    elementDer(ListeSub,E1),
    elementDer(ListeIn,E2),
    Out is E2+E1.
