# SAP ECC MM — Runtime Validation Execution Packet

[Versión en español](./RUNTIME_EXECUTION.es.md)

> **Current evidence status:** `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`  
> **Purpose:** preserve a complete, reproducible SAP runtime procedure for future execution in an authorized ECC DEV/sandbox.  
> **Important:** this document is a future execution runbook; it does not record a completed SAP runtime validation.

## Current closure of Task 2.1

The source-level stage is complete:

- source/hardening review completed
- six deterministic test vectors traced against the implementation: **6/6 static PASS**
- object-by-object build procedure documented
- runtime execution intentionally deferred because this portfolio exercise is not using enterprise development/CTS access

See [`STATIC_VALIDATION.md`](./STATIC_VALIDATION.md) for the trace record.

## Future runtime working rule

When an authorized SAP environment becomes available, validate **one object at a time**. Do not proceed until the current object passes Syntax Check and activation.

A sanitized result is enough:

```text
Object: ZCX_MM_STOCK_NOT_FOUND
Syntax: PASS
Activation: PASS
ECC release/EHP: <non-sensitive technical version only>
Notes: none
```

For failures, retain only the object, approximate line and SAP error text after removing sensitive identifiers.

## Validation sequence

| Step | Object | Tool | Future runtime gate |
|---|---|---|---|
| 2.1.1 | `ZCX_MM_STOCK_NOT_FOUND` | SE24 / SE80 | syntax + activation |
| 2.1.2 | `ZIF_MM_STOCK_SOURCE` | SE24 / SE80 | syntax + activation |
| 2.1.3 | `ZCL_MM_STOCK_SOURCE_DEMO` | SE24 / SE80 | syntax + activation |
| 2.1.4 | `ZCL_MM_STOCK_SOURCE_ECC` | SE24 / SE80 | syntax + activation |
| 2.1.5 | `ZCL_MM_STOCK_RISK_SERVICE` | SE24 / SE80 | syntax + activation |
| 2.1.6 | local ABAP Unit classes | SE24 / ABAP Unit | six deterministic tests |
| 2.1.7 | `ZMM_STOCK_RISK_REPORT` | SE38 / SE80 | syntax + activation + runtime + SALV |
| 2.1.8 | `ZMM_STOCK_RISK` | SE93 | creation + launch + SALV |

## Source files

Use the versioned files under `source/` as the implementation source of truth.

The ECC datasource remains read-only and uses standard MM context:

- `MARA-MEINS`
- `MARC-DISMM`
- `MARC-MINBE`
- `MARC-EISBE`
- `MARD-LABST`

The diagnostic differentiates selected storage-location unrestricted stock from gross plant unrestricted stock. It is deliberately documented as a **stock-only early-warning diagnostic**, not as SAP MRP.

## ABAP Unit target

Prepared scenarios:

1. plant stock above reorder point → `OK`
2. plant stock at reorder point → `REORDER`
3. plant stock below safety stock → `CRITICAL`
4. shortage quantity to reorder point
5. no reorder/safety thresholds → `NOT_CONFIGURED`
6. low selected-storage stock with sufficient plant stock → plant-level state remains authoritative

Current source-level result:

```text
Static vectors reviewed: 6
Static expected outcomes consistent: 6
Static mismatches: 0
```

Future SAP runtime target:

```text
ABAP Unit executed: 6
Passed: 6
Failed: 0
```

The second block must not be claimed until observed in SAP.

## Runtime material boundary

Use only a non-sensitive validation material that already exists in the system, is extended to the selected plant, has a valid storage-location record and has an MRP context that can be interpreted for the diagnostic.

Never publish the real material, plant, storage location, SID, client, usernames or transport request.

## Final promotion gate

Only promote the public evidence to:

```text
RUNTIME_VALIDATED
TEST_VALIDATED
```

when every object is active, all six ABAP Unit tests pass, `ZMM_STOCK_RISK_REPORT` executes successfully, `ZMM_STOCK_RISK` launches through SE93 and the SALV output is observed in an authorized environment.

Until then, Task 2.1 is considered **complete at source/static-validation level** and does not block the remaining SAP evidence roadmap.

For the full Spanish object-by-object procedure, use [`RUNTIME_EXECUTION.es.md`](./RUNTIME_EXECUTION.es.md).
