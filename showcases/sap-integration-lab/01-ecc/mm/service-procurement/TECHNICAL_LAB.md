# ECC MM Technical Lab — Read-Only Contract Audit

> **Status:** `DESIGN_READY / SOURCE_NOT_YET_IMPLEMENTED`

This lab is intentionally read-only. Its purpose is to transform functional knowledge of framework contracts into ABAP engineering evidence without creating or changing purchasing documents.

## Target

Custom report transaction:

`ZMM_CONTRACT_AUDIT`

Executable report:

`ZMM_CONTRACT_AUDIT_REPORT`

## Planned architecture

```text
ZMM_CONTRACT_AUDIT
        │
        ▼
ZMM_CONTRACT_AUDIT_REPORT
        │
        ▼
ZCL_MM_CONTRACT_AUDIT_SERVICE
        │
        ▼
ZIF_MM_CONTRACT_SOURCE
   ├── ZCL_MM_CONTRACT_SOURCE_ECC
   └── ZCL_MM_CONTRACT_SOURCE_DEMO
```

## Standard ECC boundary

The first source implementation will be limited to purchasing-document information that can be safely explained from the standard ECC contract model, primarily `EKKO` and `EKPO`.

No service-package table relationship will be implemented until it is separately verified for the target ECC release and the selected service-procurement scenario.

## Diagnostic outcomes

Planned transparent states:

- `ACTIVE`
- `EXPIRING_SOON`
- `EXPIRED`
- `INVALID_VALIDITY`
- `NO_ITEMS`

The report will not claim to replace release strategy, commitment consumption, source determination, pricing, service entry or procurement controls.

## Selection screen

Planned safe filters:

- purchasing document / contract (optional)
- vendor (optional)
- validity date range
- purchasing organization (optional)
- status filter

Public screenshots, if ever added, must use synthetic identifiers.

## ABAP Unit design

Deterministic vectors planned:

1. valid agreement with future end date → `ACTIVE`
2. agreement within configurable warning window → `EXPIRING_SOON`
3. end date before key date → `EXPIRED`
4. end date before start date → `INVALID_VALIDITY`
5. agreement with no items → `NO_ITEMS`
6. demo datasource returns multiple contracts without SAP data dependency

## Security and governance

- read-only Open SQL
- no `UPDATE`, `INSERT`, `MODIFY` or `DELETE`
- no `BAPI_TRANSACTION_COMMIT`
- no direct document creation
- no internal Z transaction reuse
- no copied employer/customer code
- source remains `PLANNED` until actual ABAP files exist
- runtime remains unclaimed until authorized execution evidence exists

## Future promotion gate

`DESIGN_READY -> SOURCE_READY -> STATIC_VALIDATED -> RUNTIME_DEFERRED/RUNTIME_VALIDATED -> TEST_VALIDATED`
