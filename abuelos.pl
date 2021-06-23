progenitor(clara,pedro).
progenitor(pedro,jose).
progenitor(ana,clara).
progenitor(jose,clara).
abuelo(X,Y):-progenitor(X,Z),progenitor(Z,Y).
bisabuelo(X,Y):-abuelo(X,Z),progenitor(Z,Y).
