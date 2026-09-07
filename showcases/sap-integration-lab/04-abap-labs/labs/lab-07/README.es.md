# Lab 07 — Tablas Internas (Parte I)

[English version](./README.md)

## Estado

`HISTORICAL_EXECUTION_VERIFIED`

## Procedencia

Curso 1 (Logali Group), Unidad 10 — "Tablas Internas Parte I." Entrega personal en Word (`FRANCISCO JAVIER QUINTEROS ANDRADE.docx`), autoría confirmada vía `docProps/core.xml`. Las capturas embebidas son las propias capturas de Eclipse ADT del propietario.

## Objeto

[`ZCL_LAB_07_TABLES_FQ`](../source/zcl_lab_07_tables_fq.abap)

## Qué demuestra esto

Constructor `VALUE`, `INSERT INTO TABLE`, `APPEND` (simple/`VALUE`/`LINES OF`), `MOVE-CORRESPONDING`, `READ TABLE` (índice/clave), `line_exists( )`, y `line_index( )`, contra los registros de empleados sintéticos propios de la clase y la tabla de demostración estándar del SAP Flight Reference Scenario `/DMO/CONNECTION`, ejecutado como una clase de consola ABAP Cloud. Autocontenida — sin dependencia de tabla específica de curso.

## Evidencia

![Salida de consola de Eclipse ADT parte 1](./assets/01-eclipse-adt-console-output-part1.png)

![Salida de consola de Eclipse ADT parte 2](./assets/02-eclipse-adt-console-output-part2.png)

![Salida de consola de Eclipse ADT parte 3](./assets/03-eclipse-adt-console-output-part3.png)

Source y salida de consola de Eclipse ADT, dividido en tres capturas.

## Sanitización

Una redacción aplicada: la columna `EMAIL` en las tablas de salida "Add records" / "Insert record" / "Append records" de la primera captura, que mostraba direcciones con dominio `@logali.com` del entorno de formación (los propios literales sintéticos de empleado del fuente histórico — el archivo `.abap` publicado ya usa el dominio sanitizado `@example.invalid` para estos mismos valores). Las tablas de datos demo de `/DMO/CONNECTION` en la segunda y tercera captura no requirieron cambios.
