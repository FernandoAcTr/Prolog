:- use_module(library(pce)).
:- use_module(library(pce_style_item)).
:- pce_image_directory('./iconos').
:- dynamic color/2.
:- dynamic si/1, no/1.

resource(img_principal, image, image('img_principal.jpg')).
resource(ich, image, image('ich.jpg')).
resource(img_1i, image, image('1i.JPG')).
resource(img_2i, image, image('2i.JPG')).
resource(img_3i, image, image('3i.JPG')).
resource(img_4i, image, image('4i.JPG')).
resource(img_5i, image, image('5i.JPG')).
resource(img_6i, image, image('6i.JPG')).
resource(img_7i, image, image('7i.JPG')).
resource(img_8i, image, image('8i.JPG')).
resource(img_9i, image, image('9i.JPG')).

main:-
new(@menu, dialog('Sistema basado en conocimiento')),

new(@texto, label(name,'Segun la respuesta dadas tendra un\nresultado')),
new(@resp, label(name,'')),
new(@boton, button('realizar test',message(@prolog,test))),
new(@boton1, button('ciprinodontiformes',message(@prolog,info1))),
new(@boton2, button('poecilidos',message(@prolog,info2))),
new(@boton3, button('gambusia affinis',message(@prolog,info3))),
new(@boton4, button('anabatidos',message(@prolog,info4))),
new(@boton5, button('luchadores de sian',message(@prolog,info5))),
new(@boton6, button('gambusia punctata',message(@prolog,info6))),
new(@boton7, button('perca trepadora',message(@prolog,info7))),
new(@boton8, button('ciclidos',message(@prolog,info8))),
new(@boton9, button('Pez joya',message(@prolog,info9))),

new(Salir, button('SALIR', 
  and(
    message(@menu,free),
    message(@texto, free), 
    message(@resp, free), 
    message(@boton, free), 
    message(@boton1, free), 
    message(@boton2, free), 
    message(@boton3, free), 
    message(@boton4, free), 
    message(@boton5, free), 
    message(@boton6, free), 
    message(@boton7, free), 
    message(@boton8, free), 
    message(@boton9, free),
    message(@menu, destroy)
  ))),

nueva_imagen(@menu, img_principal),
send(@menu, display,@boton,point(100,250)),
send(@menu, display,@boton1,point(250,250)),
send(@menu, display,@boton2,point(400,250)),
send(@menu, display,@boton3,point(550,250)),
send(@menu, display,@boton4,point(400,350)),
send(@menu, display,@boton5,point(250,300)),
send(@menu, display,@boton6,point(400,300)),
send(@menu, display,@boton7,point(550,300)),
send(@menu, display,@boton8,point(550,350)),
send(@menu, display,@boton9,point(250,350)),
send(@menu, display,@texto,point(50,142)),
send(@menu, display,Salir,point(20,250)),
send(@menu, display,@resp,point(45,185)),
send(@resp, font, font(comic, bold, 14)),
send(@menu, open).

nueva_imagen(Ventana, Imagen) :-
  new(Figura, figure),
  new(Bitmap, bitmap(resource(Imagen),@on)),
  send(Bitmap, name, 1),
  send(Figura, display, Bitmap),
  send(Figura, status, 1),
  send(Ventana, display,Figura,point(0,0)).

razapez('Ciprinodontiformes'):- ciprinodontiformes,!.
razapez(poecilidos):- poecilidos,!.
razapez(gambusia_affinis):- gambusia_affinis,!.
razapez(gambusia_punctata):- gambusia_punctata,!.
razapez(anabatidos):- anabatidos,!.
razapez(luchadores_de_sian):- luchadores_de_sian,!.
razapez(perca_trepadora):- perca_trepadora,!.
razapez(ciclidos):- ciclidos,!.
razapez(joya):- joya,!.
razapez('Se desconoce el tipo de pez').

ciprinodontiformes :- es_orden_de_ciprinodontiformes,
pregunta('¿tiene la boca pequeña?'),
pregunta('¿tiene dientes puntiagudos?'),
pregunta('¿vive en rios de muchas partes del mundo?').

poecilidos :- es_de_la_familia_de_los_poecilidos,
pregunta('¿es del orden de los cripnodontiformes?'),
pregunta('¿vive en los rios de america del sur?'),
pregunta('¿el macho es 3 centimetros mas pequeño que la hembra?'),
pregunta('¿la hembra es 3 centimetros mas grande que el macho?').

gambusia_affinis :- es_de_la_raza_gambusia_affinis,
pregunta('¿es de la familia de poecilidos?'),
pregunta('¿tiene manchas a lo largo del cuerpo?').

anabatidos :- es_de_la_raza_anabatidos,
pregunta('¿es de la familia de poecilidos?'),
pregunta('¿es de color gris?'),
pregunta('¿tiene rayas verdes?').

luchadores_de_sian :- pertenece_al_orden_de_luchadores_de_sian,
pregunta('¿es de tamaño medio?'),
pregunta('¿tiene dientes puntiagudos?'),
pregunta('¿vive en rios de todo el mundo?'),
pregunta('¿posee canales laberinticos para respirar fuera del agua?').

gambusia_punctata :- es_de_la_raza_de_gambusia_punctata,
pregunta('¿es de orden de los anabatidos?'),
pregunta('¿es de color azul?'),
pregunta('¿tiene rayas rojas?'),
pregunta('¿vive en rios de asia?').

perca_trepadora :- es_un_perca_trepadora,
pregunta('¿el pez es de orden de anabatidos?'),
pregunta('¿mide 25 centimetros?'),
pregunta('¿no tiene rayas?').

ciclidos :- es_un_ejemplar_de_orden_ciclidos,
pregunta('¿el pez tiene boca pequeña?'),
pregunta('¿vive en rios de todo el mundo?'),
pregunta('¿tiene la cola redonda?').

joya :- es_pez_joya,
pregunta('¿es de orden ciclidos?'),
pregunta('¿vive en rios de africa?'),
pregunta('¿es de color rojo?'),
pregunta('¿tiene manchas negras?').

es_de_la_raza_de_gambusia_punctata:- pregunta('¿es de orden de los anabatidos?').
es_orden_de_ciprinodontiformes:- pregunta('¿tiene la boca pequeña?').
es_de_la_familia_de_los_poecilidos:- pregunta('¿es del orden de los cripnodontiformes?').
pertenece_al_orden_de_luchadores_de_sian:- pregunta('¿es de tamaño medio?').
es_de_la_raza_gambusia_affinis:- pregunta('¿es de la familia de poecilidos?').
es_de_la_raza_anabatidos:- pregunta('¿es de la familia de poecilidos?').
es_un_perca_trepadora:- pregunta('¿el pez es de orden de anabatidos?').
es_un_ejemplar_de_orden_ciclidos:- pregunta('¿el pez tiene boca pequeña?').
es_pez_joya:- pregunta('¿es de orden ciclidos?').


info1 :- 
  new(Di,dialog('ciprinodontiformes')),
  nueva_imagen(Di, img_1i),
  send(Di,open).

info2 :- 
  new(Di,dialog('ciprinodontiformes')),
  nueva_imagen(Di, img_2i),
  send(Di,open).

info3 :- 
  new(Di,dialog('ciprinodontiformes')),
  nueva_imagen(Di, img_3i),
  send(Di,open).

info4 :- 
  new(Di,dialog('ciprinodontiformes')),
  nueva_imagen(Di, img_4i),
  send(Di,open).

info5 :- 
  new(Di,dialog('ciprinodontiformes')),
  nueva_imagen(Di, img_5i),
  send(Di,open).

info6 :- 
  new(Di,dialog('ciprinodontiformes')),
  nueva_imagen(Di, img_6i),
  send(Di,open).

info7 :- 
  new(Di,dialog('ciprinodontiformes')),
  nueva_imagen(Di, img_7i),
  send(Di,open).

info8 :- 
  new(Di,dialog('ciprinodontiformes')),
  nueva_imagen(Di, img_8i),
  send(Di,open).

info9 :- 
  new(Di,dialog('Pez joya:')),
  nueva_imagen(Di, img_9i),
  send(Di,open).

pregunta(S):- si(S)->true; no(S)->fail; preguntar(S).

preguntar(Problema):- 
  new(Di,dialog('tipos de pez')),
  nueva_imagen(Di, ich),
  new(L2,label(texto,'Responde las siguientes preguntas')),
  new(La,label(prob,Problema)),
  new(B1,button(si,message(Di,return,si))),
  new(B2,button(no,message(Di,return,no))),
  send(Di,append(L2)),
  send(Di,append(La)),
  send(Di,append(B1)),
  send(Di,append(B2)),

  send(Di,default_button,si),
  send(Di,open),
  get(Di,confirm,Answer),
  write(Answer),nl,
  send(Di,destroy),

  ((Answer==si)->assert(si(Problema)); assert(no(Problema)),fail).

limpiar :- retract(si(_)),fail.
limpiar :- retract(no(_)),fail.
limpiar.

test :- 
  lim,
  razapez(Raza),
  send(@texto, selection('Su diagnostico es: ')),
  send(@resp, selection(Raza)),
  limpiar.

lim:- send(@resp,selection('')).
