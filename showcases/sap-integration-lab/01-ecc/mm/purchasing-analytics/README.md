# SAP ECC MM — Purchasing Analytics

[Versión en español](./README.es.md)

> **Evidence type:** original read-only ECC purchasing source  
> **Status:** `SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`  
> **Scope:** Purchase Requisition → Purchase Order → Schedule-Line visibility

`ZMM_PURCH_ANALYTICS` is a classic ECC evidence lab that follows one purchase-requisition item into downstream purchasing references when they exist, without creating or changing purchasing documents.

## Standard model used

```text
EBAN — Purchase Requisition item
   │
   ├── BANFN / BNFPO
   ├── EBELN / EBELP when a PO reference exists
   │
   ▼
EKKO / EKPO — Purchase Order header/item
   │
   ▼
EKET — Schedule-line delivery context
```

SAP documentation exposes `BANFN`, `BNFPO`, `EBELN` and `EBELP` in purchase-requisition data and uses `EKET-EINDT` as schedule-line delivery-date context. The portfolio implementation remains explicitly **ECC/classic** and is not used as S/4HANA Clean Core proof.

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

The first version exposes:

- Purchase Requisition number/item
- PR document and requested-delivery context
- material / plant / purchasing group
- referenced Purchase Order/item when present
- PO document date
- vendor and purchasing organization
- PO quantity/unit
- schedule-line count
- earliest/latest schedule-line delivery date
- transparent portfolio diagnostic result

## Diagnostic results

These labels are portfolio diagnostics, **not SAP standard document statuses**:

- `PR_ONLY` — PR exists without a PO reference
- `REFERENCE_GAP` — PR contains a PO reference but header/item cannot be resolved by the read-only lookup
- `PO_WITHOUT_SCHEDULE` — referenced PO item resolves but no schedule line is found
- `PO_WITH_SCHEDULE` — referenced PO item and schedule-line context resolve
- `PR_DELETED` — PR deletion indicator is set
- `PO_ITEM_DELETED` — referenced PO item deletion indicator is set

A PR without a PO is not treated as an error. The artifact intentionally avoids assuming that every requisition must already have a downstream order.

## Static validation

Seven deterministic ABAP Unit vectors are prepared and traced consistently at source level:

```text
Vectors reviewed: 7
Consistent:       7
Mismatches:       0
```

See [Static Validation](./STATIC_VALIDATION.md).

This is not presented as SAP ABAP Unit runtime evidence.

## Reproduction

- [Build Guide — English](./BUILD_GUIDE.md)
- [Guía de Construcción — Español](./BUILD_GUIDE.es.md)
- [Evidence Boundary](./EVIDENCE.md)
- [Design](./DESIGN.md)

The documented reproduction path uses `SE24`, `SE38` and `SE93`.

## Non-goals

The first version does not:

- create/change PRs or POs
- release purchasing documents
- simulate MRP
- calculate commitments
- claim that `PR_ONLY` is a business error
- traverse service-entry/package relationships
- calculate goods-receipt completion
- implement S/4HANA released-API behavior

## Security / confidentiality

Only synthetic identifiers belong in public visual evidence. Never publish real requisitions, POs, vendor IDs, material IDs, organizational codes, prices, screenshots or internal system metadata.

The source contains no purchasing-document write/commit path.

## Evidence boundary

`SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY` means the code and deterministic behavior are reviewable and documented. `RUNTIME_DEFERRED` means SAP activation and ABAP Unit execution are not claimed until an authorized DEV/sandbox is available.
