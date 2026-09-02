# SAP ECC MM — Inventory & Stock Risk Evidence Pack

[Versión en español](./README.es.md)

> **Track:** SAP ECC / Materials Management  
> **Artifact status:** `SOURCE_READY / RUNTIME_VALIDATION_PENDING`  
> **Runtime claim:** source reviewed and hardened; SAP activation/execution not yet evidenced

This is the first executable technical artifact in the SAP Integration Lab.

It implements a classic ECC, read-only stock early-warning diagnostic for material / plant / storage-location analysis. The application reads standard MM master/stock fields from `MARC` and `MARD`, separates selected storage-location stock from gross plant unrestricted-use stock, applies transparent threshold rules, and presents the result through SALV.

## Reproducible build path

- [Build Guide — English](./BUILD_GUIDE.md)
- [Guía de construcción — Español](./BUILD_GUIDE.es.md)
- [Compatibility & Hardening Profile](./COMPATIBILITY.md)
- [Perfil de compatibilidad y hardening](./COMPATIBILITY.es.md)
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

## ABAP Unit coverage prepared

Six deterministic cases are versioned:

1. plant stock above reorder point → `OK`
2. plant stock exactly at reorder point → `REORDER`
3. plant stock below safety stock → `CRITICAL`
4. shortage quantity is calculated to reorder point
5. missing thresholds → `NOT_CONFIGURED`
6. low selected-storage stock with sufficient plant stock → status remains plant-based

The tests use a synthetic datasource and no production SAP data. Test methods explicitly declare the propagated `CX_STATIC_CHECK` exception.

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

## What this source proves now

- classic ABAP OO design
- dependency inversion through an interface
- deterministic test datasource
- read-only Open SQL against standard ECC MM tables
- plant vs. storage-location stock separation
- MRP-context visibility through `MARC-DISMM`
- class-based exception handling
- SALV report structure
- ABAP Unit source coverage
- custom report-transaction design through `SE93`
- bilingual technical documentation
- explicit functional and runtime evidence boundaries

## What remains blocked

The following claims are not made until SAP runtime evidence is captured:

- syntax check passed in the target ECC release
- all objects activated successfully
- all six ABAP Unit tests passed in SAP
- `ZMM_STOCK_RISK` launched successfully through `SE93`
- SALV executed successfully against an SAP system

See [`EVIDENCE.md`](./EVIDENCE.md) for the promotion protocol.
