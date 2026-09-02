# SAP ECC IS-U / Work Management — Evidence Track

[Versión en español](./README.es.md)

> **Scope:** SAP ECC IS-U / Work Management / CRM integration  
> **Evidence represented:** sanitized operational guidance · original read-only ABAP source · deterministic source review · reproducible technical guides

This track is intentionally independent from S/4HANA. It converts operational utilities experience into reviewable evidence while removing customer/company configuration and real identifiers.

## Published evidence map

### Work Management operations

[Work Management Operations](./functional-evidence/work-management-operations/README.md)

Covers:

- `IW38` work-order analysis and layouts;
- work-order lifecycle interpretation;
- individual and controlled mass-processing concepts;
- `IW32` assignment/release/technical-completion flow;
- automated planning concepts;
- `SM37` background-job monitoring;
- CRM ↔ WM process dependencies.

### Work Order Status Audit — functional + ABAP source

[Work Order Status Audit](./work-management/status-audit/README.md)

Evidence available:

- `IW33` functional baseline;
- `AUFK → OBJNR`;
- `JEST` active/historical records;
- `JSTO → STSMA`;
- `TJ02T` / `TJ30T`;
- `JCDS` change-summary context;
- original datasource abstraction;
- ECC and synthetic datasources;
- ABAP Objects audit service;
- SALV report source;
- six deterministic ABAP Unit scenarios reviewed consistently at source level;
- reproducible `SE24 / SE38 / SE93` build/verification guide.

Evidence classification: `REVIEWABLE_SOURCE / STATIC_SCENARIO_VALIDATION / REPRODUCIBLE_BUILD_GUIDE`.

### Batch Work-Order Governance

[Batch Work-Order Closure Governance](./work-management/batch-order-governance/README.md)

Documents eligibility gates, bounded input, duplicate/range checks, SAP GUI scripting awareness, per-record results and mandatory post-validation. The enterprise spreadsheet/script itself is not published.

### Seal Material Enablement — MM ↔ WM

[Seal Material Enablement](./work-management/seals-material-enablement/README.md)

Documents the difference between a material being available in MM and being enabled/configured for a downstream Seal Management / work-order process.

### Equipment Consistency — IS-U ↔ CRM

[Equipment Consistency](./device-management/pec-equipment-consistency/README.md)

Documents the rule that technical equipment assignment and commercial/product representation must remain consistent, and that business-level changes should follow the CRM process instead of technical shortcuts.

### Photovoltaic Service Onboarding

[Photovoltaic Service Onboarding](./master-data/photovoltaic-service-onboarding/README.md)

Sanitized chain:

`external/GIS context → connection object → point of supply → installation → CRM customer/commercial context → specialized service contract`

### CRM ↔ IS-U Contract-End Recovery

[Contract-End / DCDE Recovery](./crm-isu-integration/dcde-recovery/README.md)

Documents process recovery when an incomplete CRM contract-end flow does not produce the expected downstream work order.

### Occasional Metered Service

[Occasional Metered Service](./crm-isu-integration/occasional-metered-service/README.md)

End-to-end CRM → WM → CRM evidence covering customer/agreement/contract setup, technical work-order execution, meter-related data, final operational status, technical completion and contract-completion sequencing.

## Standard technical references

The public SAP reference index includes official documentation for order/status fields and related development tooling:

- [`OFFICIAL_SAP_REFERENCES.md`](../../OFFICIAL_SAP_REFERENCES.md)

For the status model, SAP documentation exposes standard fields including `AUFK-AUFNR`, `JEST-STAT`, `JEST-INACT`, `JEST-CHGNR`, `JEST-OBJNR` and `JSTO-STSMA`.

## What this track demonstrates

- SAP IS-U / Work Management operational troubleshooting;
- work-order lifecycle and status interpretation;
- system vs. user status reasoning;
- active vs. historical status analysis;
- CRM ↔ IS-U / WM integration-process awareness;
- MM ↔ WM configuration-consistency reasoning;
- background-job and controlled batch-process governance;
- original classic-ABAP read-only diagnostic design;
- bilingual technical and operational documentation.

## Technical and confidentiality boundary

The public evidence documents standard read-only diagnostic objects and original portfolio source only. It does not publish direct data-manipulation shortcuts, proprietary employer/customer `Z*` implementations, credentials, real orders/installations/contracts/meters/users, internal endpoints or unsanitized enterprise screenshots.

The ABAP status-audit source is presented as source/static evidence with a reproducible verification guide. No corporate runtime result is attributed where no actual execution record exists.
