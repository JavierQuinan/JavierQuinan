# SAP ECC Materials Management (MM) — Evidence Track

[Versión en español](./README.es.md)

> **Scope:** SAP ECC / classic MM

This track documents classic MM functional knowledge and original ECC-oriented ABAP engineering. It is intentionally separated from S/4HANA so direct-table ECC patterns are not presented as Clean Core evidence.

## Technical evidence available now

### 1. Inventory & Stock Risk

[Evidence Pack](./inventory-reorder/README.md)

Evidence:

- original ABAP Objects source;
- read-only `MARA / MARC / MARD` datasource;
- plant vs. storage-location stock separation;
- MRP-context visibility;
- SALV report source;
- 6 deterministic ABAP Unit scenarios reviewed at source level;
- reproducible `SE24 / SE38 / SE93` build guide;
- source-compatibility review for classic ECC syntax.

**Evidence boundary:** source/static validation is documented; corporate SAP activation and executed ABAP Unit runtime are not claimed.

### 2. Service Procurement & `ZMM_CONTRACT_AUDIT`

[Service Procurement & Framework Contracts](./service-procurement/README.md)

Evidence:

- sanitized operational guide for framework/service contracts;
- original read-only `ZMM_CONTRACT_AUDIT` source over `EKKO / EKPO`;
- contract-validity diagnostics;
- vendor/purchasing-organization context;
- target-value / quantity-value indicators;
- SALV report source;
- 8 deterministic ABAP Unit scenarios reviewed at source level;
- bilingual build/evidence documentation.

**Evidence boundary:** source/static validation is documented; SAP runtime is not claimed.

### 3. Purchasing Analytics — PR → PO → Schedule Lines

[Purchasing Analytics](./purchasing-analytics/README.md)

Evidence:

```text
EBAN
  ↓ optional EBELN/EBELP reference
EKKO / EKPO   [EKKO-BSTYP = 'F']
  ↓
EKET
```

- PR item visibility;
- optional downstream PO resolution;
- PO-category guard;
- purchasing organization/vendor context;
- schedule-line count and delivery-date context;
- deletion indicators;
- `PR_ONLY / REFERENCE_GAP`;
- `PO_WITHOUT_SCHEDULE / PO_WITH_SCHEDULE`;
- `PR_DELETED / PO_ITEM_DELETED`;
- SALV report source;
- 7 deterministic ABAP Unit scenarios reviewed at source level;
- bilingual `SE24 / SE38 / SE93` build guide.

A PR without a PO is deliberately treated as a valid `PR_ONLY` state rather than an automatic error.

**Evidence boundary:** source/static validation is documented; SAP runtime is not claimed.

## Functional MM evidence

[Sanitized functional evidence](./functional-evidence/)

Operational guides in this track cover:

- material extension with `MM01`;
- verification of organizational extension;
- work-order material consumption and movement validation;
- material/vendor/work-center troubleshooting;
- framework/service contract handling.

### Visual evidence — MM01

[Sanitized MM01 screenshots](../../visual-evidence/mm01-material-extension/README.md)

The visual set shows:

1. material-extension access screen;
2. view selection;
3. organizational-level selection;
4. verification in material index.

Material IDs, center/storage values, descriptions and usernames are sanitized. The screenshots come from a guide supplied for this portfolio and are published only in redacted form.

## What this track demonstrates

- classic SAP MM operational understanding;
- material and organizational-level reasoning;
- purchasing/service-procurement concepts;
- PR→PO→schedule-line relationship analysis;
- ABAP Objects and datasource abstraction;
- read-only Open SQL diagnostics;
- SALV reporting;
- deterministic test design;
- bilingual technical documentation.

## ECC boundary

Classic objects and Open SQL are used only where appropriate to ECC and remain clearly labelled **ECC/classic**.

No employer/customer source, real purchasing documents, vendor IDs, material IDs, prices, organizational codes or unsanitized screenshots are published.

## S/4HANA boundary

Modern S/4HANA procurement evidence lives separately under [`../../02-s4hana`](../../02-s4hana/README.md) and prioritizes released APIs/CDS/OData boundaries.
