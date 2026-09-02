# SAP ECC Materials Management (MM) — Evidence Track

[Versión en español](./README.es.md)

> **Scope:** SAP ECC / classic MM  
> **Current maturity:** functional evidence + two source-ready/static-validated ABAP packs

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

The functional layer documents framework-contract/service-procurement workflow derived from sanitized operational material. The technical layer now includes the original read-only `ZMM_CONTRACT_AUDIT` source pack:

```text
ZMM_CONTRACT_AUDIT_REPORT
        ↓
ZCL_MM_CONTRACT_AUDIT_SERVICE
        ↓
ZIF_MM_CONTRACT_SOURCE
   ├── ECC → EKKO / EKPO
   └── Demo → synthetic data
```

Evidence includes:

- validity audit
- vendor/purchasing-organization context
- target value and target-item indicators
- active-item count
- `ACTIVE / EXPIRING_SOON / EXPIRED`
- `NOT_YET_VALID / INVALID_VALIDITY / VALIDITY_INCOMPLETE / NO_ITEMS`
- SALV report source
- 8 deterministic ABAP Unit vectors traced consistently
- bilingual build/evidence documentation

The first source intentionally does not traverse service-package hierarchies.

## Functional MM evidence

[Sanitized functional evidence](./functional-evidence/)

Derived from operational material covering:

- material extension
- work-order material consumption and movement validation
- material/vendor/work-center troubleshooting
- framework/service contract handling

## Next technical progression

1. Purchasing Analytics — Purchase Requisition / Purchase Order visibility
2. service-package relationships only after release/scenario verification
3. future runtime validation when an authorized SAP DEV/sandbox exists

## ECC boundary

Classic objects and Open SQL are permitted when appropriate to ECC and remain clearly labelled **ECC/classic**.

No employer/customer source, real purchasing documents, vendor IDs, material IDs, prices, organizational codes or screenshots are published.

## S/4HANA boundary

Modern S/4HANA procurement evidence lives separately under [`../../02-s4hana`](../../02-s4hana/README.md) and prioritizes released CDS/OData interfaces.
