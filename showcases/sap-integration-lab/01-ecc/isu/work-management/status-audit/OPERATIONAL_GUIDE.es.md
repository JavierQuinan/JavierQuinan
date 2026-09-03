# GUÍA TÉCNICA INTERNA

## Revisión de estados de órdenes de trabajo en SAP

*Procedimiento técnico avanzado: estados activos, históricos, perfiles, change documents y trazabilidad de transacciones Z*

| Responsable | Ámbito | Referencia |
|---|---|---|
| Francisco Quinteros Andrade | SAP IS-U / WM / Soporte funcional | Caso OT 44335134, 57079534 y 57793788 |

# 1. Objetivo

Establecer un procedimiento reproducible para comprobar el estado real de una orden de trabajo (OT), diferenciar estados activos de registros históricos y determinar si una discrepancia proviene del objeto estándar de la orden o de la lógica de una transacción desarrollada a medida.

# 2. Alcance y criterio de seguridad

La revisión se ejecuta exclusivamente con acceso de consulta autorizado. La evidencia técnica se conserva en el análisis interno; el ticket visible para usuarios finales debe comunicar el resultado funcional sin detallar objetos técnicos, nombres de tablas ni rutas de acceso administrativo.

- No actualizar estados directamente mediante herramientas de consulta.
- No eliminar registros históricos ni alterar indicadores de actividad.
- Toda corrección debe ejecutarse mediante el proceso funcional, programa autorizado o transporte correspondiente.

# 3. Transacciones y objetos técnicos utilizados

| Tx. / objeto | Finalidad técnica |
|---|---|
| IW33 | Visualizar la OT y contrastar cabecera, status overview, datos de control y cierre técnico. |
| IW32 | Solo para análisis funcional autorizado o ejecución controlada del proceso; no usar para forzar estados sin causa validada. |
| SE16N | Consulta controlada de AUFK, JEST, JSTO, JCDS, TJ02T y TJ30T. |
| SE93 | Identificar el programa, dynpro, clase o reporte asociado a ZCNR. |
| SE38 / SE80 | Inspeccionar el código ABAP y localizar SELECT, llamadas de status y acceso a tablas Z. |
| ST05 | SQL Trace para determinar qué objetos consulta ZCNR y con qué condiciones. |
| SAT | Runtime Analysis para seguir el flujo ABAP, módulos de función, métodos y tiempos de ejecución. |
| SU53 | Comprobar fallos de autorización si una consulta o función no devuelve el resultado esperado. |

# 4. Modelo técnico de estados

La cabecera de la orden no almacena el texto actual del estado como dato aislado. AUFK proporciona el OBJNR; dicho objeto enlaza con la gestión central de estados. La vigencia se determina en JEST y el historial de cambios en JCDS. Los textos dependen del tipo de estado y del idioma.

| Objeto | Clave / relación | Uso |
|---|---|---|
| AUFK | AUFNR → OBJNR | Cabecera de la orden y punto de entrada al objeto de status. |
| AFIH | AUFNR | Datos de cabecera PM de la orden; útil para ampliar el análisis funcional. |
| JEST | OBJNR + STAT | Estados de sistema y usuario; INACT define la vigencia. |
| JSTO | OBJNR | Información de control del objeto y perfil de estados STSMA. |
| TJ02T | ISTAT + SPRAS | Texto corto y largo de estados de sistema Ixxxx. |
| TJ30T | STSMA + ESTAT + SPRAS | Texto corto y largo de estados de usuario Exxxx. |
| JCDS | OBJNR + STAT + CHGNR | Change documents: activación/desactivación, usuario, fecha, hora y transacción. |

Relación principal: AUFK-AUFNR identifica la OT; AUFK-OBJNR se utiliza en JEST, JSTO y JCDS. Para estados de usuario, JSTO-STSMA debe acompañar a JEST-STAT al consultar TJ30T. Comparar únicamente E0007 o E0010 sin el perfil STSMA puede producir una interpretación incorrecta, porque el mismo código interno puede tener significado distinto en otro perfil.

# 5. Datos mínimos requeridos

| Dato | Uso |
|---|---|
| Número de OT | Identificar la orden reportada y normalizar el valor con ceros a la izquierda. |
| Instalación / cuenta contrato | Relacionar órdenes históricas que puedan afectar la selección de una transacción Z. |
| Estado mostrado | Registrar la diferencia: TRAT, CTEC, CERR u otro. |
| Transacción afectada | Determinar si la discrepancia aparece en el objeto estándar o únicamente en una interfaz Z. |

# 6. Procedimiento técnico paso a paso

1. **Validación funcional inicial en IW33.** Ingresar la OT, abrir el resumen de estados y registrar el status actual. Contrastar el cierre técnico, fechas, clase de orden, centro, emplazamiento y cualquier status de usuario visible. Esta revisión sirve como baseline antes de consultar objetos técnicos.
2. **Identificar la cabecera de la orden.** En SE16N consultar AUFK por AUFNR, completando ceros a la izquierda cuando aplique. Obtener OBJNR y revisar AUART, ERDAT, AENAM, LOEKZ, PHAS0–PHAS3 y demás campos relevantes para el proceso.
3. **Normalizar el objeto técnico.** Para órdenes, el OBJNR suele presentarse con el prefijo OR y el número completado con ceros. No debe construirse manualmente si ya está disponible en la cabecera.
4. **Consultar todos los estados asociados.** En SE16N consultar JEST por OBJNR y visualizar STAT, INACT y CHGNR. Ejecutar primero INACT vacío para obtener los estados vigentes. Después retirar el filtro para contrastar activos e históricos.
5. **Separar estados activos e históricos.** INACT vacío significa estado activo; INACT = X significa registro inactivo o histórico. Un estado histórico no debe interpretarse como vigente.
6. **Resolver el texto del estado.** Para STAT Ixxxx consultar TJ02T por ISTAT y SPRAS = S. Para STAT Exxxx consultar primero JSTO por OBJNR, obtener STSMA y luego consultar TJ30T por STSMA, ESTAT y SPRAS = S.
7. **Revisar la secuencia de cambios.** En SE16N consultar JCDS por OBJNR y ordenar UDATE, UTIME y CHGNR de forma descendente. Revisar STAT, INACT, USNAM y TCODE para identificar qué usuario, job, workflow o transacción activó o desactivó el estado.
8. **Comparar con la transacción reportada.** Si el estado real es correcto, pero una transacción Z continúa mostrando TRAT, revisar la lógica de selección, registros históricos, órdenes anteriores relacionadas y fuentes propias de la interfaz.

# 7. Interpretación de campos y reglas

| Campo / código | Interpretación operativa |
|---|---|
| OBJNR | Identificador técnico del objeto de estado de la orden. |
| STAT = I… | Estado de sistema. |
| STAT = E… | Estado de usuario dependiente del perfil de estados. |
| INACT vacío | Estado vigente. |
| INACT = X | Estado desactivado; permanece como antecedente histórico. |
| CHGNR | Número de modificación que ayuda a reconstruir la secuencia. |
| I0045 | Cierre técnico (CTEC/TECO). |

# 8. Caso práctico validado

En el caso analizado se revisaron las OT 44335134, 57079534 y 57793788. Los objetos técnicos identificados fueron:

| OT | OBJNR |
|---|---|
| 44335134 | OR000044335134 |
| 57079534 | OR000057079534 |
| 57793788 | OR000057793788 |

La comparación mostró el mismo patrón vigente en las tres órdenes:

| Validación | Resultado |
|---|---|
| Estado de usuario E0007 | Activo en las tres órdenes. |
| Estado de usuario E0010 | Inactivo en las tres órdenes. |
| Estado de sistema I0045 | Activo: cierre técnico confirmado. |
| Estados I0001, I0002, I0118 e I0485 | Inactivos; corresponden a antecedentes y no al estado actual. |
| Estado E0005 | Solo presente como inactivo en la OT 44335134; no genera inconsistencia vigente. |

# 9. Consultas técnicas reproducibles

Selección lógica equivalente para obtener estados activos. El ejemplo es de diagnóstico y debe ejecutarse en un entorno autorizado:

```abap
SELECT objnr, stat, inact, chgnr
 FROM jest
 WHERE objnr IN @s_objnr
 AND inact = @space
 INTO TABLE @DATA(lt_active_status).
```

Lectura del perfil de estados y texto de usuario:

```abap
SELECT SINGLE stsma FROM jsto
 WHERE objnr = @lv_objnr
 INTO @DATA(lv_stsma).

SELECT SINGLE txt04, txt30 FROM tj30t
 WHERE stsma = @lv_stsma
 AND estat = @lv_estat
 AND spras = @sy-langu
 INTO @DATA(ls_user_status_text).
```

Para lectura estándar desde ABAP, priorizar APIs de status cuando la finalidad sea lógica de aplicación. Funciones habituales: STATUS_READ para recuperar estados y STATUS_TEXT_EDIT para componer su representación textual. Antes de usarlas en desarrollo productivo, validar firma, parámetros y comportamiento en la release ECC instalada.

# 10. Conclusión del caso

No se evidenció inconsistencia en el estado real de las órdenes. Las tres mantienen cierre técnico activo y el estado de tratamiento analizado no se encuentra vigente. La persistencia de TRAT en ZCNR debe investigarse en la lógica de procesamiento de esa transacción, en la selección de antecedentes o en una fuente propia de la interfaz.

# 11. Diagnóstico avanzado de ZCNR

- Confirmar si la lógica considera únicamente estados vigentes o también registros inactivos.
- Verificar si selecciona órdenes históricas asociadas a la misma instalación o cuenta contrato.
- Determinar si TRAT proviene de un objeto de seguimiento distinto a la OT.
- Revisar si existe información pendiente de sincronización o reproceso en la interfaz.
- Si se requiere análisis ABAP, identificar el programa desde SE93 y ejecutar trace o debugging controlado con un caso reproducible.

Secuencia recomendada para aislar la fuente:

9. **SE93.** Resolver el objeto ejecutable de ZCNR y documentar programa, clase o grupo de funciones.
10. **SE80/SE38.** Buscar accesos a JEST, JSTO, JCDS, tablas Z, vistas, RFC, proxies y módulos STATUS_READ/STATUS_TEXT_EDIT.
11. **ST05.** Activar SQL Trace para el usuario de prueba, reproducir una única consulta en ZCNR, detener el trace y filtrar por programa y objetos accedidos.
12. **SAT.** Si la selección no queda clara con ST05, ejecutar Runtime Analysis para identificar el flujo, métodos y llamadas que determinan TRAT.
13. **Comparación.** Contrastar la OT actual con las órdenes históricas de la misma instalación/cuenta contrato y verificar si falta filtrar INACT, fecha, secuencia o estado final.

# 12. Matriz de diagnóstico

| Hallazgo | Interpretación | Acción |
|---|---|---|
| TRAT activo en JEST | El estado sí está vigente en el objeto estándar. | Revisar proceso funcional que debía desactivarlo y change documents. |
| TRAT inactivo en JEST; ZCNR lo muestra | Probable lectura sin filtro INACT o selección histórica. | Corregir condición de lectura en el desarrollo Z. |
| TRAT no existe en JEST | La interfaz deriva el valor de otra fuente. | Trazar tablas Z, RFC, proxy, workflow o lógica calculada. |
| I0045 activo y TRAT inactivo | Orden con cierre técnico consistente. | Escalar únicamente la visualización/procesamiento de ZCNR. |
| Resultados distintos por usuario | Posible variante, autorización, buffer o ámbito organizativo. | Comparar variantes, SU53, parámetros y trace por usuario. |

# 13. Texto recomendado para el ticket

Se realizó la validación técnica de los estados activos e históricos de las órdenes reportadas, confirmando que todas mantienen el cierre técnico y no presentan estados pendientes de tratamiento.

Estimado Carlitos, por favor, su ayuda revisando la lógica de procesamiento de la Tx. ZCNR, debido a que la interfaz continúa mostrando una inconsistencia asociada a una orden en estado TRAT, pese a que dicho estado ya no se encuentra vigente.

# 14. Checklist técnico de cierre

- OT y OBJNR verificados.
- Estados vigentes revisados con INACT vacío.
- Estados históricos diferenciados de los activos.
- Texto de estados de usuario validado contra el perfil correspondiente.
- Cierre técnico confirmado.
- Historial revisado cuando fue necesario.
- Diferencia entre estado real y visualización Z documentada.
- Respuesta al usuario final redactada sin exponer objetos técnicos internos.

*Fin de la guía*
