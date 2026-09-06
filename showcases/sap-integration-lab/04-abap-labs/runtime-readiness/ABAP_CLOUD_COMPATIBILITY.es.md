# Revisión de Compatibilidad con ABAP Cloud

[English version](./ABAP_CLOUD_COMPATIBILITY.md)

> Clasificación por fuente, solo por lectura estática. Ninguna de las frases "Clean Core compliant", "ABAP Cloud verified" ni "ATC clean" se usa en ningún lugar de este paquete — ninguna de ellas tiene todavía evidencia de runtime/tooling detrás. Las categorías siguientes son las únicas afirmaciones realizadas.

## Leyenda

| Categoría | Significado |
|---|---|
| `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | Toda construcción encontrada es un elemento de lenguaje o API liberada de ABAP Cloud, por lectura manual del código — todavía no confirmado por un chequeo de sintaxis real de ADT ni una ejecución de ATC |
| `LIKELY_COMPATIBLE_NEEDS_RUNTIME` | Mayormente construcciones liberadas, con al menos un elemento específico cuyo estado de liberación exacto necesita confirmación de runtime/tooling |
| `CLASSIC_ABAP_DEPENDENCY` | Usa una construcción ligada a ABAP clásico / estado no liberado (ninguna encontrada en este conjunto — listada por completitud) |
| `COURSE_SPECIFIC_DEPENDENCY` | Depende de un objeto (`ZEMP_LOGALI`) que solo existe en el entorno de formación |
| `UNKNOWN` | Información insuficiente para clasificar |

## Clasificación

| Fuente | Categoría | Base |
|---|---|---|
| `zcl_lab_01_var_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | Solo `if_oo_adt_classrun`, `cl_abap_context_info`, tipos elementales/estructurados, `CONV`, `/dmo/employee_hr` (una tabla de demostración estándar liberada) — no se encontraron construcciones de ABAP clásico |
| `zcl_lab_02_arithmetic_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | Sentencias aritméticas puras y la función incorporada `sqrt( )` — sin ninguna dependencia de objeto |
| `zcl_lab_03_datatypes_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | `cl_abap_context_info`, `utclong_current( )`, `utclong_add( )` — todas liberadas para ABAP Cloud |
| `zcl_lab_04_message_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | Solo funciones incorporadas de strings/regex, más un símbolo de text-pool (una característica de metadatos de ADT, no una API restringida por release) |
| `zcl_lab_05_invoice_fq` | `COURSE_SPECIFIC_DEPENDENCY` | 7 de 8 métodos son `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` por sí solos (funciones de strings, RTTI `cl_abap_typedescr`/`cl_abap_structdescr` — ambas liberadas); el 8º método (`demo_2_concat_lines_tab`) depende de `ZEMP_LOGALI`, lo que determina la clasificación de todo el archivo |
| `zcl_lab_05_invoice_fqa` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | `OVERLAY`, `substring*`, `FIND`, `REPLACE`/`REPLACE REGEX`, `repeat( )`, `escape( )` con `cl_abap_format` — todas construcciones liberadas de procesamiento de strings, sin objeto externo |
| `zcl_lab_06_condition_fq` | `COURSE_SPECIFIC_DEPENDENCY` | 8 de 9 métodos usan solo construcciones liberadas (`SWITCH`, `COND`, `DO`, `WHILE`, `CASE`, `TRY`/`CATCH cx_sy_zerodivide`); la clase en su conjunto no puede activarse sin `ZEMP_LOGALI` por las referencias de tipo `DATA` a nivel de clase |
| `zcl_lab_07_tables_fq` | `LIKELY_COMPATIBLE_NEEDS_RUNTIME` | La lógica propia de `ty_employee`/`VALUE #( )` es solo-liberada; las lecturas/tipos de `/dmo/connection` son objetos de demostración estándar, normalmente liberados en sistemas trial/demo de ABAP Cloud, pero su presencia real y cualquier restricción de asignación de paquete/estado de API necesitan confirmación en runtime |
| `zcl_lab_07_tables_fqa` | `LIKELY_COMPATIBLE_NEEDS_RUNTIME` | Misma salvedad de `/DMO/*` que lab-07 (tres tablas aquí, no una), más construcciones modernas (`ENUM`, `GROUP BY`/`FOR GROUPS`, `COLLECT`, `LET`, `BASE`, `RANGE OF`) que están liberadas en ABAP actual pero conviene ejercitar una vez, en vivo, dado cuántas se usan juntas en una sola clase |
| `zcl_lab_08_fieldsymbols_fq` | `COURSE_SPECIFIC_DEPENDENCY` | Las técnicas de field symbols en sí (`ASSIGN`, `LOOP ... ASSIGNING`, `APPEND/INSERT ... ASSIGNING`, `READ TABLE ... ASSIGNING`) están liberadas; bloqueada porque el TYPE del field symbol es `zemp_logali`. Además usa `sy-datum` directamente — ver la pregunta abierta más abajo |

## Variantes runtime-ready (aún no ejecutadas — revisadas por las mismas razones)

| Fuente | Categoría | Base |
|---|---|---|
| `zcl_employee_fixture_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | TYPEs locales, `VALUE #( )`, un método estático — sin ninguna dependencia externa |
| `zcl_lab_05_invoice_rt_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | Igual que la histórica `zcl_lab_05_invoice_fq` menos el SELECT a `ZEMP_LOGALI`, que era la única dependencia de objeto no liberado |
| `zcl_lab_06_condition_rt_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | Igual que la histórica `zcl_lab_06_condition_fq` menos la dependencia de tipo de `ZEMP_LOGALI` |
| `zcl_lab_08_fieldsymbols_rt_fq` | `LIKELY_COMPATIBLE_NEEDS_RUNTIME` | Igual que la histórica `zcl_lab_08_fieldsymbols_fq` menos la dependencia de tipo de `ZEMP_LOGALI`; la pregunta abierta sobre `sy-datum` (abajo) sigue aplicando sin cambios, ya que eliminarla se consideró fuera de alcance para una corrección centrada solo en la dependencia |

## Pregunta abierta: acceso directo a campos `sy-*`

`sy-datum` se lee directamente en `zcl_lab_08_fieldsymbols_fq` (y su variante runtime-ready). `sy-subrc` y `sy-index` se leen directamente en `zcl_lab_05_invoice_fq`, `zcl_lab_06_condition_fq` y `zcl_lab_07_tables_fq`. No todos los campos de sistema `sy-*` tienen el mismo estado de liberación en cada modelo de desarrollo de ABAP Cloud (public cloud key-user/developer extensibility vs. on-premise/private-cloud ABAP Cloud vs. on-premise clásico) — `sy-subrc` y `sy-index` están ampliamente documentados como liberados; el estado específico de `sy-datum` debería confirmarse con el propio chequeo de sintaxis/liberación de ADT (o las sugerencias de "check pragma"/quick-fix de ABAP Cloud que ADT muestra cuando una construcción no está liberada para el software component asignado) en lugar de asumirse en un sentido u otro aquí. Se deja como ítem abierto para la Fase 14, no resuelto por esta revisión.

## Qué no se afirma explícitamente

- Ninguna fuente aquí se llama "Clean Core compliant".
- Ninguna fuente aquí se llama "ABAP Cloud verified".
- Ninguna fuente aquí se llama "ATC clean".
- Ninguna afirmación de compatibilidad anterior sustituye una activación real en ADT + una ejecución de ATC en el sistema destino.
