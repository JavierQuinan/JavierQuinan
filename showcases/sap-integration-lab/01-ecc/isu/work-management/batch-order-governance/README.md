# SAP ECC IS-U / WM — Batch Work-Order Closure Governance

[Versión en español](./README.es.md)

> **Evidence type:** sanitized operational automation/governance guide  
> **Status:** `FUNCTIONAL_EVIDENCE_READY`  
> **Scope:** controlled batch closure/cancellation of eligible work orders

This evidence documents the controls around a batch process used to prevent field execution of work orders that remain open but have no operational work-center assignment.

The public artifact does **not** publish the original spreadsheet/script implementation, enterprise order numbers, environment details or proprietary automation code. The focus is governance: eligibility, pre-validation, controlled execution, per-record results and independent SAP post-validation.

## Eligibility gate

A work order enters the batch only when all required criteria are true:

- it remains in the configured open/pending state;
- no operational work center is assigned;
- the order identifier has been validated;
- closure/cancellation is the approved business objective.

## Controlled flow

```text
candidate work orders
        │
        ▼
validate eligibility in SAP
        │
        ▼
prepare bounded input set
        │
        ▼
check duplicates / blanks / range
        │
        ▼
authorize SAP GUI Scripting
        │
        ▼
execute without concurrent session work
        │
        ▼
capture result per work order
        │
        ▼
independently validate final SAP state
```

## Supplied template evidence

The source guide documents a controlled spreadsheet where:

- `C2` defines the first row;
- `C3` defines the last row;
- column A marks selected records;
- column B contains the work-order identifier;
- column D stores the execution result.

Real order identifiers are omitted from the public artifact.

Before execution, the range is checked for blanks, duplicates and unintended selected rows.

## Execution discipline

The process runs with SAP open and an authorized template. SAP GUI requests confirmation when a script attempts to access the active session.

Reproducible controls:

1. keep the SAP session active;
2. explicitly authorize GUI scripting access when prompted;
3. do not interrupt the batch mid-run;
4. avoid unrelated concurrent operations in the same session;
5. capture per-record outcome, not only a global completion message.

## Result interpretation

The supplied evidence shows a processing status and a successful execution result per order. The public version preserves the semantics rather than real identifiers:

```text
selected record
    │
    ▼
processed by automation
    │
    ▼
success / error message
    │
    ▼
independent SAP validation
```

A finished script is not proof that every work order reached the desired state.

## Post-validation and retries

If a record fails:

1. preserve the sanitized error;
2. re-check eligibility;
3. confirm current status and work-center assignment;
4. diagnose before retry;
5. avoid blind mass re-execution.

## Documented limitation

The source guide states that the automation cannot add an explanatory observation during closure/cancellation. Additional traceability therefore belongs in the authorized institutional mechanism.

## Confidentiality boundary

Not published:

- original Excel/VBA implementation;
- real work-order numbers;
- system/client names;
- usernames or companies;
- internal automation paths;
- unsanitized productive screenshots.

## What this demonstrates

- mass-processing governance;
- eligibility-rule design;
- preflight validation;
- operational SAP GUI Scripting knowledge;
- per-record error control;
- post-execution verification;
- operational-risk reduction;
- traceability and retry discipline.