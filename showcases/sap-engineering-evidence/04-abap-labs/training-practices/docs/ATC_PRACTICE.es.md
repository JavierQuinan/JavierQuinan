# ATC (ABAP Test Cockpit) — Práctica Hands-on

[English version](./ATC_PRACTICE.md)

## Estado

`USER_AUTHORED_PRACTICE` / `OWNER_CONFIRMED_HANDS_ON_EXECUTION` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` / `NO_CURRENT_RUNTIME_CLAIM`

## Procedencia

Práctica hands-on implementada por Francisco Quinteros durante formación estructurada (Logali Group, Curso 3 — módulo ATC) y normalizada para uso en portfolio. Creada y ejecutada personalmente en el entorno trial de SAP propio del propietario: ejecución de una comprobación ATC con la variante `ABAP_CLOUD_READINESS`, aplicación de una corrección con pragma `##NO_TEXT` para un finding de string traducible, y creación de una exención ATC documentada para un finding de "sin condición WHERE" con una justificación indicada. No se reclama como inventado de forma independiente fuera del contexto de formación — la clase, los findings específicos a producir, y el ejercicio de exención fueron especificados por el curso; el trabajo propio del propietario fue ejecutar el flujo completo de ATC de principio a fin.

## Objeto

[`source/zcl_c3_02_atc_demo_fq.abap`](../source/zcl_c3_02_atc_demo_fq.abap) — una clase que consulta `/dmo/flight` sin cláusula `WHERE`, deliberadamente.

## Qué demuestra esto

Ejecutar una comprobación ATC contra una clase, leer y triar findings, aplicar una corrección a nivel de código (pragma `##NO_TEXT`) para un finding, y crear una exención formalmente justificada para otro.

## Por qué la consulta sin filtro es intencional, no un defecto

El `SELECT` sin cláusula `WHERE` se mantiene exactamente igual que en el ejercicio original. Es el disparador deliberado del finding de ATC "Table /DMO/FLIGHT: No WHERE condition" que el ejercicio existe para que el estudiante exente con una justificación documentada de falso positivo — eliminarlo eliminaría el propio punto pedagógico del ejercicio.

## Normalización respecto al ejercicio original

El ejercicio original usaba un placeholder de instancia de curso en el nombre de la clase. La versión de portfolio renombra la clase a la convención `_fq` y elimina una sección vacía sin uso. La lógica del `SELECT` y la corrección del pragma `##NO_TEXT` no cambian.

## Estado de runtime

`NO_CURRENT_RUNTIME_CLAIM`. La copia normalizada y renombrada en este repositorio no ha sido reactivada, reejecutada, ni recomprobada con ATC por sí misma; la ejecución y los findings/corrección/exención originales de ATC se refieren a la práctica de formación hands-on original confirmada por el propietario. No se afirma `ATC_CLEAN`/resultado ATC actual para la copia renombrada.

## Dependencias

`/DMO/FLIGHT` (tabla de demostración estándar del SAP Flight Reference Scenario) — disponibilidad aún no reconfirmada en un sistema destino actual.
