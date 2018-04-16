1.1
#calculUnemanche/2, claculUneManche(E,S) S est le score de la manche E pour jouereur 1
calculUnemache([pierre,pierre],0.5).
calculUnemache([pierre,ciseau],1).
calculUnemache([pierre,feuille],0).
calculUnemache([ciseau,ciseau],0.5).
calculUnemache([ciseau,pierre],0).
calculUnemache([ciseau,feuille],1).
calculUnemache([feuille,ciseau],0).
calculUnemache([feuille,pierre],1).
calculUnemache([feuille,feuille],1.5).
#calculEnsemble/2 calculEnsemble(L,S) S est le somme de la partie L
calculEnsemble([],0).
calculEnsemble([E|L],S):-
	calculUneManche(E,S1),
	calculEnsemble(L,S2),
	S = S1 + S2.

#resultat/2,resultat(S,R), S est le score d'une partie,R est resultat(Perte ou Gagne ou egal)
resultat(S,perte):-
	 S < 1.5.
resultat(S,gagne):-
 	S > 1.5.
resultat(S,egal):-
	s = 1.5.

2.1
SPEC t/1
 	t(L) vrai ssi L est L est Texte,
	1, L = [], t([]) -> true;
	2, L = [E|L], blabla
at/1
ac/1
c/1

c([]).
c(['c'|L]):- 
	c(L).
ac([]).
ac([','|L]):-
	concat(C,AC,L),
	c(C),
	ac(AC).
t([]).
t(['c'|L]):-
	concat(C,[AC,AT],L),
	c(C),
	ac(AC),
	at(AT).
at([';'|L]):-
	concat('c',[C,AC,AT],L),
	c(C),
	ac(AC),
	at(AT).
concat([],L,L).
concat([E|L1],L2,[E|L]):-
	concat(L1,L2,L),

2.2
SPEC prod/2
	prod(L,R) vrai ssi R est la séquences de séquences de données.
	1), L = [] -> prod([],[]).
	2), L= [E|L] -> prod([E|L],)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
2.1
lireC(D) -> D;
lireC([c|L]) -> lireC(L).

lireAC(D) -> D;
lireAC([virgul,c|L]) -> K = lireC(L),lireAC(K).

lireAT(D) -> D;
lireAT([';',c|L]) -> K=lireC(L),M=lireAC(K),lireAT(M);

lireT(T) -> T;
lireT([c|L]) -> K=lireC(L),M=lireAC(K),lireAT(M);


3.1 
SPEC sequenceEntiersDeLibrandi/2
	sequenceEntiersDeLibrandi(N,L) vrai ssi L est la séquence entre 1 est N
	1) N = 1 -> 
	sequenceEntiersDeLibrandi(N,[]).
	2) N > 1 -> 
	sequenceEntiersDeLibrandi(N,[N|L]):- estEntierDeLibrandi(N),
		sequenceEntiersDeLibrandi(N-1,L])
en erlang:
	sequenceEntiersDeLibrandi(N) -> EntiersDeLibrandi(estEntierDeLibrandi(n),N).
	EntiersDeLibrandi(1) -> [];
	EntiersDeLibrandi(true,N) -> [N|sequenceEntiersDeLibrandi(N-1)];
	EntiersDeLibrandi(false,N) -> [sequenceEntiersDeLibrandi(N-1)].

3.2 Nombre de Librandi concurrent
-module(librandi)
init(Nbprod) ->
	PidConso = spawn(librandi,conso,[Nbprod]),
	proNat(PidConso,Nbprod).
%envoies les nombres après de traitement
proNat(PidConso,N) ->
	spawn(fun() -> PidConso ! [estEntierDeLibrandi(N),N])
	proNat(PidConso,N-1).
conso(0) -> [];
conso(Nbprod) shen Nbprod > 0 ->
	reveive M ->
		case M of
			{true,E} -> [E|conso(Nbprod-1)];
			{false,E} -> [L];
		end
	end.
