# Build Guide — `ZMM_PURCH_ANALYTICS`

[Versión en español](./BUILD_GUIDE.es.md)

> **Goal:** reproduce the read-only purchasing analytics lab in an authorized SAP ECC DEV/sandbox.  
> **Runtime status:** deferred until real SAP evidence exists.

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

`BSTYP = 'F'` is used as the Purchase Order category guard. A referenced purchasing document that does not resolve as category `F` is not silently treated as a PO.

The source intentionally treats a missing PO reference as a valid `PR_ONLY` situation. It reports `REFERENCE_GAP` only when the PR contains a downstream reference that cannot be resolved as the expected PO header/item.

## ABAP Unit

Use:

`source/zcl_mm_purch_analytics_service.clas.testclasses.abap`

Prepared vectors: **7**.

Do not claim runtime `7/7 PASS` until observed in SAP.

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

## Runtime gate

Future authorized validation should record only sanitized results:

```text
Exception .............. PASS
Datasource interface ... PASS
Demo datasource ........ PASS
ECC datasource ......... PASS
Analytics service ...... PASS
ABAP Unit .............. x/7 PASS
SE38 report ............ PASS
SE93 transaction ....... PASS
SALV ................... PASS
```

Until then: `RUNTIME_DEFERRED`.
