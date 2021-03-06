:- use_module(library(pce)).
:- use_module(library(pce_util)).

empleado:- 
  new(Dialog, dialog('Define employee')), 
  send_list(Dialog, append, 
    [
      new(N1, text_item(first_name)), 
      new(N2, text_item(family_name)), 
      % El menu asi solo, son checkboxes
      new(S, new(S, menu(sex))), 
      new(A, int_item(age, low :=18, high:=65)), 
      % El menu tipo cycle es un combo box
      new(D, menu(department,cycle)), 
      button(cancel, message(Dialog, destroy)),
      button(enter,
        and(
          message(@prolog, assert_employee, N1?selection, N2?selection, S?selection, A?selection, D?selection),
          message(Dialog, destroy)
        )
      )
    ]
  ), 
  send_list(S, append, [male, female]), 
  send_list(D, append, [research, development, marketing]), 
  send(Dialog, default_button, enter), 
  send(Dialog, open). 
  
assert_employee(FirstName, FamilyName, Sex, Age, Depth):-
  format('Adding ~n Gender: ~w~n First: ~w~n Family: ~w~n Age: ~w~n Working At: ~w~n', 
    [Sex, FirstName, FamilyName, Age, Depth]).