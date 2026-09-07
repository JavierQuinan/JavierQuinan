# Lab 08 — Field Symbols

[English version](./README.md)

## Estado

`HISTORICAL_EXECUTION_VERIFIED`

## Procedencia

Curso 1 (Logali Group), Unidad 13 — "Field Symbol - Punteros." Entrega personal en Word (`Francisco Quinteros Andrade.docx`), autoría confirmada vía `docProps/core.xml`. La captura embebida es la propia captura de Eclipse ADT del propietario.

## Objeto

[`ZCL_LAB_08_FIELDSYMBOLS_FQ`](../source/zcl_lab_08_fieldsymbols_fq.abap)

## Qué demuestra

`ASSIGN` a una variable, `ASSIGN` a una línea de tabla dentro de un loop, `APPEND`/`INSERT ... ASSIGNING`, `READ TABLE ... ASSIGNING` y un cast de coerción de campo de fecha, ejecutado como una clase de consola ABAP Cloud en la práctica histórica documentada. La clase usa la tabla `ZEMP_LOGALI` específica del curso como tipo de field symbol en tiempo de compilación; esa dependencia forma parte del contexto histórico preservado del source.

## Evidencia

![Salida de consola de Eclipse ADT para zcl_lab_08_fieldsymbols_fq](./assets/01-eclipse-adt-console-output.png)

Source y salida de consola de Eclipse ADT.

## Sanitización

Dos redacciones aplicadas: (1) la barra de estado de conexión de ADT (identificador privado de cuenta trial de BTP y fragmento de hostname del tenant); (2) una línea de código fuente que asigna un literal de email específico del entorno de formación (un dominio de apariencia real de terceros usado solo como dato de ejercicio, no datos propios del propietario ni un dominio reproducido de otra forma en el source `.abap` publicado). El resto del contenido, incluyendo la salida de consola, no fue modificado.
