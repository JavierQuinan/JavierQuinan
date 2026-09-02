# SAP ECC MM — Professional Guide to Build and Publish a Custom Z Transaction

[Versión en español](./BUILD_GUIDE.es.md)

> **Goal:** rebuild from scratch, in an authorized SAP ECC DEV/sandbox, an original and reproducible Z transaction for the `Inventory & Stock Risk` evidence pack.
>
> **Current runtime status:** `RUNTIME_VALIDATION_PENDING`.

## 1. Design principle

This guide does **not reproduce third-party internal developments**. The lab implements an original solution using standard SAP ECC objects and public SAP documentation.

The first custom transaction is:

- **Transaction code:** `ZMM_STOCK_RISK`
- **Executable report:** `ZMM_STOCK_RISK_REPORT`
- **Domain service:** `ZCL_MM_STOCK_RISK_SERVICE`
- **ECC datasource:** `ZCL_MM_STOCK_SOURCE_ECC`
- **Demo datasource:** `ZCL_MM_STOCK_SOURCE_DEMO`
- **Datasource contract:** `ZIF_MM_STOCK_SOURCE`
- **Domain exception:** `ZCX_MM_STOCK_NOT_FOUND`

The transaction is **read-only**. It reads standard MM data and does not update stock, material master data or customizing.

## 2. Architecture

```text
ZMM_STOCK_RISK
      |
      v
ZMM_STOCK_RISK_REPORT
      |
      v
ZCL_MM_STOCK_RISK_SERVICE
      |
      v
ZIF_MM_STOCK_SOURCE
  |                 |
  v                 v
ECC datasource   Demo datasource
  |                 |
  v                 v
MARC / MARD      synthetic data
```

## 3. Package and transport setup

Use `$TMP` only for authorized local, non-transportable experiments. For transportable evidence, use an authorized Z package in the development landscape. The package controls CTS transport behavior.

Public evidence may record only the ECC release/EHP, environment type, sanitized package description if needed, and activation result. Do not publish SID, client, usernames, transport numbers or company names.

## 4. Create the global exception

Use `SE24` Class Builder or `SE80`.

Object: `ZCX_MM_STOCK_NOT_FOUND`

1. Open `SE24`.
2. Enter the class name and choose **Create**.
3. Suggested description: `MM stock snapshot not found`.
4. Create a public global class.
5. Set `CX_STATIC_CHECK` as superclass.
6. Assign package/transport according to the environment policy.
7. Use source-code-based mode if available.
8. Implement `source/zcx_mm_stock_not_found.clas.abap`.
9. Run Syntax Check.
10. Activate.

Do not continue until activation succeeds.

## 5. Create the datasource interface

Object: `ZIF_MM_STOCK_SOURCE`

1. Open `SE24` or `SE80`.
2. Create a global **Interface**.
3. Assign the same package.
4. Add `source/zif_mm_stock_source.intf.abap`.
5. Confirm these standard DDIC types exist: `MARA-MATNR`, `MARC-WERKS`, `MARD-LGORT`, `MARD-LABST`, `MARC-MINBE`, `MARC-EISBE`.
6. Syntax Check.
7. Activate.

## 6. Create the datasources

Create in this order:

1. `ZCL_MM_STOCK_SOURCE_DEMO`
2. `ZCL_MM_STOCK_SOURCE_ECC`

For each class, create a global class, implement `ZIF_MM_STOCK_SOURCE`, add the versioned source, run Syntax Check and activate.

The ECC datasource is read-only and uses standard fields:

- `MARC-MINBE` — reorder point
- `MARC-EISBE` — safety stock
- `MARD-LABST` — unrestricted-use stock

No direct table updates are allowed.

## 7. Create the domain service

Object: `ZCL_MM_STOCK_RISK_SERVICE`

1. Create the global class.
2. Inject `ZIF_MM_STOCK_SOURCE` through the constructor.
3. Add `source/zcl_mm_stock_risk_service.clas.abap`.
4. Syntax Check.
5. Activate.

This service classifies stock risk; it does **not** claim to reproduce SAP MRP logic.

## 8. Add ABAP Unit

SAP recommends local test classes associated with the tested class.

1. Open `ZCL_MM_STOCK_RISK_SERVICE` in `SE24`.
2. Navigate to the local test classes area (`Goto -> Local Definitions/Implementations -> Local Test Classes`, or the release-equivalent option).
3. Add `source/zcl_mm_stock_risk_service.clas.testclasses.abap`.
4. Syntax Check.
5. Activate.
6. Run ABAP Unit.

Expected scenarios:

1. sufficient stock -> `OK`
2. stock at/below reorder point -> `REORDER`
3. stock below safety stock -> `CRITICAL`
4. correct shortage calculation

Do not mark the artifact `TEST_VALIDATED` until the SAP execution result is observed.

## 9. Create the executable program

Use `SE38` or `SE80`.

Object: `ZMM_STOCK_RISK_REPORT`

1. Open `SE38`.
2. Enter the program name.
3. Choose **Create**.
4. Type: **Executable Program**.
5. Assign the same package/CTS request.
6. Add `source/zmm_stock_risk_report.prog.abap`.
7. Syntax Check.
8. Activate.
9. Execute from `SE38` before creating the transaction code.

## 10. Create the Z transaction in SE93

Object: `ZMM_STOCK_RISK`

Correct type: **Report Transaction**.

1. Open `SE93`.
2. Enter `ZMM_STOCK_RISK`.
3. Choose **Create**.
4. Short text: `MM Stock Risk Diagnostic`.
5. Select **Program and selection screen (report transaction)** or the release-equivalent label.
6. Program: `ZMM_STOCK_RISK_REPORT`.
7. Keep the initial selection screen visible.
8. Save.
9. Assign the same package and transport.
10. Launch `ZMM_STOCK_RISK` from SAP Easy Access.

Expected input: Material, Plant and Storage Location. Expected output: a SALV row with stock values and a risk classification.

## 11. Evidence record

A professional public record does not require confidential screenshots. The following is sufficient when verified:

```text
Object creation: PASS
Syntax check: PASS
Activation: PASS
ABAP Unit: 4/4 PASS
Transaction ZMM_STOCK_RISK: PASS
SALV runtime: PASS
Data source: sanitized/non-sensitive material
```

A sanitized ABAP Unit screenshot and SALV screenshot are optional.

## 12. Promotion checklist

Only promote to `RUNTIME_VALIDATED / TEST_VALIDATED` when:

- [ ] all repository objects exist in ECC DEV/sandbox
- [ ] all activate
- [ ] ABAP Unit succeeds
- [ ] `SE93` launches the Z transaction
- [ ] the report processes a non-sensitive material
- [ ] no table modification exists
- [ ] `EVIDENCE.md` is updated

## 13. Official SAP references

- Class Builder / SE24: https://help.sap.com/docs/SAP_ERP_SPV/142f8559883b4c11966ebfb99dd61164/cac035baa6c611d1b4790000e8a52bed.html
- Creating a Standard Class: https://help.sap.com/docs/SAP_NETWEAVER_AS_ABAP_752/bd833c8355f34e96a6e83096b38bf192/c088885f720911d1b44d0000e8a52bed.html
- Creating a Program / SE38: https://help.sap.com/saphelp_aii710/helpdata/en/d1/801a47454211d189710000e8322d00/content.htm
- Maintaining Transactions / SE93: https://help.sap.com/docs/SAP_NETWEAVER_AS_ABAP_752/bd833c8355f34e96a6e83096b38bf192/432c43b427bf601fe10000000a422035.html
- Report Transactions: https://help.sap.com/saphelp_snc70/helpdata/en/43/0f4c879f2d6f41e10000000a422035/content.htm
- ABAP Unit: https://help.sap.com/docs/ABAP_PLATFORM_NEW/c238d694b825421f940829321ffa326a/4ec18be06e391014adc9fffe4e204223.html
- ABAP Unit local test classes: https://help.sap.com/docs/ABAP_PLATFORM_NEW/ba879a6e2ea04d9bb94c7ccd7cdac446/556bac6cf8464655ab726c8a49aa6adc.html
- Transport Layer / CTS: https://help.sap.com/docs/ABAP_PLATFORM_NEW/c238d694b825421f940829321ffa326a/4ec218e26e391014adc9fffe4e204223.html
