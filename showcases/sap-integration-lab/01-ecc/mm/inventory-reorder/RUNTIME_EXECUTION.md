# SAP ECC MM — Reproducible Execution & Verification Guide

[Versión en español](./RUNTIME_EXECUTION.es.md)

> **Evidence represented here:** reviewable source, completed source hardening, six deterministic scenarios reviewed consistently, and a complete SAP build/execution procedure.

This document is a reusable technical guide for creating and verifying the evidence pack in an authorized SAP ECC development or sandbox environment. It does not represent unobserved SAP activation or ABAP Unit runtime as completed evidence.

## Verified repository evidence

- source/hardening review: **completed**
- deterministic scenarios reviewed: **6**
- consistent expected outcomes: **6**
- static mismatches: **0**
- datasource posture: **read-only**
- object creation guide: **available**
- SE24 / SE38 / SE93 procedure: **available**

See [`STATIC_VALIDATION.md`](./STATIC_VALIDATION.md) for the source trace.

## Object sequence

| Step | Object | SAP tool | Verification checkpoint |
|---|---|---|---|
| 1 | `ZCX_MM_STOCK_NOT_FOUND` | SE24 / SE80 | syntax + activation |
| 2 | `ZIF_MM_STOCK_SOURCE` | SE24 / SE80 | syntax + activation |
| 3 | `ZCL_MM_STOCK_SOURCE_DEMO` | SE24 / SE80 | syntax + activation |
| 4 | `ZCL_MM_STOCK_SOURCE_ECC` | SE24 / SE80 | syntax + activation |
| 5 | `ZCL_MM_STOCK_RISK_SERVICE` | SE24 / SE80 | syntax + activation |
| 6 | local ABAP Unit classes | SE24 / ABAP Unit | six deterministic cases |
| 7 | `ZMM_STOCK_RISK_REPORT` | SE38 / SE80 | syntax + activation + SALV |
| 8 | `ZMM_STOCK_RISK` | SE93 | report transaction + launch |

Use the versioned files under `source/` as the implementation source of truth.

## Datasource boundary

The ECC source is intentionally read-only and uses standard MM fields:

- `MARA-MEINS`
- `MARC-DISMM`
- `MARC-MINBE`
- `MARC-EISBE`
- `MARD-LABST`

The diagnostic keeps selected storage-location unrestricted stock separate from gross plant unrestricted stock. The status is a transparent stock diagnostic and must not be presented as SAP MRP.

## Deterministic scenarios

1. plant stock above reorder point → `OK`
2. plant stock exactly at reorder point → `REORDER`
3. plant stock below safety stock → `CRITICAL`
4. shortage quantity calculated to the reorder point
5. no reorder/safety thresholds → `NOT_CONFIGURED`
6. low selected-storage stock with sufficient plant stock → plant-level result remains authoritative

Repository review result:

```text
Scenarios reviewed: 6
Consistent:        6
Mismatches:        0
```

## Execution procedure

For each global class/interface/program:

1. create the object with the documented name;
2. assign an authorized development package or local package according to the target environment policy;
3. copy the corresponding versioned source;
4. run Syntax Check;
5. activate;
6. record only sanitized compatibility notes if the target ECC release requires an adjustment.

For ABAP Unit:

1. attach the local test classes to `ZCL_MM_STOCK_RISK_SERVICE`;
2. run Syntax Check and activate;
3. execute the test class;
4. record the observed total/pass/fail result without system/company identifiers.

For the executable:

1. create `ZMM_STOCK_RISK_REPORT` in `SE38`/`SE80`;
2. execute it first as a report;
3. verify the SALV columns and diagnostic result using non-sensitive data;
4. create `ZMM_STOCK_RISK` in `SE93` as a Report Transaction pointing to the executable report;
5. launch the transaction and verify the same read-only output.

## Validation data rule

Use only a non-sensitive material that exists, is extended to the selected plant, has a storage-location record and has interpretable MRP/reorder fields. Public evidence must remove material, plant, storage location, SID, client, usernames and transport numbers.

## Result recording format

Use [`VALIDATION_RESULTS_TEMPLATE.md`](./VALIDATION_RESULTS_TEMPLATE.md) as a neutral recording form. Empty fields mean **not recorded in this repository**, not failed or pending.

## Safety and interpretation limits

This evidence pack contains no document creation/change BAPI, no database `INSERT`, `UPDATE`, `MODIFY`, `DELETE`, no direct table maintenance and no commit behavior. It does not calculate requirements, firmed receipts, MRP-area scope, lot sizing, lead times, forecast behavior or productive authorization design.

## Public claim supported by this repository

> SAP ECC MM / ABAP Objects evidence pack with reviewable read-only MARA/MARC/MARD source, SALV reporting, six deterministic scenarios reviewed consistently, and reproducible SE24/SE38/SE93 construction and verification guides.
