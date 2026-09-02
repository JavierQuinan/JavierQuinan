# Static Validation — ECC IS-U / Work Management Status Audit

> **Validation date:** 2026-09-02  
> **Scope:** source-level deterministic review  
> **Result:** `6/6 scenarios consistent`  
> **Runtime boundary:** no SAP activation or executed ABAP Unit result is asserted here

## Standard model reviewed

The source follows the same read-only status relationship documented in the functional troubleshooting guide and SAP status extraction documentation:

```text
AUFK-AUFNR
    ↓
AUFK-OBJNR
    ├── JSTO-STSMA
    ├── JEST-STAT / INACT / CHGNR
    │      ├── system text → TJ02T
    │      └── user text   → TJ30T + STSMA
    └── JCDS → change count + latest change date/time
```

## Deterministic scenarios

| # | Scenario | Expected result | Source review |
|---|---|---|---|
| 1 | one active system status with resolved text | `OK`, active system = 1 | consistent |
| 2 | only historical/inactive status | `NO_ACTIVE_STATUS`, historical = 1 | consistent |
| 3 | active user status with no `STSMA` | `USER_PROFILE_MISSING` | consistent |
| 4 | active status without resolved text | `TEXT_RESOLUTION_GAP`, unresolved = 1 | consistent |
| 5 | one active + one inactive system status | active = 1, historical = 1, `OK` | consistent |
| 6 | synthetic status plus JCDS summary metadata | change count/date preserved | consistent |

```text
Scenarios reviewed: 6
Consistent:        6
Mismatches:        0
```

## Diagnostic precedence

The service uses this transparent precedence:

1. no active JEST record → `NO_ACTIVE_STATUS`
2. active user status but no status profile → `USER_PROFILE_MISSING`
3. active status whose text cannot be resolved → `TEXT_RESOLUTION_GAP`
4. otherwise → `OK`

`OK` means the **technical status snapshot is structurally resolvable by this lab**. It does not mean that the work order is functionally correct or that its lifecycle state is appropriate for the business process.

## Security boundary

The public source does not return or publish real work-order identifiers, users from change history, internal custom transaction codes, installations/contracts/accounts, production screenshots or direct status-modification procedures. The ECC datasource reads status/history tables only.

## Functional limits

The source does not decide whether an order should be technically complete, infer customer-specific status meaning beyond text resolution, reproduce workflow/event logic, change `JEST/JSTO/JCDS`, inspect proprietary Z tables, expose JCDS user/TCode fields or replace standard status APIs and functional process controls.

## Reproducible verification guide

The bilingual build guide documents object creation, syntax/activation checks, ABAP Unit execution, `SE38` report execution and `SE93` transaction configuration for an authorized ECC development/sandbox environment. Results are recorded only when directly observed and sanitized.

## Public evidence claim

> Read-only ECC IS-U / Work Management status-audit source using `AUFK/JSTO/JEST/TJ02T/TJ30T/JCDS`, six deterministic scenarios reviewed consistently, SALV reporting and a reproducible bilingual build/verification guide.
