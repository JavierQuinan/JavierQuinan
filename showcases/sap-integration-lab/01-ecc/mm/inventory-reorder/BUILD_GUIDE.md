# SAP ECC MM — Professional Guide to Build and Publish a Custom Z Transaction

[Versión en español](./BUILD_GUIDE.es.md)

> **Goal:** rebuild from scratch, in an authorized SAP ECC DEV/sandbox, an original and reproducible Z transaction for the `Inventory & Stock Risk` evidence pack.  
> **Current runtime status:** `RUNTIME_VALIDATION_PENDING`.

## 1. Engineering principle

This lab does **not** reproduce third-party custom developments. It implements an original, read-only solution using standard ECC DDIC objects, classic ABAP Objects, ABAP Unit, SALV and a report transaction created in `SE93`.

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

- selected storage-location unrestricted stock
- gross plant unrestricted stock calculated from `MARD-LABST`
- MRP type from `MARC-DISMM`
- reorder point from `MARC-MINBE`
- safety stock from `MARC-EISBE`

Status is based on the plant stock total, not one storage location.

The lab does not calculate firmed receipts, requirements, MRP-area scope, storage-location MRP exclusions, lot sizing, lead times or forecast logic.

## 3. Compatibility posture

Core runtime source favors classic constructs:

- `CREATE OBJECT`
- `CALL METHOD`
- explicit `DATA`
- classic Open SQL without `@` host variables
- global classes/interfaces
- class-based exceptions
- `CL_SALV_TABLE`

Modern syntax is intentionally avoided where it adds no evidence value. Exact ECC release/EHP compatibility remains part of runtime validation.

## 4. Package and transport

Use `$TMP` only for an authorized local/non-transportable experiment. For transportable work, use an authorized Z package and CTS request.

Never publish:

- SID/client
- usernames
- transport request IDs
- company/customer names
- real material/business identifiers

## 5. Create `ZCX_MM_STOCK_NOT_FOUND`

Tool: `SE24` or `SE80`.

1. Create global class `ZCX_MM_STOCK_NOT_FOUND`.
2. Set superclass `CX_STATIC_CHECK`.
3. Assign package/transport.
4. Implement `source/zcx_mm_stock_not_found.clas.abap`.
5. Syntax Check.
6. Activate.

Because this is a static-check exception, callers must catch it or declare it in their interface.

## 6. Create `ZIF_MM_STOCK_SOURCE`

Create a global interface and implement `source/zif_mm_stock_source.intf.abap`.

Confirm these DDIC references exist on the target release:

- `MARA-MATNR`
- `MARC-WERKS`
- `MARC-DISMM`
- `MARC-MINBE`
- `MARC-EISBE`
- `MARD-LGORT`
- `MARD-LABST`

The snapshot exposes both storage-location and plant stock values.

Syntax Check and activate before continuing.

## 7. Create datasources

Create in this order:

1. `ZCL_MM_STOCK_SOURCE_DEMO`
2. `ZCL_MM_STOCK_SOURCE_ECC`

The demo datasource accepts deterministic synthetic values and is used by ABAP Unit.

The ECC datasource is read-only. It:

1. reads `MARC-DISMM`, `MARC-MINBE`, `MARC-EISBE` for material/plant
2. reads `MARD-LABST` for the selected storage location
3. reads all `MARD-LABST` values for the material/plant
4. sums those values in ABAP to produce `plant_unrestricted`

No `INSERT`, `UPDATE`, `MODIFY`, `DELETE` or `COMMIT WORK` is used.

## 8. Create `ZCL_MM_STOCK_RISK_SERVICE`

Create the global service class and inject `ZIF_MM_STOCK_SOURCE` via its constructor.

The service produces:

- `NOT_CONFIGURED` — reorder point and safety stock are initial
- `CRITICAL` — plant unrestricted stock is below configured safety stock
- `REORDER` — plant unrestricted stock is at/below configured reorder point but not below safety stock
- `OK` — none of the above

`shortage_qty` is calculated only when a positive reorder point exists and plant stock is lower.

Syntax Check and activate.

## 9. Add ABAP Unit

Open `ZCL_MM_STOCK_RISK_SERVICE` and add the local test source from:

`source/zcl_mm_stock_risk_service.clas.testclasses.abap`

Depending on release, use the local test-class editor or the equivalent local definitions/implementations view.

The prepared tests explicitly declare `RAISING ZCX_MM_STOCK_NOT_FOUND`, because the service propagates a `CX_STATIC_CHECK` exception.

Prepared scenarios:

1. plant stock above reorder point → `OK`
2. plant stock exactly at reorder point → `REORDER`
3. plant stock below safety stock → `CRITICAL`
4. shortage quantity to reorder point
5. no configured thresholds → `NOT_CONFIGURED`
6. low selected-storage stock but sufficient plant stock → status remains plant-based

Run ABAP Unit only after all dependent classes are active.

Expected evidence after successful runtime validation:

```text
Tests executed: 6
Passed: 6
Failed: 0
```

Do not record this as passed until it is actually observed in SAP.

## 10. Create executable program

Tool: `SE38` or `SE80`.

Program: `ZMM_STOCK_RISK_REPORT`

1. Create as **Executable Program**.
2. Assign the same package/CTS request.
3. Add `source/zmm_stock_risk_report.prog.abap`.
4. Syntax Check.
5. Activate.
6. Execute directly from `SE38` before creating the transaction.

Selection parameters:

- Material
- Plant
- Storage Location

Expected SALV fields include:

- material
- plant
- selected storage location
- MRP type
- selected storage unrestricted stock
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

SAP performs the standard `S_TCODE` start authorization check for custom transactions. A productive deployment would still require business-data authorization design with the relevant security team; this public lab does not invent a customer-specific authorization object.

## 12. Runtime test data

Use only a non-sensitive material that:

- exists
- is extended to the target plant
- has the selected storage-location record
- has an understood MRP type
- has useful reorder/safety values for the selected test

Do not publish real material numbers. Sanitized evidence can use placeholders.

## 13. Evidence record

After real validation, record only non-confidential results in `EVIDENCE.md`:

```text
Object creation: PASS
Syntax checks: PASS
Activation: PASS
ABAP Unit: 6/6 PASS
Transaction ZMM_STOCK_RISK: PASS
SALV runtime: PASS
ECC release/EHP: <non-confidential description>
```

Screenshots are optional. Textual evidence is sufficient when accurate and reproducible.

## 14. Promotion gate

Only promote to `RUNTIME_VALIDATED / TEST_VALIDATED` when:

- [ ] every object exists and activates in ECC DEV/sandbox
- [ ] six ABAP Unit tests pass
- [ ] report runs directly
- [ ] `SE93` launches `ZMM_STOCK_RISK`
- [ ] SALV displays the hardened fields
- [ ] no write logic exists
- [ ] no confidential data is committed
- [ ] `EVIDENCE.md` is updated

## 15. SAP documentation basis

The procedure is grounded in SAP documentation for:

- Class Builder / global classes and interfaces
- class-based exceptions and `CX_STATIC_CHECK`
- executable programs
- ABAP Unit test classes
- `CL_SALV_TABLE`
- report transactions / `SE93`
- transaction authorization via `S_TCODE`
- reorder-point planning behavior
- packages / CTS
