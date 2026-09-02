# SAP ECC MM — Inventory & Stock Risk Evidence Pack

[Versión en español](./README.es.md)

> **Track:** SAP ECC / Materials Management  
> **Artifact status:** `SOURCE_READY / RUNTIME_VALIDATION_PENDING`  
> **Runtime claim:** source prepared; SAP activation/execution not yet evidenced

This is the first executable technical artifact in the SAP Integration Lab.

It implements a classic ECC diagnostic around material/plant/storage-location stock. The application reads standard MM fields from `MARC` and `MARD`, evaluates unrestricted-use stock against reorder point and safety stock, and presents the result through an executable SALV report.

## Reproducible build path

The package now includes a professional, source-backed build procedure for creating the complete ABAP object set and exposing the report through the original custom transaction `ZMM_STOCK_RISK` using `SE93`.

- [Build Guide — English](./BUILD_GUIDE.md)
- [Guía de construcción — Español](./BUILD_GUIDE.es.md)
- [Runtime Runbook](./RUNBOOK.md)
- [Guía de ejecución](./RUNBOOK.es.md)
- [Evidence record](./EVIDENCE.md)

The build guide is grounded in official SAP documentation for Class Builder (`SE24`), executable programs (`SE38`), Transaction Maintenance (`SE93`), ABAP Unit and CTS/package behavior.

## Important functional boundary

This application is **not an implementation of SAP MRP** and does not claim to reproduce replenishment planning. It is a focused diagnostic/reporting exercise suitable for demonstrating classic ECC MM + ABAP engineering.

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

- `ZCX_MM_STOCK_NOT_FOUND` — explicit error when material/plant/storage-location data cannot be resolved.

## Standard ECC data used

The ECC datasource reads:

- `MARC-MINBE` — reorder point
- `MARC-EISBE` — safety stock
- `MARD-LABST` — unrestricted-use stock for the selected storage location

No update, insert or delete statement is used. The datasource is read-only.

## Diagnostic rule

- `CRITICAL` — unrestricted stock is below safety stock
- `REORDER` — unrestricted stock is at or below reorder point, but not below safety stock
- `OK` — unrestricted stock is above reorder point

`shortage_qty` reports the quantity required to reach the configured reorder point when current unrestricted stock is lower.

## Source layout

```text
inventory-reorder/
├── README.md
├── README.es.md
├── BUILD_GUIDE.md
├── BUILD_GUIDE.es.md
├── RUNBOOK.md
├── RUNBOOK.es.md
├── EVIDENCE.md
└── source/
    ├── zcx_mm_stock_not_found.clas.abap
    ├── zif_mm_stock_source.intf.abap
    ├── zcl_mm_stock_source_ecc.clas.abap
    ├── zcl_mm_stock_source_demo.clas.abap
    ├── zcl_mm_stock_risk_service.clas.abap
    ├── zcl_mm_stock_risk_service.clas.testclasses.abap
    └── zmm_stock_risk_report.prog.abap
```

## ABAP Unit coverage prepared

Four deterministic cases are versioned:

1. stock above reorder point → `OK`
2. stock exactly at reorder point → `REORDER`
3. stock below safety stock → `CRITICAL`
4. shortage quantity is calculated up to the reorder point

The tests use the demo datasource, not production SAP data.

## What this source proves now

- classic ABAP OO design
- interface-based dependency inversion
- deterministic test datasource
- read-only Open SQL against standard ECC MM tables
- domain-specific exception handling
- executable report structure
- SALV output structure
- ABAP Unit source coverage
- documented creation of a custom report transaction through `SE93`
- bilingual engineering documentation

## What remains blocked

The following claims are **not** made until SAP runtime evidence is captured:

- syntax check passed in a specific ECC release
- all objects activated successfully
- ABAP Unit passed in SAP
- `ZMM_STOCK_RISK` launched successfully through `SE93`
- the SALV report executed successfully against an SAP system

See [`EVIDENCE.md`](./EVIDENCE.md) for the validation protocol.
