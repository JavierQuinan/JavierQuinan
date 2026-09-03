# SAP ECC IS-U / Work Management — Evidence Track

[Versión en español](./README.es.md)

> **Scope:** SAP ECC IS-U / Work Management / CRM / GIS integration  
> **Evidence represented:** sanitized operational guidance · original read-only ABAP source · deterministic source review · reproducible technical guides

This track is intentionally independent from S/4HANA. It converts operational utilities experience into reviewable evidence while removing customer/company configuration and real identifiers.

## Published evidence map

### Work Management operations

[Work Management Operations](./functional-evidence/work-management-operations/README.md)

Covers `IW38`, work-order lifecycle, individual/controlled mass processing, `IW32` assignment/release/technical completion, automated planning concepts, `SM37` monitoring and CRM ↔ WM dependencies.

### Work Order Status Audit — functional + ABAP source

[Work Order Status Audit](./work-management/status-audit/README.md)

Evidence includes `IW33`, `AUFK → OBJNR`, `JEST`, `JSTO → STSMA`, `TJ02T`, `TJ30T`, `JCDS`, ECC/synthetic datasources, ABAP Objects service, SALV report, six deterministic ABAP Unit scenarios reviewed at source level and reproducible `SE24 / SE38 / SE93` guidance.

Classification: `REVIEWABLE_SOURCE / STATIC_SCENARIO_VALIDATION / REPRODUCIBLE_BUILD_GUIDE`.

### Batch Work-Order Governance

[Batch Work-Order Closure Governance](./work-management/batch-order-governance/README.md)

Documents eligibility gates, bounded spreadsheet input, duplicate/range checks, SAP GUI Scripting, per-record outcomes and mandatory post-validation. The enterprise Excel/VBA implementation is not published.

### Work-Order Number Range Governance

[Number Range Governance](./work-management/number-range-governance/README.md)

Evidence for preventive `RSNUMHOT` monitoring and controlled `SNRO / SNUM` maintenance of standard object `AUFTRAG`: utilization, exhaustion risk, groups, intervals, overlap controls and post-change verification.

### Seal Material Enablement — MM ↔ WM

[Seal Material Enablement](./work-management/seals-material-enablement/README.md)

Documents the difference between material availability in MM and enablement/configuration for downstream Seal Management / work-order processes.

### Device Status Regularization

[Device Status Regularization](./device-management/device-status-regularization/README.md)

Sanitized Device Management case using `IQ09 → EG35 → EG36 → EG50 → EG34 → IQ09`, reading-history validation, operational-date consistency and `MIGO` logistics contingency when applicable.

### Equipment Consistency — IS-U ↔ CRM

[Equipment Consistency](./device-management/pec-equipment-consistency/README.md)

Documents consistency between technical equipment assignment and commercial/product representation.

### Photovoltaic Service Onboarding

[Photovoltaic Service Onboarding](./master-data/photovoltaic-service-onboarding/README.md)

Sanitized chain: `external/GIS context → connection object → point of supply → installation → CRM commercial context → specialized service contract`.

### CRM ↔ IS-U Contract-End Recovery

[Contract-End / DCDE Recovery](./crm-isu-integration/dcde-recovery/README.md)

Documents recovery when an incomplete CRM contract-end flow does not produce the expected downstream work order.

### CUEN Monitoring and Reprocessing — GIS ↔ SAP

[CUEN Monitoring & Reprocessing](./crm-isu-integration/gis-cuen-reprocessing/README.md)

Documents pre-classification of errors, read-only technical lookup, `CUEN → novelty ID` resolution, bounded GIS→SAP reprocessing and per-record post-validation.

### Occasional Metered Service

[Occasional Metered Service](./crm-isu-integration/occasional-metered-service/README.md)

End-to-end CRM → WM → CRM evidence covering contract setup, technical work-order execution, meter-related data, final operational status, technical completion and contract completion.

## Standard technical references

- [`OFFICIAL_SAP_REFERENCES.md`](../../OFFICIAL_SAP_REFERENCES.md)

For the status model, SAP documentation exposes standard fields including `AUFK-AUFNR`, `JEST-STAT`, `JEST-INACT`, `JEST-CHGNR`, `JEST-OBJNR` and `JSTO-STSMA`.

## What this track demonstrates

- SAP IS-U / Work Management operational troubleshooting;
- work-order lifecycle and status reasoning;
- preventive `AUFTRAG` number-range administration;
- governed SAP GUI Scripting batch operations;
- Device Management and status regularization;
- CRM ↔ IS-U / WM and GIS ↔ SAP integration support;
- MM ↔ WM configuration consistency;
- background-job and controlled batch-process governance;
- original classic-ABAP read-only diagnostic design;
- bilingual technical and operational documentation.

## Technical and confidentiality boundary

Public evidence documents standard read-only diagnostic objects and original portfolio source only. It does not publish direct manipulation shortcuts, proprietary `Z*` implementations, credentials, real orders/installations/contracts/meters/CUEN/users, internal endpoints or unsanitized enterprise screenshots.

The ABAP status-audit source remains source/static evidence with reproducible verification guidance. No corporate runtime result is attributed where no actual execution record exists.