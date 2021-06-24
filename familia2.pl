:- discontiguous persona/8.
:- discontiguous persona/7.

persona(
  miembro(padre), 
  familia(1),
  nombre('Tomas'), 
  a_paterno('Garcia'), 
  a_materno('Perez'), 
  fechaNac(07,5,1960), 
  ocupacion(profesor), 
  salario(60)).  

persona(
  miembro(madre), 
  familia(1),
  nombre('Ana'), 
  a_paterno('Lopez'), 
  a_materno('Ruiz'), 
  fechaNac(10,03,1962), 
  ocupacion(medica), 
  salario(90)).

persona(
  miembro(hijo),
  familia(1),
  nombre('Juan'), 
  a_paterno('Garcia'), 
  a_materno('Lopez'), 
  fechaNac(5,01,1980), 
  ocupacion(estudiante)).

persona(
  miembro(hijo),
  familia(1),
  nombre('Maria'), 
  a_paterno('Garcia'), 
  a_materno('Lopez'), 
  fechaNac(12,04,1992), 
  ocupacion(estudiante)).

persona(
  miembro(padre), 
  familia(2),
  nombre('Jose'), 
  a_paterno('Perez'), 
  a_materno('Ruiz'), 
  fechaNac(06,03,1963), 
  ocupacion(pintor), 
  salario(120)).

persona(
  miembro(madre), 
  familia(2),
  nombre('Luisa'), 
  a_paterno('Galvez'), 
  a_materno('Perez'), 
  fechaNac(12,5,1964), 
  ocupacion(medica), 
  salario(90)).

persona(
  miembro(hijo),
  familia(2),
  nombre('Juan Luis'), 
  a_paterno('Perez'), 
  a_materno('Galvez'), 
  fechaNac(5,02,1960), 
  ocupacion(estudiante)).

persona(
  miembro(hijo),
  familia(2),
  nombre('Maria Jose'), 
  a_paterno('Perez'), 
  a_materno('Galvez'), 
  fechaNac(12,06,1992), 
  ocupacion(estudiante)).

persona(
  miembro(hijo),
  familia(2),
  nombre('Jose Maria'), 
  a_paterno('Perez'), 
  a_materno('Galvez'), 
  fechaNac(12,07,1994), 
  ocupacion(estudiante)).

% Cuanto ganan por familia 
salarios(Salario, Familia):- 
  findall(S, persona(_, familia(Familia), _, _, _, _, _, salario(S)), Lista), sumlist(Lista, Salario).

%Cuantos hijos tiene cada familia
hijos(NumHijos, Familia):- 
  findall(_, persona(miembro(hijo), familia(Familia),_,_,_,_,_), ListaHijos), length(ListaHijos, NumHijos).

%quienes son estudiantes
estudiantes(Lista):- findall((N,A1,A2), persona(_,_,nombre(N),a_paterno(A1),a_materno(A2),_,ocupacion(estudiante)), Lista).

%quienes nacieron en mayo 
mayo(Lista):- findall((N,A1,A2), persona(_,_,nombre(N),a_paterno(A1),a_materno(A2),fechaNac(_,5,_),_), Lista).
mayo(Lista):- findall((N,A1,A2), persona(_,_,nombre(N),a_paterno(A1),a_materno(A2),fechaNac(_,5,_),_, _), Lista).

% Porcentaje
porcentaje(P):- salarios(S1, 1), salarios(S2, 2), P is S1/S2*100.