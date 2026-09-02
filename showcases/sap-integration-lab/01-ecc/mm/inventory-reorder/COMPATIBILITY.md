# ECC Compatibility & Hardening Profile

[Versión en español](./COMPATIBILITY.es.md)

> **Status:** source-reviewed; SAP runtime validation still pending.

This document records the design decisions used to make `ZMM_STOCK_RISK` more portable and defensible on a classic SAP ECC / AS ABAP landscape.

## Compatibility strategy

The source intentionally favors classic ABAP constructs and avoids unnecessary modern syntax that may vary across NetWeaver / ECC releases.

Preferred in this package:

- `CREATE OBJECT`
- `CALL METHOD`
- explicitly declared `DATA`
- classic Open SQL without `@` host variables
- global classes/interfaces
- class-based exceptions
- `CL_SALV_TABLE`
- local ABAP Unit test classes

Intentionally avoided in the core runtime path:

- `NEW #( )`
- `VALUE #( )`
- table expressions
- inline `DATA( )`
- string templates
- constructor expressions
- CDS/RAP/ABAP Cloud syntax

This does **not** establish a guaranteed minimum ECC release. The exact release/EHP remains part of runtime validation.

## Functional hardening performed

### 1. Plant stock vs. storage-location stock

`MARC` planning parameters are plant-level. The first source version compared them directly with one storage location's `MARD-LABST` value. That was too simplified for a professional diagnostic.

The hardened snapshot now exposes both:

- `storage_unrestricted` — unrestricted-use stock for the selected storage location
- `plant_unrestricted` — sum of unrestricted-use stock represented by `MARD-LABST` records for the selected material and plant

The diagnostic status is based on `plant_unrestricted`; the selected storage-location value is retained as a drill-down field.

### 2. MRP type made visible

The datasource now reads `MARC-DISMM` so the report exposes the material's MRP type instead of presenting reorder-point thresholds without planning context.

### 3. Unconfigured thresholds

When both reorder point and safety stock are initial, the result is `NOT_CONFIGURED` instead of producing a misleading reorder signal.

### 4. Static exception discipline

`ZCX_MM_STOCK_NOT_FOUND` inherits from `CX_STATIC_CHECK`. ABAP Unit test methods that call APIs propagating this exception now explicitly declare `RAISING ZCX_MM_STOCK_NOT_FOUND`.

### 5. Read-only runtime path

The ECC datasource contains `SELECT` operations only. There is no `INSERT`, `UPDATE`, `MODIFY`, `DELETE`, direct table maintenance, debug-based write or commit logic.

## Important MRP boundary

This application is a **stock-only early-warning diagnostic**. It is not SAP MRP and must not be described as reproducing reorder-point planning.

SAP reorder-point planning can consider plant stock plus firmed receipts and other planning logic. This lab intentionally does not calculate:

- firmed receipts
- purchase orders / purchase requisitions
- reservations or dependent requirements
- MRP-area scope
- storage-location MRP exclusions
- lot-sizing
- lead-time planning
- forecast logic
- planning-file behavior

The output should therefore be described as a transparent engineering diagnostic around selected MM stock/master-data fields.

## SALV choice

`CL_SALV_TABLE` is used for read-only structured output. No editable ALV behavior is implemented.

## Transaction authorization boundary

`ZMM_STOCK_RISK` is designed as a report transaction created in `SE93`. SAP performs the standard transaction-start authorization check (`S_TCODE`) for custom transactions as well.

For a real productive deployment, business-data authorization must be designed with the customer's authorization team. This public lab deliberately does not invent a customer-specific authorization object or role model.

## Runtime validation checklist

Before promotion beyond `RUNTIME_VALIDATION_PENDING`:

1. verify all DDIC references exist on the target ECC release
2. syntax-check every class/interface/program
3. activate every object
4. run all ABAP Unit tests
5. create and execute `ZMM_STOCK_RISK` through `SE93`
6. execute with a non-sensitive material/plant/storage-location combination
7. verify the SALV fields and status logic
8. record any release-specific compatibility changes in `EVIDENCE.md`

## External SAP references used during hardening

- SAP ABAP Keyword Documentation — class-based exception categories
- SAP ABAP Unit — `FOR TESTING`, `RISK LEVEL`, `DURATION`
- SAP documentation — report transactions / `SE93`
- SAP authorization documentation — `S_TCODE`
- SAP ALV documentation — customer use of `CL_SALV_TABLE`
- SAP documentation — reorder-point planning functional behavior
