# abapGit — Práctica Hands-on

[English version](./ABAPGIT_PRACTICE.md)

## Estado

`USER_AUTHORED_PRACTICE` / `OWNER_CONFIRMED_HANDS_ON_EXECUTION` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` / `NO_CURRENT_RUNTIME_CLAIM`

## Procedencia

Práctica hands-on implementada por Francisco Quinteros durante formación estructurada (Logali Group, Curso 3 — módulo abapGit) y normalizada para uso en portfolio. El propietario confirma haber creado y ejecutado personalmente la práctica en un entorno trial SAP: creación de la clase, creación de un repositorio GitHub y ejecución de stage/commit/push con abapGit. Esto **no** se presenta como inventado de forma independiente fuera del contexto formativo; la estructura de la clase y los literales de prueba provenían del ejercicio del curso, mientras que la implementación hands-on y la ejecución del workflow fueron realizadas por el propietario.

## Objeto

[`source/zcl_c3_01_projects_fq.abap`](../source/zcl_c3_01_projects_fq.abap) — clase con un método `create_project` que demuestra paso de parámetros `IMPORTING`/`EXPORTING`.

## Qué demuestra

Crear una clase ABAP Cloud en Eclipse ADT, estructurar un método con parámetros de entrada/salida y versionarla con abapGit contra un repositorio GitHub.

## Normalización de portfolio

El ejercicio original utilizaba un placeholder de instancia de curso en el nombre de la clase. La copia pública del portfolio usa la convención `_fq` y elimina una sección vacía sin uso de la definición de clase. La estructura de paso de parámetros y los literales de prueba del ejercicio se conservan porque forman parte del contexto formativo declarado arriba.

## Límite de runtime

El claim de ejecución corresponde a la práctica hands-on original confirmada por el propietario. La copia pública normalizada se presenta como evidencia de source y no lleva un claim separado de runtime actual.

## Dependencias

Ninguna más allá de APIs liberadas de ABAP Cloud (`if_oo_adt_classrun`). Sin tabla `/DMO/*` ni objeto externo.
