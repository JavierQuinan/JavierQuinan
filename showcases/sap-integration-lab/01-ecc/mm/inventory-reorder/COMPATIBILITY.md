# ECC Compatibility & Hardening Profile

[Versión en español](./COMPATIBILITY.es.md)

> **Evidence type:** source-level compatibility and hardening review  
> **Runtime boundary:** no specific ECC release activation is asserted by this document

This document records the design decisions used to make `ZMM_STOCK_RISK` portable and defensible on a classic SAP ECC / AS ABAP landscape.

## Compatibility strategy

The source intentionally favors classic ABAP constructs and avoids unnecessary syntax that varies across NetWeaver / ECC generations.

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

This posture improves classic-ECC portability. Exact syntax availability still depends on the concrete ECC / NetWeaver release in which the source is imported; this repository does not claim a minimum release that was not observed.

## Functional hardening performed

### 1. Plant stock vs. storage-location stock

`MARC` planning parameters are plant-level. The original draft compared them directly with one storage location's `MARD-LABST`, which was too simplified for a professional diagnostic.

The hardened snapshot exposes both:

- `storage_unrestricted` — unrestricted-use stock for the selected storage location
- `plant_unrestricted` — sum of `MARD-LABST` represented for the selected material and plant

The diagnostic status uses `plant_unrestricted`; the selected storage-location value remains a drill-down field.

### 2. MRP type made visible

The datasource reads `MARC-DISMM`, so the report exposes the material's MRP type instead of presenting reorder/safety thresholds without planning context.

### 3. Base unit made visible

The snapshot includes `MARA-MEINS`, preventing quantity values from being shown without their base-unit context.

### 4. Unconfigured thresholds

When both reorder point and safety stock are initial, the result is `NOT_CONFIGURED` instead of producing a misleading reorder signal.

### 5. Static exception discipline

`ZCX_MM_STOCK_NOT_FOUND` inherits from `CX_STATIC_CHECK`. ABAP Unit test methods that call APIs propagating this exception explicitly declare `RAISING ZCX_MM_STOCK_NOT_FOUND`.

### 6. Read-only source path

The ECC datasource contains `SELECT` operations only. There is no `INSERT`, `UPDATE`, database `MODIFY`, `DELETE`, direct table maintenance, debug-based write or commit logic.

## Important MRP boundary

This application is a **stock-only early-warning diagnostic**. It is not SAP MRP and must not be described as reproducing reorder-point planning.

The public source does not calculate:

- firmed receipts
- purchase orders / purchase requisitions
- reservations or dependent requirements
- MRP-area scope
- storage-location MRP exclusions
- lot sizing
- lead-time planning
- forecast logic
- planning-file behavior

The output is therefore described as a transparent engineering diagnostic around selected MM stock/master-data fields.

## SALV choice

`CL_SALV_TABLE` is used for read-only structured output. No editable ALV behavior is implemented.

## Transaction authorization boundary

`ZMM_STOCK_RISK` is documented as a report transaction created in `SE93`. SAP applies the standard transaction-start authorization check (`S_TCODE`).

Business-data authorization is organization-specific. This public lab deliberately does not invent a customer-specific authorization object or role model.

## Verification procedure

A reusable verification sequence is documented for any authorized ECC development/sandbox environment:

1. verify the DDIC references used by the source
2. run syntax checks on the classes/interfaces/program
3. activate the objects
4. run the six ABAP Unit cases
5. execute `ZMM_STOCK_RISK_REPORT` through `SE38`
6. configure/launch `ZMM_STOCK_RISK` through `SE93`
7. inspect the SALV fields and diagnostic result using non-sensitive data
8. record release-specific differences without exposing enterprise identifiers

This is a replication procedure, not a claim that those runtime results were observed for this public artifact.

## External SAP references

See the centralized [`OFFICIAL_SAP_REFERENCES.md`](../../../OFFICIAL_SAP_REFERENCES.md) for SAP Help references covering Class Builder/SE24, report transactions/SE93, ABAP Unit and related development concepts.
