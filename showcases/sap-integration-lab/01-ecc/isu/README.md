# SAP ECC IS-U / Work Management — Evidence Track

[Versión en español](./README.es.md)

> **Scope:** SAP ECC IS-U / Work Management / CRM integration  
> **Current maturity:** multiple sanitized functional/technical evidence packs published; ABAP labs planned

This track is intentionally independent from S/4HANA. It converts operational utilities experience into reviewable evidence while removing customer/company configuration and real identifiers.

## Published evidence map

### Work Management operations

[Work Management Operations](./functional-evidence/work-management-operations/README.md)

Covers `IW38`, work-order lifecycle, individual/mass creation concepts, `IW32` assignment/release/completion, automated planning, `SM37` monitoring and CRM↔WM process dependencies.

### Work Order Status Audit

[Work Order Status Audit](./work-management/status-audit/README.md)

Advanced read-only troubleshooting using:

- `IW33`
- `AUFK -> OBJNR`
- `JEST` active/historical records
- `JSTO -> STSMA`
- `TJ02T` / `TJ30T`
- `JCDS`
- `SE93`, `SE38`, `SE80`, `ST05`, `SAT`, `SU53`

### Batch Work-Order Governance

[Batch Work-Order Closure Governance](./work-management/batch-order-governance/README.md)

Documents eligibility gates, bounded input, duplicate/range checks, SAP GUI scripting awareness, per-record results and mandatory post-validation. The enterprise spreadsheet/script itself is not published.

### Seal Material Enablement — MM ↔ WM

[Seal Material Enablement](./work-management/seals-material-enablement/README.md)

Shows the difference between a material being available in MM and being enabled/configured for a downstream Seal Management / work-order process.

### Equipment Consistency — IS-U ↔ CRM

[Equipment Consistency](./device-management/pec-equipment-consistency/README.md)

Documents the rule that technical equipment assignment and commercial/product representation must remain consistent, and that business-level changes should follow the CRM process instead of technical shortcuts.

### Photovoltaic Service Onboarding

[Photovoltaic Service Onboarding](./master-data/photovoltaic-service-onboarding/README.md)

Sanitized chain:

`external/GIS context -> connection object -> point of supply -> installation -> CRM customer/commercial context -> specialized service contract`.

### CRM ↔ IS-U Contract-End Recovery

[Contract-End / DCDE Recovery](./crm-isu-integration/dcde-recovery/README.md)

Shows process recovery when an incomplete CRM contract-end flow does not produce the expected downstream work order: restore the contract to a valid business state, then rerun the official process.

### Occasional Metered Service

[Occasional Metered Service](./crm-isu-integration/occasional-metered-service/README.md)

End-to-end CRM→WM→CRM evidence covering customer/agreement/contract setup, technical work-order execution, meter-related data, final operational status, technical completion and contract completion sequencing.

## Technical boundary

The public evidence may document standard read-only diagnostic objects, but it does not publish direct data-manipulation shortcuts, proprietary `Z*` implementation details, credentials or customer-specific process IDs.

No real installation, contract account, contract, business partner, device/meter, work order, CUEN/service identifier, customer address or employee data may appear publicly.

## Planned ABAP / engineering progression

1. synthetic Work Order Status Audit report/service
2. status API vs. direct diagnostic-read comparison
3. batch eligibility/idempotency lab with synthetic orders
4. MM↔Seal configuration consistency checker
5. CRM↔IS-U integration state-machine/compensation lab

Any ABAP artifact follows the SAP Evidence Governance gate. Source/static evidence remains separate from SAP runtime claims.
