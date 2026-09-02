# SAP ECC MM — Inventory & Reorder Evidence Pack

[Versión en español](./README.es.md)

> **Track:** SAP ECC / Materials Management  
> **Artifact status:** `SOURCE_READY / RUNTIME_VALIDATION_PENDING`  
> **Runtime claim:** none yet

This package is the first technical artifact in the SAP Integration Lab.

It demonstrates a small, testable MM domain rule around current stock, reorder point and safety stock using ABAP Objects and ABAP Unit.

## What this source proves

- ABAP Objects class design
- typed return structure
- explicit business-status rules
- deterministic business logic
- ABAP Unit test-class structure
- separation of public source evidence from runtime claims

## What this source does **not** prove yet

- activation in a real SAP ECC system
- execution against MARC/MARD or another SAP standard source
- successful ABAP Unit execution in SAP
- production readiness

Those claims remain blocked until `EVIDENCE.md` records the runtime result.

## Business scenario

For a synthetic material/plant context:

- `current_stock` = available stock
- `reorder_point` = threshold that triggers replenishment
- `safety_stock` = minimum protective stock

The evaluator returns:

- `OK` — stock is at or above reorder point + safety stock
- `REORDER` — stock is below the target but not below safety stock
- `CRITICAL` — stock is below safety stock

It also returns the quantity required to recover the target level.

## Current branch layout

This folder already contains the bilingual package documentation and runtime-evidence record. The first ABAP class and its ABAP Unit source currently remain under the earlier `01-abap-core/` path in this same branch.

They will be refactored into this package during **Task 2 — ECC MM Inventory & Reorder executable evidence**, together with the datasource abstraction, executable report and runtime-validation checklist. Until that refactor is complete, this README does not claim the source files are physically located here.

## Next technical promotion

Task 2 will add:

1. datasource interface
2. synthetic/demo datasource for deterministic tests
3. ECC datasource for standard material/plant/storage-location stock when an appropriate SAP environment is available
4. executable report/SALV consumer
5. ABAP Unit coverage
6. completed `EVIDENCE.md` after SAP activation/execution

## Validation rule

Do not describe this package as “running in SAP” until:

1. the class is created/imported
2. syntax check succeeds
3. activation succeeds
4. ABAP Unit runs successfully
5. result is recorded in `EVIDENCE.md`
