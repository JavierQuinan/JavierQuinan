# Evidence Record — ECC MM Inventory & Stock Risk

> **Evidence available:** source review · deterministic scenario review · reproducible SAP construction guide  
> **Runtime boundary:** this repository does not assert SAP activation or ABAP Unit execution for this pack

## Source objects

The versioned pack contains:

1. `ZCX_MM_STOCK_NOT_FOUND`
2. `ZIF_MM_STOCK_SOURCE`
3. `ZCL_MM_STOCK_SOURCE_DEMO`
4. `ZCL_MM_STOCK_SOURCE_ECC`
5. `ZCL_MM_STOCK_RISK_SERVICE`
6. local ABAP Unit classes for the service
7. `ZMM_STOCK_RISK_REPORT`
8. `ZMM_STOCK_RISK` — documented SE93 report-transaction design

## Review result

| Object / layer | Source review | Deterministic logic review | Public runtime claim |
|---|---|---|---|
| `ZCX_MM_STOCK_NOT_FOUND` | PASS | PASS | none |
| `ZIF_MM_STOCK_SOURCE` | PASS | PASS | none |
| `ZCL_MM_STOCK_SOURCE_DEMO` | PASS | PASS | none |
| `ZCL_MM_STOCK_SOURCE_ECC` | PASS | PASS | none |
| `ZCL_MM_STOCK_RISK_SERVICE` | PASS | PASS | none |
| ABAP Unit source | PASS | 6/6 scenarios consistent | not presented as executed SAP tests |
| `ZMM_STOCK_RISK_REPORT` | PASS | PASS | none |
| `ZMM_STOCK_RISK` design | PASS | PASS | none |

## Hardening already applied

- plant-level and selected-storage-location unrestricted stock are separated;
- diagnostic status uses plant-level unrestricted stock rather than one storage location;
- `MARC-DISMM` MRP type is exposed;
- base unit `MARA-MEINS` is included;
- missing reorder/safety thresholds produce `NOT_CONFIGURED`;
- `CX_STATIC_CHECK` propagation is explicit in the test source;
- classic `CREATE OBJECT`, `CALL METHOD` and classic Open SQL are preferred for ECC portability;
- runtime source remains read-only.

See [`COMPATIBILITY.md`](./COMPATIBILITY.md) and [`SOURCE_REVIEW.md`](./SOURCE_REVIEW.md).

## Deterministic scenario review

The six versioned ABAP Unit scenarios were traced against the current service implementation:

1. plant unrestricted stock above reorder point → `OK` — **STATIC PASS**
2. plant unrestricted stock exactly at reorder point → `REORDER` — **STATIC PASS**
3. plant unrestricted stock below safety stock → `CRITICAL` — **STATIC PASS**
4. shortage quantity from 55 to reorder point 80 → `25` — **STATIC PASS**
5. no reorder/safety thresholds → `NOT_CONFIGURED` — **STATIC PASS**
6. low selected-storage stock with sufficient plant stock → plant-based status preserved — **STATIC PASS**

```text
Scenarios reviewed: 6
Consistent:         6
Mismatches:         0
```

This is source-level evidence. It is deliberately not labelled as an executed ABAP Unit run.

## Read-only ECC model

The datasource uses standard MM context:

- `MARA-MEINS`
- `MARC-DISMM`
- `MARC-MINBE`
- `MARC-EISBE`
- selected `MARD-LABST`
- all applicable `MARD-LABST` rows for a transparent gross plant unrestricted-stock total

No `UPDATE`, `INSERT`, database `MODIFY`, `DELETE` or document-changing BAPI exists in the source path.

## Reproducible construction and verification guides

- [`BUILD_GUIDE.md`](./BUILD_GUIDE.md)
- [`BUILD_GUIDE.es.md`](./BUILD_GUIDE.es.md)
- [`RUNTIME_EXECUTION.md`](./RUNTIME_EXECUTION.md)
- [`RUNTIME_EXECUTION.es.md`](./RUNTIME_EXECUTION.es.md)
- [`RUNBOOK.md`](./RUNBOOK.md)
- [`RUNBOOK.es.md`](./RUNBOOK.es.md)
- [`VALIDATION_RESULTS_TEMPLATE.md`](./VALIDATION_RESULTS_TEMPLATE.md)

These are reusable technical instructions for `SE24/SE80`, ABAP Unit, `SE38`, SALV and `SE93`. They are published as guides, not as evidence that a specific corporate system executed the code.

## Functional boundary

This artifact is a transparent stock early-warning diagnostic. It does **not** reproduce SAP MRP availability or claim to calculate firmed receipts, requirements, MRP-area scope, storage-location exclusions, lot sizing, lead times or forecasting.

## Recruiter-safe portfolio statement

> SAP ECC MM / ABAP Objects evidence pack with reviewable read-only MARA/MARC/MARD source, SALV reporting, six deterministic scenarios reviewed consistently and reproducible SE24/SE38/SE93 construction guides. SAP runtime execution is not asserted for this public artifact.
