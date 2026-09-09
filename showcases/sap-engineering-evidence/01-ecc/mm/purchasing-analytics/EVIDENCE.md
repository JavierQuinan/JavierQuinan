# Evidence Record — `ZMM_PURCH_ANALYTICS`

> **Evidence classification:** `REVIEWABLE_SOURCE / STATIC_SCENARIO_VALIDATION / REPRODUCIBLE_BUILD_GUIDE`

## Reviewable source

The public source pack contains:

- `ZCX_MM_PURCH_NOT_FOUND`
- `ZIF_MM_PURCH_SOURCE`
- `ZCL_MM_PURCH_SOURCE_DEMO`
- `ZCL_MM_PURCH_SOURCE_ECC`
- `ZCL_MM_PURCH_ANALYTICS_SERVICE`
- local ABAP Unit classes
- `ZMM_PURCH_ANALYTICS_REPORT`

## Standard read-only model

The ECC datasource is limited to:

- `EBAN` — Purchase Requisition item and optional downstream PO reference
- `EKKO` — PO header context
- `EKPO` — PO item context and deletion indicator
- `EKET` — schedule-line delivery-date context

The downstream header is accepted as a Purchase Order only when `EKKO-BSTYP = 'F'`.

No purchase-document creation/change API is used.

## Static scenario validation

```text
Scenarios reviewed: 7
Consistent:        7
Mismatches:        0
```

Covered diagnostics:

1. `PR_ONLY`
2. `REFERENCE_GAP`
3. `PO_WITHOUT_SCHEDULE`
4. `PO_WITH_SCHEDULE`
5. `PR_DELETED`
6. `PO_ITEM_DELETED`
7. synthetic demo-source roundtrip

A Purchase Requisition without a downstream PO is deliberately represented as `PR_ONLY`, not as an automatic error.

## Integrity controls

- no `UPDATE`
- no `INSERT`
- no database `MODIFY`
- no `DELETE`
- no BAPI document creation/change
- no `BAPI_TRANSACTION_COMMIT`
- no employer/customer source copied
- no real PR/PO/vendor/material values published

## Reproducible verification procedure

The build guide documents the object sequence, syntax/activation checkpoints, ABAP Unit execution, `SE38` report execution and `SE93` report-transaction configuration. Any runtime result must be recorded only when actually observed and with enterprise identifiers removed.

## Evidence boundary

The repository demonstrates the ECC data model, source architecture, diagnostic logic, deterministic scenarios and construction procedure. It does **not** represent SAP activation or ABAP Unit execution inside a specific enterprise system as completed evidence.
