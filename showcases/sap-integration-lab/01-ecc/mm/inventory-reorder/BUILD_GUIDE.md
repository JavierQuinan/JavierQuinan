# SAP ECC MM — Professional Guide to Build a Custom Z Transaction

[Versión en español](./BUILD_GUIDE.es.md)

> **Goal:** rebuild, in an authorized SAP ECC development/sandbox, the original read-only `Inventory & Stock Risk` evidence pack from the versioned source in this repository.

## 1. Engineering principle

This lab does **not** reproduce third-party custom developments. It implements an original read-only solution using standard ECC DDIC objects, classic ABAP Objects, ABAP Unit, SALV and a report transaction created in `SE93`.

Objects:

- `ZCX_MM_STOCK_NOT_FOUND`
- `ZIF_MM_STOCK_SOURCE`
- `ZCL_MM_STOCK_SOURCE_DEMO`
- `ZCL_MM_STOCK_SOURCE_ECC`
- `ZCL_MM_STOCK_RISK_SERVICE`
- local ABAP Unit test classes
- `ZMM_STOCK_RISK_REPORT`
- `ZMM_STOCK_RISK` — SE93 Report Transaction

Read [`COMPATIBILITY.md`](./COMPATIBILITY.md) before implementation.

## 2. Functional boundary

The application is a **stock-only early-warning diagnostic**, not SAP MRP.

The hardened implementation distinguishes:

- selected storage-location unrestricted stock;
- gross plant unrestricted stock calculated from `MARD-LABST`;
- MRP type from `MARC-DISMM`;
- reorder point from `MARC-MINBE`;
- safety stock from `MARC-EISBE`.

Status is based on the plant stock total, not one storage location.

The lab does not calculate firmed receipts, requirements, MRP-area scope, storage-location MRP exclusions, lot sizing, lead times or forecast logic.

## 3. Compatibility posture

Core source favors classic constructs:

- `CREATE OBJECT`
- `CALL METHOD`
- explicit `DATA`
- classic Open SQL without `@` host variables
- global classes/interfaces
- class-based exceptions
- `CL_SALV_TABLE`

Modern syntax is avoided where it adds no evidence value. Exact syntax availability depends on the ECC / NetWeaver release in which the source is imported; this repository does not assert a minimum release that was not observed.

## 4. Package and transport

Use `$TMP` only for an authorized local/non-transportable experiment. For transportable work, use an authorized Z package and CTS request.

Never publish SID/client, usernames, transport request IDs, company/customer names or real material/business identifiers.

## 5. Create `ZCX_MM_STOCK_NOT_FOUND`

Tool: `SE24` or `SE80`.

1. Create global class `ZCX_MM_STOCK_NOT_FOUND`.
2. Set superclass `CX_STATIC_CHECK`.
3. Assign package/transport according to the environment policy.
4. Implement `source/zcx_mm_stock_not_found.clas.abap`.
5. Run Syntax Check.
6. Activate.

Because this is a static-check exception, callers must catch it or declare it in their interface.

## 6. Create `ZIF_MM_STOCK_SOURCE`

Create a global interface and implement `source/zif_mm_stock_source.intf.abap`.

Confirm the target release resolves:

- `MARA-MATNR`
- `MARA-MEINS`
- `MARC-WERKS`
- `MARC-DISMM`
- `MARC-MINBE`
- `MARC-EISBE`
- `MARD-LGORT`
- `MARD-LABST`

The snapshot exposes both storage-location and plant stock values.

Run Syntax Check and activate before continuing.

## 7. Create datasources

Create in this order:

1. `ZCL_MM_STOCK_SOURCE_DEMO`
2. `ZCL_MM_STOCK_SOURCE_ECC`

The demo datasource accepts deterministic synthetic values and is used by ABAP Unit.

The ECC datasource is read-only. It:

1. reads `MARA-MEINS`;
2. reads `MARC-DISMM`, `MARC-MINBE`, `MARC-EISBE` for material/plant;
3. reads `MARD-LABST` for the selected storage location;
4. reads all `MARD-LABST` values for material/plant;
5. sums those values in ABAP to produce `plant_unrestricted`.

No `INSERT`, `UPDATE`, database `MODIFY`, `DELETE` or `COMMIT WORK` is used.

## 8. Create `ZCL_MM_STOCK_RISK_SERVICE`

Create the global service class and inject `ZIF_MM_STOCK_SOURCE` through its constructor.

The service produces:

- `NOT_CONFIGURED` — reorder point and safety stock are initial;
- `CRITICAL` — plant unrestricted stock is below configured safety stock;
- `REORDER` — plant unrestricted stock is at/below configured reorder point but not below safety stock;
- `OK` — none of the above.

`shortage_qty` is calculated only when a positive reorder point exists and plant stock is lower.

Run Syntax Check and activate.

## 9. Add ABAP Unit

Open `ZCL_MM_STOCK_RISK_SERVICE` and add the local test source from:

`source/zcl_mm_stock_risk_service.clas.testclasses.abap`

Prepared scenarios:

1. plant stock above reorder point → `OK`
2. plant stock exactly at reorder point → `REORDER`
3. plant stock below safety stock → `CRITICAL`
4. shortage quantity to reorder point
5. no configured thresholds → `NOT_CONFIGURED`
6. low selected-storage stock but sufficient plant stock → plant-based status remains authoritative

Repository source review result:

```text
Scenarios reviewed: 6
Consistent:        6
Mismatches:        0
```

When executing ABAP Unit in SAP, record only the observed total/pass/fail values. Do not infer a runtime result from the static review.

## 10. Create executable program

Tool: `SE38` or `SE80`.

Program: `ZMM_STOCK_RISK_REPORT`

1. Create as **Executable Program**.
2. Assign the same package/CTS request.
3. Add `source/zmm_stock_risk_report.prog.abap`.
4. Run Syntax Check.
5. Activate.
6. Execute directly from `SE38`.

Selection parameters:

- Material
- Plant
- Storage Location

Expected SALV context:

- material
- plant
- selected storage location
- base unit
- MRP type
- selected-storage unrestricted stock
- gross plant unrestricted stock
- reorder point
- safety stock
- diagnostic status
- shortage quantity

## 11. Create `ZMM_STOCK_RISK` in SE93

Correct transaction type: **Report Transaction / Program and selection screen**.

1. Open `SE93`.
2. Enter `ZMM_STOCK_RISK`.
3. Choose **Create**.
4. Short text: `MM Stock Risk Diagnostic`.
5. Select the report-transaction option.
6. Program: `ZMM_STOCK_RISK_REPORT`.
7. Keep the standard selection screen.
8. Save and assign package/transport.
9. Launch the transaction from SAP Easy Access.

SAP applies the standard transaction-start authorization check (`S_TCODE`). Business-data authorization is organization-specific; this public lab does not invent a customer-specific role model.

## 12. Validation data

Use only a non-sensitive material that exists, is extended to the target plant, has the selected storage-location record and has interpretable MRP/reorder values.

Do not publish real material numbers, plant/storage values, SID/client, usernames or transport identifiers.

## 13. Record observed results

Use [`VALIDATION_RESULTS_TEMPLATE.md`](./VALIDATION_RESULTS_TEMPLATE.md). Record `PASS` or `FAIL` only for actions actually observed; leave non-observed fields blank.

## 14. SAP documentation basis

The procedure is grounded in SAP documentation for Class Builder/global classes and interfaces, class-based exceptions, executable programs, ABAP Unit, report transactions/`SE93`, `S_TCODE` and related development concepts. See [`OFFICIAL_SAP_REFERENCES.md`](../../../OFFICIAL_SAP_REFERENCES.md).

## Evidence represented by this guide

This guide is complete as a **reproducible construction and verification procedure**. It does not present a corporate SAP runtime result unless such a result is separately recorded from an actual authorized execution.
