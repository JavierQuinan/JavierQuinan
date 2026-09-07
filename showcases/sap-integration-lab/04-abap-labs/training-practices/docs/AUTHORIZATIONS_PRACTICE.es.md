# Autorizaciones — Práctica Hands-on

[English version](./AUTHORIZATIONS_PRACTICE.md)

## Estado

`USER_AUTHORED_PRACTICE` / `PORTFOLIO_NORMALIZED` / `NORMALIZED_NOT_EXECUTED` / `NEEDS_ADT_VERIFICATION`

## Procedencia

Práctica hands-on implementada por Francisco Quinteros durante formación estructurada (Logali Group, Curso 3 — módulo Autorizaciones) y normalizada para uso en portfolio. Creada personalmente en el entorno trial de SAP propio del propietario: un elemento de datos, un campo de autorización, un objeto de autorización, y esta clase que realiza una consulta protegida por `AUTHORITY-CHECK`. No se reclama como inventado de forma independiente fuera del contexto de formación — el ejercicio especificó las relaciones entre objetos y la lógica de comprobación/consulta; el trabajo propio del propietario fue crear estos objetos DDIC/ABAP de principio a fin y conectarlos correctamente.

## Objeto

[`source/zcl_c3_04_dept_auth_fq.abap`](../source/zcl_c3_04_dept_auth_fq.abap) — consulta `/dmo/airport` solo si el `AUTHORITY-CHECK` tiene éxito.

## Objetos DDIC requeridos creados en ADT (documentados, no fabricados como archivos fuente)

Los dominios, elementos de datos, y campos/objetos de autorización de Dictionary se crean mediante asistentes de ADT, no se escriben como texto fuente de tipo clase. Esta clase depende de tres de esos objetos, ninguno con archivo `.abap` propio:

| Objeto | Tipo | Nombre usado |
|---|---|---|
| Elemento de datos | Tipo de campo | `zde_dept_fq` |
| Campo de autorización | `AUTHORITY-CHECK ... ID` | `ZAFDEPTFQ` |
| Objeto de autorización | `AUTHORITY-CHECK ... OBJECT` | `ZAODEPTFQ` |

El campo y el objeto de autorización usan un estilo corto sin guiones bajos (9 caracteres cada uno) en lugar de la convención con guión bajo `_fq` de la clase — los objetos y campos de autorización de SAP están limitados a 10 caracteres, límite que la convención con sufijo de guión bajo excedería.

Estos tres objetos, más la asignación del objeto/campo de autorización al perfil de autorización del usuario en ejecución (un paso de entorno/asignación de rol, no una dependencia de código), deben existir antes de que esta clase pueda activarse y su rama de `AUTHORITY-CHECK` pueda tener éxito.

## Qué demuestra esto

Construir una cadena de autorización completa en ABAP Cloud: un elemento de datos que respalda un campo de autorización, un objeto de autorización que usa ese campo, y una sentencia `AUTHORITY-CHECK` que protege una consulta de base de datos en código de aplicación.

## Normalización respecto al ejercicio original

El ejercicio original usaba un placeholder de instancia de curso en el nombre de la clase y en los nombres de objeto DDIC previstos. La versión de portfolio renombra la clase a la convención `_fq`, renombra el elemento de datos al patrón ya documentado `zde_<tema>_fq`, y da al campo/objeto de autorización nombres cortos nuevos coherentes con la misma restricción de 10 caracteres que el propio código extraído del ejercicio original ya sorteaba. La lógica de `AUTHORITY-CHECK`/consulta no cambia.

## Estado de runtime

`NORMALIZED_NOT_EXECUTED`. Esta clase y sus prerrequisitos DDIC no han sido creados ni activados en esta forma. `NEEDS_ADT_VERIFICATION` antes de cualquier afirmación de runtime actual.

## Dependencias

`/DMO/AIRPORT` (tabla de demostración estándar del SAP Flight Reference Scenario) — disponibilidad aún no reconfirmada en un sistema destino actual, más los tres objetos DDIC anteriores y su asignación de rol.
