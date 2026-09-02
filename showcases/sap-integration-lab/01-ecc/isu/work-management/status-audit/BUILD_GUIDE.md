# Build Guide — `ZWM_STATUS_AUDIT_LAB`

[Versión en español](./BUILD_GUIDE.es.md)

> **Goal:** reproduce the read-only work-order status audit in an authorized SAP ECC DEV/sandbox.  
> **Runtime status:** deferred until real SAP evidence exists.

## Object order

1. `ZCX_WM_ORDER_NOT_FOUND` — `SE24`
2. `ZIF_WM_STATUS_SOURCE` — `SE24` / `SE80`
3. `ZCL_WM_STATUS_SOURCE_DEMO` — `SE24`
4. `ZCL_WM_STATUS_SOURCE_ECC` — `SE24`
5. `ZCL_WM_STATUS_AUDIT_SERVICE` — `SE24`
6. local ABAP Unit classes
7. `ZWM_STATUS_AUDIT_REPORT` — `SE38`
8. `ZWM_STATUS_AUDIT_LAB` — `SE93` Report Transaction

## Standard DDIC prerequisites

Confirm the target release resolves:

- `AUFK-AUFNR`, `AUFK-OBJNR`
- `JSTO-STSMA`
- `JEST-STAT`, `JEST-INACT`, `JEST-CHGNR`
- `JCDS-UDATE`, `JCDS-UTIME`, `JCDS-CHGNR`
- `TJ02T-ISTAT`, `TJ02T-TXT04`, `TJ02T-TXT30`
- `TJ30T-STSMA`, `TJ30T-ESTAT`, `TJ30T-TXT04`, `TJ30T-TXT30`

## ECC datasource behavior

The source resolves:

```text
AUFNR → AUFK-OBJNR
OBJNR → JSTO/JEST/JCDS
I.... → TJ02T system text
E.... → TJ30T user text using JSTO-STSMA
```

`INACT` is preserved so the service can distinguish active from historical records.

The history read returns only count and latest date/time; user/TCode fields are deliberately excluded from the public lab.

## ABAP Unit

Use:

`source/zcl_wm_status_audit_service.clas.testclasses.abap`

Prepared vectors: **6**.

Do not claim runtime `6/6 PASS` until observed in SAP.

## Executable report

Create `ZWM_STATUS_AUDIT_REPORT` from:

`source/zwm_status_audit_report.prog.abap`

Selection:

- work order number

SALV displays status rows plus:

- active/system/user classification
- status-profile context
- active vs historical distinction
- status texts
- change number
- summary counts
- latest status-change date/time
- diagnostic result

## SE93

Create:

```text
Transaction: ZWM_STATUS_AUDIT_LAB
Type:        Report Transaction / Program and selection screen
Program:     ZWM_STATUS_AUDIT_REPORT
Short text:  WM Status Audit Lab
```

## Runtime gate

Future authorized validation should record only sanitized results:

```text
Exception .............. PASS
Datasource interface ... PASS
Demo datasource ........ PASS
ECC datasource ......... PASS
Audit service .......... PASS
ABAP Unit .............. x/6 PASS
SE38 report ............ PASS
SE93 transaction ....... PASS
SALV ................... PASS
```

Until then: `RUNTIME_DEFERRED`.
