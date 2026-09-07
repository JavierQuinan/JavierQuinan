# ABAP Cloud Dictionary Guide

[Versión en español](./ABAP_CLOUD_DICTIONARY_GUIDE.es.md)

## Status

`TRAINING_DERIVED_GUIDE` — independently written from completed third-party training. No own DDIC object is claimed as built or activated in this historical lab set.

## Scope

Conceptual overview of domains, data elements, database tables, structures, lock objects and table relationships, with ABAP Cloud-specific caveats called out explicitly.

## Core concepts

- **Domain:** technical value definition such as type, length, decimals and optional fixed values.
- **Data element:** semantic reusable type information layered on top of a domain or built-in type.
- **Database table:** persistent repository object with fields and a key.
- **Structure:** reusable non-persistent structured type.
- **Foreign-key relationship:** relationship metadata between fields/tables; exact runtime/value-help effects depend on the consuming technology.
- **Lock object:** repository object defining logical lock parameters for SAP enqueue processing.

## Locking: classic ABAP vs. ABAP Cloud

Activating a lock object generates `ENQUEUE_*` / `DEQUEUE_*` function modules in classic ABAP. In ABAP Cloud developer extensibility, direct use of those generated function modules is not permitted; SAP documents the generic lock API based on `CL_ABAP_LOCK_OBJECT_FACTORY` / `IF_ABAP_LOCK_OBJECT` for supported scenarios.

This distinction matters: a guide labeled "ABAP Cloud" should not instruct developers to call generated enqueue/dequeue function modules directly.

## Illustrative design — not built

| Object | Example name | Purpose |
|---|---|---|
| Domain | `ZDO_ORDER_STATUS_FQ` | Two-character order status |
| Data element | `ZDE_ORDER_STATUS_FQ` | Semantic order-status type |
| Database table | `ZTORDER_FQ` | Synthetic service-order persistence |
| Lock object | `EZTORDER_FQ` | Logical lock definition for the order key |

These are design examples only. No object with these names is claimed as created or activated.

## Procedure for a future lab

1. Create the type/domain objects required by the scenario.
2. Create a small synthetic persistence table using only public/safe data.
3. Activate and verify the table definition.
4. Add a lock object only if concurrent-update protection is part of the scenario.
5. In an ABAP Cloud-compatible implementation, use the supported generic lock API rather than direct generated function-module calls.
6. Add current runtime evidence and, where practical, ABAP Unit around the service logic.

## Common failure modes

- Changing a persisted type without considering existing data.
- Treating buffering/caching as a universal performance fix.
- Assuming a Dictionary relationship automatically enforces every business authorization rule.
- Mixing classic enqueue-call patterns into code presented as ABAP Cloud.

## Clean Core

Persistence can remain private to an owning package while consumers use released service/API surfaces. Direct table access across unrelated components should not be presented as a Clean Core integration boundary.

## Provenance

Concepts were studied during third-party training. The wording, structure and illustrative design were independently created for this portfolio.

## Evidence status

`TRAINING_ONLY_IN_THIS_TRACK` — Course 2 hands-on training occurred, but no saved source artifact exists to normalize or publish; see [Course 3 Training Practices — Evidence Matrix](../training-practices/EVIDENCE_MATRIX.md) for how this is disclosed.

## Official reference

- SAP Help — Lock Objects / developer extensibility: https://help.sap.com/docs/SAP_S4HANA_CLOUD/6aa39f1ac05441e5a23f484f31e477e7/06d03eda843643b7a64acfb67edf521b.html
