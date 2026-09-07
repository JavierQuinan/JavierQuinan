# abapGit — Hands-on Practice

[Versión en español](./ABAPGIT_PRACTICE.es.md)

## Status

`USER_AUTHORED_PRACTICE` / `OWNER_CONFIRMED_HANDS_ON_EXECUTION` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` / `NO_CURRENT_RUNTIME_CLAIM`

## Provenance

Hands-on practice implemented by Francisco Quinteros during structured training (Logali Group, Curso 3 — abapGit module) and normalized for portfolio use. The account owner confirms personally creating and executing the practice in a SAP trial environment: creating the class, creating a GitHub repository, and performing an abapGit stage/commit/push. This is **not** claimed as independently invented outside the training context; the class structure and test literals came from the course exercise, while the hands-on implementation and workflow execution were performed by the account owner.

## Object

[`source/zcl_c3_01_projects_fq.abap`](../source/zcl_c3_01_projects_fq.abap) — a class with a `create_project` method demonstrating `IMPORTING`/`EXPORTING` parameter passing.

## What this demonstrates

Creating an ABAP Cloud class in Eclipse ADT, structuring a method with input/output parameters, and versioning it with abapGit against a GitHub repository.

## Portfolio normalization

The original exercise used a course-instance placeholder in the class name. The public portfolio copy uses the `_fq` convention and removes an unused empty section from the class definition. The exercise's parameter-passing structure and literal test values are preserved because they are part of the training context disclosed above.

## Runtime boundary

The execution claim refers to the original hands-on training practice confirmed by the account owner. The normalized public copy is presented as source evidence and carries no separate current-runtime claim.

## Dependencies

None beyond released ABAP Cloud APIs (`if_oo_adt_classrun`). No `/DMO/*` table and no external object.
