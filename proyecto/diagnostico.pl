:- module(diagnostico, [diagnosticar/1]).

:- dynamic  y/1.
:- dynamic n/1.

% DECLARACION DE LOS OPERADORES
:- op(1115, fx, si).
:- op(1110, xfy, entonces).
:- op(1100, xfy, o).
:- op(1000, xfy, y).
:- op(900, fx, no).

%REGLA 1:
regla(si perdida_energia(Persona) o fatiga(Persona) o sensacion_lento(Persona) entonces sintomas_fisicos(Persona)).
regla(si dificultad_para_concentrarse(Persona) o dificultad_recordar(Persona) o dificultad_tomar_decisiones(Persona) entonces sintomas_fisicos(Persona)).
regla(si dificultad_para_dormir(Persona) o dificultad_despertar_temprano(Persona) o dormir_demasiado entonces sintomas_fisicos(Persona)).
regla(si cambios_en_apetito(Persona) o cambios_en_peso(Persona) entonces sintomas_fisicos(Persona)).
regla(si inquietud(Persona) o irritabilidad(Persona) entonces sintomas_fisicos(Persona)).

%REGLA 2
regla(si bajo_estado_animo(Persona) entonces sintomas_mentales(Persona)).
regla(si sentimientos_tristeza(Persona) entonces sintomas_mentales(Persona)).
regla(si sentimientos_persistentes_tristeza(Persona) o ansiedad(Persona) entonces sintomas_mentales(Persona)).
regla(si sentimientos_pesimismo(Persona) o falta_esperanza(Persona) entonces sintomas_mentales(Persona)).
regla(si sentimientos_culpabilidad(Persona) o inutilidad(Persona) o impotencia(Persona) entonces sintomas_mentales(Persona)).

%REGLA 3
regla(si sintomas_fisicos(Persona) y no_enfermedad_organica(Persona) o sintomas_mentales(Persona) entonces posible_depresion(Persona)).

%REGLA 4
regla(si posible_depresion(Persona) y duracion_dos_semanas(Persona) entonces episodio_depresivo(Persona)).

%REGLA 5
regla(si sequedad_de_boca(Persona) o estrenimiento(Persona) o diarrea(Persona) o ulcera_gastrica(Persona) entonces alteraciones_gastrointestinales(Persona)).

%REGLA 6
regla(si sensacion_ahogo(Persona) o dificultad_respiratoria(Persona) entonces alteraciones_respiratorias(Persona)).

%REGLA 8
regla(si molestias_al_orinar(Persona) o ausencia_de_la_menstruacion(Persona) o impotencia(Persona) entonces alteraciones_genitourinarias(Persona)).

%REGLA 9 
regla(si dolores_inespecificos(Persona) o alteraciones_gastrointestinales(Persona) o alteraciones_respiratorias(Persona) o alteraciones_neurologicas(Persona) o alteraciones_genitourinarias(Persona) entonces sintomas_somaticos(Persona)).

%REGLA 10
regla(si posible_depresion(Persona) y sintomas_somaticos(Persona) entonces depresion_somatizada(Persona)).

%REGLA 11
regla(si sentimiento_culpa(Persona) entonces ideas_delirantes(Persona)).
regla(si sentimientos_pecado(Persona) entonces ideas_delirantes(Persona)).
regla(si sentimientos_ruina(Persona) entonces ideas_delirantes(Persona)).
regla(si pensamientos_catastrofes_inminentes(Persona) entonces ideas_delirantes(Persona)).

%REGLA 12
regla(si episodio_depresivo(Persona) o ideas_delirantes(Persona) o alucinaciones(Persona) y posible_depresion(Persona) entonces depresion_con_sintomas_psicoticos(Persona)).

%REGLA 13
regla(si euforia(Persona) o hiperactividad(persona) entonces episodios_exaltacion(Persona)).

%REGLA 14
regla(si alteracion_estado_animo(Persona) y episodios_exaltacion(Persona) y posible_depresion(Persona) entonces trastorno_bipolar(Persona)).

%REGLA 15
regla(si edad_adulta(Persona) y posible_depresion(Persona) y duracion_prolongada(Persona) entonces transtorno_distimico(Persona)).

%REGLA 16
regla(si embarazada(Persona) y posible_depresion(Persona) entonces depresion_perinatal(Persona)).

%REGLA 17
regla(si recien_aliviada(Persona) y posible_depresion(Persona) entonces depresion_posparto(Persona)).

%REGLA 18
regla(si ser_mujer(Persona) o soledad(Persona) o carencia_de_un_apoyo_social(Persona) o experiencias_de_vida_estresantes(Persona) o antecedentes_familiares_de_depresion(Persona) entonces factores_de_riesgo(Persona)).
regla(si otros_padecimientos_de_salud_mental(Persona) o abuso_de_alcohol(Persona) o abuso_drogas(Persona) o problemas_en_el_matrimonio(Persona) entonces factores_de_riesgo(Persona)).
regla(si problemas_en_relaciones o dificultades_financieras(Persona) o cambios_importantes_en_la_vida(Persona) entonces factores_de_riesgo(Persona)).
regla(si problemas_de_salud(Persona) o dolor_cronico(Persona) o exposicion_a_trauma(Persona) o ser_victima_de_abuso(Persona) o abandono o ser_victima_de_un_crimen(Persona) entonces factores_de_riesgo(Persona)).

%REGLA 20
regla(si puntaje_test_menor_28(Persona) o puntaje_test_igual_28(Persona) entonces ausencia_de_depresion(Persona)).

%REGLA 21
regla(si puntaje_test_mayor_28(Persona) y puntaje_test_igual_menor_41(Persona) entonces depresion_leve(Persona)).

%REGLA 22
regla(si puntaje_test_igual_mayor_42(Persona) y puntaje_test_igual_menor_53(Persona) entonces depresion_moderada(Persona)).

%REGLA 23
regla(si puntaje_test_mayor_53(Persona) entonces depresion_grave(Persona)).

%REGLA 25
regla(si dificultad_relaciones_interpersonales(Persona) entonces terapia_interpersonal(Persona)).

%REGLA 24
regla(si aislamiento_social(Persona) o desempeno_deficiente_en_trabajo(Persona) o desempeno_deficiente_en_la_escuela(Persona) o falta_de_control_sobre_los_impulsos(Persona) o toma_de_malas_decisiones(Persona) o niveles_de_ansiedad_elevados(Persona) o dificultades_con_relaciones_interpersonales(Persona) o debilitamiento_del_sistema_inmunologico(Persona) o ulceras(Persona) o dolores_de_cabeza_cronicos_debido_a_la_tension(Persona) o presion_arterial_elevada(Persona) o obesidad_(Persona) o uso_de_sustancias_nocivas_(Persona) o conductas_autolesivas(Persona) o pensamientos_suicida(Persona) entonces requiere_tratamiento(Persona)).

%REGLA 26
regla(si pensamientos_negativos(Persona) o creencias_negativas(Persona) o actitudes_negativas(Persona) entonces terapia_cognitiva(Persona)).

%REGLA 27
regla(si mujer(Persona) y menor_60_anios(Persona) y (sintomas_tristeza(Persona) o falta_autoestima(Persona) o sentimientos_culpabilidad(Persona)) entonces posible_depresion(Persona)).

%REGLA 28
regla(si hombre(Persona) y menor_60(Persona) entonces posible_depresion(Persona)).
regla(si cansancio(Persona) entonces posible_depresion(Persona)).
regla(si irritabilidad(Persona) entonces posible_depresion(Persona)).
regla(si enojo(Persona) entonces posible_depresion(Persona)).
regla(si falta_interes_trabajo(Persona) entonces posible_depresion(Persona)).
regla(si dificultad_dormir(Persona) entonces posible_depresion(Persona)).
regla(si comportamiento_irresponsable(Persona) entonces posible_depresion(Persona)).

%REGLA 29
regla(si mayor_60(Persona) y transtornos_medicos(Persona) entonces posible_depresion(Persona)).
regla(si sentimientos_tristeza(Persona) entonces posible_depresion(Persona)).
regla(si sentimientos_pena(Persona) entonces posible_depresion(Persona)).

%REGLA 30
regla(si menor_10(Persona) y negacion_asistir_escuela(Persona) entonces posible_depresion(Persona)).
regla(si fingir_enfermo(Persona) entonces posible_depresion(Persona)).
regla(si aferracion_padres(Persona) entonces posible_depresion(Persona)).
regla(si preocupacion_muerte_padres(Persona) entonces posible_depresion(Persona)).

%REGLA 31
regla(si mayor_10(Persona) y menor_19(Persona) entonces posible_depresion(Persona)).
regla(si problemas_escuela(Persona) entonces posible_depresion(Persona)).
regla(si mal_humor(Persona) entonces posible_depresion(Persona)).
regla(si irritabilidad(Persona) entonces posible_depresion(Persona)).
regla(si ansiedad(Persona) entonces posible_depresion(Persona)).
regla(si transtornos_alimentacios(Persona) entonces posible_depresion(Persona)).
regla(si consumo_sustancias_nocivas(Persona) entonces posible_depresion(Persona)).


diagnosticar(TipoDepresion):- hipotesis(TipoDepresion),
      write('La depresion es de tipo: '),
      write(TipoDepresion),
      nl,
      undo.

%HIPOTESIS
hipotesis('Episodio Depresivo'):- episodio_depresivo, !.
hipotesis('Depresion Somatizada'):- depresion_somatizada, !.
hipotesis('Depresión con síntomas psicóticos'):- depresion_con_sintomas_psicoticos, !.
hipotesis('Depresión perinatal'):- depresion_perinatal, !.
hipotesis('Depresion postparto') :- depresion_posparto, !.
hipotesis('Transtorno bipolar') :- transtorno_bipolar, !.
hipotesis('Transtorno distímico') :- transtorno_distimico, !.
hipotesis('Se desconoce tu tipo de depresion').

%VERIFICAR REGLAS
episodio_depresivo:- posible_depresion, duracion_dos_semanas.
depresion_somatizada:- posible_depresion, sintomas_somaticos.
depresion_con_sintomas_psicoticos:- 
      posible_depresion, episodio_depresivo, ideas_delirantes.
depresion_perinatal:- posible_depresion, pregunta('¿Estas embarazada?').
depresion_posparto:- posible_depresion, pregunta('¿Acabas de aliviarte de un embarazo recientemente?').

% ----------------- Sintomas generales -----------
posible_depresion:- sintomas_fisicos, not(enfermedad_organica).
posible_depresion:- sintomas_mentales. 

sintomas_fisicos:- pregunta('¿Tienes perdida de energia?').
sintomas_fisicos:- pregunta('¿Tienes fatiga sin razon aparente?').
sintomas_fisicos:- pregunta('¿Tienes sensacion de lentitud?').
sintomas_fisicos:- pregunta('¿Tienes dificultad para concentrarte?').
sintomas_fisicos:- pregunta('¿Tienes dificultad para recordar?').
sintomas_fisicos:- pregunta('¿Tienes dificultad para tomar decisiones?').
sintomas_fisicos:- pregunta('¿Tienes dificultad para dormir?').
sintomas_fisicos:- pregunta('¿Tienes dificultad para depertar temprano por la mañana?').
sintomas_fisicos:- pregunta('¿Duermes demasiado?').
sintomas_fisicos:- pregunta('¿Has experimentado cambios en el apetito?').
sintomas_fisicos:- pregunta('¿Has bajado de peso sin razon aparente?').
sintomas_fisicos:- pregunta('¿Presentas inquietud o irritabilidad?').

enfermedad_organica:- pregunta('¿Tienes una enfermedad orgánica que te provoque cansancio?').

sintomas_mentales:- pregunta('¿Tienes bajo estado de animo?').
sintomas_mentales:- pregunta('¿Tienes sentimientos de tristeza?').
sintomas_mentales:- pregunta('¿Tienes ansiedad?').
sintomas_mentales:- pregunta('¿Tienes sentimientos de pesimismo?').
sintomas_mentales:- pregunta('¿Tienes falta de esperanza?').
sintomas_mentales:- pregunta('¿Tienes sentimientos de culpabilidad?').
sintomas_mentales:- pregunta('¿Te sientes inútil o impotente?').
sintomas_mentales:- pregunta('¿Perdiste el interes o placer en alguna actividad?').
sintomas_mentales:- pregunta('¿Has presentado pensamientos de muerte?').
sintomas_mentales:- pregunta('¿Has tenido intentos de suicidio?').

% ----------------- Episodio depresivo -----------
duracion_dos_semanas:- pregunta('¿Te has sentido triste por al menos dos semanas seguidas?').

% ----------------- Depresion somatizada -----------
sintomas_somaticos:- alteraciones_gastrointestinales.
sintomas_somaticos:- alteraciones_genitourinarias.
sintomas_somaticos:- alteraciones_neurologicas.
sintomas_somaticos:- alteraciones_respiratorias.

alteraciones_gastrointestinales:- pregunta('¿Tienes sequedad de boca?').
alteraciones_gastrointestinales:- pregunta('¿Enfermaste recientemente de extreñimiento?').
alteraciones_gastrointestinales:- pregunta('¿Enfermaste recientemente de diarrea?').
alteraciones_gastrointestinales:- pregunta('¿Enfermaste recientemente de úlcera gástrica?').

alteraciones_genitourinarias:- pregunta('¿Presentas molestias al orinar?'). 
alteraciones_genitourinarias:- pregunta('¿Tienes ausencia de menstruación?'). 
alteraciones_genitourinarias:- pregunta('¿Tienes impotencia sexual?'). 

alteraciones_neurologicas:- pregunta('¿Usualmene presentas mareo?'). 
alteraciones_neurologicas:- pregunta('¿Usualmene presentas cefálea?'). 
alteraciones_neurologicas:- pregunta('¿Usualmene presentas vértigo o temblores?'). 

alteraciones_respiratorias:- pregunta('¿Has sentido sensación de ahogo sin razón aparente?').
alteraciones_respiratorias:- pregunta('¿Has sentido dificultad respiratoria sin razón aparente?').

% ----------------- Depresion con sintomas psicoticos -----------
ideas_delirantes:- pregunta('¿Has tenido alucinaciones?'). 
ideas_delirantes:- pregunta('¿Has tenido sentimientos de culpa?'). 
ideas_delirantes:- pregunta('¿Has tenido sentimientos de pecado?'). 
ideas_delirantes:- pregunta('¿Has tenido sentimientos de ruina?'). 
ideas_delirantes:- pregunta('¿Has pensamientos de catátrofes mundiales?'). 

% ----------------- Transtorno bipolar -----------
transtorno_bipolar:- 
      posible_depresion,
      pregunta('¿Sufres alteraciones repentinas en tu estado del ánimo?'), 
      pregunta('¿Te exhaltas fácilmente').

% ----------------- Transtorno distimico -----------
transtorno_distimico:- 
      posible_depresion,
      pregunta('¿Tienes mas de 40 años?'),
      pregunta('¿Siempre te sientes cansado o desganado?').

%SALIDA AL EDITOR
pregunta(S) :- y(S)->true; n(S)->fail; preguntar(S).

preguntar(Pregunta):- 
  new(Di, dialog('DIAGNOSTICO DE DEPRESION')), 
  new(LblIndicacion, label(null, 'Responde las siguientes preguntas:')),
  new(LblPregunta, label(prob, Pregunta)), 
  new(BtnSi, button(si, message(Di, return, si),'SI')),
  new(BtnNo, button(no, message(Di, return, no),'NO')),
  send(Di, append(LblIndicacion)), 
  send(Di, append(LblPregunta)),
  send(Di, append(BtnSi)),
  send(Di, append(BtnNo)),
  send(Di, default_button, si),
  send(Di, open), 
  get(Di, confirm, Answer), 
  write(Answer), nl, 
  send(Di, destroy),

  % Comparar la respuesta recibida y regresar un verdadero o un falso
  ((Answer == si)->assert(y(Pregunta)) ; assert(n(Pregunta)), fail).


undo :- retract(y(_)),fail.
undo :- retract(n(_)),fail.
undo.