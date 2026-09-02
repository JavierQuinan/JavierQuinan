# SAP ECC Materials Management (MM) — Evidence Track

[Versión en español](./README.es.md)

> **Scope:** SAP ECC / classic MM  
> **Current maturity:** functional evidence + three source-ready/static-validated ABAP packs

This track is intentionally separated from SAP S/4HANA. It documents classic MM functional knowledge and ECC-oriented ABAP engineering without presenting direct-table patterns as Clean Core evidence.

## Published technical evidence

### 1. Inventory & Stock Risk

[Evidence Pack](./inventory-reorder/README.md)

`SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

- ABAP Objects
- `MARA` / `MARC` / `MARD`
- plant vs. storage-location stock
- SALV
- 6 deterministic ABAP Unit vectors traced at source level
- reproducible `SE24 / SE38 / SE93` procedure

### 2. Service Procurement & Contract Audit

[Service Procurement & Framework Contracts](./service-procurement/README.md)

`FUNCTIONAL_EVIDENCE_READY / ABAP_SOURCE_READY / STATIC_VALIDATED / RUNTIME_DEFERRED`

Original read-only `ZMM_CONTRACT_AUDIT` source over `EKKO/EKPO`, contract-validity diagnostics, SALV, 8 deterministic vectors and bilingual build/evidence documentation.

### 3. Purchasing Analytics — PR → PO → Schedule Lines

[Purchasing Analytics](./purchasing-analytics/README.md)

`SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

Original read-only `ZMM_PURCH_ANALYTICS` source:

```text
EBAN
  ↓ optional EBELN/EBELP reference
EKKO / EKPO
  ↓
EKET
```

Evidence includes:

- PR item visibility
- optional downstream PO resolution
- purchasing organization/vendor context
- schedule-line count and delivery-date context
- deletion indicators
- `PR_ONLY / REFERENCE_GAP`
- `PO_WITHOUT_SCHEDULE / PO_WITH_SCHEDULE`
- `PR_DELETED / PO_ITEM_DELETED`
- SALV report
- 7 deterministic ABAP Unit vectors traced consistently
- bilingual `SE24 / SE38 / SE93` build guide

A PR without PO is deliberately not classified as an error.

## Functional MM evidence

[Sanitized functional evidence](./functional-evidence/)

Derived from operational material covering:

- material extension
- work-order material consumption and movement validation
- material/vendor/work-center troubleshooting
- framework/service contract handling

## Next technical progression

1. service-package relationships only after release/scenario verification
2. deeper purchasing history/GR visibility only after defining a bounded evidence case
3. future runtime validation when an authorized SAP DEV/sandbox exists

## ECC boundary

Classic objects and Open SQL are permitted when appropriate to ECC and remain clearly labelled **ECC/classic**.

No employer/customer source, real purchasing documents, vendor IDs, material IDs, prices, organizational codes or screenshots are published.

## S/4HANA boundary

Modern S/4HANA procurement evidence lives separately under [`../../02-s4hana`](../../02-s4hana/README.md) and prioritizes released CDS/OData interfaces.
