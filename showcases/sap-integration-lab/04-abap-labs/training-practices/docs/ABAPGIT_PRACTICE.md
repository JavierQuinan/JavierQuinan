# abapGit — Hands-on Practice

[Versión en español](./ABAPGIT_PRACTICE.es.md)

## Status

`USER_AUTHORED_PRACTICE` / `PORTFOLIO_NORMALIZED` / `NORMALIZED_NOT_EXECUTED` / `NEEDS_ADT_VERIFICATION`

## Provenance

Hands-on practice implemented by Francisco Quinteros during structured training (Logali Group, Curso 3 — abapGit module) and normalized for portfolio use. Personally created and executed in the account owner's own SAP trial environment: creating the class, creating a GitHub repository, and performing an abapGit stage/commit/push. This is **not** claimed as independently invented outside the training context — the class structure and test literals were specified by the course exercise itself; the account owner's own work was typing, activating, running it, and completing the abapGit workflow.

## Object

[`source/zcl_c3_01_projects_fq.abap`](../source/zcl_c3_01_projects_fq.abap) — a class with a `create_project` method demonstrating `IMPORTING`/`EXPORTING` parameter passing.

## What this demonstrates

Creating an ABAP Cloud class in Eclipse ADT, structuring a method with input/output parameters, and versioning it with abapGit against a GitHub repository.

## Normalization from the original exercise

The original exercise used a course-instance placeholder in the class name (a suffix meant to be replaced with the student's own SAP username fragment). The portfolio version renames the class to the `_fq` convention and removes an unused empty section from the class definition. The method's parameter-passing style (`IMPORTING`/`EXPORTING`) and the literal test values are unchanged, since parameter-passing direction was the exercise's own teaching point.

## Runtime status

`NORMALIZED_NOT_EXECUTED`. This file has not been activated or run in this form. `NEEDS_ADT_VERIFICATION` before any current-runtime claim.

## Dependencies

None beyond released ABAP Cloud APIs (`if_oo_adt_classrun`). No `/DMO/*` table, no external object.
