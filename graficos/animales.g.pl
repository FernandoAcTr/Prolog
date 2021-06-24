/***************************PLF****************/
/****************************EJEMPLO ANIMALES**********************/

:- dynamic  yes/1.
:- dynamic no/1.

% DECLARACION DE LOS OPERADORES

 :- op(1115, fx, si).
 :- op(1110, xfy, entonces).
 :- op(1100, xfy, o).
 :- op(1000, xfy, y).
 :- op(900, fx, no).


%R1:
regla(si tiene_pelo(Animal) entonces mamifero(Animal)).
%R2:
regla(si tiene_cola(Animal) entonces mamifero(Animal)).
%R3:
regla(si come_semillas(Animal) entonces ave(Animal)).
%R4:
regla(si tiene_alas(Animal) entonces ave(Animal)).
%R5
regla(si tamano_grande(Animal) entonces herbivoro(Animal)).
%R6
regla(si ojos_chicos(Animal) entonces herviboro(Animal)).
%R7:
regla(si vuela(Animal) y pone_huevos(Animal) entonces ave(Animal)).
%R8:
regla(si tiene_cola(Animal) y tiene_pelo(Animal) entonces mamifero(Animal)).
%R9:
regla(si mamifero(Animal) y come_carne(Animal) entonces carnivoro(Animal)).
%R10:
regla(si color_leonado(Animal) entonces carnivoro(Animal)).
%R11:
regla(si mamifero(Animal) y tiene_dientes_agudos(Animal) y tiene_garras(Animal) y tiene_ojos_que_mira_hacia_adelante(Animal) entonces carnivoro(Animal)).
%R12:
regla(si come_yerba(Animal) y piel_gruesa(Animal) entonces herbivoro(Animal)).



identificar :- hipotesis(Animal),
      respuesta(Animal),
      undo.

%HIPOTESIS
hipotesis(perro)     :- perro, !.
hipotesis(tigre)     :- tigre, !.
hipotesis(pajaro)    :- pajaro, !.
hipotesis(elefante)  :- elefante, !.
hipotesis(desconocido).     /* sin diagnostico */

%VERIFICAR REGLAS
perro :-   carnivoro,
           verify(es_un_animal_domestico).


tigre :- carnivoro,
         verify(color_leonado),
         verify(tiene_franjas_negras).

pajaro:-  ave,
	    verify(tiene_varios_colores),
	    verify(es_pequeno).

elefante:- herbivoro,
	     verify(animal_pesado).


mamifero    :- verify(tiene_pelo), !.
mamifero    :- verify(tiene_cola).


ave         :- verify(tiene_plumas), !.
ave         :- verify(vuela),
               verify(pone_huevos).


carnivoro :- mamifero,verify(come_carne), !.
carnivoro :- mamifero,verify(tiene_colmillos),
             verify(tiene_garras_afiladas),
             verify(tiene_ojos_que_mira_hacia_delante).

herbivoro:-  verify(come_yerba),
	       verify(piel_gruesa).


% S de ask(S) unifica con S de verify(S)
verify(S) :-
      (yes(S) -> true ; (no(S) -> fail ; ask(S))).


ask(Pregunta):- 
      new(Di, dialog('PREGUNTA')), 
      new(LblIndicacion, label(null, '¿El animal tiene la siguiente caracteristica?  ')),
      new(LblPregunta, label(prob, Pregunta)), 
      new(BtnSi, button(yes, 
            and(
            message(Di, return, yes)
            ), 
            'SI'
      )),
      new(BtnNo, button(no, 
            and(
            message(Di, return, no)
            ), 
            'NO'
      )),
      send(Di, append(LblIndicacion)), 
      send(Di, append(LblPregunta)),
      send(Di, append(BtnSi)),
      send(Di, append(BtnNo)),
      send(Di, default_button, yes),
      send(Di, open), 
      get(Di, confirm, Answer), 
      write(Answer), nl, 
      send(Di, destroy),

      % Comparar la respuesta recibida y regresar un verdadero o un falso
      ((Answer == yes)->assert(yes(Pregunta)) ; assert(no(Pregunta)), fail).


respuesta(Animal):-
      new(Di, dialog('RESPUESTA')), 
      new(Lbl, label(null, 'Pienso que el animal es : ')),
      new(LblRespuesta, label(prob, Animal)), 
      send(Di, append(Lbl)), 
      send(Di, append(LblRespuesta)),
      send(Di, open). 

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.


