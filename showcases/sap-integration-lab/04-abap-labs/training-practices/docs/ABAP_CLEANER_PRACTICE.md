# ABAP Cleaner — Hands-on Practice

[Versión en español](./ABAP_CLEANER_PRACTICE.es.md)

## Status

`USER_AUTHORED_PRACTICE` / `PORTFOLIO_NORMALIZED` / `NORMALIZED_NOT_EXECUTED` / `NEEDS_ADT_VERIFICATION`

## Provenance

Hands-on practice implemented by Francisco Quinteros during structured training (Logali Group, Curso 3 — ABAP Cleaner module) and normalized for portfolio use. Personally created and executed in the account owner's own SAP trial environment: configuring an ABAP Cleaner profile with a specific subset of rule categories (Empty Lines, Spaces, Syntax, Declarations, Pretty Printer, Alignment), running that profile against the class, and exporting the profile. Not claimed as independently invented outside the training context — the class structure was specified by the exercise as the "before" code to be cleaned up; the account owner's own work was configuring and running the ABAP Cleaner tool itself.

## Object

[`source/zcl_c3_03_cleaner_demo_fq.abap`](../source/zcl_c3_03_cleaner_demo_fq.abap) — the "before cleanup" class as specified by the exercise.

## What this demonstrates

Configuring an ABAP Cleaner profile with a selected rule-category subset and applying it to a class as a formatting/style cleanup pass.

## Normalization from the original exercise

The original exercise used a course-instance placeholder in the class name. The portfolio version renames the class to the `_fq` convention and removes an unused empty section. No "after cleanup" version is included, since no independently-verifiable post-cleanup source survived to transcribe — publishing only what can be confirmed avoids fabricating a diff.

## Runtime status

`NORMALIZED_NOT_EXECUTED`. This file has not been activated, run, or run through ABAP Cleaner in this form. `NEEDS_ADT_VERIFICATION` before any current-runtime claim, and before any "after cleanup" version is added.

## Dependencies

`/DMO/FLIGHT` (standard SAP Flight Reference Scenario demo table) — availability not yet re-confirmed in a current target system.
