:- use_module(library(pce)).
:- use_module(library(pce_style_item)).

% Crear una ventana
ejemplo :-
  /*
  * Crea el objeto dialogo en la variable D
  */
  new(D, dialog('Hello World')),
  /*
   * Crea el objeto boton almacenandolo en la variable @boton de tal forma
   * que al pulsar sobre el boton libere la memoria y cierre la ventana)
   */
  new(@boton, button('Cerrar Dialogo',
    and(
      message(D, destroy),
      message(D, free),
      message(@boton, free)
    )
  )),
  /*
   * Inserta el botón en el diálogo
  */
  send(D, append(@boton)),
  /*
   * Le envia el mensaje open al dialogo para que cree y muestre la ventana.
  */
  send(D, open).


% Crear una ventana que muestre un mensaje
ejemplo_mensaje :-
  % Crea el objeto dialogo en la variable D
  new(D, dialog('Nombre del Dialogo')),
  % Crea un boton que llama al predicado mostrar_mensaje
  new(B, button('Mostrar en Consola',
    message(@prolog, mostrar_mensaje, 'Este es el valor que tendra la variable P'))
  ),
  % Crea un boton para cerrar el dialogo
  % Si el boton se ocupara asi mismo en el la accion debe guardarse en una variable global
  new(@boton2, button('Cerrar Dialogo',
    and(
      message(D, destroy),
      message(D, free),
      message(@boton2, free)
    )
  )),
   % Inserta los botones en el diálogo
  send(D, append(@boton2)),
  send(D, append(B)),
  % Muestre la ventana.
  send(D, open).
  
mostrar_mensaje(P) :- write('La variable P vale: '), write(P), nl.

ejemplo_ventana :-
  % Crea el objeto dialogo en la variable D
  new(D, dialog('Nombre del Dialogo', size(440,320))),
  % Crea un boton que llama al predicado mostrar_mensaje
  new(B, button('Nueva Ventana',
    message(@prolog, nueva_ventana)
  )),
  % Crea un boton para cerrar el dialogo
  % Si el boton se ocupara asi mismo en el la accion debe guardarse en una variable global
  new(@boton2, button('Cerrar Dialogo',
    and(
      message(D, destroy),
      message(D, free),
      message(@boton2, free)
    )
  )),
   % Inserta los botones en el diálogo
  send(D, append(@boton2)),
  send(D, append(B)),
  % Muestre la ventana.
  send(D, open).

nueva_ventana:- new(W, window('Nueva', size(400, 400))), send(W, open). 