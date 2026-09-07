# Mapeo de Variantes de Runtime

[English version](./RUNTIME_VARIANT_MAPPING.md)

> Mapea cada clase histórica de laboratorio con su variante runtime-ready (solo donde realmente se necesitó una), indica la razón exacta, y confirma las restricciones de longitud de nomenclatura de objetos ABAP. Las fuentes históricas nunca se modifican — las variantes viven solo en `source/` y son archivos nuevos, adicionales.

## Comprobación de longitud de nombre (antes de elegir un sufijo)

Los nombres de clase global ABAP (`CLAS`) están limitados a 30 caracteres. El sufijo ilustrativo del enunciado original (`_runtime_fq`, 8 caracteres adicionales) se comprobó contra los 10 nombres históricos y **excede los 30 caracteres en 4 de ellos** al combinarse con la longitud de nombre existente:

| Nombre histórico | Longitud | `+_runtime_fq` (+8) | ¿Cabe en 30? |
|---|---|---|---|
| `zcl_lab_01_var_fq` | 17 | 25 | Sí |
| `zcl_lab_02_arithmetic_fq` | 24 | 32 | **No** |
| `zcl_lab_03_datatypes_fq` | 23 | 31 | **No** |
| `zcl_lab_04_message_fq` | 21 | 29 | Sí (no necesaria — ver abajo) |
| `zcl_lab_05_invoice_fq` | 21 | 29 | Sí |
| `zcl_lab_05_invoice_fqa` | 22 | 30 | Exactamente en el límite (no necesaria — ver abajo) |
| `zcl_lab_06_condition_fq` | 23 | 31 | **No** |
| `zcl_lab_07_tables_fq` | 20 | 28 | Sí (no necesaria — ver abajo) |
| `zcl_lab_07_tables_fqa` | 21 | 29 | Sí (no necesaria — ver abajo) |
| `zcl_lab_08_fieldsymbols_fq` | 26 | 34 | **No** |

Dado que 4 de los nombres que realmente necesitarían una variante (patrón 02/03/06/08) fallan con el sufijo ilustrativo de 8 caracteres, este paquete usa en su lugar un sufijo más corto, igualmente explícito: **`_rt_fq` / `_rt_fqa`** (`_rt` = 3 caracteres). Recalculado:

| Nombre histórico | Longitud | `+_rt` (+3) insertado antes de `_fq`/`_fqa` | ¿Cabe en 30? |
|---|---|---|---|
| `zcl_lab_05_invoice_fq` → `zcl_lab_05_invoice_rt_fq` | 21 | 24 | Sí |
| `zcl_lab_06_condition_fq` → `zcl_lab_06_condition_rt_fq` | 23 | 26 | Sí |
| `zcl_lab_08_fieldsymbols_fq` → `zcl_lab_08_fieldsymbols_rt_fq` | 26 | 29 | Sí |

**Ítem de verificación pendiente:** el límite de 30 caracteres anterior es la restricción estándar de objeto de repositorio ABAP para `CLAS`; aun así debe confirmarse directamente en ADT (intentando crear la clase, o comprobando la restricción del campo de nombre en el Object Navigator) antes de la activación, ya que los límites exactos pueden depender del release del sistema — ver `ADT_EXECUTION_GUIDE.es.md` y las preguntas abiertas de la Fase 14.

## Tabla de mapeo

| Histórica | Runtime-ready | Razón de existir la variante | Método(s) modificado(s) |
|---|---|---|---|
| `zcl_lab_01_var_fq` | *(ninguna)* | Sin dependencia específica de curso; solo la disponibilidad de `/dmo/employee_hr` necesita confirmación en runtime, sin cambio de código | — |
| `zcl_lab_02_arithmetic_fq` | *(ninguna)* | Cero dependencia externa | — |
| `zcl_lab_03_datatypes_fq` | *(ninguna)* | Cero dependencia externa | — |
| `zcl_lab_04_message_fq` | *(ninguna)* | `TEXT-001` es un paso de configuración de text-pool en ADT, no un problema de código — ver `LAB04_TEXT_ELEMENT_DECISION.es.md` | — |
| `zcl_lab_05_invoice_fq` | `zcl_lab_05_invoice_rt_fq` | Elimina la dependencia de runtime de `ZEMP_LOGALI` en un método | Solo `demo_2_concat_lines_tab` |
| `zcl_lab_05_invoice_fqa` | *(ninguna)* | Cero dependencia externa (ya totalmente autocontenida) | — |
| `zcl_lab_06_condition_fq` | `zcl_lab_06_condition_rt_fq` | Elimina la dependencia de **tipo DDIC en tiempo de compilación** de `ZEMP_LOGALI` que bloquea la activación | Tipos `DATA` a nivel de clase + `perform_loop_endloop` |
| `zcl_lab_07_tables_fq` | *(ninguna)* | Ya autocontenida; solo la disponibilidad de `/dmo/connection` necesita confirmación en runtime, sin cambio de código | — |
| `zcl_lab_07_tables_fqa` | *(ninguna)* | Ya autocontenida; solo la disponibilidad de `/dmo/flight`, `/dmo/connection`, `/dmo/carrier` necesita confirmación en runtime, sin cambio de código | — |
| `zcl_lab_08_fieldsymbols_fq` | `zcl_lab_08_fieldsymbols_rt_fq` | Elimina la dependencia de **tipo DDIC en tiempo de compilación** de `ZEMP_LOGALI` (field symbol tipado contra ella) que bloquea la activación | Tipo del `FIELD-SYMBOLS` + llamada a la fixture |
| *(nuevo, no es un lab)* | `zcl_employee_fixture_fq` | Fuente de datos sintética compartida, consumida por las tres variantes runtime-ready anteriores | n/a |

**7 de 10 laboratorios históricos no necesitan ninguna variante de código.** Solo los laboratorios 05, 06 y 08 la necesitan, y en cada caso el cambio se limita exactamente a las líneas que referenciaban `ZEMP_LOGALI` — ningún otro método, literal, o lógica de control se toca. Esto es deliberado (ver instrucción de la Fase 3: "generar solo cuando sea necesario").

## Resumen completo del diff por variante

### `zcl_lab_05_invoice_fq` → `zcl_lab_05_invoice_rt_fq`
- Nombre de clase renombrado (necesario — las clases ABAP con dependencias históricas/bloqueantes de curso no pueden compartir nombre con su propia corrección).
- Método `demo_2_concat_lines_tab`: `SELECT * FROM zemp_logali INTO TABLE @DATA(lt_employees).` reemplazado por `DATA(lt_employees) = zcl_employee_fixture_fq=>get_employees( ).`
- Todo lo demás idéntico byte a byte (los otros 7 métodos, `struct_to_line`, todos los literales).

### `zcl_lab_06_condition_fq` → `zcl_lab_06_condition_rt_fq`
- Nombre de clase renombrado.
- `DATA mt_employees TYPE TABLE OF zemp_logali` a nivel de clase → `DATA mt_employees TYPE zcl_employee_fixture_fq=>tt_employee_fixture_fq`.
- `DATA ms_employee TYPE zemp_logali` a nivel de clase → `DATA ms_employee TYPE zcl_employee_fixture_fq=>ty_employee_fixture_fq`.
- Método `perform_loop_endloop`: `SELECT * FROM zemp_logali INTO TABLE @me->mt_employees.` reemplazado por `me->mt_employees = zcl_employee_fixture_fq=>get_employees( ).`
- Todo lo demás idéntico byte a byte (los otros 8 métodos, todos los literales, el manejo real de la excepción `cx_sy_zerodivide`).

### `zcl_lab_08_fieldsymbols_fq` → `zcl_lab_08_fieldsymbols_rt_fq`
- Nombre de clase renombrado.
- `FIELD-SYMBOLS <ls_employee> TYPE zemp_logali` → `FIELD-SYMBOLS <ls_employee> TYPE zcl_employee_fixture_fq=>ty_employee_fixture_fq`.
- `SELECT * FROM zemp_logali INTO TABLE @DATA(lt_employees).` reemplazado por `DATA(lt_employees) = zcl_employee_fixture_fq=>get_employees( ).`
- Todo lo demás idéntico byte a byte (las 6 actividades de field symbols, todos los literales, el cast de coerción de `sy-datum` se mantiene igual — ver `ABAP_CLOUD_COMPATIBILITY.es.md` para la única pregunta abierta sobre ese campo).

## Qué NO se hace explícitamente

- Las 3 clases históricas (`zcl_lab_05_invoice_fq`, `zcl_lab_06_condition_fq`, `zcl_lab_08_fieldsymbols_fq`) **no se modifican, reemplazan ni eliminan** — permanecen exactamente como se publicaron, siguen en `HISTORICAL_EXECUTION_EVIDENCE = YES` / `CURRENT_RUNTIME_VERIFICATION = NO_CURRENT_RUNTIME_CLAIM`.
- Ninguna variante runtime-ready ha sido ejecutada. Su estado es `NOT_YET_EXECUTED`, no `CURRENT_RUNTIME_VERIFIED` — ese estado solo puede proponerse después de que exista evidencia de ejecución real (ver Fase 10 / `RUNTIME_EXECUTION_PLAN.es.md` en la Fase 7).
- Las variantes runtime-ready no se publican en GitHub — existen solo en esta carpeta local `_RUNTIME_WORK/source/`.
