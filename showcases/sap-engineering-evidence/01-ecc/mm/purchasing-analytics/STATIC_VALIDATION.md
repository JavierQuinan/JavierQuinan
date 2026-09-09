# Static Validation — `ZMM_PURCH_ANALYTICS`

> **Validation type:** source-level deterministic trace  
> **Runtime boundary:** this record does not claim executed ABAP Unit results inside SAP

## Reviewed scenarios

| # | Scenario | Expected result | Source trace |
|---|---|---|---|
| 1 | PR exists and has no PO reference | `PR_ONLY` | consistent |
| 2 | PR has PO reference but category-F header/item cannot be resolved | `REFERENCE_GAP` | consistent |
| 3 | PO header/item resolve and no schedule lines exist | `PO_WITHOUT_SCHEDULE` | consistent |
| 4 | PO header/item resolve and schedule lines exist | `PO_WITH_SCHEDULE` | consistent |
| 5 | PR deletion indicator is set | `PR_DELETED` | consistent |
| 6 | PO item deletion indicator is set | `PO_ITEM_DELETED` | consistent |
| 7 | Demo datasource resolves synthetic PR→PO→schedule data | `PO_WITH_SCHEDULE` | consistent |

```text
Scenarios reviewed: 7
Consistent:        7
Mismatches:        0
```

## Data-flow review

The ECC source performs read-only resolution:

```text
EBAN BANFN/BNFPO
      │
      ├── no EBELN/EBELP → PR_ONLY candidate
      │
      ▼
EKKO with BSTYP = 'F'
      │
      ├── no category-F PO header → REFERENCE_GAP candidate
      ▼
EKPO referenced item
      │
      ├── missing item → REFERENCE_GAP candidate
      ▼
EKET schedule lines
```

`EKET-EINDT` is used only for schedule-line delivery-date visibility. The lab does not calculate goods receipts, commitments, MRP, release strategy or service-entry status.

## Integrity review

Source contains no purchasing-document write operation:

- no `UPDATE`
- no `INSERT`
- no database `MODIFY`
- no `DELETE`
- no BAPI document creation/change
- no `BAPI_TRANSACTION_COMMIT`

## Reproducible verification guide

The build guide documents syntax/activation checks, ABAP Unit execution, `SE38` report execution and `SE93` report-transaction configuration for an authorized ECC development/sandbox environment. Runtime values are recorded only when actually observed.

## Public evidence claim

> Read-only SAP ECC MM purchasing analytics source using `EBAN → EKKO/EKPO → EKET`, a Purchase Order category guard, seven deterministic scenarios reviewed consistently, SALV report source and a reproducible build/verification guide.
