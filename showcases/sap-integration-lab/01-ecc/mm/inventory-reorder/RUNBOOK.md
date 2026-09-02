# SAP ECC MM Inventory & Stock Risk — Verification Runbook

[Versión en español](./RUNBOOK.es.md)

> Use only in an authorized SAP development/sandbox environment.

## Goal

Create, activate, test and execute the hardened evidence pack without using customer source code or confidential data.

## Object order

1. `ZCX_MM_STOCK_NOT_FOUND`
2. `ZIF_MM_STOCK_SOURCE`
3. `ZCL_MM_STOCK_SOURCE_DEMO`
4. `ZCL_MM_STOCK_SOURCE_ECC`
5. `ZCL_MM_STOCK_RISK_SERVICE`
6. local ABAP Unit test classes
7. `ZMM_STOCK_RISK_REPORT`
8. `ZMM_STOCK_RISK` in `SE93`

Use the matching files under `source/` as the source of truth.

## Verification sequence

For each development object:

1. run Syntax Check;
2. activate;
3. record only release-specific compatibility notes that can be safely published.

After the classes are active:

1. execute ABAP Unit for `ZCL_MM_STOCK_RISK_SERVICE`;
2. record the observed total/pass/fail counts;
3. compare the observed results with the six source-reviewed scenarios.

## Source-reviewed scenarios

1. plant stock above reorder point → `OK`
2. plant stock exactly at reorder point → `REORDER`
3. plant stock below safety stock → `CRITICAL`
4. shortage quantity to reorder point
5. no thresholds → `NOT_CONFIGURED`
6. low selected-storage stock with sufficient plant stock → plant-level status remains `OK`

Repository static review: **6 scenarios / 6 consistent / 0 mismatches**.

## Report execution

Execute `ZMM_STOCK_RISK_REPORT` first from `SE38`, then through `ZMM_STOCK_RISK` after creating the Report Transaction in `SE93`.

Use a non-sensitive material that:

- exists in SAP;
- is extended to the selected plant;
- has a valid storage-location record;
- has an understood MRP type;
- has usable reorder-point/safety-stock values for the diagnostic.

Expected SALV context:

- material;
- plant;
- selected storage location;
- MRP type;
- selected-storage unrestricted stock;
- gross plant unrestricted stock;
- reorder point;
- safety stock;
- diagnostic status;
- shortage quantity.

## Interpretation boundary

The report is a stock-only early-warning diagnostic. It does not calculate SAP MRP availability and does not include firmed receipts, requirements, MRP-area scope, storage-location exclusions, lot sizing, lead times or forecast logic.

## Safety boundary

The runtime path performs read-only access to `MARC` and `MARD`. Do not add direct table maintenance, debug-based writes, update statements or commit behavior to this public evidence pack.

Use synthetic or sanitized identifiers in any public evidence.

## Authorization boundary

`ZMM_STOCK_RISK` is a report transaction. SAP applies the standard transaction-start authorization check (`S_TCODE`). Productive business-data authorization must be designed per target organization; this public lab does not invent customer-specific roles.

## Result record

Use [`VALIDATION_RESULTS_TEMPLATE.md`](./VALIDATION_RESULTS_TEMPLATE.md) to record only observed values. Leave non-observed fields blank rather than marking them as pending.
