# SAP ECC IS-U / Work Management — Work Order Status Audit

[Versión en español](./README.es.md)

> **Evidence type:** sanitized technical troubleshooting guide  
> **Status:** `FUNCTIONAL_TECHNICAL_EVIDENCE_READY`  
> **Runtime claim:** no custom ABAP artifact is claimed as executed

This guide documents a reproducible, read-only troubleshooting method for determining the actual status of a work order, distinguishing active status from historical status and isolating whether a discrepancy belongs to the standard SAP status object or to a custom presentation/selection layer.

## Safety rule

This procedure is diagnostic.

- Do not directly change status records through table viewers.
- Do not delete historical status data.
- Do not manipulate `INACT` or status codes manually.
- Any correction must use an authorized functional process, approved application logic or controlled transport/change process.

## Diagnostic flow

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
JCDS — reconstruct status change history
              │
              ▼
Compare standard object with custom UI/monitor
              │
       ┌──────┴──────┐
       ▼             ▼
standard wrong    custom layer wrong
       │             │
functional flow   SE93 → SE38/SE80 → ST05/SAT
```

## Standard objects

| Object | Relationship | Diagnostic use |
|---|---|---|
| `AUFK` | `AUFNR -> OBJNR` | Work-order header and technical status-object entry point |
| `AFIH` | `AUFNR` | PM/maintenance-order header context when relevant |
| `JEST` | `OBJNR + STAT` | System and user status records; `INACT` determines active/inactive state |
| `JSTO` | `OBJNR` | Status object control and status profile (`STSMA`) |
| `TJ02T` | system status + language | System-status text resolution |
| `TJ30T` | `STSMA + user status + language` | User-status text resolution within the correct profile |
| `JCDS` | `OBJNR + STAT + CHGNR` | Status activation/deactivation history and change context |

## Critical interpretation rule

A status code alone is not enough.

- `INACT` initial/blank → active status in the inspected record.
- `INACT = X` → inactive/historical record.
- `I....` → system-status family.
- `E....` → user-status family.
- A user-status code must be interpreted with the relevant `STSMA` profile; the same internal code must not be assumed to mean the same thing across profiles.

## Step-by-step troubleshooting

### 1. Functional baseline — `IW33`

Open the work order and record the visible status overview, technical-completion context, dates, order type and other relevant control data.

### 2. Resolve the status object — `AUFK`

Read the work-order header by order number and obtain `OBJNR`. Use the stored technical object identifier instead of manually constructing it when available.

### 3. Read active and historical status — `JEST`

First inspect active records (`INACT` initial). Then compare with the complete history including inactive records. Never interpret a historical row as the current state.

### 4. Resolve texts

For system statuses, resolve the text through the appropriate system-status text source such as `TJ02T` for the active logon language.

For user statuses:

1. read `JSTO` for the order status object;
2. obtain `STSMA`;
3. resolve the user status within that profile through `TJ30T`.

### 5. Reconstruct the change sequence — `JCDS`

Sort the relevant change records chronologically and inspect status, activation/inactivation, date/time and available transaction/user context. The objective is to determine which business process, job, workflow or transaction changed the status.

### 6. Compare with the reported custom surface

If the standard status object is correct but a custom monitor/interface shows a different state, investigate the custom selection logic rather than changing the standard order.

### 7. Trace the custom layer when required

Use a controlled technical sequence:

```text
SE93
  ↓ identify executable object
SE38 / SE80
  ↓ inspect selection/status logic
ST05
  ↓ observe accessed tables/SQL for one reproducible case
SAT
  ↓ inspect runtime call flow when SQL trace is insufficient
SU53
  ↓ check authorization failure when results differ by user/access
```

## Typical diagnostic matrix

| Finding | Interpretation | Next action |
|---|---|---|
| Target status active in `JEST` | Status really is active | Review the functional process that should have changed it |
| Target status inactive in `JEST`, custom screen still shows it | Likely stale/historical/custom selection issue | Review `INACT`, historical selection and custom logic |
| Target status absent from `JEST` | Custom layer may derive it elsewhere | Trace custom tables, RFC/proxy/workflow or calculated logic |
| Technical completion active and pending-treatment user status inactive | Standard order status is internally consistent | Escalate only the custom display/processing discrepancy |
| Different result by user | Authorization, variant, organizational scope or buffering may differ | Compare variants, `SU53`, parameters and controlled trace |

## ABAP application guidance

When building application logic, prefer standard status APIs where appropriate rather than reproducing status semantics through uncontrolled direct-table logic. Candidate APIs must be verified in the installed ECC release before production use.

Direct table reads in this document are explicitly **diagnostic/read-only evidence**.

## Public evidence boundary

The source guide contained real order identifiers and a named custom transaction. They are intentionally excluded here.

Never publish:

- real work-order numbers
- installation or contract-account identifiers
- internal custom transaction names when not required
- usernames
- customer/company configuration
- internal screenshots
- direct table-editing procedures

## What this proves

- SAP work-order status model troubleshooting
- standard vs. user status separation
- active vs. historical-state analysis
- status-profile awareness
- change-document reconstruction
- transaction-to-code tracing
- SQL/runtime diagnostics
- security-aware escalation discipline
