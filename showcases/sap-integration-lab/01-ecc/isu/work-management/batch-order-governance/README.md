# SAP ECC IS-U / WM — Batch Work-Order Closure Governance

[Versión en español](./README.es.md)

> **Evidence type:** sanitized operational automation/governance guide  
> **Status:** `FUNCTIONAL_EVIDENCE_READY`  
> **Scope:** controlled batch closure/cancellation of eligible work orders

This evidence documents the controls around a batch process used to prevent execution of work orders that remain open but are not assigned to an operational work center.

The public artifact intentionally does **not** publish the original spreadsheet/script implementation, internal order numbers, environment details or enterprise automation code. The focus is governance: eligibility, pre-validation, controlled execution, per-record results and post-validation in SAP.

## Eligibility gate

A work order enters the batch only when all required conditions are true.

Example source-derived criteria:

- order remains in the configured open/pending state
- no operational work center is assigned
- order identifier is known and validated
- closing/cancelling it is the approved business objective

If a record does not meet every criterion, it must be excluded from the batch.

## Controlled batch flow

```text
Candidate work orders
        │
        ▼
Eligibility validation in SAP
        │
        ▼
Prepare bounded input set
        │
        ▼
Check duplicates / blanks / range
        │
        ▼
Authorize automation access
        │
        ▼
Execute batch without concurrent user actions
        │
        ▼
Capture result per work order
        │
        ▼
Validate final status in SAP
        │
    ┌───┴────┐
    ▼        ▼
Success    Failure
    │        │
close log  preserve error + diagnose before retry
```

## Pre-execution controls

Before the batch starts:

1. verify each order still satisfies the functional eligibility criteria;
2. remove duplicates;
3. ensure the selected processing range contains only intended rows;
4. exclude blank/ambiguous records;
5. avoid unrelated concurrent work in the same SAP session;
6. execute only from an authorized automation source;
7. prefer a controlled time window when batch locking could affect other processes.

## Execution discipline

The source process uses SAP GUI automation initiated from a controlled spreadsheet/template.

Public lessons:

- the SAP session must remain active;
- the user must explicitly authorize GUI scripting access when prompted;
- the process should not be interrupted mid-batch;
- results must be captured per record rather than only as a global success message.

## Per-record result model

A professional batch should expose at least:

```text
input order
selected? yes/no
processing status
result code/message
validation status
retry/escalation decision
```

Do not treat “script finished” as proof that every work order reached the desired SAP state.

## Post-validation

After execution, independently verify the resulting work-order state in SAP.

If a record fails:

1. preserve the sanitized error message;
2. re-check eligibility;
3. confirm current order status and assignment;
4. diagnose the cause before retrying;
5. avoid blind mass re-execution.

## Automation limitations

The source guide notes that the automation cannot add an explanatory observation to the work order during closure/cancellation. Therefore, additional traceability must be stored through the authorized institutional mechanism rather than assumed to exist in the batch tool.

## Future engineering lab

A modern public lab can reproduce the governance pattern using synthetic orders:

```text
CSV/JSON batch input
     │
     ▼
validator
     │
     ▼
dry-run / eligibility matrix
     │
     ▼
command executor abstraction
     │
     ▼
per-item result log
     │
     ▼
idempotent retry queue
     │
     ▼
audit report
```

This future implementation would demonstrate batch safety, idempotency, auditability and error isolation without interacting with any real enterprise SAP system.

## Confidentiality boundary

Not published:

- original Excel/VBA script
- enterprise order numbers
- system/client names
- usernames
- company names
- internal automation paths
- production screenshots

## What this proves

- mass-processing governance
- eligibility-rule design
- preflight validation
- SAP GUI automation awareness
- per-item error handling
- post-execution verification
- operational risk reduction
- audit/traceability thinking
