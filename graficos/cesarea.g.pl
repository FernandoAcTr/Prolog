:- use_module(library(pce)).
:- use_module(library(pce_util)).
:- pce_image_directory('./iconos').

resource(cesarea, image, image('cesarea.jpg')).
resource(bebe, image, image('bebe.jpg')).

comenzar :-
	new(A, dialog('Sistema Experto Ginegologia')),
	send(A, append, new(Txt3, text('Sistema Experto para la Realizacion de Cesareas'))),
	send(Txt3, font, bold),
	send(Txt3,alignment, center),

	send(A, append, new(_, button(diagnostico, and(message(@prolog, diagnostico))))),
	send(A, append, new(_, button(informacion, and(message(@prolog, informacion)))), next_row),
	send(A, append, new(Txt1, text('sistema experto que ayuda al medico en la toma de la decision del tipo de cesarea a realizar.'))),
	send(Txt1, alignment, center),
	send(A, append, new(P, picture), next_row),
	new(Fig, figure),
	new(Bitmap, bitmap(resource(bebe), @on)),
	send(Bitmap, name, 1),
	send(Fig, display, Bitmap),
	send(Fig, status, 1),
	send(P,display, Fig, point(1,1)),
	send(A,open).

diagnostico :-
    new(B, dialog('Diagnostico')),
		send_list(B, append, 
		[
			new(N, menu(el_bebe_esta_en_posicion_podalica)),
			new(O, menu(la_madre_padece_gestosis)),
			new(P, menu(la_madre_padece_diabetes_gravidica)),
			new(Q, menu(la_placenta_esta_en_posicion_previa_central)),
			new(R, menu(la_madre_tiene_problemas_del_corazon)),
			new(S, menu(la_madre_tiene_problemas_renales)),
			new(T, menu(la_madre_tiene_problemas_graves_de_infecciones_de_vias_renales)),
			new(U, menu(la_cabeza_del_ninio_es_demasiado_grande_y_no_cabe_por_el_canal_del_parto)),
			new(V, menu(la_cabeza_del_ninio_no_esta_encajada_correctamente_en_el_canal_de_parto)),
			new(W, menu(el_ritmo_cardiaco_del_bebe_ya_no_es_regular)),
			new(X, menu(la_placenta_se_desprende))
		]),
	send_list(N, append, [si, no]),
	send_list(O, append, [si, no]),
	send_list(P, append, [si, no]),
	send_list(Q, append, [si, no]),
	send_list(R, append, [si, no]),
	send_list(S, append, [si, no]),
	send_list(T, append, [si, no]),
	send_list(U, append, [si, no]),
	send_list(V, append, [si, no]),
	send_list(W, append, [si, no]),
	send_list(X, append, [si, no]),
	send(B, append, 
		new(_, button(cesarea, message(@prolog, preguntas, N?selection,O?selection,P?selection,Q?selection,R?selection,S?selection,T?selection,U?selection,V?selection,W?selection,X?selection)))
	),
	send(B, open).

informacion :-
  new(C, dialog('Informacion')),
	send(C, append, new(Txt3, text('INFORMACIÓN SOBRE LAS CESÁREAS \n\n Una cesárea es una intervención quirúrgica para el nacimiento de un bebé. \n El bebé se saca a través de una incisión en el abdomen de la madre. \n El procedimiento generalmente se hace mientras la mujer está despierta. \n \n El cuerpo está anestesiado desde el tórax hasta los pies, usando anestesia epidural o raquídea. \n\n El equipo médico limpia los líquidos de la nariz y de la boca del bebé. Se corta el cordón umbilical. \n El pediatra o el personal de enfermería constatan que la respiración del bebé sea normal y que el bebé esté estable. \n La madre está despierta y puede escuchar y ver a su bebé. \n El padre u otra persona de apoyo con frecuencia puede estar con la madre durante el parto.'))),
	send(Txt3, font, bold),
	send(Txt3,alignment, center),
	send(C, open).

cesarea_prevista :-
	new(D, dialog('Cesarea Prevista')),
	send(D, append, new(Txt4, text('La cesarea que se realizara sera: \nCesarea Prevista'))),
	send(Txt4, font, bold),
	send(Txt4, alignment, center),
	send(D, append, new(P, picture), next_row),
	new(Fig, figure),
	new(Bitmap, bitmap(resource(cesarea), @on)),
	send(Bitmap, name, 1),
	send(Fig, display, Bitmap),
	send(Fig, status, 1),
	send(P,display, Fig, point(1,1)),
	send(D, append, new(_, button(tipo_incision, and(message(@prolog, incision))))),
	send(D, open).

cesarea_improvista :-
	new(E, dialog('Cesarea Improvista')),
	send(E, append, new(Txt5, text('La cesarea que se realizara sera: \nCesarea Imprevista'))),
	send(Txt5, font, bold),
	send(Txt5, alignment, center),
	send(E, append, new(P, picture), next_row),
	new(Fig, figure),
	new(Bitmap, bitmap(resource(cesarea), @on)),
	send(Bitmap, name, 1),
	send(Fig, display, Bitmap),
	send(Fig, status, 1),
	send(P,display, Fig, point(1,1)),
	send(E, append, new(_, button(tipo_incision, and(message(@prolog, incision))))),
	send(E, open).

cesarea_desconocida :-
	new(E, dialog('Cesarea Desconocida')),
	send(E, append, new(Txt5, text('Las seniales no coinciden con ningun tipo de cesarea conocida'))),
	send(Txt5, font, bold),
	send(Txt5, alignment, center),
	send(E, append, new(P, picture), next_row),
	new(Fig, figure),
	new(Bitmap, bitmap(resource(cesarea), @on)),
	send(Bitmap, name, 1),
	send(Fig, display, Bitmap),
	send(Fig, status, 1),
	send(P,display, Fig, point(1,1)),
	send(E, open).

incision :-
	new(F, dialog('Tipo de Incision')),
	send_list(F, append, 
		[
			new(Y, menu(incision_por_despredimiento_de_placenta)),
			new(Z, menu(no_hay_desprendimiento_de_placenta))
		]
	),
  send_list(Y, append, [si, no]),
	send_list(Z, append, [si, no]),
	send(F, append, new(_, button(evaluar, and(message(@prolog, tipo_incision, Y?selection,Z?selection))))),
	send(F, open).

tipo_incision(Y, Z):-
	pregunta('incision_por_despredimiento_de_placenta',Y),Y='no',
	pregunta('no_hay_desprendimiento_de_placenta',Z),Z='si',
	incision_transversal;
	pregunta('incision_por_despredimiento_de_placenta',Y),Y='si',
	pregunta('no_hay_desprendimiento_de_placenta',Z),Z='no',
	incision_umbilica;
	incision_desconocida.

incision_umbilica :-
	new(G, dialog('Cesarea Prevista')),
	send(G, append, new(Txt4, text('La incision que se realizara sera:\nIncision Umbilical.\nUmbilico pubica. Es vertical, empieza debajo del ombligo y termina en el pubis. La cicatriz es visible y grande'))),
	send(Txt4, font, bold),
	send(Txt4, alignment, center),
	send(G, open).

incision_transversal :-
	new(G, dialog('Tipo de Incision')),
	send(G, append, new(Txt4, text('La incision que se realizara sera:\nIncision Transversal\nEs horizontal, la cicatriz no es visible.'))),
	send(Txt4, font, bold),
	send(Txt4, alignment, center),
	send(G, open).

incision_desconocida :-
	new(G, dialog('Tipo de Incision')),
	send(G, append, new(Txt4, text('Anbas respuestas no pueden ser iguales.\nEso conlleva a una insicion desconocida'))),
	send(Txt4, font, bold),
	send(Txt4, alignment, center),
	send(G, open).


preguntas(N, O, P, Q, R, S, T, U, V, W, X):-
	pregunta('el_bebe_esta_en_posicion_podalica',N),N='si',
	pregunta('la_madre_padece_gestosis',O),O='si',
	pregunta('la_madre_padece_diabetes_gravidica',P),P='si',
	pregunta('la_placenta_esta_en_posicion_previa_central',Q),Q='si',
	pregunta('la_madre_tiene_problemas_del_corazon',R),R='si',
	pregunta('la_madre_tiene_problemas_renales',S),S='si',
	pregunta('la_madre_tiene_problemas_graves_de_infecciones_de_vias_renales',T),T='si',
	% pregunta('la_cabeza_del_ninio_es_demasiado_grande_y_no_cabe_por_el_canal_del_parto',U),U='no',
	% pregunta('la_cabeza_del_ninio_no_esta_encajada_correctamente_en_el_canal_de_parto',V),V='no',
	% pregunta('el_ritmo_cardiaco_del_bebe_ya_no_es_regular',W),W='no',
	% pregunta('la_placenta_se_desprende',X),X='no',
	cesarea_prevista;
	% pregunta('el_bebe_esta_en_posicion_podalica',N),N='no',
	% pregunta('la_madre_padece_gestosis',O),O='no',
	% pregunta('la_madre_padece_diabetes_gravidica',P),P='no',
	% pregunta('la_placenta_esta_en_posicion_previa_central',Q),Q='no',
	% pregunta('la_madre_tiene_problemas_del_corazon',R),R='no',
	% pregunta('la_madre_tiene_problemas_renales',S),S='no',
	% pregunta('la_madre_tiene_problemas_graves_de_infecciones_de_vias_renales',T),T='no',
	pregunta('la_cabeza_del_ninio_es_demasiado_grande_y_no_cabe_por_el_canal_del_parto',U),U='si',
	pregunta('la_cabeza_del_ninio_no_esta_encajada_correctamente_en_el_canal_de_parto',V),V='si',
	pregunta('el_ritmo_cardiaco_del_bebe_ya_no_es_regular',W),W='si',
	pregunta('la_placenta_se_desprende',X),X='si',
  cesarea_improvista;
	cesarea_desconocida.

pregunta('el_bebe_esta_en_posicion_podalica',X) :- respuesta(X). %N
pregunta('la_madre_padece_gestosis',X) :- respuesta(X). %O
pregunta('la_madre_padece_diabetes_gravidica',X) :- respuesta(X). %P
pregunta('la_placenta_esta_en_posicion_previa_central',X) :- respuesta(X). %Q
pregunta('la_madre_tiene_problemas_del_corazon',X) :- respuesta(X). %R
pregunta('la_madre_tiene_problemas_renales',X) :- respuesta(X). %S
pregunta('la_madre_tiene_problemas_graves_de_infecciones_de_vias_renales',X) :- respuesta(X). %T

pregunta('la_cabeza_del_ninio_es_demasiado_grande_y_no_cabe_por_el_canal_del_parto',X) :- respuesta(X). %U
pregunta('la_cabeza_del_ninio_no_esta_encajada_correctamente_en_el_canal_de_parto',X) :- respuesta(X). %V
pregunta('el_ritmo_cardiaco_del_bebe_ya_no_es_regular',X) :- respuesta(X). %W
pregunta('la_placenta_se_desprende',X) :- respuesta(X). %X

pregunta('incision_por_despredimiento_de_placenta',X) :- respuesta(X). %Y
pregunta('no_hay_desprendimiento_de_placenta',X) :- respuesta(X). %Z

respuesta(si).
respuesta(no).