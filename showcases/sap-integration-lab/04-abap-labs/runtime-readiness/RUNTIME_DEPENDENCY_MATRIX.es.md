# Matriz de Dependencias de Runtime

[English version](./RUNTIME_DEPENDENCY_MATRIX.md)

> Inventario técnico exacto de cada clase, tabla, tipo, símbolo de texto y dependencia de sistema encontrada en los 10 archivos fuente ABAP publicados en `showcases/sap-integration-lab/04-abap-labs/labs/source/` (leídos desde `origin/main`, sin modificar). No se asume ninguna disponibilidad — todo lo que no pueda verificarse por lectura estática queda `UNKNOWN` hasta comprobarse en un sistema ABAP Cloud real. Esta matriz alimenta el Issue #36, ítems P0 1 y 5.

## Leyenda — Tipo de Dependencia

| Tipo | Significado |
|---|---|
| `STANDARD_ABAP` | Palabra clave/sentencia/función incorporada del lenguaje base, sin dependencia de objeto |
| `ABAP_CLOUD_RELEASED` | Una API liberada para el modelo de programación ABAP Cloud (p. ej. `cl_abap_context_info`) |
| `DMO` | Objeto de demostración estándar del SAP Flight Reference Scenario (`/DMO/*`) |
| `COURSE_SPECIFIC` | Objeto provisto únicamente por el entorno de formación de Logali Group, no parte de ninguna entrega estándar de SAP |
| `CUSTOM_Z` | Objeto de namespace de cliente que habría que crear de nuevo (ninguno identificado aún como objeto *nuevo requerido* — ver notas) |
| `TEXT_ELEMENT` | Símbolo de text-pool de ABAP, mantenido en ADT, no forma parte del archivo fuente |
| `UNKNOWN` | No se puede clasificar solo con lectura estática |

## Matriz

| Lab | Objeto | Dependencia | Tipo | Disponibilidad actual | Bloqueante | Acción recomendada |
|---|---|---|---|---|---|---|
| 01 | `if_oo_adt_classrun`, `if_oo_adt_classrun_out` | Interfaz | ABAP_CLOUD_RELEASED | Disponible (API liberada de ABAP Cloud) | No | Ninguna |
| 01 | `cl_abap_context_info=>get_system_date/get_system_time` | Clase/métodos | ABAP_CLOUD_RELEASED | Disponible | No | Ninguna |
| 01 | `/dmo/employee_hr` | Tabla de demostración estándar (`SELECT SINGLE`) | DMO | UNKNOWN | Sí, si está ausente en el sistema destino | Verificar en ADT Data Preview antes de ejecutar (ver `DMO_DEPENDENCY_CHECK.es.md`) |
| 01 | `mty_customer` | TYPE estructurado local | STANDARD_ABAP | Disponible (definido inline) | No | Ninguna |
| 02 | — | Aritmética pura (`ADD`/`SUBTRACT`/`MULTIPLY`/`DIVIDE`/`DIV`/`MOD`/`**`/`sqrt( )`) | STANDARD_ABAP | Disponible | No | Ninguna |
| 03 | `cl_abap_context_info=>get_system_date/get_system_time` | Clase/métodos | ABAP_CLOUD_RELEASED | Disponible | No | Ninguna |
| 03 | `utclong_current( )`, `utclong_add( )` | Funciones incorporadas | STANDARD_ABAP | Disponible | No | Ninguna |
| 04 | `TEXT-001` | Símbolo de text-pool | TEXT_ELEMENT | No presente (el contenido del text pool no forma parte del archivo `.abap`) | **Sí** — referenciar un símbolo de texto no mantenido hace fallar la activación | Crear `TEXT-001` en la pestaña "Text Elements" de ADT antes de activar — ver `LAB04_TEXT_ELEMENT_DECISION.es.md` |
| 04 | `strlen`, `numofchar`, `count`, `FIND`, `to_upper/to_lower/to_mixed`, `reverse`, `contains( regex = )` | Funciones incorporadas de strings/regex | STANDARD_ABAP | Disponible | No | Ninguna |
| 05 | `zemp_logali` | Tabla Z (`SELECT *` en runtime, solo en el método `demo_2_concat_lines_tab`) | COURSE_SPECIFIC | No disponible fuera del entorno de curso de Logali Group | Sí, solo para ese método — los otros 7 métodos de la clase no se ven afectados | Usar `zcl_employee_fixture_fq` en la variante runtime-ready (ver Fase 2/3) |
| 05 | `cl_abap_typedescr`, `cl_abap_structdescr` | Clases RTTI | STANDARD_ABAP | Disponible | No | Ninguna |
| 05a | — | Operaciones de strings puras (`OVERLAY`, `substring*`, `FIND`, `REPLACE`, `contains`, `REPLACE REGEX`, `repeat`, `escape`), `cl_abap_format` | STANDARD_ABAP / ABAP_CLOUD_RELEASED | Disponible | No | Ninguna |
| 06 | `zemp_logali` | Tabla Z — **TYPE en tiempo de compilación** para `DATA mt_employees TYPE TABLE OF zemp_logali` y `DATA ms_employee TYPE zemp_logali` a nivel de clase, más un `SELECT *` en runtime en `perform_loop_endloop` | COURSE_SPECIFIC | No disponible fuera del entorno de curso de Logali Group | **Sí — bloquea la activación.** A diferencia de lab-05, esto es una referencia de tipo DDIC, no solo un `SELECT` en runtime; la clase no activará en absoluto sin que exista `ZEMP_LOGALI` | La variante runtime-ready es obligatoria (ver `RUNTIME_VARIANT_MAPPING.es.md`) — reemplazar la referencia de tipo DDIC por un tipo local y la clase fixture |
| 06 | `cx_sy_zerodivide` | Clase de excepción estándar | ABAP_CLOUD_RELEASED | Disponible | No | Ninguna |
| 06 | `cl_abap_context_info=>get_system_time` | Clase/método | ABAP_CLOUD_RELEASED | Disponible | No | Ninguna |
| 06 | `SWITCH`, `COND`, `DO`/`ENDDO`, `WHILE`/`ENDWHILE`, `CASE`/`ENDCASE`, `TRY`/`CATCH` | Sentencias | STANDARD_ABAP | Disponible | No | Ninguna |
| 07 | `/dmo/connection` | Tabla de demostración estándar — **TYPE en tiempo de compilación** (`TYPES tt_connection TYPE STANDARD TABLE OF /dmo/connection`) y `SELECT` en runtime | DMO | UNKNOWN | Sí, si está ausente en el sistema destino (bloquea activación, no solo runtime) | Verificar en ADT antes de ejecutar |
| 07 | `ty_employee` (id/email/ape1/ape2/name/fechan/fechaa) | TYPE propio local + datos literales `VALUE #( )` | STANDARD_ABAP | Disponible (autocontenido, sin dependencia de `ZEMP_LOGALI` en este laboratorio) | No | Ninguna — este laboratorio ya no tiene dependencia de curso |
| 07 | `line_exists( )`, `line_index( )` | Funciones incorporadas de tablas | STANDARD_ABAP | Disponible | No | Ninguna |
| 07a | `/dmo/flight`, `/dmo/connection`, `/dmo/carrier` | Tablas de demostración estándar — **TYPE en tiempo de compilación** (3× `STANDARD TABLE OF /dmo/...`) y múltiples `SELECT` | DMO | UNKNOWN | Sí, si falta alguna de las tres (bloquea activación) | Verificar las tres en ADT antes de ejecutar |
| 07a | `/dmo/carrier_id`, `/dmo/connection_id`, `/dmo/plane_seats_occupied`, `/dmo/flight_date`, `/dmo/airport_from_id`, `/dmo/airport_to_id`, `/dmo/flight_price` | Elementos de datos DMO usados como TYPE de campo en estructuras locales | DMO | UNKNOWN (mismo paquete que las tablas anteriores; normalmente se entrega junto) | Sí, igual que arriba | Verificar junto con las 3 tablas |
| 07a | `land1` | Elemento de datos estándar de SAP Basis (clave de país) | STANDARD_ABAP | Disponible (elemento DDIC de Basis, no específico de DMO) | No | Ninguna |
| 07a | `cl_abap_context_info=>get_user_technical_name( )` | Clase/método | ABAP_CLOUD_RELEASED | Disponible | No (no bloquea) — **pero ver nota de sanitización** | El valor devuelto es el nombre de usuario técnico *del sistema en ejecución*, embebido en la tabla de salida `A01` (campo `iduser`). No es un identificador fijo en el código, pero será un dato real, actual y potencialmente identificable en cualquier captura de evidencia nueva — debe recortarse/redactarse (ver `RUNTIME_EVIDENCE_CHECKLIST.es.md`) |
| 07a | `BEGIN OF ENUM ... BASE TYPE`, `GROUP BY`/`FOR GROUPS`, `COLLECT`, `LET`, `BASE`, `RANGE OF` | Construcciones modernas de ABAP | STANDARD_ABAP | Disponible | No | Ninguna |
| 08 | `zemp_logali` | Tabla Z — **TYPE en tiempo de compilación** para `FIELD-SYMBOLS <ls_employee> TYPE zemp_logali` más un `SELECT *` en runtime | COURSE_SPECIFIC | No disponible fuera del entorno de curso de Logali Group | **Sí — bloquea la activación**, misma severidad que lab-06 | La variante runtime-ready es obligatoria |
| 08 | `sy-datum` | Campo de sistema, lectura directa | STANDARD_ABAP | Disponible, pero el estado de liberación bajo contratos estrictos de ABAP Cloud varía según el modelo de desarrollo | LIKELY_COMPATIBLE_NEEDS_RUNTIME — ver `ABAP_CLOUD_COMPATIBILITY.es.md` | Confirmar con el chequeo de sintaxis ABAP Cloud de ADT; si se marca, sustituir por `cl_abap_context_info=>get_system_date( )` solo en la variante runtime-ready |
| 05/06/07/08 | `sy-subrc`, `sy-index` | Campos de sistema, solo lectura | STANDARD_ABAP / ABAP_CLOUD_RELEASED | Disponible (liberado para ABAP Cloud) | No | Ninguna |

## Resumen

- **Ningún laboratorio usa vistas CDS, artefactos RAP, Behavior Definitions, Service Definitions/Bindings, ni OData.** Ninguno encontrado en los laboratorios históricos, Curso 2, ni las prácticas de Curso 3.
- **Ningún laboratorio requiere que exista un objeto Z propio nuevo** para compilar como fuente histórico — el único objeto de namespace de cliente referenciado es `ZEMP_LOGALI`, que es provisto por el curso, no algo que este portafolio deba recrear desde cero (en la Fase 2/3 se diseña un *reemplazo*, no una recreación de `ZEMP_LOGALI` en sí).
- **3 laboratorios (06, 08, y parcialmente 05) están bloqueados por `ZEMP_LOGALI`.** Los laboratorios 06 y 08 se bloquean en tiempo de activación (referencia de tipo DDIC); el laboratorio 05 se bloquea solo en runtime para uno de sus ocho métodos.
- **1 laboratorio (04) está bloqueado por un elemento de texto faltante**, no por una dependencia de código.
- **3 laboratorios (01, 07, 07a) dependen de objetos `/DMO/*`** cuya presencia en el sistema destino es `UNKNOWN` hasta comprobarse.
- **4 laboratorios (02, 03, 05a) más la mayor parte de la lógica propia del laboratorio 07 no tienen ninguna dependencia externa** más allá de APIs liberadas de ABAP Cloud y construcciones estándar del lenguaje.
