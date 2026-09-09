# Build Guide — `ZMM_PURCH_ANALYTICS`

[Versión en español](./BUILD_GUIDE.es.md)

> **Goal:** reproduce the read-only purchasing analytics source in an authorized SAP ECC development/sandbox using the versioned files in this repository.

## Object order

1. `ZCX_MM_PURCH_NOT_FOUND` — `SE24`
2. `ZIF_MM_PURCH_SOURCE` — `SE24` / `SE80`
3. `ZCL_MM_PURCH_SOURCE_DEMO` — `SE24`
4. `ZCL_MM_PURCH_SOURCE_ECC` — `SE24`
5. `ZCL_MM_PURCH_ANALYTICS_SERVICE` — `SE24`
6. local ABAP Unit classes
7. `ZMM_PURCH_ANALYTICS_REPORT` — `SE38`
8. `ZMM_PURCH_ANALYTICS` — `SE93` Report Transaction

## Standard DDIC prerequisites

Confirm the target release resolves:

- `EBAN-BANFN`, `EBAN-BNFPO`
- `EBAN-BADAT`, `EBAN-LFDAT`, `EBAN-LOEKZ`
- `EBAN-MATNR`, `EBAN-WERKS`, `EBAN-EKGRP`
- `EBAN-EBELN`, `EBAN-EBELP`
- `EKKO-BSTYP`, `EKKO-BEDAT`, `EKKO-LIFNR`, `EKKO-EKORG`
- `EKPO-LOEKZ`, `EKPO-MENGE`, `EKPO-MEINS`
- `EKET-EINDT`

## ECC datasource behavior

```text
BANFN/BNFPO
   ↓
EBAN
   ├── PR metadata
   └── EBELN/EBELP reference when present
           ↓
 EKKO where BSTYP = 'F'
           ↓
          EKPO
           ↓
          EKET
```

`BSTYP = 'F'` is the Purchase Order category guard. A referenced purchasing document that does not resolve as category `F` is not treated as a PO.

A missing PO reference is a valid `PR_ONLY` situation. `REFERENCE_GAP` is used only when the PR carries a downstream reference that cannot be resolved as the expected PO header/item.

## ABAP Unit

Use:

`source/zcl_mm_purch_analytics_service.clas.testclasses.abap`

Repository source review:

```text
Scenarios reviewed: 7
Consistent:        7
Mismatches:        0
```

When executing ABAP Unit in SAP, record only observed total/pass/fail values. Do not infer runtime `7/7 PASS` from source review.

## Executable report

Create `ZMM_PURCH_ANALYTICS_REPORT` from:

`source/zmm_purch_analytics_report.prog.abap`

Selection:

- Purchase Requisition (`BANFN`)
- PR item (`BNFPO`)

SALV output includes:

- PR/item reference
- PR/document/delivery-date context
- material/plant/purchasing group
- linked PO/item when present
- vendor/purchasing organization
- PO quantity/unit
- schedule-line count
- earliest/latest schedule delivery date
- diagnostic result

## SE93

Create:

```text
Transaction: ZMM_PURCH_ANALYTICS
Type:        Report Transaction / Program and selection screen
Program:     ZMM_PURCH_ANALYTICS_REPORT
Short text:  MM Purchasing Analytics
```

## Result recording

For an authorized execution, record only observed and sanitized values:

```text
Exception:
Datasource interface:
Demo datasource:
ECC datasource:
Analytics service:
ABAP Unit total/pass/fail:
SE38 report:
SE93 transaction:
SALV observed:
```

Leave non-observed fields blank. Do not publish real PR/PO/vendor/material, organizational, SID/client, user or transport data.

## Evidence represented by this guide

This guide is complete as a **reproducible construction and verification procedure** for the versioned source. Runtime values are claimed only when separately recorded from an actual authorized SAP execution.
