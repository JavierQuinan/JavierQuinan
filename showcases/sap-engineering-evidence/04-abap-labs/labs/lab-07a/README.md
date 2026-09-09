# Lab 07a — Internal Tables (Part II, Advanced)

[Versión en español](./README.es.md)

## Status

`HISTORICAL_EXECUTION_VERIFIED`

## Provenance

Curso 1 (Logali Group), Unit 11 — "Tablas Internas Parte II." Personal Word submission (`LAB_11_FRANCISCO QUINTEROS.docx`), authorship confirmed via `docProps/core.xml`. The embedded screenshots are the account owner's own Eclipse ADT captures.

## Object

[`ZCL_LAB_07_TABLES_FQA`](../source/zcl_lab_07_tables_fqa.abap)

## What this demonstrates

15 numbered activities against the standard SAP Flight Reference Scenario demo tables (`/DMO/FLIGHT`, `/DMO/CONNECTION`, `/DMO/CARRIER`): `FOR` expressions, nested `FOR`, multi-line `SELECT`, `SORT`, `MODIFY`, `DELETE`, `CLEAR`/`FREE`, `COLLECT`, `LET`, `BASE`, three `GROUP BY` variants, `RANGE` tables, and `ENUM` types — executed as an ABAP Cloud console class.

## Evidence

![Eclipse ADT console output part 1](./assets/01-eclipse-adt-console-output-part1.png)

![Eclipse ADT console output part 2](./assets/02-eclipse-adt-console-output-part2.png)

![Eclipse ADT console output part 3](./assets/03-eclipse-adt-console-output-part3.png)

![Eclipse ADT console output part 4](./assets/04-eclipse-adt-console-output-part4.png)

![Eclipse ADT console output part 5](./assets/05-eclipse-adt-console-output-part5.png)

![Eclipse ADT console output part 6](./assets/06-eclipse-adt-console-output-part6.png)

![Eclipse ADT console output part 7](./assets/07-eclipse-adt-console-output-part7.png)

Eclipse ADT source and console output, split across seven captures, covering all 15 activities (`A01`–`A15`).

## Sanitization

One redaction applied, across the first two captures: the `IDUSER` column of the `A01 - LT_FLIGHTS`/`LT_FLIGHTS_INFO` output tables. `add_flights_with_for( )` calls `cl_abap_context_info=>get_user_technical_name( )` and embeds the account owner's real technical SAP username (concatenated with a private BTP trial account identifier) into that column at runtime — this value is not hardcoded in the source, but the resulting screenshot is real, current, personally-identifying data and has been redacted. All other columns and captures are unmodified.
