# Lab 06 — Control Structures

[Versión en español](./README.es.md)

## Status

`HISTORICAL_EXECUTION_VERIFIED`

## Provenance

Curso 1 (Logali Group), Unit 8 — "Estructuras de control." Personal Word submission (`08 Laboratorio - Estructuras de control_FRANCISCO QUINTEROS ANDRADE.docx`), authorship confirmed via `docProps/core.xml`. The embedded screenshots are the account owner's own Eclipse ADT captures.

## Object

[`ZCL_LAB_06_CONDITION_FQ`](../source/zcl_lab_06_condition_fq.abap)

## What this demonstrates

`IF`/`ENDIF`, `CASE`/`ENDCASE`, `DO`/`ENDDO`, `CHECK`, `SWITCH`, `COND`, `WHILE`/`ENDWHILE`, `LOOP`/`ENDLOOP`, and `TRY`/`ENDTRY` with a real exception (`CX_SY_ZERODIVIDE`), executed as an ABAP Cloud console class. This class uses the training-specific `ZEMP_LOGALI` table as a compile-time DDIC type — see the [optional runtime-readiness reference](../../runtime-readiness/README.md) for a synthetic `_fq` replacement that removes this dependency.

## Evidence

![Eclipse ADT project explorer and console output](./assets/01-eclipse-adt-project-explorer-and-console.png)

![Eclipse ADT console output continued](./assets/02-eclipse-adt-console-output-continued.png)

Eclipse ADT source and console output, split across two captures.

## Sanitization

Two redactions applied: (1) the Project Explorer's root connection node (private BTP trial account identifier) in the first capture; (2) four `LOOP AT` output lines showing training-environment `ZEMP_LOGALI` email addresses in the second capture. All other content is unmodified.
