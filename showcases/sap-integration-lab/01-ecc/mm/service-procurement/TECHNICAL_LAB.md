# ECC MM Technical Lab — Read-Only Contract Audit

> **Evidence classification:** `REVIEWABLE_SOURCE / STATIC_SCENARIO_VALIDATION / REPRODUCIBLE_BUILD_GUIDE`

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

Supporting exception: `ZCX_MM_CONTRACT_NOT_FOUND`.

## Standard ECC boundary

The ECC datasource reads only transparent purchasing-contract information required by this diagnostic.

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

The source does not traverse service-package hierarchy; that capability is outside the artifact's stated scope.

## Transparent diagnostic outcomes

- `ACTIVE`
- `EXPIRING_SOON`
- `EXPIRED`
- `NOT_YET_VALID`
- `INVALID_VALIDITY`
- `VALIDITY_INCOMPLETE`
- `NO_ITEMS`

The service also exposes `days_to_expiry` and preserves target-value/target-item indicators returned by the datasource.

## Selection screen

The executable report audits **one contract at a time** using:

- purchasing contract
- key date
- warning days

This keeps the result deterministic and explainable.

## ABAP Unit source

Eight deterministic scenarios are versioned:

1. active agreement
2. expiring agreement
3. expired agreement
4. not-yet-valid agreement
5. invalid validity interval
6. incomplete validity
7. no active items
8. target indicators preserved

Source-level review: **8/8 consistent / 0 mismatches**. This is not represented as an executed SAP runtime result.

## Security and governance

- read-only Open SQL
- no `UPDATE`, `INSERT`, database `MODIFY` or `DELETE`
- no `BAPI_TRANSACTION_COMMIT`
- no document creation/change API
- no copied internal `Z*` implementation
- no enterprise identifiers or values

## Reproducibility

- [Build Guide](./BUILD_GUIDE.md)
- [Guía de construcción](./BUILD_GUIDE.es.md)
- [Static Validation](./STATIC_VALIDATION.md)
- [Evidence Record](./EVIDENCE.md)
- [`source/`](./source/)

## Evidence represented

This directory represents implemented source, reviewed deterministic scenarios, a SALV report design and reproducible construction/verification documentation. It does not present unobserved enterprise runtime as completed evidence.
