enfermedad(gripe, pedro).
enfermedad(hepatitis, pedro). 
enfermedad(gripe, maria).
enfermedad(hepatitis, juan).
enfermedad(intoxicacion, carlos).
sintoma(gripe, fiebre).
sintoma(gripe, cansancio).
sintoma(hepatitis, cansancio).
sintoma(intoxicacion, diarrea).
medicamento(aspirina, fiebre). 
medicamento(lomotil, diarrea). 

alivia(Farmaco, Enfermedad):- sintoma(Enfermedad, X), medicamento(Farmaco, X).
deberia_tomar(Persona, Farmaco):- enfermedad(X, Persona), alivia(Farmaco, X).


