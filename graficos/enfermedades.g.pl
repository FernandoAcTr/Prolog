:- use_module(library(pce)).
:- use_module(library(pce_style_item)).
:- pce_image_directory('./iconos').

:- dynamic si/1. 
:- dynamic no/1. 

resource(img_principal, image, image('diagnostico.jpg')).


main:- 
  new(@menu, dialog('DIAGNOSTICO MEDICO', size(500,500))),
  nueva_imagen(@menu, img_principal), 
  new(Title, label(null, 'BIENVENIDO A SU ATENCION MEDICA')), 
  new(@texto, label(null, 'Proceda a responder las siguietes preguntas para que obtenga su diagnostico')), 
  new(@respuesta, label(null, '')),
  new(@btnInit, button('REALIZAR CONSULTA', message(@prolog, botones))),
  new(Salir, button('SALIR', 
      and(
        message(@menu, destroy),
        message(@menu, free),
        message(@texto, free),    
        message(@respuesta, free),    
        message(@btnInit, free)    
      )      
    )),

  % Botones de informacion
  new(BtnInfo1, button('Colesterol', message(@prolog, info_colesterol))),
  new(BtnInfo2, button('Diabetes', message(@prolog, info_diabetes))),
  new(BtnInfo3, button('Asma', message(@prolog, info_asma))),
  new(BtnInfo4, button('Sida', message(@prolog, info_sida))),
  new(BtnInfo5, button('Tuberculosis', message(@prolog, info_tuberculosis))),
  new(BtnInfo6, button('Gastritis', message(@prolog, info_gastritis))),

  % Crear el estilo de cada boton y label
  send(@menu, append(Title)), 
  send(@menu, display, Title, point(70, 20)), 
  send(@menu, display, @btnInit, point(200, 150)), 
  send(@menu, display, @texto, point(70, 100)), 
  send(@menu, display, Salir, point(300, 300)), 
  send(@menu, display, @respuesta, point(20, 130)), 

  send(@menu, display, BtnInfo1, point(50, 200)), 
  send(@menu, display, BtnInfo2, point(200, 200)), 
  send(@menu, display, BtnInfo3, point(350, 200)), 
  send(@menu, display, BtnInfo4, point(50, 250)), 
  send(@menu, display, BtnInfo5, point(200, 250)), 
  send(@menu, display, BtnInfo6, point(350, 250)), 
  
  send(@menu, open), 
  send(Title, font, font(comic, bold, 20)),
  send(@texto, font, font(comic, bold, 10)),
  send(@respuesta, font, font(comic, bold, 15)),
  send(Title, colour(white)),
  send(@texto, colour(white)),
  send(@resp, colour(white)).


% Hipotesis
hipotesis(colesterol):- colesterol, !.
hipotesis(diabetes):- diabetes, !.
hipotesis(gastritis):- gastritis, !.
hipotesis(asma):- asma, !.
hipotesis(sida):- sida, !.
hipotesis(tuberculosis):- tuberculosis, !.
hipotesis('Enfermedad desconocida'):- !.

% Base de conocimiento
colesterol:- tiene_colesterol,
pregunta('¿Tiene hinchazon en alguna extremidad del cuerpo?'),
pregunta('¿Tiene perdida de equilibrio o mareos?'),
pregunta('¿Tiene dolor de cabeza?'),
pregunta('¿Tiene ojos amarillentos?'),
pregunta('¿Tiene vision borrosa?'),
pregunta('¿Tiene agitacion, en especial al caminar?'),
pregunta('¿Tiene dolor en el pecho?').

diabetes:- tiene_diabetes, 
pregunta('¿Padece de sed constante?'),
pregunta('¿Siente hambre excesiva?'),
pregunta('¿Perdio peso de manera inexplicable recientemente?'),
pregunta('¿Siente debilidad en su cuerpo?').

gastritis:- tiene_gastritis, 
pregunta('¿Ha perdido peso?'), 
pregunta('¿Siente nauseas repentinas?'), 
pregunta('¿Tiene hipo y eructa con frecuencia?'), 
pregunta('¿Tiene regularmente mal sabor de boca o mal aliento?'), 
pregunta('¿Padece vacio gastrico?').  

asma:- tiene_asma, 
pregunta('¿Padece dificultad al respirar en cierta ocasiones?'), 
pregunta('¿Siente presion en el pecho?'), 
pregunta('¿Padece de sibilancias?').

sida:- tiene_sida, 
pregunta('¿Tiene dolor de cabeza?'),
pregunta('¿Sufre de fatiga?'),
pregunta('¿Tiene los ganglio linfáticos hinchados?'),
pregunta('¿Tiene dolor de garganta?'),
pregunta('¿Tiene salpullido?').

tuberculosis:- tiene_tuberculosis, 
pregunta('¿Ha presentado tos con sangre o esputo?'), 
pregunta('¿Tiene dolor en el pecho?'), 
pregunta('¿Tiene debilidad o cansancio?'), 
pregunta('¿Ha perdido peso de manera inexplicable?'), 
pregunta('¿Presenta falta de apetito?'), 
pregunta('¿Ha sentido escalofrios?'), 
pregunta('¿Tiene fiebre?'),
pregunta('¿Suda durante la noche regularmente?').

obesidad:- tiene_obesidad, 
pregunta('¿Padece baja resistencia?'),
pregunta('¿Padece de sudoracion?').

tiene_colesterol:- pregunta('¿Tiene adormecimiento en alguna extremidad del cuerpo?'), !.
tiene_diabetes:- pregunta('¿Padece puliuria (orinar con frecuencia)?'), !.
tiene_gastritis:- pregunta('¿Padece ardor en el estomago?'), !.
tiene_asma:- pregunta('¿Padece de tos?'), !.
tiene_sida:- pregunta('¿Padece o tiene fiebre?'), !.
tiene_tuberculosis:- pregunta('¿Padece ardor en el pecho?'), !.
tiene_obesidad:- pregunta('¿Pesa mas de 800 kg maldito gordo?'), !. 

% Informacion
info_colesterol :- 
  new(Di, dialog('Informacion')),
	send(Di, append, new(Txt3, text('El colesterol es una sustancia cerosa y parecida a la grasa que se encuentra en todas las células de su cuerpo. \nSu cuerpo necesita algo de colesterol para producir hormonas, vitamina D y sustancias que le ayuden a digerir los alimentos.\n Su cuerpo produce todo el colesterol que necesita.'))),
	send(Txt3, font, bold),
	send(Txt3,alignment, center),
	send(Di, open).

info_diabetes :- 
  new(Di, dialog('Informacion')),
	send(Di, append, new(Txt3, text('La diabetes es una enfermedad en la que los niveles de glucosa (azúcar) de la sangre están muy altos.\n La glucosa proviene de los alimentos que consume. \nLa insulina es una hormona que ayuda a que la glucosa entre a las células para suministrarles energía. '))),
	send(Txt3, font, bold),
	send(Txt3,alignment, center),
	send(Di, open).

info_gastritis :- 
  new(Di, dialog('Informacion')),
	send(Di, append, new(Txt3, text('La gastritis es un término general para un grupo de enfermedades con un punto en común: la inflamación del revestimiento del estómago.\n La inflamación de la gastritis generalmente se produce por la misma infección bacteriana que provoca la mayoría de las úlceras estomacales'))),
	send(Txt3, font, bold),
	send(Txt3,alignment, center),
	send(Di, open).

info_asma :- 
  new(Di, dialog('Informacion')),
	send(Di, append, new(Txt3, text('Es una enfermedad crónica que provoca que las vías respiratorias de los pulmones se hinchen y se estrechen. \nEsto hace que se presente dificultad para respirar como sibilancias, falta de aliento, opresión en el pecho y tos.'))),
	send(Txt3, font, bold),
	send(Txt3,alignment, center),
	send(Di, open).

info_sida :- 
  new(Di, dialog('Informacion')),
	send(Di, append, new(Txt3, text('Sida significa síndrome de inmunodeficiencia adquirida. Es la etapa final de la infección por VIH. Ocurre cuando el sistema inmunitario del cuerpo está muy dañado por el virus.\n No todas las personas con VIH desarrollan sida.'))),
	send(Txt3, font, bold),
	send(Txt3,alignment, center),
	send(Di, open).

info_tuberculosis :- 
  new(Di, dialog('Informacion')),
	send(Di, append, new(Txt3, text('La tuberculosis (TB) es una infección bacteriana causada por un gérmen llamado Mycobacterium tuberculosis.\n La bacteria suele atacar los pulmones, pero puede también dañar otras partes del cuerpo.\n La TB se disemina a través del aire, cuando una persona con TB pulmonar tose, estornuda o habla.'))),
	send(Txt3, font, bold),
	send(Txt3,alignment, center),
	send(Di, open).


nueva_imagen(Ventana, Imagen) :-
  new(Figura, figure),
  new(Bitmap, bitmap(resource(Imagen),@on)),
  send(Bitmap, name, 1),
  send(Figura, display, Bitmap),
  send(Figura, status, 1),
  send(Ventana, display,Figura,point(0,0)).

pregunta(S) :- si(S)->true; no(S)->fail; preguntar(S).

preguntar(Pregunta):- 
  new(Di, dialog('EXAMEN MEDICO')), 
  new(LblIndicacion, label(null, 'Responde las siguientes preguntas:')),
  new(LblPregunta, label(prob, Pregunta)), 
  new(BtnSi, button(si, message(Di, return, si),'SI')),
  new(BtnNo, button(no, message(Di, return, no),'NO')),
  send(Di, append(LblIndicacion)), 
  send(Di, append(LblPregunta)),
  send(Di, append(BtnSi)),
  send(Di, append(BtnNo)),
  send(Di, default_button, si),
  send(Di, open), 
  get(Di, confirm, Answer), 
  write(Answer), nl, 
  send(Di, destroy),

  % Comparar la respuesta recibida y regresar un verdadero o un falso
  ((Answer == si)->assert(si(Pregunta)) ; assert(no(Pregunta)), fail).
  

limpiar:- retract(si(_)), fail. 
limpiar:- retract(no(_)), fail. 

botones:- 
  clear, 
  send(@btnInit, free), 
  hipotesis(Enfermedad), 
  send(@texto, selection('Segun sus sintomas usted es muy probable que padezca de: ')), 
  send(@respuesta, selection(Enfermedad)), 
  new(@btnInit, button('REALIZAR CONSULTA', message(@prolog, botones))), 
  send(@menu, display, @btnInit, point(300, 150)), 
  limpiar. 

clear:- send(@respuesta, selection('')).
