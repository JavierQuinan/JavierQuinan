# SAP ECC Materials Management (MM) — Evidence Track

[Versión en español](./README.es.md)

> **Scope:** SAP ECC / classic MM  
> **Current maturity:** functional evidence published; first ABAP pack static-validated; service-procurement technical lab designed

This track is intentionally separated from SAP S/4HANA. It documents classic MM functional knowledge and ECC-oriented ABAP engineering without presenting direct-table patterns as Clean Core evidence.

## Published evidence

### 1. Inventory & Stock Risk — ABAP engineering

[Inventory & Stock Risk Evidence Pack](./inventory-reorder/README.md)

Status: `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

Evidence:

- classic ABAP Objects
- read-only `MARA` / `MARC` / `MARD` datasource
- plant vs. storage-location stock separation
- MRP-context visibility
- explicit exception handling
- SALV report design
- six deterministic ABAP Unit vectors traced consistently at source level
- reproducible `SE24` / `SE38` / `SE93` build and execution procedure

Actual SAP activation/unit-test runtime is not claimed while portfolio execution remains blocked by enterprise DEV/CTS access.

### 2. Functional MM evidence

[Sanitized functional evidence](./functional-evidence/)

Derived from operational material covering:

- material extension to organizational levels
- work-order material consumption and movement validation
- material/vendor/work-center troubleshooting

### 3. Service Procurement & Framework Contracts

[Service Procurement & Framework Contracts](./service-procurement/README.md)

Status: `FUNCTIONAL_EVIDENCE_READY / TECHNICAL_LAB_PLANNED`

The evidence covers:

- long-term vendor agreements
- duplicate-prevention check
- validity periods
- quantity/value context
- service items
- contracted activities/service catalogue
- commercial conditions
- follow-on procurement reference

The source operational guide uses `ME31` plus `ME33K`; the public document preserves that source-derived procedure while distinguishing it from the standard SAP ECC contract transaction family commonly represented by `ME31K` / `ME32K` / `ME33K`.

A [read-only Contract Audit technical lab](./service-procurement/TECHNICAL_LAB.md) is designed around `EKKO` / `EKPO`, with no document creation/change claim.

## Planned technical progression

1. implement `ZMM_CONTRACT_AUDIT` as read-only source evidence
2. add deterministic contract-validity ABAP Unit vectors
3. build Purchasing Analytics for requisition/order visibility
4. keep service-package relationships release-specific until formally verified

## ECC boundary

Classic objects/Open SQL may be used when appropriate to ECC. They remain labelled **ECC/classic**.

No employer/customer source, real purchasing documents, vendor IDs, material IDs, prices, organizational codes or screenshots are published.

## S/4HANA boundary

Modern S/4HANA procurement evidence lives separately under [`../../02-s4hana`](../../02-s4hana/README.md) and prioritizes released CDS/OData interfaces rather than mechanically exposing ECC tables externally.
