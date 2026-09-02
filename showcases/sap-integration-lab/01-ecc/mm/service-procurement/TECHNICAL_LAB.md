# ECC MM Technical Lab — Read-Only Contract Audit

> **Status:** `SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

This lab transforms functional framework-contract knowledge into reviewable ABAP engineering evidence without creating or changing purchasing documents.

## Artifact

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
   ├── ZCL_MM_CONTRACT_SOURCE_ECC  → EKKO / EKPO
   └── ZCL_MM_CONTRACT_SOURCE_DEMO → synthetic data
```

Supporting exception:

`ZCX_MM_CONTRACT_NOT_FOUND`

## Standard ECC boundary

The ECC datasource reads only transparent purchasing-contract information needed for this first diagnostic:

### EKKO

- contract/purchasing document
- vendor
- purchasing organization
- document type/category
- validity start/end
- currency
- target value

### EKPO

- active item count
- target-quantity indicator count
- target-value indicator count

Only purchasing documents with category `BSTYP = 'K'` are accepted. Deleted items are excluded from item counts.

No service-package hierarchy is traversed in this version.

## Transparent diagnostic outcomes

- `ACTIVE`
- `EXPIRING_SOON`
- `EXPIRED`
- `NOT_YET_VALID`
- `INVALID_VALIDITY`
- `VALIDITY_INCOMPLETE`
- `NO_ITEMS`

The service also exposes `days_to_expiry` and preserves target-value/target-item indicators returned by the datasource.

## First-version selection screen

The first executable report intentionally audits **one contract at a time**:

- purchasing contract
- key date
- warning days

This keeps the result deterministic and explainable. Multi-contract/vendor/purchasing-organization monitoring is a future extension.

## ABAP Unit source

Eight deterministic test vectors are versioned:

1. active agreement
2. expiring agreement
3. expired agreement
4. not-yet-valid agreement
5. invalid validity interval
6. incomplete validity
7. no active items
8. target indicators preserved

Source-level review: **8/8 consistent**. This is not an SAP runtime test claim.

## Security and governance

- read-only Open SQL
- no `UPDATE`, `INSERT`, `MODIFY` or `DELETE`
- no `BAPI_TRANSACTION_COMMIT`
- no document creation/change API
- no copied internal `Z*` implementation
- no enterprise identifiers or values
- SAP runtime remains deferred until an authorized DEV/sandbox is available

## Reproducibility

- [Build Guide](./BUILD_GUIDE.md)
- [Guía de construcción](./BUILD_GUIDE.es.md)
- [Static Validation](./STATIC_VALIDATION.md)
- [Evidence Record](./EVIDENCE.md)
- [`source/`](./source/)

## Evidence gate

`DESIGN_READY -> SOURCE_READY -> STATIC_VALIDATED -> EXECUTION_PROCEDURE_READY -> RUNTIME_DEFERRED/RUNTIME_VALIDATED -> TEST_VALIDATED`
