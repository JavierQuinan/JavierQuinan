# SAP ECC MM — Inventory & Stock Risk Evidence Pack

[Versión en español](./README.es.md)

> **Track:** SAP ECC / Materials Management  
> **Artifact status:** `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`  
> **Runtime claim:** source logic and deterministic test vectors reviewed; SAP activation/execution remains unclaimed until an authorized DEV/sandbox is available

This is the first executable technical artifact in the SAP Integration Lab.

It implements a classic ECC, read-only stock early-warning diagnostic for material / plant / storage-location analysis. The application reads standard MM master/stock fields from `MARC` and `MARD`, separates selected storage-location stock from gross plant unrestricted-use stock, applies transparent threshold rules, and presents the result through SALV.

## Reproducible build path

- [Build Guide — English](./BUILD_GUIDE.md)
- [Guía de construcción — Español](./BUILD_GUIDE.es.md)
- [Compatibility & Hardening Profile](./COMPATIBILITY.md)
- [Perfil de compatibilidad y hardening](./COMPATIBILITY.es.md)
- [Static Validation Record](./STATIC_VALIDATION.md)
- [Runtime Execution Packet — English](./RUNTIME_EXECUTION.md)
- [Paquete de ejecución runtime — Español](./RUNTIME_EXECUTION.es.md)
- [Runtime Runbook](./RUNBOOK.md)
- [Guía de ejecución](./RUNBOOK.es.md)
- [Validation Results Template](./VALIDATION_RESULTS_TEMPLATE.md)
- [Evidence record](./EVIDENCE.md)

The build path uses classic SAP development tools and concepts: `SE24`, `SE38`, `SE93`, packages/CTS, ABAP Unit and SALV.

## Important functional boundary

This application is **not SAP MRP** and does not reproduce reorder-point planning.

SAP reorder-point planning can consider plant stock, firmed receipts and additional planning logic. This lab is intentionally narrower: it is a transparent stock/master-data diagnostic designed to demonstrate ECC MM + ABAP engineering without pretending to reproduce SAP planning behavior.

## Architecture

```text
ZMM_STOCK_RISK
        │
        ▼
ZMM_STOCK_RISK_REPORT
        │
        ▼
ZCL_MM_STOCK_RISK_SERVICE
        │
        ▼
ZIF_MM_STOCK_SOURCE
   ├── ZCL_MM_STOCK_SOURCE_ECC  → MARC / MARD
   └── ZCL_MM_STOCK_SOURCE_DEMO → synthetic deterministic data
```

Supporting object:

- `ZCX_MM_STOCK_NOT_FOUND` — explicit static exception when material/plant/storage-location data cannot be resolved.

## Standard ECC data used

The ECC datasource reads:

- `MARC-DISMM` — MRP type
- `MARC-MINBE` — reorder point
- `MARC-EISBE` — safety stock
- `MARD-LABST` — unrestricted-use stock for the selected storage location
- all `MARD-LABST` records for the material/plant to calculate a gross plant unrestricted-use total

No update, insert, modify or delete statement exists in the runtime path.

## Hardened diagnostic rule

- `NOT_CONFIGURED` — both reorder point and safety stock are initial
- `CRITICAL` — plant unrestricted-use stock is below configured safety stock
- `REORDER` — plant unrestricted-use stock is at or below configured reorder point, but not below safety stock
- `OK` — none of the above conditions applies

`shortage_qty` reports the quantity required to reach the configured reorder point when the plant unrestricted-use total is lower.

The selected storage-location stock is displayed as drill-down evidence; it does not drive the plant-level status.

## Static validation + ABAP Unit design

Six deterministic test vectors are versioned and were traced against the current source implementation:

1. plant stock above reorder point → `OK` — static PASS
2. plant stock exactly at reorder point → `REORDER` — static PASS
3. plant stock below safety stock → `CRITICAL` — static PASS
4. shortage quantity from 55 to reorder point 80 → `25` — static PASS
5. missing thresholds → `NOT_CONFIGURED` — static PASS
6. low selected-storage stock with sufficient plant stock → status remains plant-based — static PASS

**Static vectors reviewed: 6/6; source-level mismatches: 0.**

This is source/static validation, not a claim that ABAP Unit has been executed in SAP. The runtime test target remains 6/6 PASS when an authorized environment is available.

## ECC compatibility posture

The core runtime intentionally favors classic constructs:

- `CREATE OBJECT`
- `CALL METHOD`
- explicit `DATA`
- classic Open SQL without `@` host variables
- global classes/interfaces
- local ABAP Unit classes
- `CL_SALV_TABLE`

Modern syntax is avoided where it does not add value. This improves portability, but the exact ECC release/EHP still has to be runtime-validated.

## What this evidence proves now

- classic ABAP OO design
- dependency inversion through an interface
- deterministic test datasource
- six deterministic test vectors consistent with current source logic
- read-only Open SQL design against standard ECC MM tables
- plant vs. storage-location stock separation
- MRP-context visibility through `MARC-DISMM`
- class-based exception handling
- SALV report structure
- ABAP Unit source coverage
- custom report-transaction design through `SE93`
- reproducible object-by-object build/runtime procedure
- bilingual technical documentation
- explicit functional and runtime evidence boundaries

## Runtime boundary

Runtime execution is currently deferred because this portfolio exercise is not using enterprise development/CTS access. This is an environment/governance constraint, not represented as an execution PASS.

The following claims remain intentionally blocked until SAP runtime evidence exists:

- syntax check passed in a specific ECC release
- all objects activated successfully in SAP
- all six ABAP Unit tests passed in SAP
- `ZMM_STOCK_RISK` launched successfully through `SE93`
- SALV executed successfully against an SAP system

See [`STATIC_VALIDATION.md`](./STATIC_VALIDATION.md) and [`EVIDENCE.md`](./EVIDENCE.md).
