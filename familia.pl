familia(
  padre(nombre('Tomas'), a_paterno('Garcia'), a_materno('Perez'), fechaNac(07,05,1960), trabajo(profesor), salario(60)),  
  madre(nombre('Ana'), a_paterno('Lopez'), a_materno('Ruiz'), fechaNac(10,03,1962), trabajo(medica), salario(90)),
  [
    hijo(nombre('Juan'), a_paterno('Garcia'), a_materno('Lopez'), fechaNac(05,01,1980), trabajo(estudiante)),
    hijo(nombre('Maria'), a_paterno('Garcia'), a_materno('Lopez'), fechaNac(12,04,1992), trabajo(estudiante))
  ]
).

familia(
  padre(nombre('Jose'), a_paterno('Perez'), a_materno('Ruiz'), fechaNac(06,03,1963), trabajo(pintor), salario(120)),  
  madre(nombre('Luisa'), a_paterno('Galvez'), a_materno('Perez'), fechaNac(12,05,1964), trabajo(medica), salario(90)),
  [
    hijo(nombre('Juan Luis'), a_paterno('Perez'), a_materno('Galvez'), fechaNac(05,02,1960), trabajo(estudiante)),
    hijo(nombre('Maria Jose'), a_paterno('Perez'), a_materno('Galvez'), fechaNac(12,06,1992), trabajo(estudiante)),
    hijo(nombre('Jose Maria'), a_paterno('Perez'), a_materno('Galvez'), fechaNac(12,07,1994), trabajo(estudiante))
  ]
).

%Cuanto ganan por familia
salarios:- findall((S1, S2), familia(padre(_,_,_,_,_,salario(S1)), madre(_,_,_,_,_,salario(S2)), _), ListaSalarios), 
                ganancias(ListaSalarios).

ganancias([]):- !.
ganancias([(P,M)|L]):- mostrarSalario(P,M), ganancias(L).

mostrarSalario(P,M):- nl, S is P+M, write('La ganacias de la familia es: '), write(S).

%Cuantos hijos tiene cada familia
numHijos(X):- familia(_,_,Hijos), length(Hijos, X). 

%quienes son estudiantes
estudiantes:- findall(C, (familia(_,_, Hijos), member(C, Hijos)), ListaHijos), mostrarLista(ListaHijos).

mostrarLista([]):- !.
mostrarLista([C|L]):- write(C), nl, mostrarLista(L).

