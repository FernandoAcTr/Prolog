:- module(test, [do_test/0]).

:- use_module(library(pce)).
:- use_module(library(pce_util)).

do_test :- test. 

test :-
    new(Dialog, dialog('Test')),
		send_list(Dialog, append, 
		[
			new(A, menu('1. Me siento triste y deprimido')),
			new(B, menu('2. Por las mañanas me siento mejor que por las tardes')),
			new(C, menu('3. Frecuentemente tengo ganas de llorar y a veces lloro')),
			new(D, menu('4. Me cuesta mucho dormir o duermo mal por las noches')),
			new(E, menu('5. Ahora tengo tanto apetito como antes')),
			new(F, menu('6. Todavía me siento atraído por el sexo opuesto')),
			new(G, menu('7. Creo que estoy adelgazando')),
			new(H, menu('8. Estoy estreñido')),
			new(I, menu('9. Tengo palpitaciones')),
			new(J, menu('10. Me canso por cualquier cosa')),
			new(K, menu('11. Mi cabeza está tan despejada como antes')),
			new(L, menu('12. Hago las cosas con la misma facilidad que ante')),
			new(M, menu('13. Me siento agitado e intranquilo y no puedo estar quieto')),
			new(N, menu('14. Tengo esperanza y confío en el futuro')),
			new(O, menu('15. Me siento más irritable que habitualmente')),
			new(P, menu('16. Encuentro fácil tomar decisiones')),
			new(Q, menu('17. Me creo útil y necesario para la gente')),
			new(R, menu('18. Encuentro agradable vivir, mi vida es plena')),
			new(S, menu('19. Creo que sería mejor para los demás si me muriera')),
			new(T, menu('20. Me gustan las mismas cosas que solían agradarme'))
		]),
	send_list(A, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(B, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(C, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(D, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(E, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(F, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(G, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(H, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(I, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(J, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(K, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(L, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(M, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(N, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(O, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(P, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(Q, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(R, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(S, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send_list(T, append, ['Muy pocas veces', 'Algunas veces', 'Muchas veces', 'Casi siempre']),
	send(Dialog, append, 
		new(_, button('Listo', 
			message(
					@prolog, 
					preguntas, 
					A?selection,
					B?selection,
					C?selection,
					D?selection,
					E?selection,
					F?selection,
					G?selection,
					H?selection,
					I?selection,
					J?selection,
					K?selection,
					L?selection,
					M?selection,
					N?selection,
					O?selection,
					P?selection,
					Q?selection,
					R?selection,
					S?selection,
					T?selection
			)))
	),
	send(Dialog, open). 

% -----------------------------------------------------
% Hipotesis
% -----------------------------------------------------
ausencia_depresion(Puntaje) :-
	new(G, dialog('Ausencia de depresion')),
	concat('Tu puntaje fue de ', Puntaje, C1),
	concat(C1, '\nNo padeces ningun tipo de depresion', C2),
	send(G, append, new(Txt4, text(C2))),
	send(Txt4, font, bold),
	send(Txt4, alignment, center),
	send(G, open).

depresion_leve(Puntaje) :-
	new(G, dialog('Depresion leve')),
	concat('Tu puntaje fue de ', Puntaje, C1), 
	concat(C1, '\nPadeces una depresion leve. Considera visitar a un psicologo', C2),
	send(G, append, new(Txt4, text(C2))),
	send(Txt4, font, bold),
	send(Txt4, alignment, center),
	send(G, open).

depresion_moderada(Puntaje) :-
	new(G, dialog('Depresion moderada')),
	concat('Tu puntaje fue de ', Puntaje, C1),
	concat(C1, '\nPadeces una depresion moderada. Considera visitar a un psicologo', C2),
	send(G, append, new(Txt4, text(C2))),
	send(Txt4, font, bold),
	send(Txt4, alignment, center),
	send(G, open).

depresion_grave(Puntaje) :-
	new(G, dialog('Depresion moderada')),
	concat('Tu puntaje fue de ', Puntaje, C1),
	concat(C1, '\nPadeces una depresion grave. Considera seriamente visitar a un psicologo, \nNo hay de que avergonzarse, a muchos nos sucede', C2),
	send(G, append, new(Txt4, text(C2))),
	send(Txt4, font, bold),
	send(Txt4, alignment, center),
	send(G, open).

preguntas(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T):-
	pregunta(A, VA, positiva),
	pregunta(B, VB, positiva),
	pregunta(C, VC, positiva),
	pregunta(D, VD, positiva),
	pregunta(E, VE, positiva),
	pregunta(F, VF, positiva),
	pregunta(G, VG, positiva),
	pregunta(H, VH, positiva),
	pregunta(I, VI, positiva),
	pregunta(J, VJ, positiva),
	pregunta(K, VK, negativa),
	pregunta(L, VL, negativa),
	pregunta(M, VM, negativa),
	pregunta(N, VN, negativa),
	pregunta(O, VO, negativa),
	pregunta(P, VP, negativa),
	pregunta(Q, VQ, negativa),
	pregunta(R, VR, negativa),
	pregunta(S, VS, negativa),
	pregunta(T, VT, negativa), 
	sumlist([VA,VB,VC,VD,VE,VF,VG,VH,VI,VJ,VK,VL,VM,VN,VO,VP,VQ,VR,VS,VT], Sum),
	showResult(Sum).
	
pregunta(Respuesta, Valor, Tipo):- opcion(Respuesta, Valor, Tipo).

opcion('Muy pocas veces', Valor, positiva):- Valor is 1.
opcion('Algunas veces', Valor, positiva):- Valor is 2. 
opcion('Muchas veces', Valor, positiva):- Valor is 3.
opcion('Casi siempre', Valor, positiva):- Valor is 4.

opcion('Muy pocas veces', Valor, negativa):- Valor is 4.
opcion('Algunas veces', Valor, negativa):- Valor is 3. 
opcion('Muchas veces', Valor, negativa):- Valor is 2.
opcion('Casi siempre', Valor, negativa):- Valor is 1.

showResult(Suma):- Suma =< 28, ausencia_depresion(Suma), !.
showResult(Suma):- Suma >= 28, Suma =< 41, depresion_leve(Suma), !.
showResult(Suma):- Suma >= 42, Suma =< 53, depresion_moderada(Suma), !.
showResult(Suma):- Suma >= 54, depresion_grave(Suma), !.