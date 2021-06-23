media(X,Y,Z) :- Z is X/Y.

menu:- 
  write('1. Evar al cuadrado'), nl,
  write('2. Evar al cubo'), nl,
  write('0. Salir'), nl,
  write('Seleccione una opcion'), nl,
  read(Opcion), 
  ejecutar(Opcion).

ejecutar(Opcion):- 
  Opcion == 1, cuadrado;
  Opcion == 2, cubo;
  Opcion == 0, true.

cuadrado:- write('Digita el numero'), read(Numero), R is Numero*Numero, write(R).
cubo:- write('Digita el numero'), read(Numero), R is Numero*Numero*Numero, write(R).


transporte(madrid,20000).
transporte(barcelona,25000).
transporte(guadalajara,15000).
alojamiento(hotel,madrid, 2500).
alojamiento(hotel,barcelona, 2300).
alojamiento(hotel,guadalajara, 2100).
alojamiento(hostal,madrid, 1500).
alojamiento(hostal,barcelona, 1300).
alojamiento(camping,madrid, 500).
alojamiento(camping,barcelona, 700).
alojamiento(camping, guadalajara, 800).

cotizacion(TipoAlojamiento, Lugar, C):-
  transporte(Lugar, CT), 
  alojamiento(TipoAlojamiento, Lugar, CA), 
  C is CT+CA.


padre(jose, fernando).
padre(jose, luis).
padre(jose, marisol).

madre(maricela, fernando).
madre(maricela, luis).
madre(maricela, marisol).

hermano(X,Y):- padre(P, X), padre(P, Y), madre(M, X), madre(M, Y), X \== Y.
