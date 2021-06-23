%hechos
hombre(filogonio).
hombre(jesus).
hombre(martin).
hombre(cresenciano).
hombre(apolonio).
hombre(juan).
hombre(pedro).

mujer(norma).
mujer(maria).
mujer(francisca).

entrada(crema_de_calabacin).
entrada(alcachofas_hervidas).
entrada(acelgas_con_patatas).
entrada(garbanzos_con_espinacas).
entrada(potage_de_garbanzas).
entrada(arroz_a_la_cubana).
entrada(paella).

carne(cabrito_asado_con_patatas).
carne(carne_de_puerco_en_salsa).
pescado(filete_asado).
pescado(pescado_blanco_a_la_plancha).
pescado(gambas_a_la_planca).
pescado(langostinos_cocidos).
pescado(pescadilla).

postre(arroz_con_leche).
postre(natilla_de_vainilla).
postre(helado_de_chocolate).
postre(flan_napolitano).
postre(pastel_de_chocolate).
postre(napolitano_de_nuez).

calorias(crema_de_calabacin,174).
calorias(alcachofas_hervidas,295).
calorias(acelgas_con_patatas, 300).
calorias(garbanzos_con_espinacas,200).
calorias(potage_de_garbanzas,244).
calorias(arroz_a_la_cubana, 403).
calorias(paella,455).
calorias(cabrito_asado_con_patatas,222).
calorias(filete_asado,380).
calorias(carne_de_puerco_en_salsa,342).
calorias(pescado_blanco_a_la_plancha,225).
calorias(pescadilla, 220).
calorias(gambas_a_la_plancha,326).
calorias(langostinos_cocidos ,246).
calorias(arroz_con_leche,200).
calorias(natilla_de_vainilla,350).
calorias(helado_de_chocolate,370).
calorias(flan_napolitano,320).
calorias(pastel_de_chocolate,420).
calorias(napolitano_de_nuez,450).

%reglas
segundo_plato(X):-carne(X).
segundo_plato(X):-pescado(X).

permitido(Cliente, Permitido):-hombre(Cliente), Permitido is 1000.
permitido(Cliente, Permitido):-mujer(Cliente), Permitido is 800.

comida(Primero,Segundo,Tercero):- entrada(Primero), segundo_plato(Segundo), postre(Tercero).

kcalorias(X,Y,Z,Calorias):- comida(X,Y,Z),calorias(X,Ce),calorias(Y,Cs),calorias(Z,Cp),Calorias is Ce+Cs+Cp.

recomendacion(X,Y,Z,Calorias,Cliente):- comida(X,Y,Z), permitido(Cliente, P), kcalorias(X,Y,Z,C), C=<P, Calorias=C.

%funcion recursiva para sumar el total de calorias de pescado
calorias_pescado:- findall(C, (pescado(Pescado), calorias(Pescado, C)), ListaCalorias), 
                   sumlist(ListaCalorias, Sum),
                    write('Total de calorias: '), write(Sum). 
  
  

%funcion recursiva para sumar el total de calorias de carne
calorias_carne:- findall(C, (carne(Carne), calorias(Carne, C)), ListaCalorias), 
                   sumlist(ListaCalorias, Sum),
                   write('Total de calorias: '), write(Sum). 

%buscar combinaciones de menu con mas calorias


