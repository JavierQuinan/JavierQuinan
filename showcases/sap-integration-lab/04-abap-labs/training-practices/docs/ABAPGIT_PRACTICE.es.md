# abapGit — Práctica Hands-on

[English version](./ABAPGIT_PRACTICE.md)

## Estado

`USER_AUTHORED_PRACTICE` / `OWNER_CONFIRMED_HANDS_ON_EXECUTION` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` / `NO_CURRENT_RUNTIME_CLAIM`

## Procedencia

Práctica hands-on implementada por Francisco Quinteros durante formación estructurada (Logali Group, Curso 3 — módulo abapGit) y normalizada para uso en portfolio. Creada y ejecutada personalmente en el entorno trial de SAP propio del propietario: creación de la clase, creación de un repositorio de GitHub, y ejecución de un stage/commit/push con abapGit. Esto **no** se reclama como inventado de forma independiente fuera del contexto de formación — la estructura de la clase y los literales de prueba fueron especificados por el propio ejercicio del curso; el trabajo propio del propietario fue teclearla, activarla, ejecutarla, y completar el flujo de abapGit.

## Objeto

[`source/zcl_c3_01_projects_fq.abap`](../source/zcl_c3_01_projects_fq.abap) — una clase con un método `create_project` que demuestra el paso de parámetros `IMPORTING`/`EXPORTING`.

## Qué demuestra esto

Crear una clase ABAP Cloud en Eclipse ADT, estructurar un método con parámetros de entrada/salida, y versionarla con abapGit contra un repositorio de GitHub.

## Normalización respecto al ejercicio original

El ejercicio original usaba un placeholder de instancia de curso en el nombre de la clase (un sufijo destinado a reemplazarse con un fragmento del nombre de usuario SAP del estudiante). La versión de portfolio renombra la clase a la convención `_fq` y elimina una sección vacía sin uso de la definición de la clase. El estilo de paso de parámetros del método (`IMPORTING`/`EXPORTING`) y los valores literales de prueba no cambian, ya que la dirección de paso de parámetros era el propio punto pedagógico del ejercicio.

## Estado de runtime

`NO_CURRENT_RUNTIME_CLAIM`. La copia normalizada y renombrada en este repositorio no ha sido reejecutada por sí misma; la ejecución se refiere a la práctica de formación hands-on original confirmada por el propietario. Reejecutar este archivo renombrado específico es trabajo futuro opcional, no un requisito de este track.

## Dependencias

Ninguna más allá de APIs liberadas de ABAP Cloud (`if_oo_adt_classrun`). Sin tabla `/DMO/*`, sin objeto externo.
