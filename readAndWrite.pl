% carro(pĺaca, consumo_km, lista de choferes)
carro(hav379, 0.2, petroleo,  [chofer(kyle, 5, 17), chofer(josh, 12, 60), chofer(juan, 3, 8)]). 
carro(hav380, 0.4, petroleo,  [chofer(kyle, 5, 17), chofer(josh, 12, 60), chofer(juan, 3, 8)]). 
carro(hav381, 0.3, gasolina, [chofer(pedro, 5, 17), chofer(kyle, 5, 60), chofer(apolonio, 3, 8)]). 


% a) ¿Que cantidad de choferes han conducido el carro que tiene como placa la quie entre el usuario
%    por consola? 

cantidad:- read(Placa), carro(Placa, _, _,Choferes), length(Choferes, Cantidad), 
write('La cantidad de choferes es: '), write(Cantidad). 

% b) ¿Listado de las placas de todos los carros que consumen petroleo? 

% findAll(Respuesta, Goal, Listado)
listadoPlacas :- findall(Placa, carro(Placa, _, petroleo, _), ListaRespuestas), 
                  write(ListaRespuestas).

muestraLista([]):- !. 
muestraLista([C|Lista]) :- write(C), nl, muestraLista(Lista). 


% c) Dada la placa de un carro y una cantidad de combustible, determinar cuantos km puede recorrer
%    dicho carro con el combustible dado. 

cantKm(Placa, Combustible, CantKm) :- 
  carro(Placa, Consumo, _, _), 
  CantKm is Consumo * Combustible. 

% El findAll tiene limitaciones
familia(pedro, [maria, juan]).
familia(josue, [roiber, maria]).
familia(einstein, [dimitri, vladimir]).

setof(C, (P,H)^(familia(P, H), member(C,H)),L ).