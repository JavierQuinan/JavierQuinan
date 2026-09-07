# Authorizations — Hands-on Practice

[Versión en español](./AUTHORIZATIONS_PRACTICE.es.md)

## Status

`USER_AUTHORED_PRACTICE` / `PORTFOLIO_NORMALIZED` / `NORMALIZED_NOT_EXECUTED` / `NEEDS_ADT_VERIFICATION`

## Provenance

Hands-on practice implemented by Francisco Quinteros during structured training (Logali Group, Curso 3 — Authorizations module) and normalized for portfolio use. Personally created in the account owner's own SAP trial environment: a data element, an authorization field, an authorization object, and this class performing an `AUTHORITY-CHECK`-gated query. Not claimed as independently invented outside the training context — the exercise specified the object relationships and the check/query logic; the account owner's own work was creating these DDIC/ABAP objects end to end and wiring them together correctly.

## Object

[`source/zcl_c3_04_dept_auth_fq.abap`](../source/zcl_c3_04_dept_auth_fq.abap) — queries `/dmo/airport` only if the `AUTHORITY-CHECK` succeeds.

## Required ADT-created DDIC objects (documented, not fabricated as source files)

Dictionary domains, data elements, and authorization fields/objects are created through ADT wizards, not written as class-style source text. This class depends on three such objects, none of which have their own `.abap` file:

| Object | Type | Name used |
|---|---|---|
| Data element | Field type | `zde_dept_fq` |
| Authorization field | `AUTHORITY-CHECK ... ID` | `ZAFDEPTFQ` |
| Authorization object | `AUTHORITY-CHECK ... OBJECT` | `ZAODEPTFQ` |

The authorization field and object names use a short, unsuffixed style (9 characters each) rather than the class's `_fq` underscore convention — SAP authorization objects and fields are limited to 10 characters, which the underscore-suffixed convention would exceed.

These three objects, plus assignment of the authorization object/field to the executing user's authorization profile (an environment/role-assignment step, not a code dependency), must exist before this class can activate and its `AUTHORITY-CHECK` branch can succeed.

## What this demonstrates

Building a complete authorization chain in ABAP Cloud: a data element backing an authorization field, an authorization object using that field, and an `AUTHORITY-CHECK` statement gating a database query in application code.

## Normalization from the original exercise

The original exercise used a course-instance placeholder in the class name and in the intended DDIC object names. The portfolio version renames the class to the `_fq` convention, renames the data element to the already-documented `zde_<topic>_fq` pattern, and gives the authorization field/object new short names consistent with the same 10-character constraint the original exercise's own extracted code already worked around. The `AUTHORITY-CHECK`/query logic is unchanged.

## Runtime status

`NORMALIZED_NOT_EXECUTED`. This class and its DDIC prerequisites have not been created or activated in this form. `NEEDS_ADT_VERIFICATION` before any current-runtime claim.

## Dependencies

`/DMO/AIRPORT` (standard SAP Flight Reference Scenario demo table) — availability not yet re-confirmed in a current target system, plus the three DDIC objects above and their role assignment.
