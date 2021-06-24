/*
Luis Fernando Acosta Tovar
Inteligencia Artificial
Ing. Sistemas Computacionales
Arbol Genealogico con los Simpson
*/

% Definir las relaciones basicas padre/madre-hijo con progenitor(A,B)
% donde A es progenitor de B
progenitor(homero,bart).
progenitor(homero,lisa).
progenitor(homero,maggie).
progenitor(marge,bart).
progenitor(marge,lisa).
progenitor(marge,maggie).
progenitor(abraham,herbert).
progenitor(abraham,homero).
progenitor(mona,herbert).
progenitor(mona,homero).
progenitor(selma,ling).
progenitor(clancy,patty).
progenitor(clancy,selma).
progenitor(clancy,marge).
progenitor(jacqueline,patty).
progenitor(jacqueline,selma).
progenitor(jacqueline,marge).
pareja(homero, marge).
pareja(marge, homero). 

hijo(Hijo,Padre):- progenitor(Padre,Hijo).

hermano(H1,H2):- progenitor(X,H1), progenitor(X,H2), H1\==H2.

abuelo(Abuelo,Nieto):- progenitor(Abuelo,X), progenitor(X,Nieto).

nieto(Nieto,Abuelo):- abuelo(Abuelo,Nieto).

primo(P1,P2):- progenitor(X,P1), hermano(X,Z), progenitor(Z,P2).

tio(Tio,Sobrino):- progenitor(X, Sobrino), hermano(X, Tio). 
tio(Tio,Sobrino):- progenitor(X, Sobrino), hermano(X, Y), pareja(Y, Tio). 











