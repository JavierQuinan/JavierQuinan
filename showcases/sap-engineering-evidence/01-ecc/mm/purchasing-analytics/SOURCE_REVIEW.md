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

Exact syntax availability depends on the concrete ECC / NetWeaver release in which the source is imported; this repository does not claim a minimum release that was not observed.

## Standard model controls

- `EBAN` is the PR entry point.
- `EBAN-EBELN/EBELP` is treated as an optional downstream purchasing reference.
- `EKKO-BSTYP = 'F'` is required before the referenced document is treated as a Purchase Order.
- `EKPO` must resolve the referenced item.
- `EKET` is used only for schedule-line delivery-date visibility.

## Business-semantics controls

The source does not assume:

- every PR must have a PO;
- absence of schedule lines is automatically a business error;
- a referenced non-category-F purchasing document is a PO;
- a deletion indicator means the database record should be changed.

Diagnostic labels belong to the portfolio lab; they are not SAP standard statuses.

## Security / integrity

Verified source intent:

- read-only database access;
- no purchasing-document BAPI writes;
- no commit path;
- no customer/employer code;
- no real enterprise identifiers;
- demo datasource uses synthetic identifiers only.

## Review conclusion

The source is internally consistent with its stated scope: a classic-ECC, read-only PR→PO→schedule-line diagnostic with explicit document-category controls, deterministic scenarios and a reproducible build guide.

**Evidence classification:** `REVIEWABLE_SOURCE / STATIC_SCENARIO_VALIDATION / REPRODUCIBLE_BUILD_GUIDE`.
