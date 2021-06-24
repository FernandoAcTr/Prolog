:- use_module(library(pce)).
:- use_module(library(pce_util)).
:- use_module(library(pce_style_item)).
:- pce_image_directory('./peces').

:- dynamic color/2.
:- dynamic si/1, no/1.

:- pce_begin_class(fixed_size_button, button).
compute(_) :-> true.
:- pce_end_class.

resource(fondo, image, image('fondo.jpg')).
resource(i_anostomidae, image, image('anostomidae.jpg')).
resource(i_balitoridae, image, image('balitoridae.jpg')).
resource(i_characidae, image, image('characidae.jpg')).
resource(i_cyprinidae, image, image('cyprinidae.jpg')).
resource(i_elopidae, image, image('elopidae.jpg')).
resource(i_megalopidae, image, image('megalopidae.jpg')).
resource(i_pomacentridae, image, image('pomacentridae.jpg')).
resource(i_tetraodontidae, image, image('tetraodontidae.jpg')).
resource(i_triacanthodidae, image, image('triacanthodidae.jpg')).

resource(i_jikii, image, image('jikii.jpg')).
resource(i_atrianalis, image, image('atrianalis.jpg')).
resource(i_passionis, image, image('passionis.jpg')).
resource(i_acutidens, image, image('acutidens.jpg')).
resource(i_microlepis, image, image('microlepis.jpg')).
resource(i_acutus, image, image('acutus.jpg')).
resource(i_ipanquianus, image, image('ipanquianus.jpg')).
resource(i_melanogramma, image, image('melanogramma.jpeg')).
resource(i_zollingeri, image, image('zollingeri.jpeg')).
resource(i_quignardi, image, image('quignardi.jpg')).
resource(i_alutaceus, image, image('alutaceus.jpg')).
resource(i_arcasii, image, image('arcasii.jpeg')).
resource(i_affinis, image, image('affinis.jpg')).
resource(i_atlanticus, image, image('atlanticus.jpg')).
resource(i_carduus, image, image('carduus.jpg')).
resource(i_asellus, image, image('asellus.jpeg')).
resource(i_psittacus, image, image('psittacus.jpg')).
resource(i_hollardi, image, image('hollardi.jpg')).
resource(i_payaso, image, image('payaso.jpeg')).
resource(i_damisela, image, image('damisela.jpg')).

main:-
  new(Di, dialog('Sistema experto de peces')),
  background(Di, fondo),
  new(LblTitle, label(name,'Sistema Experto de Peces')),
  new(@lbl1, label(name,'')),
  new(@resp, label(name,'')),
  new(BtnInicio, fixed_size_button('Comenzar',message(@prolog,comenzar))),
  new(Btn1, fixed_size_button('Anostomidae',message(@prolog,info1))),
  new(Btn2, fixed_size_button('Characidae',message(@prolog,info2))),
  new(Btn3, fixed_size_button('Balitoridae',message(@prolog,info3))),
  new(Btn4, fixed_size_button('Cyprinidae',message(@prolog,info4))),
  new(Btn5, fixed_size_button('Elopidae',message(@prolog,info5))),
  new(Btn6, fixed_size_button('Megalopidae',message(@prolog,info6))),
  new(Btn7, fixed_size_button('Tetraodontidae',message(@prolog,info7))),
  new(Btn8, fixed_size_button('Triacanthodidae',message(@prolog,info8))),
  new(Btn9, fixed_size_button('Pomacentridae',message(@prolog,info9))),
  
  new(BtnSalir, fixed_size_button('SALIR', 
    and(
      message(@resp,free),
      message(@lbl1,free),
      message(Di, destroy)
    ))),
  
  send(Di, display, LblTitle, point(130,38)),
  send(Di, display, @lbl1, point(256,152)),
  send(Di, display, @resp, point(240,215)),
  send(Di, display, Btn1, point(32,342)),
  send(Di, display, Btn2, point(256,342)),
  send(Di, display, Btn3, point(480,342)),
  send(Di, display, Btn4, point(32,418)),
  send(Di, display, Btn5, point(256,418)),
  send(Di, display, Btn6, point(480,418)),
  send(Di, display, Btn7, point(32,494)),
  send(Di, display, Btn8, point(256,494)),
  send(Di, display, Btn9, point(480,494)),
  send(Di, display, BtnInicio, point(294,570)),
  send(Di, display, BtnSalir, point(544,570)),

  % Estilos a los componentes
  send(LblTitle, colour(white)),
  send(@lbl1, colour(white)),
  send(@resp, colour(white)),
  send(LblTitle, font, font(comic, bold, 30)),
  send(@lbl1, font, font(comic, normal, 16)),
  send(@resp, font, font(comic, bold, 20)),
  send_list(
    [
      Btn1,
      Btn2,
      Btn3,
      Btn4,
      Btn5,
      Btn6,
      Btn7,
      Btn8,
      Btn9
    ], size(size(192, 32))),
  send(BtnSalir, size(size(128, 32))),
  send(BtnInicio, size(size(128, 32))),
  send(Di, open).

%Hipotesis
hipotesis('Jikii'):- jikii,!.
hipotesis('Anostomoides atrianalis'):- atrianalis, !.
hipotesis('Anostomoides passionis'):- passionis, !.
hipotesis('Leporinus acutidens'):- acutidens, !.
hipotesis('Acanthocharax microlepis'):- microlepis, !.
hipotesis('Acestrocephalus acutus'):- acutus, !.
hipotesis('Acrobrycon ipanquianus'):- ipanquianus, !.
hipotesis('Acinocheirodon melanogramma'):- melanogramma, !.
hipotesis('Homaloptera zollingeri'):- zollingeri, !.
hipotesis('Barbatula quignardi'):- quignardi, !.
hipotesis('Acrocheilus alutaceus'):- alutaceus, !.
hipotesis('Achondrostoma arcasii'):- arcasii, !.
hipotesis('Elops affinis'):- affinis, !.
hipotesis('Megalops atlanticus'):- atlanticus, !.
hipotesis('Arothron carduus'):- carduus, !.
hipotesis('Colomesus asellus'):- asellus, !.
hipotesis('Colomesus psittacus'):- psittacus, !.
hipotesis('Hollardia hollardi'):- hollardi, !.
hipotesis('Pez payaso'):- payaso, !.
hipotesis('Pez damisela'):- damisela, !.
hipotesis('Pez desconocido').

jikii :- 
  potadromo,
  characiforme, 
  anostomidae, 
  pregunta('¿Tiene la cabeza bastante estrecha en relacion al cuerpo?'),
  pregunta('¿Su aleta caudal esta dividida?'),
  pregunta('¿Posee aleta adiposa?'),
  pregunta('¿Tiene la boca en posicion adelantada?'),
  img_resp(i_jikii).

atrianalis:- 
  potadromo, 
  characiforme, 
  anostomidae, 
  pregunta('¿Vive en la cuenca del rio Orinoco?'),
  img_resp(i_atrianalis). 

passionis:- 
  potadromo, 
  characiforme, 
  anostomidae, 
  pregunta('¿Vive en el rio Xingu?'), 
  pregunta('¿Los machos pueden medir hasta 30.6cm?'),
  img_resp(i_passionis).

acutidens:- 
  potadromo, 
  characiforme, 
  anostomidae, 
  pregunta('¿Habita en aguas calidas?'), 
  pregunta('¿Mide aprox. 33cm?'),
  img_resp(i_acutidens).

microlepis:- 
  potadromo, 
  characiforme, 
  characidae, 
  pregunta('¿Viven principalmente en la cuenca del rio Esequibio en la Guayana?'), 
  pregunta('¿Los machos pueden medir hasta 8.5cm?'),
  img_resp(i_microlepis).

acutus:- 
  potadromo, 
  characiforme, 
  characidae, 
  pregunta('¿Viven en los rios Tocantins y Tapajos en Brasil?'),
  pregunta('¿Los machos pueden medir hasta 10.4cm?'),
  img_resp(i_acutus).

ipanquianus:- 
  potadromo, 
  characiforme, 
  characidae, 
  pregunta('¿Viven en la cuenca del rio Amazonas y en el centro de Argentina?'),
  pregunta('¿Los machos miden 10cm?'),
  img_resp(i_ipanquianus).

melanogramma:- 
  potadromo, 
  characiforme,
  characidae, 
  pregunta('¿Viven en las cuencas de los rios Sao Francisco y Jequitinhonha en Brasil?'),
  pregunta('¿Los machos miden 3.8cm?'),
  img_resp(i_melanogramma).

zollingeri:- 
  potadromo, 
  cypriniforme,
  balitoridae,
  pregunta('¿Se encuentran en las cuencas de los rios Mekong y Chao Phraya?'),
  pregunta('¿Se encuentran en la Peninsula de Malaca e Indonesia?'),
  pregunta('¿Los machos miden hasta 10cm?'),
  img_resp(i_zollingeri).

quignardi:- 
  potadromo, 
  cypriniforme,
  balitoridae, 
  pregunta('¿Posee un cuerpo alargado y de seccion cilindrica?'),
  pregunta('¿Tiene aletas pequenias?'), 
  pregunta('¿Su boca infera tiene tres pares de barbillas?'),
  pregunta('¿Vive entre los rios Bidasoa y Nervion'),
  img_resp(i_quignardi).

alutaceus:- 
  potadromo, 
  cypriniforme, 
  cyprinidae, 
  pregunta('¿Es oviparo?'),
  pregunta('¿Los machos pueden medir hasta 30cm?'), 
  img_resp(i_alutaceus). 

arcasii:- 
  potadromo, 
  cypriniforme, 
  cyprinidae, 
  pregunta('¿Vive en rios y lagos de la peninsula iberica?'),
  pregunta('¿Tiene boca subterminal con la aleta dorsal de perfil convexo?'),
  pregunta('¿Tiene una linea lateral muy marcada, coloracion oscura en el dorso y roja en la base de las aletas pares?'),
  img_resp(i_arcasii).

affinis:- 
  oceanodromo, 
  elopiforme, 
  elopidae, 
  pregunta('¿Tiene cuerpo largo y delgado?'),
  pregunta('¿Tiene dientes pequenios, granulares, en las mandibulas, paladar, la lengua y las bases de los arcos branquiales?'),
  pregunta('¿Es plateado con reflejos azulados y la cabeza con aspecto amarillento?'),
  img_resp(i_affinis). 

atlanticus:-
  oceanodromo, 
  elopiforme, 
  megalopidae, 
  pregunta('¿Es un pez de gran tamanio, de entre 2 y 2.5 m y alrededor de 150 a 161 kg de peso?'),
  pregunta('¿habitan en las zonas costeras del Atlantico, Florida y en África en latitudes tropicales?'),
  img_resp(atlanticus). 

carduus:- 
  oceanodromo,
  tetraodontiforme, 
  tetraodontidae, 
  pregunta('¿Vive en Malasia?'),
  img_resp(i_carduus). 

asellus:- 
  oceanodromo, 
  tetraodontiforme, 
  tetraodontidae,
  pregunta('¿Los machos pueden llegar alcanzar los 12,8 cm de longitud total?'),
  pregunta('¿Vive en el rio Amazonas y la costa oeste del oceano Atlantico?'),
  img_resp(i_asellus).

psittacus:- 
  oceanodromo, 
  tetraodontiforme, 
  tetraodontidae,
  pregunta('¿Come principalmente moluscos. caracoles o gambas?'), 
  pregunta('¿ Los machos pueden llegar alcanzar los 28.9 cm de longitud total?'),
  img_resp(i_psittacus).

hollardi:- 
  oceanodromo, 
  tetraodontiforme,
  triacanthodidae, 
  pregunta('¿Tiene cabeza y cuerpo rosado palido dorsalmente, desvaneciendose a blancuzco hacia el vientre?'), 
  pregunta('¿Tiene lineas rojas irregularmente reticulares?'),
  pregunta('¿Tiene forro de la cavidad estomacal muy oscuro, frecuentemente con flecos y manchas mas oscuras?'),
  img_resp(i_hollardi). 

payaso:- 
  oceanodromo, 
  perciforme, 
  pomacentridae, 
  pregunta('¿Presenta color naranja, entremezclados con franjas blancas y bordes negros?'), 
  pregunta('¿Vive en los arrecifes de corales protegidos por anemonas?'),
  img_resp(i_payaso).

damisela:- 
  oceanodromo,
  perciforme, 
  pomacentridae,
  pregunta('¿Es de de colores brillantes como verde esmeralda, azul, amarillo?'), 
  pregunta('¿Mide al rededor de 7.6cm?'),
  img_resp(i_damisela).

potadromo:- 
  pregunta('¿Es de agua dulce?').

oceanodromo:-
  not(potadromo).

characiforme:- 
  pregunta('¿Tiene dientes en la boca?'), 
  not(pregunta('¿Tiene bigotes?')).

anostomidae:- 
  pregunta('¿Tiene cuerpo elongado y pequenio?'). 

characidae:- 
  pregunta('¿Mide entre 13 mm y 3cm de longitud'),
  pregunta('¿Tiene una pequenia aleta dorsal adiposa cerca de la base de la cola?').

cypriniforme:-
  pregunta('¿Tiene una aleta dorsal simple?').

balitoridae:-
  pregunta('¿Se adhiere a las superficies planas?'),
  pregunta('¿Tiene una cola muy alargada en relacion a su cuerpo?'). 

cyprinidae:-
  pregunta('¿Poseen en la faringe entre una y tres filas de dientes?'),
  pregunta('¿la boca tiene labios finos sin papilas?').

elopiforme:- 
  pregunta('¿Son teleosteos?'),
  pregunta('¿Se encuentran en TODOS los oceanos?'). 

elopidae:-
  pregunta('¿Tienen el cuerpo fusiforme, oval y ligeramente comprimido?'),
  pregunta('¿Tiene grandes ojos parcialmente recubiertos con parpados adiposos?').

megalopidae:- 
  pregunta('¿Es un pez grande, de unos 2.2m?'),
  pregunta('¿Es plateado?'),
  pregunta('¿Tiene una unica aleta dorsal, que no presenta espinas?').

tetraodontiforme:-
  pregunta('¿Tiene forma globular, triangular o casicuadrada?'),
  pregunta('¿Su movimiento es lento?'). 

tetraodontidae:- 
  pregunta('¿Poseen la capacidad de hincharse para defenderse?').

triacanthodidae:- 
  pregunta('¿Es pqquenio?'),
  pregunta('¿Tiene piel gruesa, aspera, cubierta con numerosas escamas pequenias, cada una con espinulas diminutas?').

perciforme:-
  pregunta('¿Tienen aleta dorsal con base amplia, con un entalle?'),
  pregunta('¿La parte posterior posee rayas que pueden estar parcial o totalmente separadas?').

pomacentridae:-
  pregunta('¿Tiene colores muy llamativos?').

img_resp(Imagen):-
  new(Di, dialog('Imagen')),
  background(Di, Imagen),
  send(Di,open).

% Le pone una imagen a una ventanaa
background(Ventana, Imagen) :-
  new(Figura, figure),
  new(Bitmap, bitmap(resource(Imagen),@on)),
  send(Bitmap, name, 1),
  send(Figura, display, Bitmap),
  send(Figura, status, 1),
  send(Ventana, display,Figura,point(0,0)).

info1 :- 
  new(Di,dialog('Anostomidae')),
  background(Di, i_anostomidae),
  send(Di,open).

info2 :- 
  new(Di,dialog('Characidae')),
  background(Di, i_characidae),
  send(Di,open).

info3 :- 
  new(Di,dialog('Balitoridae')),
  background(Di, i_balitoridae),
  send(Di,open).

info4 :- 
  new(Di,dialog('Cyprinidae')),
  background(Di, i_cyprinidae),
  send(Di,open).

info5 :- 
  new(Di,dialog('Elopidae')),
  background(Di, i_elopidae),
  send(Di,open).

info6 :- 
  new(Di,dialog('Megalopidae')),
  background(Di, i_megalopidae),
  send(Di,open).

info7 :- 
  new(Di,dialog('Tetraodontidae')),
  background(Di, i_tetraodontidae),
  send(Di,open).

info8 :- 
  new(Di,dialog('Triacanthodidae')),
  background(Di, i_triacanthodidae),
  send(Di,open).

info9 :- 
  new(Di,dialog('Pomacentridae')),
  background(Di, i_pomacentridae),
  send(Di,open).

pregunta(S):- si(S)->true; no(S)->fail; preguntar(S).

preguntar(Problema):- 
  new(Di,dialog('tipos de pez')),
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

comenzar :- 
  lim,
  hipotesis(Raza),
  send(@lbl1, selection('La especie de pez es: ')),
  send(@resp, selection(Raza)),
  limpiar.

lim:- 
  send(@resp,selection('')),
  send(@lbl1,selection('')).