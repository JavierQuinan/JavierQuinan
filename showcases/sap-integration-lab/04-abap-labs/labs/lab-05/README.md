# Lab 05 — String Operations (Part I)

[Versión en español](./README.es.md)

## Status

`HISTORICAL_EXECUTION_VERIFIED`

## Provenance

Curso 1 (Logali Group), Unit 6 — "Operaciones con cadenas de caracteres." Personal Word submission (`06 Laboratorio - Operaciones con cadenas de caracteres_Francisco Quinteros.docx`), authorship confirmed via `docProps/core.xml`. The embedded screenshot is the account owner's own Eclipse ADT capture.

## Object

[`ZCL_LAB_05_INVOICE_FQ`](../source/zcl_lab_05_invoice_fq.abap)

## What this demonstrates

`CONCATENATE`, `CONCATENATE LINES OF`, `CONDENSE`, `REPLACE`, `SPLIT`, `SHIFT`, `STRLEN`/`NUMOFCHAR`, `TRANSLATE`, string-template insertion, and `REVERSE`, executed as an ABAP Cloud console class. One method (`demo_2_concat_lines_tab`) reads the training-specific `ZEMP_LOGALI` table — see the [optional runtime-readiness reference](../../runtime-readiness/README.md) for a synthetic `_fq` replacement that removes this dependency.

## Evidence

![Eclipse ADT console output for zcl_lab_05_invoice_fq](./assets/01-eclipse-adt-console-output.png)

Eclipse ADT source and console output.

## Sanitization

One redaction applied: the `[2] CONCATENATE LINES OF` output line, which contained training-environment `ZEMP_LOGALI` record data (synthetic-looking names and email addresses supplied by the course, not the account owner's own data). All other content is unmodified.
