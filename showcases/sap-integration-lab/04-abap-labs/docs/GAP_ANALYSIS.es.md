# Análisis de Gaps — Track Histórico de Laboratorios ABAP Cloud

[English version](./GAP_ANALYSIS.md)

> Este documento cubre únicamente `04-abap-labs/`. Es un análisis de gaps a nivel de track, no una afirmación de que el SAP Integration Lab más amplio carezca de estas capacidades. **El alcance actual de este track está completo** — nada de lo siguiente es un bloqueador para ello; todo aquí es `OPTIONAL_FUTURE_EXPANSION`, listado por transparencia sobre lo que un futuro conjunto de laboratorios de siguiente generación podría añadir.

## Ya cerrado por este track

- **10 laboratorios históricos**, `HISTORICAL_EXECUTION_VERIFIED`, sin claim de runtime actual afirmado ni exigido.
- **Práctica hands-on de abapGit, ATC, ABAP Cleaner, Autorizaciones** — antes listado aquí como gaps solo-formación, ahora cerrado vía [Prácticas de Formación de Curso 3](../training-practices/README.es.md) (`OWNER_CONFIRMED_HANDS_ON_EXECUTION`, source normalizado `_fq` publicado).
- **Reproducibilidad de `ZEMP_LOGALI` y la dependencia `TEXT-001`** — analizadas y documentadas en la [referencia opcional de runtime-readiness](../runtime-readiness/README.es.md), incluyendo una fixture sintética `_fq` y 3 borradores de source runtime-ready. Esta referencia existe porque tiene valor técnico, no porque este track la requiera para cerrar.

## `OPTIONAL_FUTURE_EXPANSION` — laboratorios originales de siguiente generación

| Capacidad | Evidencia en este track | Laboratorio siguiente recomendado, si se persigue |
|---|---|---|
| ABAP Unit | Ninguna en este conjunto histórico | Una clase de test local añadida a un laboratorio de lógica pura como aritmética/conversiones |
| CDS | Ninguna en este conjunto histórico | Una vista CDS de solo lectura sobre datos demo sintéticos o liberados |
| RAP | Ninguna en este conjunto histórico | Un escenario RAP managed mínimo sobre datos sintéticos |
| Definición/binding de servicio | Ninguna en este conjunto histórico | Una extensión del escenario RAP anterior |
| Exposición OData hands-on en ABAP | Ninguna en este conjunto histórico | Una extensión del escenario RAP anterior |
| Consumo de API | Sin laboratorio hands-on en este track | Un laboratorio de cliente HTTP de solo lectura seguro en el entorno ABAP Cloud |

El SAP Integration Lab más amplio ya contiene material RAP basado en documentación y un ejemplo ejecutable no-live de cliente OData; los ítems anteriores tratan específicamente de una **futura generación de laboratorios ABAP hands-on originales** — nunca un requisito para cerrar el track actual.

## `OPTIONAL_FUTURE_EXPANSION` — laboratorios originales de Curso 2

Curso 2 (formación hands-on de ABAP Dictionary: dominios, elementos de datos, tablas, objetos de bloqueo, ajustes de persistencia, relaciones de tablas, Dynamic Cache) es `TRAINING_ONLY` — practicado hands-on, pero no se guardó ningún artefacto de source para normalizar o publicar. Un futuro laboratorio DDIC completamente original (escenario propio, nomenclatura `_fq` propia, construido y ejecutado de forma independiente al ejercicio del curso) podría cerrar este gap, pero es trabajo futuro opcional, no un requisito del alcance actual.

## Contexto global del portfolio

Usa la [Matriz de Capacidades SAP](../../00-profile/SAP_CAPABILITY_MATRIX.es.md) central para claims globales. `NOT_FOUND_IN_THIS_LAB_SET` es intencionalmente local a este track.
