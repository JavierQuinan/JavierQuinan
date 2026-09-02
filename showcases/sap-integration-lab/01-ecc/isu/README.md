# SAP ECC IS-U / Work Management — Evidence Track

[Versión en español](./README.es.md)

> **Scope:** SAP ECC IS-U / Work Management / CRM integration  
> **Current maturity:** sanitized functional/technical evidence published; first WM ABAP source pack static-validated

This track is intentionally independent from S/4HANA. It converts operational utilities experience into reviewable evidence while removing customer/company configuration and real identifiers.

## Published evidence map

### Work Management operations

[Work Management Operations](./functional-evidence/work-management-operations/README.md)

Covers `IW38`, work-order lifecycle, individual/mass creation concepts, `IW32` assignment/release/completion, automated planning, `SM37` monitoring and CRM↔WM process dependencies.

### Work Order Status Audit — functional + ABAP source

[Work Order Status Audit](./work-management/status-audit/README.md)

Status: `FUNCTIONAL_TECHNICAL_EVIDENCE_READY / SOURCE_READY / STATIC_VALIDATED / RUNTIME_DEFERRED`

Evidence:

- `IW33`
- `AUFK -> OBJNR`
- `JEST` active/historical records
- `JSTO -> STSMA`
- `TJ02T` / `TJ30T`
- `JCDS`
- original datasource abstraction
- ECC and demo datasources
- ABAP OO audit service
- SALV report
- six deterministic ABAP Unit vectors traced consistently at source level
- reproducible `SE24` / `SE38` / `SE93` build guide

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

Shows process recovery when an incomplete CRM contract-end flow does not produce the expected downstream work order.

### Occasional Metered Service

[Occasional Metered Service](./crm-isu-integration/occasional-metered-service/README.md)

End-to-end CRM→WM→CRM evidence covering customer/agreement/contract setup, technical work-order execution, meter-related data, final operational status, technical completion and contract completion sequencing.

## Technical boundary

The public evidence documents standard read-only diagnostic objects and original portfolio source only. It does not publish direct data-manipulation shortcuts, proprietary employer/customer `Z*` implementations, credentials or real process identifiers.

## Engineering progression

1. **completed:** `ZWM_STATUS_AUDIT_LAB` source/static evidence
2. compare standard status APIs vs. direct diagnostic reads when release/runtime is available
3. build `ZWM_ORDER_MONITOR_LAB` with synthetic/read-only order visibility
4. build batch eligibility/idempotency lab with synthetic orders
5. build MM↔Seal configuration-consistency checker
6. model CRM↔IS-U integration state/retry/compensation patterns

Any ABAP artifact follows SAP Evidence Governance. Static/source evidence remains separate from SAP runtime claims.
