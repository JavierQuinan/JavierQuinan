# Evidence Record — `ZMM_PURCH_ANALYTICS`

> **Current maturity:** `SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

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

No purchase-document creation/change API is used.

## Static validation

Prepared deterministic vectors: **7**.

```text
Vectors reviewed: 7
Consistent:       7
Mismatches:       0
```

Covered diagnostics:

1. `PR_ONLY`
2. `REFERENCE_GAP`
3. `PO_WITHOUT_SCHEDULE`
4. `PO_WITH_SCHEDULE`
5. `PR_DELETED`
6. `PO_ITEM_DELETED`
7. synthetic demo-source roundtrip

This is source/static evidence, not executed ABAP Unit runtime.

## Integrity controls

- no `UPDATE`
- no `INSERT`
- no database `MODIFY`
- no `DELETE`
- no BAPI document creation/change
- no `BAPI_TRANSACTION_COMMIT`
- no employer/customer source copied
- no real PR/PO/vendor/material values published

## Runtime promotion gate

Future promotion requires an authorized SAP ECC DEV/sandbox and recorded sanitized evidence for:

- syntax checks
- object activation
- ABAP Unit execution
- `SE38` report execution
- `SE93` transaction execution
- SALV output

Until then: `RUNTIME_DEFERRED`.
