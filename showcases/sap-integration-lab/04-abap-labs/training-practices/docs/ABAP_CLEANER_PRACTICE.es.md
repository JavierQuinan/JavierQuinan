# ABAP Cleaner — Práctica Hands-on

[English version](./ABAP_CLEANER_PRACTICE.md)

## Estado

`USER_AUTHORED_PRACTICE` / `PORTFOLIO_NORMALIZED` / `NORMALIZED_NOT_EXECUTED` / `NEEDS_ADT_VERIFICATION`

## Procedencia

Práctica hands-on implementada por Francisco Quinteros durante formación estructurada (Logali Group, Curso 3 — módulo ABAP Cleaner) y normalizada para uso en portfolio. Creada y ejecutada personalmente en el entorno trial de SAP propio del propietario: configuración de un perfil de ABAP Cleaner con un subconjunto específico de categorías de reglas (Empty Lines, Spaces, Syntax, Declarations, Pretty Printer, Alignment), ejecución de ese perfil contra la clase, y exportación del perfil. No se reclama como inventado de forma independiente fuera del contexto de formación — la estructura de la clase fue especificada por el ejercicio como el código "antes" a limpiar; el trabajo propio del propietario fue configurar y ejecutar la propia herramienta ABAP Cleaner.

## Objeto

[`source/zcl_c3_03_cleaner_demo_fq.abap`](../source/zcl_c3_03_cleaner_demo_fq.abap) — la clase "antes de la limpieza" según lo especificado por el ejercicio.

## Qué demuestra esto

Configurar un perfil de ABAP Cleaner con un subconjunto de categorías de reglas seleccionado y aplicarlo a una clase como un paso de limpieza de formato/estilo.

## Normalización respecto al ejercicio original

El ejercicio original usaba un placeholder de instancia de curso en el nombre de la clase. La versión de portfolio renombra la clase a la convención `_fq` y elimina una sección vacía sin uso. No se incluye una versión "después de la limpieza", ya que no sobrevivió ningún fuente posterior a la limpieza verificable de forma independiente para transcribir — publicar solo lo que puede confirmarse evita fabricar un diff.

## Estado de runtime

`NORMALIZED_NOT_EXECUTED`. Este archivo no ha sido activado, ejecutado, ni pasado por ABAP Cleaner en esta forma. `NEEDS_ADT_VERIFICATION` antes de cualquier afirmación de runtime actual, y antes de añadir cualquier versión "después de la limpieza".

## Dependencias

`/DMO/FLIGHT` (tabla de demostración estándar del SAP Flight Reference Scenario) — disponibilidad aún no reconfirmada en un sistema destino actual.
