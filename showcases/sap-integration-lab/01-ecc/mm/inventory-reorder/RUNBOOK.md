# SAP ECC MM Inventory & Stock Risk — Runtime Runbook

[Versión en español](./RUNBOOK.es.md)

> Use only in an authorized SAP development/sandbox environment.

## Goal

Create, activate, test and execute the evidence pack without using customer source code or confidential data.

## Recommended object order

1. Create exception class `ZCX_MM_STOCK_NOT_FOUND`.
2. Create interface `ZIF_MM_STOCK_SOURCE`.
3. Create class `ZCL_MM_STOCK_SOURCE_DEMO`.
4. Create class `ZCL_MM_STOCK_SOURCE_ECC`.
5. Create class `ZCL_MM_STOCK_RISK_SERVICE`.
6. Add the local ABAP Unit test classes to `ZCL_MM_STOCK_RISK_SERVICE`.
7. Create executable report `ZMM_STOCK_RISK_REPORT`.

Use the matching files under `source/` as the source of truth.

## Validation sequence

For each object:

1. run syntax check
2. activate
3. record any release-specific adjustment in `EVIDENCE.md`

After all classes are active:

1. run ABAP Unit for `ZCL_MM_STOCK_RISK_SERVICE`
2. confirm the four prepared tests execute successfully
3. record passed/failed counts in `EVIDENCE.md`

## Report execution

Execute `ZMM_STOCK_RISK_REPORT` with a non-sensitive material that:

- exists in the SAP system
- is extended to the selected plant
- has a valid storage-location record
- has meaningful reorder-point/safety-stock values for the test scenario

Enter:

- Material
- Plant
- Storage location

Expected result: one SALV row containing material, plant, storage location, unrestricted-use stock, reorder point, safety stock, diagnostic status and shortage quantity.

## Safety boundary

The report performs read-only access to `MARC` and `MARD`. Do not add update/debug/table-edit behavior to this public evidence pack.

Use synthetic or sanitized identifiers in screenshots.

## Evidence capture

After successful runtime validation, update `EVIDENCE.md` with:

- ECC release/EHP (without confidential system ID)
- syntax/activation status
- ABAP Unit result
- sanitized report execution result
- compatibility adjustments, if any

Only then may the public maturity state advance beyond `RUNTIME_VALIDATION_PENDING`.
