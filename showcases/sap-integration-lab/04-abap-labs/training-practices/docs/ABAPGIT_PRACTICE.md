# abapGit — Hands-on Practice

[Versión en español](./ABAPGIT_PRACTICE.es.md)

## Status

`USER_AUTHORED_PRACTICE` / `OWNER_CONFIRMED_HANDS_ON_EXECUTION` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` / `NO_CURRENT_RUNTIME_CLAIM`

## Provenance

Hands-on practice implemented by Francisco Quinteros during structured training (Logali Group, Curso 3 — abapGit module) and normalized for portfolio use. Personally created and executed in the account owner's own SAP trial environment: creating the class, creating a GitHub repository, and performing an abapGit stage/commit/push. This is **not** claimed as independently invented outside the training context — the class structure and test literals were specified by the course exercise itself; the account owner's own work was typing, activating, running it, and completing the abapGit workflow.

## Object

[`source/zcl_c3_01_projects_fq.abap`](../source/zcl_c3_01_projects_fq.abap) — a class with a `create_project` method demonstrating `IMPORTING`/`EXPORTING` parameter passing.

## What this demonstrates

Creating an ABAP Cloud class in Eclipse ADT, structuring a method with input/output parameters, and versioning it with abapGit against a GitHub repository.

## Normalization from the original exercise

The original exercise used a course-instance placeholder in the class name (a suffix meant to be replaced with the student's own SAP username fragment). The portfolio version renames the class to the `_fq` convention and removes an unused empty section from the class definition. The method's parameter-passing style (`IMPORTING`/`EXPORTING`) and the literal test values are unchanged, since parameter-passing direction was the exercise's own teaching point.

## Runtime status

`NO_CURRENT_RUNTIME_CLAIM`. The normalized, renamed copy in this repository has not itself been re-executed; execution refers to the original hands-on training practice confirmed by the account owner. Re-executing this specific renamed file is optional future work, not a requirement of this track.

## Dependencies

None beyond released ABAP Cloud APIs (`if_oo_adt_classrun`). No `/DMO/*` table, no external object.
