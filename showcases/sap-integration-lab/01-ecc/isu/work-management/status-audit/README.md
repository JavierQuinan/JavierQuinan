# SAP ECC IS-U / Work Management — Work Order Status Audit

[Versión en español](./README.es.md)

> **Evidence:** sanitized operational troubleshooting · original read-only ABAP source · deterministic source review

This evidence pack combines a sanitized troubleshooting method derived from operational guidance with an original ABAP engineering lab that audits the standard SAP work-order status model without changing data.

## Functional diagnostic flow

```text
Reported work-order status problem
              │
              ▼
IW33 — establish functional baseline
              │
              ▼
AUFK — resolve AUFNR → OBJNR
              │
              ▼
JEST — active + historical status records
              │
        ┌─────┴─────┐
        ▼           ▼
 System status   User status
   I....            E....
        │           │
        ▼           ▼
     TJ02T      JSTO → STSMA → TJ30T
        │           │
        └─────┬─────┘
              ▼
JCDS — change-history context
```

Critical interpretation rules:

- `INACT` initial → active record;
- `INACT = X` → inactive/historical record;
- `I....` → system-status family;
- `E....` → user-status family;
- user status is interpreted with the applicable `STSMA` profile.

## Original ABAP artifact

```text
ZWM_STATUS_AUDIT_LAB
        │
        ▼
ZWM_STATUS_AUDIT_REPORT
        │
        ▼
ZCL_WM_STATUS_AUDIT_SERVICE
        │
        ▼
ZIF_WM_STATUS_SOURCE
   ┌─────────┴─────────┐
   ▼                   ▼
ECC datasource      Demo datasource
   │
   ├── AUFK
   ├── JSTO
   ├── JEST
   ├── TJ02T
   ├── TJ30T
   └── JCDS
```

Reviewable source: [`source/`](./source/)

## ECC datasource scope

| Object | Purpose |
|---|---|
| `AUFK` | resolve order number to `OBJNR` |
| `JSTO` | obtain `STSMA` status profile |
| `JEST` | active and historical status records |
| `TJ02T` | resolve system-status text |
| `TJ30T` | resolve user-status text within the profile |
| `JCDS` | change count and latest change timestamp |

The public lab excludes historical user/TCode output and all write operations.

## Diagnostic outcomes

The service reports structural audit conditions only:

- `OK`
- `NO_ACTIVE_STATUS`
- `USER_PROFILE_MISSING`
- `TEXT_RESOLUTION_GAP`

`OK` does **not** mean a work order is functionally correct. It means the status snapshot is structurally resolvable by this audit logic.

## Deterministic scenario review

Six ABAP Unit scenarios are versioned and traced consistently at source level:

1. resolved active system status → `OK`;
2. historical-only records → `NO_ACTIVE_STATUS`;
3. active user status without `STSMA` → `USER_PROFILE_MISSING`;
4. active status without text → `TEXT_RESOLUTION_GAP`;
5. active and historical records counted separately;
6. change-summary metadata preserved.

```text
Scenarios reviewed: 6
Consistent:         6
Mismatches:         0
```

This is source/static review, not a claim of ABAP Unit execution inside a corporate SAP system.

## SALV output

The report source exposes:

- order / status object;
- status profile;
- status code and system/user classification;
- active vs. historical state;
- status texts;
- change number;
- summary counts;
- latest change date/time;
- diagnostic result.

## Reproducible evidence

- [Build Guide — English](./BUILD_GUIDE.md)
- [Guía de Construcción — Español](./BUILD_GUIDE.es.md)
- [Evidence Record](./EVIDENCE.md)
- [Static Validation](./STATIC_VALIDATION.md)

The build guide documents `SE24`, `SE38` and `SE93` object creation and report-transaction setup.

## What this evidence demonstrates

- SAP work-order status-model troubleshooting;
- system vs. user status separation;
- active vs. historical interpretation;
- `STSMA`-aware status resolution;
- change-history awareness;
- classic ABAP Objects design;
- ECC/synthetic datasource abstraction;
- deterministic scenario design;
- SALV reporting;
- security-aware public documentation.

## Security / evidence boundary

The public evidence excludes real work-order numbers, installations, contract accounts, customer/company identifiers, usernames, SID/client, internal URLs, transport IDs, proprietary custom transaction source and direct table-editing procedures.

The artifact is read-only and contains no `UPDATE`, `INSERT`, database `MODIFY`, `DELETE` or commit operation.

The repository presents source/static evidence and reproducible construction instructions; it does not claim activation or execution of these custom objects in a specific corporate SAP system.
