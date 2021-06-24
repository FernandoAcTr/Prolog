:- use_module(library(pce)).
:- use_module(library(pce_util)).
:- use_module(library(pce_style_item)).
:- use_module(test).
:- use_module(diagnostico).
:- use_module(registro).
:- pce_image_directory('./imagenes').

:- dynamic color/2.
:- dynamic si/1, no/1.

:- pce_begin_class(fixed_size_button, button).
compute(_) :-> true.
:- pce_end_class.

resource(fondo, image, image('fondo.jpg')).
resource(i_episodio, image, image('episodio_info.jpg')).
resource(i_somatizada, image, image('somatizada_info.jpg')).
resource(i_psicotico, image, image('psicoticos_info.jpg')).
resource(i_perinatal, image, image('perinatal_info.jpg')).
resource(i_posparto, image, image('posparto_info.jpg')).
resource(i_bipolar, image, image('bipolar_info.jpg')).
resource(i_distimia, image, image('distimia_info.jpg')).
resource(i_depresion, image, image('depresion_info.jpg')).

main:-
  new(@dialog, dialog('Sistema experto de Depresion')),
  background(@dialog, fondo),
  new(LblTitle, label(name,'Sistema Experto de Depresion')),
  new(@lbl1, label(name,'')),
  new(@resp, label(name,'')),
  new(@btnTest, button('Realizar Test de Gravedad',message(@prolog,do_test))),
  new(BtnInicio, fixed_size_button('Diagnosticar',message(@prolog,comenzar_registro))),
  new(Btn1, fixed_size_button('Episodio Depresivo',message(@prolog,info1))),
  new(Btn2, fixed_size_button('Depresion Somatizada',message(@prolog,info2))),
  new(Btn3, fixed_size_button('Depresion con sintomas psicoticos',message(@prolog,info3))),
  new(Btn4, fixed_size_button('Depresion perinatal',message(@prolog,info4))),
  new(Btn5, fixed_size_button('Depresion postparto',message(@prolog,info5))),
  new(Btn6, fixed_size_button('Transtorno bipolar',message(@prolog,info6))),
  new(Btn7, fixed_size_button('Transtorno distimico',message(@prolog,info7))),
  new(Btn8, fixed_size_button('Depresion',message(@prolog,info8))),
  
  new(BtnSalir, fixed_size_button('SALIR', 
    and(
      message(@resp,free),
      message(@lbl1,free),
      message(@btnTest,free),
      message(@dialog, free),
      message(@dialog, destroy)
    ))),
  
  send(@dialog, display, LblTitle, point(130,38)),
  send(@dialog, display, @lbl1, point(256,152)),
  send(@dialog, display, @resp, point(240,195)),
  send(@dialog, display, Btn1, point(32,342)),
  send(@dialog, display, Btn2, point(256,342)),
  send(@dialog, display, Btn3, point(480,342)),
  send(@dialog, display, Btn4, point(32,418)),
  send(@dialog, display, Btn5, point(256,418)),
  send(@dialog, display, Btn6, point(480,418)),
  send(@dialog, display, Btn7, point(32,494)),
  send(@dialog, display, Btn8, point(256,494)),
  send(@dialog, display, BtnInicio, point(294,570)),
  send(@dialog, display, BtnSalir, point(544,570)),

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
      Btn8
    ], size(size(192, 32))),
  send(BtnSalir, size(size(128, 32))),
  send(BtnInicio, size(size(128, 32))),
  send(@dialog, open).

% Le pone una imagen a una ventanaa
background(Ventana, Imagen) :-
  new(Figura, figure),
  new(Bitmap, bitmap(resource(Imagen),@on)),
  send(Bitmap, name, 1),
  send(Figura, display, Bitmap),
  send(Figura, status, 1),
  send(Ventana, display,Figura,point(0,0)).

info1 :- 
  new(Di,dialog('Episodio Depresivo')),
  background(Di, i_episodio),
  send(Di,open).

info2 :- 
  new(Di,dialog('Depresion Somatizada')),
  background(Di, i_somatizada),
  send(Di,open).

info3 :- 
  new(Di,dialog('Depresion con sintomas psicoticos')),
  background(Di, i_psicotico),
  send(Di,open).

info4 :- 
  new(Di,dialog('Depresion perinatal')),
  background(Di, i_perinatal),
  send(Di,open).

info5 :- 
  new(Di,dialog('Depresion postparto')),
  background(Di, i_posparto),
  send(Di,open).

info6 :- 
  new(Di,dialog('Transtorno bipolar')),
  background(Di, i_bipolar),
  send(Di,open).

info7 :- 
  new(Di,dialog('Transtorno distimico')),
  background(Di, i_distimia),
  send(Di,open).

info8 :- 
  new(Di,dialog('Depresion')),
  background(Di, i_depresion),
  send(Di,open).

limpiar :- retract(si(_)),fail.
limpiar :- retract(no(_)),fail.
limpiar.

comenzar_registro :- 
  lim,
  new(Lbl, label(name,'Una vez que te registres, presiona comenzar para iniciar con tu diagnostico.')),
  new(Di,dialog('Todo listo')),
  new(Button, button('Comenzar', 
    and( 
      message(Di, destroy),
      message(@prolog, comenzar_diagnostico)
    )
  )),
  send_list(Di, append, [Lbl, Button]),
  send(Di, open),
  registrar.

comenzar_diagnostico:-
  diagnosticar(Tipo),
  send(@lbl1, selection('Tipo de depresion: ')),
  send(@resp, selection(Tipo)),
  send(@dialog, display, @btnTest, point(270,240)),
  limpiar.

lim:- 
  send(@resp,selection('')),
  send(@lbl1,selection('')).