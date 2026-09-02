# SAP ECC IS-U / Work Management — Work Order Status Audit

[Versión en español](./README.es.md)

> **Evidence type:** sanitized operational troubleshooting + original read-only ABAP source  
> **Status:** `FUNCTIONAL_TECHNICAL_EVIDENCE_READY / SOURCE_READY / STATIC_VALIDATED / RUNTIME_DEFERRED`  
> **Runtime claim:** no SAP activation or ABAP Unit runtime is claimed

This evidence pack combines a sanitized troubleshooting method derived from real operational guidance with an original ABAP engineering lab that audits the standard SAP work-order status model without changing data.

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

- `INACT` initial → active record
- `INACT = X` → inactive/historical record
- `I....` → system-status family
- `E....` → user-status family
- user status must be interpreted with the applicable `STSMA` profile

## Original ABAP technical artifact

Transaction target:

`ZWM_STATUS_AUDIT_LAB`

Executable report:

`ZWM_STATUS_AUDIT_REPORT`

Architecture:

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

Reviewable source lives under [`source/`](./source/).

## What the ECC datasource reads

| Object | Purpose |
|---|---|
| `AUFK` | resolve order number to `OBJNR` |
| `JSTO` | obtain `STSMA` status profile |
| `JEST` | active and historical status records |
| `TJ02T` | resolve system-status text |
| `TJ30T` | resolve user-status text within the profile |
| `JCDS` | change count and latest change timestamp |

The public lab deliberately excludes historical user/TCode output and all write operations.

## Diagnostic outcomes

The service reports only structural audit conditions:

- `OK`
- `NO_ACTIVE_STATUS`
- `USER_PROFILE_MISSING`
- `TEXT_RESOLUTION_GAP`

`OK` does **not** mean the work order is functionally correct. It only means the inspected status snapshot is structurally resolvable by this audit logic.

## Static validation

Six deterministic ABAP Unit vectors are prepared and traced consistently at source level:

1. resolved active system status → `OK`
2. historical-only records → `NO_ACTIVE_STATUS`
3. active user status without `STSMA` → `USER_PROFILE_MISSING`
4. active status without text → `TEXT_RESOLUTION_GAP`
5. active and historical records counted separately
6. change-summary metadata preserved

Result:

```text
Vectors reviewed: 6
Consistent:       6
Mismatches:       0
```

This is **static/source validation**, not SAP ABAP Unit runtime.

## SALV output

The executable report is designed to expose:

- order / status object
- status profile
- status code and system/user classification
- active vs. historical state
- status texts
- change number
- summary counts
- latest change date/time
- diagnostic result

## Reproduction

- [Build Guide — English](./BUILD_GUIDE.md)
- [Guía de Construcción — Español](./BUILD_GUIDE.es.md)
- [Evidence Record](./EVIDENCE.md)
- [Static Validation](./STATIC_VALIDATION.md)

The documented build sequence uses `SE24`, `SE38` and `SE93` and keeps runtime status at `RUNTIME_DEFERRED` until an authorized SAP DEV/sandbox is available.

## Security / public boundary

Never publish:

- real work-order numbers
- installations or contract accounts
- customer/company identifiers
- usernames, SID/client, URLs or transport IDs
- internal proprietary transaction names/source
- direct table-editing procedures
- screenshots that contain enterprise data or third-party material without publication rights

The artifact is read-only and contains no `UPDATE`, `INSERT`, `MODIFY`, `DELETE` or commit operation.

## What this demonstrates

- SAP work-order status-model troubleshooting
- system vs. user status separation
- active vs. historical interpretation
- `STSMA`-aware status resolution
- change-history awareness
- classic ABAP OO source design
- datasource abstraction and synthetic testing
- SALV reporting
- security-conscious public evidence boundaries
