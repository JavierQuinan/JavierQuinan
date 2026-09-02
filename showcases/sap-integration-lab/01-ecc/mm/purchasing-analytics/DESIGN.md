# Design — `ZMM_PURCH_ANALYTICS`

> **Evidence classification:** `REVIEWABLE_SOURCE / STATIC_SCENARIO_VALIDATION`

Implemented source architecture:

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

## Source boundary

Read-only visibility only.

The ECC datasource starts from one Purchase Requisition item (`BANFN/BNFPO`), preserves its optional `EBELN/EBELP` reference, resolves only `EKKO` category `BSTYP = 'F'` as a Purchase Order, then reads the referenced `EKPO` item and `EKET` delivery-date context.

## Implemented outputs

- purchase requisition number/item
- PR date and requested-delivery date
- material / plant / purchasing group
- purchase order number/item when present
- PO document date
- vendor / purchasing organization
- order quantity / unit
- schedule-line count
- earliest/latest `EKET-EINDT`
- diagnostic state

## Diagnostic states

- `PR_ONLY`
- `REFERENCE_GAP`
- `PO_WITHOUT_SCHEDULE`
- `PO_WITH_SCHEDULE`
- `PR_DELETED`
- `PO_ITEM_DELETED`

These labels are portfolio diagnostics, not SAP standard document statuses.

## Decision rules

1. PR deletion indicator takes precedence → `PR_DELETED`.
2. No downstream PO reference → `PR_ONLY`.
3. PO reference exists but category-F header/item cannot be resolved → `REFERENCE_GAP`.
4. Referenced PO item is marked for deletion → `PO_ITEM_DELETED`.
5. Resolved PO item with no schedule lines → `PO_WITHOUT_SCHEDULE`.
6. Resolved PO item with schedule-line context → `PO_WITH_SCHEDULE`.

## Scope exclusions

This artifact does not:

- create/change PRs or POs
- release purchasing documents
- simulate MRP
- calculate commitments
- traverse service packages
- calculate goods-receipt completion
- modify source lists/info records
- claim S/4HANA Clean Core behavior

These are explicit scope boundaries, not promised extensions.

## Test strategy

A demo datasource supports a synthetic end-to-end source/service scenario. Six additional snapshot scenarios isolate the decision rules. All seven are documented as source/static evidence rather than executed SAP ABAP Unit runtime evidence.
