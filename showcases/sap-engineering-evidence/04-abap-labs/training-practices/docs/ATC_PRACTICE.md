# ATC (ABAP Test Cockpit) — Hands-on Practice

[Versión en español](./ATC_PRACTICE.es.md)

## Status

`USER_AUTHORED_PRACTICE` / `OWNER_CONFIRMED_HANDS_ON_EXECUTION` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` / `NO_CURRENT_RUNTIME_CLAIM`

## Provenance

Hands-on practice implemented by Francisco Quinteros during structured training (Logali Group, Curso 3 — ATC module) and normalized for portfolio use. Personally created and executed in the account owner's own SAP trial environment: running an ATC check with the `ABAP_CLOUD_READINESS` variant, applying a `##NO_TEXT` pragma fix for a translatable-string finding, and creating a documented ATC exemption for a "no WHERE condition" finding with a stated justification. Not claimed as independently invented outside the training context — the class, the specific findings to produce, and the exemption exercise were specified by the course; the account owner's own work was running the full ATC workflow end to end.

## Object

[`source/zcl_c3_02_atc_demo_fq.abap`](../source/zcl_c3_02_atc_demo_fq.abap) — a class querying `/dmo/flight` without a `WHERE` clause, deliberately.

## What this demonstrates

Running an ATC check against a class, reading and triaging findings, applying a code-level fix (`##NO_TEXT` pragma) for one finding, and creating a formally justified exemption for another.

## Why the unfiltered query is intentional, not a defect

The `SELECT` with no `WHERE` clause is kept exactly as in the original exercise. This is the deliberate trigger for the "Table /DMO/FLIGHT: No WHERE condition" ATC finding that the exercise exists to have the student exempt with a documented false-positive justification — removing it would remove the exercise's own teaching point.

## Normalization from the original exercise

The original exercise used a course-instance placeholder in the class name. The portfolio version renames the class to the `_fq` convention and removes an unused empty section. The `SELECT` logic and the `##NO_TEXT` pragma fix are unchanged.

## Runtime status

`NO_CURRENT_RUNTIME_CLAIM`. The normalized, renamed copy in this repository has not itself been re-activated, re-run, or re-checked with ATC; execution and the original ATC findings/fix/exemption refer to the original hands-on training practice confirmed by the account owner. No `ATC_CLEAN`/current-ATC-result claim is made for the renamed copy.

## Dependencies

`/DMO/FLIGHT` (standard SAP Flight Reference Scenario demo table) — availability not yet re-confirmed in a current target system.
