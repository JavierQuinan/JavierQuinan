# Source Review — `ZMM_PURCH_ANALYTICS`

> **Review scope:** classic ECC portability, read-only behavior and evidence integrity.

## Compatibility profile

The source intentionally favors classic constructs already used by the other ECC evidence packs:

- explicit `DATA`
- `CREATE OBJECT`
- `CALL METHOD`
- classic Open SQL `SELECT SINGLE` / `SELECT ... INTO TABLE`
- explicit internal tables and `READ TABLE`
- no inline `DATA( )`
- no `VALUE #( )`
- no table expressions
- no host-variable `@` syntax
- no CDS/RAP dependencies

Exact syntax availability still depends on the target ECC release and must be confirmed during future runtime validation.

## Standard model controls

- `EBAN` is the PR entry point.
- `EBAN-EBELN/EBELP` is treated as an optional downstream purchasing reference.
- `EKKO-BSTYP = 'F'` is required before the referenced document is treated as a Purchase Order.
- `EKPO` must resolve the referenced item.
- `EKET` is used only for schedule-line delivery-date visibility.

## Business-semantics controls

The source does not assume:

- every PR must have a PO
- absence of schedule lines is automatically a business error
- a referenced non-category-F purchasing document is a PO
- a deletion indicator means the database record should be changed

Diagnostic labels belong to the portfolio lab; they are not SAP standard statuses.

## Security / integrity

Verified source intent:

- read-only database access
- no purchasing-document BAPI writes
- no commit path
- no customer/employer code
- no real enterprise identifiers
- demo datasource uses synthetic identifiers only

## Review outcome

`SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`
