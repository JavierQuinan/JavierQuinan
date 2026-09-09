# Static Validation — ECC MM Contract Audit

> **Validation date:** 2026-09-02  
> **Scope:** source-level deterministic trace  
> **Result:** `8/8 deterministic scenarios consistent`  
> **Runtime boundary:** no SAP activation or executed ABAP Unit result is asserted here

## Source model reviewed

The lab uses standard classic ECC purchasing context:

- `EKKO-EBELN` — purchasing document
- `EKKO-LIFNR` — vendor
- `EKKO-EKORG` — purchasing organization
- `EKKO-BSART` — purchasing document type
- `EKKO-KDATB` — validity start
- `EKKO-KDATE` — validity end
- `EKKO-WAERS` — document currency
- `EKKO-KTWRT` — target value
- `EKPO-KTMNG` — target quantity at item level
- `EKPO-ZWERT` — target value at item level
- `EKPO-LOEKZ` — item deletion indicator

The ECC datasource accepts only purchasing documents with `EKKO-BSTYP = 'K'` and counts only non-deleted `EKPO` items.

## Deterministic scenarios traced

| # | Input condition | Expected | Source-review result |
|---|---|---|---|
| 1 | valid 2026-01-01 → 2026-12-31, key date 2026-09-01, items > 0 | `ACTIVE` | consistent |
| 2 | validity ends 2026-09-20, key date 2026-09-01, warning 30 days | `EXPIRING_SOON` + 19 days | consistent |
| 3 | validity ended 2026-08-31 before key date | `EXPIRED` | consistent |
| 4 | validity begins 2026-10-01 after key date | `NOT_YET_VALID` | consistent |
| 5 | end date before start date | `INVALID_VALIDITY` | consistent |
| 6 | validity end missing | `VALIDITY_INCOMPLETE` | consistent |
| 7 | structurally valid agreement with zero active items | `NO_ITEMS` | consistent |
| 8 | target value/item-target counters supplied by datasource | values preserved in result | consistent |

```text
Scenarios reviewed: 8
Consistent:        8
Mismatches:        0
```

## Precedence reviewed

The service applies diagnostic precedence in this order:

1. incomplete validity
2. invalid validity interval
3. no active items
4. not yet valid
5. expired
6. expiring within warning window
7. active

This avoids classifying a structurally invalid agreement as active simply because its end date is later than the key date.

## Functional boundary

The lab is a **read-only contract diagnostic**, not a replacement for SAP purchasing-contract processing. It does not calculate or validate release strategy, release-order consumption, source determination, service entry sheets, invoice verification, condition technique/pricing completeness, budget/account assignment, commitment consumption or service-package hierarchy.

## Reproducible verification guide

The build guide documents object creation, syntax/activation checks, ABAP Unit execution, `SE38` execution and `SE93` report-transaction configuration for an authorized ECC development/sandbox environment. Results are recorded only when directly observed.

## Public evidence claim

> SAP ECC MM contract-audit source over read-only `EKKO/EKPO`, eight deterministic validity scenarios reviewed consistently, SALV report source and bilingual reproducible construction/verification guides.
