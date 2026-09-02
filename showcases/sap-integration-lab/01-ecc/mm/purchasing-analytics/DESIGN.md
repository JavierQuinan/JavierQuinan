# Design — `ZMM_PURCH_ANALYTICS`

> **Status:** `DESIGN_READY`

Planned source architecture:

```text
ZMM_PURCH_ANALYTICS
        │
        ▼
ZMM_PURCH_ANALYTICS_REPORT
        │
        ▼
ZCL_MM_PURCH_ANALYTICS_SERVICE
        │
        ▼
ZIF_MM_PURCH_SOURCE
   ┌──────────┴──────────┐
   ▼                     ▼
ECC datasource        Demo datasource
EBAN/EKKO/EKPO/EKET   synthetic records
```

## First source boundary

Read-only visibility only.

Planned outputs:

- purchase requisition number/item
- purchase order number/item when a safe standard relationship is available
- purchasing organization/group context
- material or short-text context without publishing real values
- document/date context
- item count
- schedule-line count and delivery-date visibility
- diagnostic state for missing/partial downstream linkage

## Diagnostic states planned

- `PR_ONLY`
- `PR_WITH_PO`
- `PO_WITHOUT_SCHEDULE`
- `PO_WITH_SCHEDULE`
- `REFERENCE_GAP`

These labels are portfolio diagnostics, not SAP standard document statuses.

## Non-goals

The first version will not:

- create/change PRs or POs
- release purchasing documents
- simulate MRP
- calculate commitments
- traverse service packages
- modify source lists/info records
- claim S/4HANA Clean Core behavior

## Test strategy

A demo datasource will drive deterministic vectors without SAP data dependency. The ECC datasource will remain independently reviewable and read-only.
