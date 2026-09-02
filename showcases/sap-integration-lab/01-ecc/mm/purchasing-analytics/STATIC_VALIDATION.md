# Static Validation — `ZMM_PURCH_ANALYTICS`

> **Validation type:** source-level deterministic trace  
> **SAP runtime:** not claimed

## Reviewed vectors

| # | Scenario | Expected result | Source trace |
|---|---|---|---|
| 1 | PR exists and has no PO reference | `PR_ONLY` | consistent |
| 2 | PR has PO reference but header/item cannot be resolved | `REFERENCE_GAP` | consistent |
| 3 | PO header/item resolve and no schedule lines exist | `PO_WITHOUT_SCHEDULE` | consistent |
| 4 | PO header/item resolve and schedule lines exist | `PO_WITH_SCHEDULE` | consistent |
| 5 | PR deletion indicator is set | `PR_DELETED` | consistent |
| 6 | PO item deletion indicator is set | `PO_ITEM_DELETED` | consistent |
| 7 | Demo datasource resolves synthetic PR→PO→schedule data | `PO_WITH_SCHEDULE` | consistent |

Result:

```text
Vectors reviewed: 7
Consistent:       7
Mismatches:       0
```

## Data-flow review

The ECC source performs read-only resolution:

```text
EBAN BANFN/BNFPO
      │
      ├── no EBELN/EBELP → PR_ONLY candidate
      │
      ▼
EKKO + EKPO
      │
      ├── missing referenced header/item → REFERENCE_GAP candidate
      │
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

## Runtime boundary

The 7 vectors are **not** presented as executed ABAP Unit results. Future runtime promotion requires syntax check, activation, ABAP Unit execution, report execution and SE93 transaction execution in an authorized SAP ECC DEV/sandbox.
