% listar(L) :- L = [1,2,3,4,5].
listar(L) :- Cabeza = [1, 1.1], Cola = [2,3,[3.1, 3.2, 3.3],4,5], L = [0, Cabeza | Cola].

dameCabeza([Cabeza | Cola], C, L):- C = Cabeza, L=Cola. 
% Para no hacer C = Cabeza, L=Cola se puede unificar directamente,  evitando definir mas variables
dameCabeza([C | L], C, L). 


% Eliminar los dos primeros elementos de la lista 
eliminar2([_, _ | L], L). 


% Ejercicio de los progenitores usando listas 
progenitor(pedro, [ana, ramon, javier, josh, vilma, nicolas, peter ]).
progenitor(juan, [ben, pepe, josue, jesica, pavel, keith, kyle ]).

primerHijo(P, Hijo):- progenitor(P,[Hijo | _]). 

esPadreDe(Padre, Hijo) :- progenitor(Padre, Hijos), buscar(Hijo, Hijos). 
% Busqueda en una lista, se va descabezando recursivamente hasta llegar a una lista vacia
buscar(_, []):- !, fail.   
buscar(Hijo, [C|_]) :- C == Hijo, !.
buscar(Hijo, [_|L]) :- buscar(Hijo, L).   

% Prolog ya brinda metodos para operar sobre listas, uno de ellos es member, que hace una busqueda
esPadreDe2(Padre, Hijo) :- progenitor(Padre, Hijos), member(Hijo, Hijos). 

% Concatenar dos listas
concatenar([], L, L).
concatenar([X|M], L, [X|Z]):- concatenar(M,L,Z).