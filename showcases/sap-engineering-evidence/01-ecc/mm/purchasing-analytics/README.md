# SAP ECC MM — Purchasing Analytics

[Versión en español](./README.es.md)

> **Evidence:** original read-only ECC purchasing source · deterministic source review · reproducible build guide  
> **Scope:** Purchase Requisition → Purchase Order → Schedule-Line visibility

`ZMM_PURCH_ANALYTICS` follows one purchase-requisition item into downstream purchasing references when they exist, without creating or changing purchasing documents.

## Standard model used

```text
EBAN — Purchase Requisition item
   │
   ├── BANFN / BNFPO
   ├── EBELN / EBELP when a PO reference exists
   │
   ▼
EKKO / EKPO — Purchase Order header/item
   │  EKKO-BSTYP = 'F'
   ▼
EKET — Schedule-line delivery context
```

The artifact remains explicitly **ECC/classic** and is not presented as S/4HANA Clean Core evidence.

## Source architecture

```text
ZMM_PURCH_ANALYTICS
        │
        ▼
ZMM_PURCH_ANALYTICS_REPORT
        │
        ▼
ZCL_MM_PURCH_ANALYTICS_SERVICE
        │
        ▼
ZIF_MM_PURCH_SOURCE
   ┌──────────┴──────────┐
   ▼                     ▼
ECC datasource        Demo datasource
EBAN/EKKO/EKPO/EKET   synthetic records
```

Reviewable source: [`source/`](./source/)

## Read-only output

- Purchase Requisition number/item;
- PR document and requested-delivery context;
- material / plant / purchasing group;
- referenced Purchase Order/item when present;
- PO document date;
- vendor and purchasing organization;
- PO quantity/unit;
- schedule-line count;
- earliest/latest schedule-line delivery date;
- transparent portfolio diagnostic result.

## Diagnostic results

These labels are portfolio diagnostics, **not SAP standard document statuses**:

- `PR_ONLY` — PR exists without a PO reference;
- `REFERENCE_GAP` — PR contains a PO reference but header/item cannot be resolved by the read-only lookup;
- `PO_WITHOUT_SCHEDULE` — referenced PO item resolves but no schedule line is found;
- `PO_WITH_SCHEDULE` — referenced PO item and schedule-line context resolve;
- `PR_DELETED` — PR deletion indicator is set;
- `PO_ITEM_DELETED` — referenced PO item deletion indicator is set.

A PR without a PO is deliberately not classified as an error.

## Deterministic scenario review

Seven ABAP Unit scenarios are versioned and traced consistently at source level:

```text
Scenarios reviewed: 7
Consistent:         7
Mismatches:         0
```

See [Static Validation](./STATIC_VALIDATION.md). This is source/static review, not a claim of ABAP Unit execution inside SAP.

## Reproducible evidence

- [Build Guide — English](./BUILD_GUIDE.md)
- [Guía de Construcción — Español](./BUILD_GUIDE.es.md)
- [Evidence Boundary](./EVIDENCE.md)
- [Design](./DESIGN.md)
- [Source Review](./SOURCE_REVIEW.md)

The build guide documents `SE24`, `SE38` and `SE93`.

## What this evidence demonstrates

- PR→PO→schedule-line relationship reasoning;
- use of `EKKO-BSTYP = 'F'` to guard Purchase Order category;
- ABAP Objects and datasource abstraction;
- synthetic deterministic test design;
- read-only ECC Open SQL;
- deletion/reference-gap handling;
- SALV reporting;
- bilingual technical documentation.

## Non-goals / evidence boundary

The artifact does not create/change/release PRs or POs, simulate MRP, calculate commitments, traverse service-entry packages, calculate goods-receipt completion or implement S/4HANA released-API behavior.

Public evidence contains no real requisitions, POs, vendor/material identifiers, organizational codes, prices or internal system metadata. The source contains no purchasing-document write/commit path.

The repository presents source/static evidence and construction instructions; it does not claim activation or execution of these custom objects inside a specific corporate SAP system.
