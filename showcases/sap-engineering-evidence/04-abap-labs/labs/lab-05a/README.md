# Lab 05a — String Operations (Part II)

[Versión en español](./README.es.md)

## Status

`HISTORICAL_EXECUTION_VERIFIED`

## Provenance

Curso 1 (Logali Group), Unit 7 — "Operaciones con cadenas de caracteres II." Personal Word submission (`07 Laboratorio - Operaciones con cadenas de caracteres II_FRANCISCO QUINTEROS.docx`), authorship confirmed via `docProps/core.xml`. The embedded screenshot is the account owner's own Eclipse ADT capture.

## Object

[`ZCL_LAB_05_INVOICE_FQA`](../source/zcl_lab_05_invoice_fqa.abap)

## What this demonstrates

`OVERLAY`, `substring`/`substring_before`/`substring_after`, `FIND` with offset, `REPLACE`, regex validation, `REPLACE REGEX` (leading-zero stripping), `repeat( )`, and `escape( )` (URL/JSON/string-template formats), executed as an ABAP Cloud console class. Fully self-contained — no external table or object dependency.

## Evidence

![Eclipse ADT console output for zcl_lab_05_invoice_fqa](./assets/01-eclipse-adt-console-output.png)

Eclipse ADT source and console output.

## Sanitization

One redaction applied: a "Valid email: ..." console line showing a training-environment-specific address (`@logali.com` domain) generated at runtime, distinct from the historical source's own literal (`learner@example.com`, itself a synthetic value — not redacted, since it is not a real address). All other content is unmodified.
