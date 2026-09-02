# SAP ECC Materials Management (MM) — Evidence Track

[Versión en español](./README.es.md)

> **Scope:** SAP ECC / classic MM only  
> **Current maturity:** functional evidence published; technical packs in construction

This track is intentionally separated from SAP S/4HANA. It documents classic MM functional knowledge and ABAP engineering patterns appropriate for ECC scenarios.

## Evidence layers

### Functional / operational evidence

A sanitized public evidence layer is now available under [`functional-evidence`](./functional-evidence/). It is derived from real operational guides covering material extension, work-order material consumption and troubleshooting of material/supplier organizational dependencies.

The original guides remain private; real identifiers, customer configuration, screenshots and proprietary values are not published.

### Technical ABAP evidence

Planned and active technical packs:

1. **Inventory & Stock Risk** — stock, reorder point, safety stock, datasource abstraction, OO service, executable report and ABAP Unit.
2. **Purchasing Analytics** — purchase requisitions, purchase orders, positions/schedules and analytical transformations.
3. **Service Procurement** — service-oriented procurement scenarios, validations and reporting.

## Technical boundary

ECC evidence may use classic objects and Open SQL when appropriate. Any direct-table implementation is labelled ECC/classic evidence and is not represented as a Clean Core S/4HANA pattern.

The Inventory & Stock Risk pack is a diagnostic portfolio application. It does not claim to reproduce SAP MRP planning logic.

No employer/customer source or configuration is copied into this lab.

## Runtime rule

A source artifact only becomes `RUNTIME_VALIDATED` after successful SAP activation and execution are documented in its `EVIDENCE.md`. ABAP Unit results are required before a test claim becomes `TEST_VALIDATED`.
