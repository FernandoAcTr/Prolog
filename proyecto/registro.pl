:- use_module(library(pce)).
:- use_module(library(pce_util)).
:- use_module(library(odbc)).

registrar:- 
  new(Dialog, dialog('Registrar Paciente')), 
  send_list(Dialog, append, 
    [
      new(Name, text_item('Nombre')), 
      new(LastName, text_item('Apellidos')), 
      % El menu asi solo, son checkboxes
      new(Gender, new(Gender, menu('Genero'))), 
      new(Age, int_item('Edad', low :=10, high:=65)), 
      button(cancel, message(Dialog, destroy)),
      button(enter,
        and(
          message(@prolog, guardar, Name?selection, LastName?selection, Gender?selection, Age?selection),
          message(Dialog, destroy)
        )
      )
    ]
  ), 
  send_list(Gender, append, [femenino, masculino]), 
  send(Dialog, default_button, enter), 
  send(Dialog, open). 
  
guardar(FirstName, LastName, Gender, Age):-
  format('Adding ~n Gender: ~w~n First: ~w~n Family: ~w~n Age: ~w~n', 
    [Gender, FirstName, LastName, Age]), 
    insertar_registro(FirstName, LastName, Gender, Age).


% Metodos para el manejo de la base de datos
abrir_conexion:- odbc_connect('MSProlog', _, [user(prolog), password('123'), alias('prolog'), open(once)]).
obtener_conexion(Connection):- odbc_connect('MSProlog', Connection, [user(prolog), password('123'), alias('prolog'), open(once)]).

cerrar_conexion:- odbc_disconnect('prolog').

prepare_statement(SQL, Values, Types, Row):- 
  obtener_conexion(Connection),
  odbc_prepare(Connection, SQL, Types, Statement),
  odbc_execute(Statement, Values, Row).

insertar_registro(Nombre, Apellido, Genero, Edad):- 
  abrir_conexion, 
  prep('insert into paciente values(default, ?, ?, ?, ?, now())', [Nombre, Apellido, Genero, Edad], [varchar, varchar, varchar, int], _). 


consultar_registros(Result):- odbc_query('prolog', 'select * from paciente', Result); 

  
  


