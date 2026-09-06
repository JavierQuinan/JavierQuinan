# Plan de Ejecución de Runtime

[English version](./RUNTIME_EXECUTION_PLAN.md)

> Orden de ejecución y checklist por laboratorio para convertir evidencia histórica en evidencia de runtime actual, un laboratorio a la vez, según el Issue #36. Ningún laboratorio aquí ha sido ejecutado por esta revisión — `CURRENT_RUNTIME_STATUS = NOT_REEXECUTED` para los 10 hasta que el propietario de la cuenta los ejecute en un sistema ABAP Cloud real y aporte la evidencia de vuelta. Este plan no afirma que haya ocurrido ninguna ejecución.

## Orden recomendado y por qué

`01 → 02 → 03 → 04 → 05 → 05a → 06 → 07 → 07a → 08`

Razonamiento: primero los laboratorios sin dependencia externa (01–03, en orden numérico ya que 01 solo necesita comprobar una tabla DMO), luego el único paso de configuración de elemento de texto (04), después los laboratorios afectados por `ZEMP_LOGALI` junto con sus contrapartes runtime-ready (05, 06, 08 — en orden numérico original, no agrupados, para mantener la secuencia predecible), y finalmente los dos laboratorios con más carga de `/DMO/*` (07, 07a) una vez que las comprobaciones DMO de los labs 01/05 ya hayan establecido un patrón funcionando. Esto es una sugerencia, no un requisito — los laboratorios son independientes entre sí y pueden ejecutarse en cualquier orden o en paralelo en distintas sesiones.

---

## Lab 01 — `zcl_lab_01_var_fq`

1. **Objeto a crear:** ninguno — la clase ya existe como fuente histórico; importar/pegar tal cual.
2. **Paquete:** cualquier paquete local/de cliente con asignación de transporte válida en el sistema destino (el paquete de laboratorios original, si los laboratorios históricos se crearon originalmente bajo uno, o un paquete dedicado nuevo — a elección del propietario de la cuenta).
3. **Prerrequisitos:** ninguno más allá de la conectividad de ADT.
4. **Dependencias:** debe existir `/dmo/employee_hr` — ver `DMO_DEPENDENCY_CHECK.es.md`.
5. **Procedimiento de activación:** pegar el fuente en una clase global nueva llamada `zcl_lab_01_var_fq` que implemente `if_oo_adt_classrun`; activar (`Ctrl+F3`).
6. **Procedimiento de ejecución:** clic derecho sobre la clase → Run As → "Console Application" (o `F9`).
7. **Comportamiento esperado según el fuente:** imprime valores de tipos elementales, la estructura `mty_customer`, una fila de `/dmo/employee_hr`, la conversión de código de barras, y los valores declarados inline — ver los propios `[encabezados de sección]` de la clase en el fuente para el orden exacto.
8. **Evidencia requerida:** captura del output de la Consola ADT mostrando la ejecución completa sin volcado de runtime, más el Project Explorer mostrando la clase activada (verde).
9. **Sanitización requerida:** ninguna esperada — esta clase no imprime datos identificadores de usuario ni datos de tenant/sistema (ver `RUNTIME_EVIDENCE_CHECKLIST.es.md` para el checklist general de todas formas).
10. **Rollback/limpieza:** ninguno necesario si la clase debe quedarse; si se ejecuta en un paquete desechable, eliminar la clase después vía ADT.

## Lab 02 — `zcl_lab_02_arithmetic_fq`

1. **Objeto a crear:** ninguno — fuente histórico tal cual.
2. **Paquete:** el mismo del lab 01 u otro nuevo.
3. **Prerrequisitos:** ninguno.
4. **Dependencias:** ninguna — cero objetos externos.
5. **Procedimiento de activación:** crear clase global, pegar fuente, activar.
6. **Procedimiento de ejecución:** Run As → Console Application.
7. **Comportamiento esperado:** imprime 8 resultados aritméticos numerados (`ADD`/`SUBTRACT`/`MULTIPLY`/`DIVIDE`/`DIV`/`MOD`/`**`/`sqrt`), valores completamente deterministas a partir de los literales del fuente.
8. **Evidencia requerida:** captura del output de la Consola ADT mostrando las 8 líneas.
9. **Sanitización requerida:** ninguna — el output es puramente numérico, sin datos identificadores.
10. **Rollback/limpieza:** eliminar si está en un paquete desechable.

## Lab 03 — `zcl_lab_03_datatypes_fq`

1. **Objeto a crear:** ninguno — fuente histórico tal cual.
2. **Paquete:** el mismo que arriba.
3. **Prerrequisitos:** ninguno.
4. **Dependencias:** ninguna — solo APIs liberadas `cl_abap_context_info`/`utclong_*`.
5. **Procedimiento de activación:** crear clase global, pegar fuente, activar.
6. **Procedimiento de ejecución:** Run As → Console Application.
7. **Comportamiento esperado:** imprime resultados de conversión de tipo, truncamiento/redondeo, declaraciones inline, conversión forzada, y — **nota** — la fecha/hora de sistema actual y el timestamp UTC actual (estos diferirán legítimamente de la ejecución histórica de 2025; eso es esperado y correcto, no un error).
8. **Evidencia requerida:** captura del output de la Consola ADT.
9. **Sanitización requerida:** la fecha/hora de sistema/timestamp UTC impresos no son sensibles en sí mismos (no son un identificador de tenant/cuenta), pero confirmar que no vienen acompañados de ningún otro texto de banner de sistema antes de capturar.
10. **Rollback/limpieza:** eliminar si está en un paquete desechable.

## Lab 04 — `zcl_lab_04_message_fq`

1. **Objeto a crear:** ninguno — fuente histórico tal cual, más una entrada de Text Elements (no código fuente).
2. **Paquete:** el mismo que arriba.
3. **Prerrequisitos:** crear `TEXT-001` en la pestaña Text Elements de la clase **antes** de activar — ver `LAB04_TEXT_ELEMENT_DECISION.es.md` para los pasos exactos.
4. **Dependencias:** ninguna además del símbolo de texto.
5. **Procedimiento de activación:** crear clase global, pegar fuente, mantener `TEXT-001`, activar tanto el sub-objeto Text Elements como la clase.
6. **Procedimiento de ejecución:** Run As → Console Application.
7. **Comportamiento esperado:** imprime el valor de `TEXT-001`, resultados de funciones de descripción de strings (`STRLEN`/`NUMOFCHAR`/`COUNT`/`FIND`), resultados de conversión de mayúsculas/minúsculas, y dos resultados de validación regex (patrón de teléfono contra la cadena placeholder `'Agregar cualquier teléfono'`, patrón de email contra `'Agregar cualquier correo'` — se espera que ambos placeholders impriman **inválido**, ya que no coinciden con el regex; es el propio contenido literal del fuente histórico, no un error).
8. **Evidencia requerida:** captura del output de la Consola ADT.
9. **Sanitización requerida:** ninguna — no se usa ningún teléfono/email real, solo las cadenas placeholder literales ya presentes en el fuente.
10. **Rollback/limpieza:** eliminar si está en un paquete desechable; la entrada de Text Elements se elimina junto con la clase.

## Lab 05 — `zcl_lab_05_invoice_fq` (histórica) y `zcl_lab_05_invoice_rt_fq` (runtime-ready)

1. **Objeto a crear:** la clase histórica tal cual; **además**, `zcl_employee_fixture_fq` y `zcl_lab_05_invoice_rt_fq` si se usa la ruta runtime-ready (recomendado, ya que no se espera que `ZEMP_LOGALI` exista en el sistema destino).
2. **Paquete:** el mismo que arriba; la clase fixture y ambas variantes del lab 05 deben vivir en el mismo paquete para que la llamada de método estático `=>` resuelva.
3. **Prerrequisitos:** ninguno para los 7 métodos no afectados de la clase histórica; la clase fixture debe crearse y activarse primero si se ejecuta la variante runtime-ready.
4. **Dependencias:** `zemp_logali` (histórica, solo método `demo_2_concat_lines_tab`) — se espera `NOT_AVAILABLE`; `zcl_employee_fixture_fq` (runtime-ready).
5. **Procedimiento de activación:** (a) crear+activar `zcl_employee_fixture_fq` desde `source/zcl_employee_fixture_fq.abap`; (b) crear+activar `zcl_lab_05_invoice_rt_fq` desde `source/zcl_lab_05_invoice_rt_fq.abap`; (c) opcionalmente también crear+activar la histórica `zcl_lab_05_invoice_fq` para confirmar que los *otros 7 métodos* se ejecutan igual (el método 2 lanzará un error/dump de "tabla no existe" si `ZEMP_LOGALI` realmente está ausente — esperado, no un defecto).
6. **Procedimiento de ejecución:** Run As → Console Application sobre la(s) clase(s) activadas.
7. **Comportamiento esperado:** 8 resultados numerados de operaciones de strings (`CONCAT`, `CONCATENATE LINES OF`, `CONDENSE`/`REPLACE`, `SPLIT`, `SHIFT`, `STRLEN`/`NUMOFCHAR`, `TRANSLATE`, inserción+`REVERSE`); en la variante runtime-ready, el output del método 2 mostrará las 4 filas sintéticas de la fixture concatenadas en una línea en vez de filas de `ZEMP_LOGALI`.
8. **Evidencia requerida:** captura del output de la Consola ADT para la ejecución runtime-ready (y, si se intenta, la ejecución histórica mostrando el fallo esperado del método 2 con los otros 7 métodos exitosos).
9. **Sanitización requerida:** ninguna — los datos de la fixture usan `example.invalid`, sin identificadores reales.
10. **Rollback/limpieza:** eliminar objetos desechables; conservar `zcl_employee_fixture_fq` si los labs 06/08 se ejecutarán en la misma sesión (la reutilizan).

## Lab 05a — `zcl_lab_05_invoice_fqa`

1. **Objeto a crear:** ninguno — fuente histórico tal cual.
2. **Paquete:** el mismo que arriba.
3. **Prerrequisitos:** ninguno.
4. **Dependencias:** ninguna — totalmente autocontenida.
5. **Procedimiento de activación:** crear clase global, pegar fuente, activar.
6. **Procedimiento de ejecución:** Run As → Console Application.
7. **Comportamiento esperado:** `OVERLAY`, `substring`/`substring_before`/`substring_after`, `FIND`+`count`, `REPLACE`, una validación de formato de email por regex contra el literal `learner@example.com` (se espera **válido** — coincide con el patrón), eliminación de ceros a la izquierda vía `REPLACE REGEX`, `repeat( )`, y tres formatos de `escape( )` (URL, JSON, string-template).
8. **Evidencia requerida:** captura del output de la Consola ADT.
9. **Sanitización requerida:** ninguna — `learner@example.com` es el propio literal sintético del fuente histórico (ver el comentario de cabecera propio de la clase), no una dirección real; no se imprime ningún otro dato sensible.
10. **Rollback/limpieza:** eliminar si está en un paquete desechable.

## Lab 06 — `zcl_lab_06_condition_fq` (bloqueada) y `zcl_lab_06_condition_rt_fq` (runtime-ready, ruta obligatoria)

1. **Objeto a crear:** `zcl_employee_fixture_fq` (si no se creó ya para lab 05) y `zcl_lab_06_condition_rt_fq`. La histórica `zcl_lab_06_condition_fq` **ni siquiera puede activarse** sin que exista `ZEMP_LOGALI` (referencia de tipo DDIC a nivel de clase), por lo que no se espera que sea utilizable para un intento de activación nuevo salvo que el propietario de la cuenta provisione `ZEMP_LOGALI` por separado.
2. **Paquete:** el mismo paquete que la clase fixture.
3. **Prerrequisitos:** `zcl_employee_fixture_fq` creada y activada primero.
4. **Dependencias:** `zcl_employee_fixture_fq` (ruta runtime-ready).
5. **Procedimiento de activación:** crear+activar `zcl_lab_06_condition_rt_fq` desde `source/zcl_lab_06_condition_rt_fq.abap`.
6. **Procedimiento de ejecución:** Run As → Console Application.
7. **Comportamiento esperado:** 9 demostraciones numeradas de estructuras de control (`IF`, `CASE`, `DO`, `CHECK`, `SWITCH`, `COND`, `WHILE`, un loop sobre las 4 filas de la fixture imprimiendo cada `email`, y una secuencia real de `TRY`/`CATCH cx_sy_zerodivide` a lo largo de 5 iteraciones donde la 5ª divide por cero y se captura).
8. **Evidencia requerida:** captura del output de la Consola ADT, incluyendo la línea de excepción capturada.
9. **Sanitización requerida:** ninguna — los emails de la fixture son `@example.invalid`.
10. **Rollback/limpieza:** eliminar objetos desechables; conservar la fixture si sigue el lab 08.

## Lab 07 — `zcl_lab_07_tables_fq`

1. **Objeto a crear:** ninguno — fuente histórico tal cual.
2. **Paquete:** el mismo que arriba.
3. **Prerrequisitos:** confirmar que `/dmo/connection` existe y devuelve filas para `carrier_id = 'LH'`, `connection_id > '0400'`, `distance_unit = 'KM'` (ver `DMO_DEPENDENCY_CHECK.es.md`).
4. **Dependencias:** `/dmo/connection`.
5. **Procedimiento de activación:** crear clase global, pegar fuente, activar.
6. **Procedimiento de ejecución:** Run As → Console Application.
7. **Comportamiento esperado:** 9 actividades numeradas de tablas internas usando los registros sintéticos propios de `ty_employee` (1–6) para las tres primeras, luego lecturas/`MOVE-CORRESPONDING`/`READ TABLE`/`line_exists`/`line_index` respaldadas por `/dmo/connection` para el resto.
8. **Evidencia requerida:** captura del output de la Consola ADT; si alguna sección dependiente de `/DMO/CONNECTION` devuelve un resultado vacío inesperadamente, capturar eso también (es información diagnóstica, no un fallo que ocultar).
9. **Sanitización requerida:** ninguna — los datos de empleados son los literales sintéticos propios de la clase (`employee1@example.invalid`, etc., ya declarados como "no empleados reales" en el propio comentario del fuente); los datos de `/DMO/CONNECTION` son datos de demostración estándar de SAP, no datos personales.
10. **Rollback/limpieza:** eliminar si está en un paquete desechable.

## Lab 07a — `zcl_lab_07_tables_fqa`

1. **Objeto a crear:** ninguno — fuente histórico tal cual.
2. **Paquete:** el mismo que arriba.
3. **Prerrequisitos:** confirmar que `/dmo/flight`, `/dmo/connection`, `/dmo/carrier` existen los tres y devuelven filas para los filtros usados (`carrier_id = 'SQ'`, `seats_max = 140`, `price BETWEEN 200 AND 400`, `airport_from_id = 'FRA'`) — ver `DMO_DEPENDENCY_CHECK.es.md`.
4. **Dependencias:** `/dmo/flight`, `/dmo/connection`, `/dmo/carrier`.
5. **Procedimiento de activación:** crear clase global, pegar fuente, activar.
6. **Procedimiento de ejecución:** Run As → Console Application.
7. **Comportamiento esperado:** 15 actividades numeradas (`A01`–`A15`) que cubren `FOR`, `FOR` anidado, `SELECT` multi-línea, `SORT`, `MODIFY`, `DELETE`, `CLEAR`/`FREE`, `COLLECT`, `LET`, `BASE`, tres variantes de `GROUP BY`, tablas `RANGE`, y valores `ENUM` — los conteos de filas exactos dependen de los datos `/DMO/*` en vivo en el sistema destino.
8. **Evidencia requerida:** captura del output de la Consola ADT para cada una de las 15 actividades (o una captura continua de scroll) **con la columna `iduser` del bloque `A01` recortada o redactada** — ver el ítem 9.
9. **Sanitización requerida:** **recorte/redacción obligatoria de la columna `iduser` de la tabla `A01 - LT_FLIGHTS`.** `add_flights_with_for( )` llama a `cl_abap_context_info=>get_user_technical_name( )` e incrusta el nombre de usuario técnico *actual y real* de quien ejecute esto en cada una de las 15 filas sintéticas que genera. Esto no está fijado en el fuente (así que el propio archivo fuente está limpio), pero cualquier **captura nueva** del output de este laboratorio contendrá un nombre de usuario técnico real, actual y potencialmente identificable a menos que esa columna se recorte o tache antes de guardar/publicar la evidencia.
10. **Rollback/limpieza:** eliminar si está en un paquete desechable.

## Lab 08 — `zcl_lab_08_fieldsymbols_fq` (bloqueada) y `zcl_lab_08_fieldsymbols_rt_fq` (runtime-ready, ruta obligatoria)

1. **Objeto a crear:** `zcl_employee_fixture_fq` (si no se creó ya) y `zcl_lab_08_fieldsymbols_rt_fq`. La clase histórica **no puede activarse** sin `ZEMP_LOGALI` (referencia de tipo DDIC del field symbol), igual que lab 06.
2. **Paquete:** el mismo paquete que la clase fixture.
3. **Prerrequisitos:** `zcl_employee_fixture_fq` creada y activada primero.
4. **Dependencias:** `zcl_employee_fixture_fq`.
5. **Procedimiento de activación:** crear+activar `zcl_lab_08_fieldsymbols_rt_fq` desde `source/zcl_lab_08_fieldsymbols_rt_fq.abap`.
6. **Procedimiento de ejecución:** Run As → Console Application.
7. **Comportamiento esperado:** reasignación de un field symbol escalar, actualización masiva de emails sobre las 4 filas de la fixture vía `LOOP ... ASSIGNING`, `APPEND ... ASSIGNING`, `INSERT ... ASSIGNING` en el índice 2, `READ TABLE ... ASSIGNING` + actualización de campo, y un cast de coerción de campo de fecha imprimiendo la fecha de hoy (vía `sy-datum` — ver la pregunta abierta de compatibilidad en `ABAP_CLOUD_COMPATIBILITY.es.md`; si ADT lo marca, es exactamente el tipo de hallazgo de runtime que este plan existe para sacar a la luz, no algo que deba evadirse silenciosamente).
8. **Evidencia requerida:** captura del output de la Consola ADT.
9. **Sanitización requerida:** ninguna — todos los datos son sintéticos de la fixture (`@example.invalid`) o la fecha de sistema actual, que no identifica tenant/cuenta por sí sola.
10. **Rollback/limpieza:** eliminar objetos desechables; la clase fixture puede eliminarse al final si ningún otro laboratorio la necesita.

---

## Qué promueve a un laboratorio a `CURRENT_RUNTIME_VERIFIED`

Según el Issue #36 y la Fase 10 de esta tarea: **nada en este documento promueve ningún laboratorio.** Un laboratorio solo puede proponerse para `CURRENT_RUNTIME_VERIFIED` después de que el propietario de la cuenta realmente haya ejecutado los pasos 5–8 anteriores en un sistema real y aportado la evidencia resultante (sanitizada según `RUNTIME_EVIDENCE_CHECKLIST.es.md`) de vuelta a esta revisión. Cada laboratorio se promueve individualmente — nunca en bloque — y solo como una **propuesta**, nunca como una edición directa de ningún claim publicado.
