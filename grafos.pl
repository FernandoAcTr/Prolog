%nodo1, nodo2, costo
conexion(d,h,4).
conexion(h,f,9).
conexion(i,f,11).
conexion(f,g,10).
conexion(f,a,8).
conexion(a,b,7).
conexion(d,i,2).

%reglas
tieneAristas(X):- conexion(X,_,_).

llegarA(Inicio, Destino, Intermedio, Costo):- 
  conexion(Inicio, Intermedio, C1), 
  conexion(Intermedio, Destino, C2), 
  Costo is C1 + C2. 

%funcion recursiva para calcular si existe un camino
camino(Inicio,Destino):- conexion(Inicio,Destino,_). 
camino(Inicio,Destino):- conexion(Inicio, X, _), camino(X, Destino).  

%funcion recursiva para calcular el costo de un camino
costoCamino(Inicio,Destino, Costo):- conexion(Inicio,Destino, C), Costo is C. 
costoCamino(Inicio,Destino, Costo):- conexion(Inicio, X, C1), costoCamino(X, Destino, C2), Costo is C1 + C2.  