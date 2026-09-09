# SAP ECC MM — Inventory & Stock Risk Evidence Pack

[Versión en español](./README.es.md)

> **Track:** SAP ECC / Materials Management  
> **Evidence:** original ABAP source · source-reviewed deterministic scenarios · reproducible build guide

This pack implements a classic ECC, read-only stock early-warning diagnostic for material / plant / storage-location analysis. It reads standard MM master/stock fields, separates selected storage-location stock from gross plant unrestricted-use stock, applies transparent threshold rules and exposes the result through SALV.

## Evidence index

- [Build Guide — English](./BUILD_GUIDE.md)
- [Guía de construcción — Español](./BUILD_GUIDE.es.md)
- [Compatibility & Hardening Profile](./COMPATIBILITY.md)
- [Perfil de compatibilidad y hardening](./COMPATIBILITY.es.md)
- [Static Validation Record](./STATIC_VALIDATION.md)
- [Evidence Record](./EVIDENCE.md)
- [`source/`](./source/) — original ABAP source

The build guide documents `SE24`, `SE38`, `SE93`, package/transport considerations, ABAP Unit placement and SALV execution steps.

## Functional boundary

This application is **not SAP MRP** and does not reproduce reorder-point planning.

It is deliberately narrower: a transparent diagnostic over stock/master-data values intended to demonstrate ECC MM + ABAP engineering without claiming SAP planning-engine equivalence.

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

Supporting exception:

- `ZCX_MM_STOCK_NOT_FOUND`

## Standard ECC data used

The ECC datasource reads:

- `MARC-DISMM` — MRP type;
- `MARC-MINBE` — reorder point;
- `MARC-EISBE` — safety stock;
- `MARD-LABST` — unrestricted-use stock for the selected storage location;
- all relevant `MARD-LABST` rows for material/plant to derive a gross plant unrestricted-use total;
- `MARA-MEINS` — base unit context.

No purchasing/material-master write operation exists in this artifact.

## Diagnostic rule

- `NOT_CONFIGURED` — reorder point and safety stock are both initial;
- `CRITICAL` — plant unrestricted-use stock is below safety stock;
- `REORDER` — plant unrestricted-use stock is at/below reorder point but not below safety stock;
- `OK` — none of the above conditions applies.

`shortage_qty` reports the amount required to reach the configured reorder point when plant unrestricted-use stock is lower.

The selected storage-location stock is displayed as drill-down context; it does not drive the plant-level result.

## Deterministic scenario review

The repository contains ABAP Unit source for six scenarios, traced consistently against the current service logic:

1. plant stock above reorder point → `OK`;
2. plant stock exactly at reorder point → `REORDER`;
3. plant stock below safety stock → `CRITICAL`;
4. stock 55 vs. reorder point 80 → shortage `25`;
5. missing thresholds → `NOT_CONFIGURED`;
6. low selected-storage stock with sufficient plant stock → plant-based result remains authoritative.

**Source-reviewed scenarios: 6/6 consistent; source-level mismatches: 0.**

This statement is a source/static review, not a claim of ABAP Unit execution inside a corporate SAP system.

## ECC compatibility posture

The source intentionally favors classic constructs:

- `CREATE OBJECT`;
- `CALL METHOD`;
- explicit `DATA` declarations;
- classic Open SQL without `@` host variables;
- global classes/interfaces;
- local ABAP Unit classes;
- `CL_SALV_TABLE`.

This reduces unnecessary dependence on newer syntax and makes the source easier to review across classic ECC landscapes.

## What this evidence demonstrates

- SAP ECC MM stock/master-data reasoning;
- classic ABAP Objects design;
- dependency inversion through an interface;
- ECC and synthetic datasource separation;
- deterministic test design;
- read-only Open SQL against standard MM objects;
- plant vs. storage-location semantics;
- explicit exception handling;
- SALV reporting;
- `SE93` report-transaction design;
- reproducible object-by-object build documentation;
- bilingual technical documentation.

## Evidence boundary

The repository contains source, static scenario review and reproducible construction/execution instructions. It does **not** present screenshots or results claiming that these custom objects were activated or executed in a specific corporate SAP system.
