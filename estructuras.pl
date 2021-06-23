persona(pedro, lopez, fechaNac(22,07,1999), aotl990702hgtcvs09).

estudiantes(
  e1(vladimir, putin, fecha(22, 08, 1990))
).

% Desglosar los parametros del poligono en una lista 
ladosIguales(P):- P =.. [_| Lista], iguales(Lista). 
% Comparar todos los elementos de la lista para ver si son iguales
iguales([]) :- !, true. 
iguales([_]):- !, true. 
iguales([X,X | Lista]):- iguales([X| Lista]). 

% Misma funcion ladosIguales, pero usando el operador functor, junto con arg
li(P) :- functor(P, Name, Arity), bi(P, Arity). 
bi(_, 0):- !, true. 
bi(_, 1):- !, true. 
bi(P, N):- 
  arg(N,P,Value1), 
  Ant is N-1, 
  arg(Ant, P, Value2), 
  Value1 == Value2, 
  bi(P, Ant). 
 