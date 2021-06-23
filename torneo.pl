ganados( juan, 7 ).
ganados( susana, 6 ).
ganados( pedro, 2 ).
ganados( rosa, 5 ).
ganados(cecilia,6).
ganados(carlos,8).

jugados(carlos,10).
jugados(cecilia,12).
jugados( rosa, 10 ).
jugados( juan, 13 ).
jugados( pedro, 3 ).
jugados( susana, 7 ).

porcentaje( X,Y ):- ganados( X,Z ),jugados( X,Q ),Y is (Z/Q)*100.
porcentaje_menos60( X,Y ):- ganados( X,Z ),jugados( X,Q ),Y is (Z/Q)*100, Y < 60.
torneos_perdidos(X,Y):- ganados(X,Z),jugados(X,Q), Y is Q-Z.
torneos_ganados(X,Y):- torneos_perdidos(X,Z), jugados(X,Q), Y is Q-Z.
