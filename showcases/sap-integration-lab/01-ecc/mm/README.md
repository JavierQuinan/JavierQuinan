# SAP ECC Materials Management (MM) — Evidence Track

[Versión en español](./README.es.md)

> **Scope:** SAP ECC / classic MM only  
> **Current maturity:** evidence track in construction

This track is intentionally separated from SAP S/4HANA. It documents classic MM functional knowledge and ABAP engineering patterns that are appropriate for ECC scenarios.

## Planned evidence packs

1. **Inventory & Reorder** — stock, reorder point, safety stock, OO service logic, report and ABAP Unit.
2. **Purchasing Analytics** — purchase requisitions, purchase orders, positions/schedules and analytical transformations.
3. **Service Procurement** — service-oriented procurement scenarios, validations and reporting.

## Technical boundary

ECC evidence may use classic objects and Open SQL when appropriate. Any direct-table implementation will be labelled as ECC/classic evidence and will not be represented as a Clean Core S/4HANA pattern.

No employer/customer source or configuration is copied into this lab.

## Runtime rule

A source artifact only becomes `RUNTIME_VALIDATED` after successful SAP activation and execution are documented in its `EVIDENCE.md`.
