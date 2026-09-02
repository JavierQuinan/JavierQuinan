# Build Guide — `ZMM_CONTRACT_AUDIT`

[Versión en español](./BUILD_GUIDE.es.md)

> **Goal:** reproduce the read-only Contract Audit in an authorized SAP ECC DEV/sandbox.  
> **Public runtime status:** deferred until actual SAP execution evidence exists.

## Object order

Create and activate one object at a time:

1. `ZCX_MM_CONTRACT_NOT_FOUND` — `SE24`
2. `ZIF_MM_CONTRACT_SOURCE` — `SE24` / `SE80`
3. `ZCL_MM_CONTRACT_SOURCE_DEMO` — `SE24`
4. `ZCL_MM_CONTRACT_SOURCE_ECC` — `SE24`
5. `ZCL_MM_CONTRACT_AUDIT_SERVICE` — `SE24`
6. local ABAP Unit test classes for the service
7. `ZMM_CONTRACT_AUDIT_REPORT` — `SE38` / `SE80`
8. `ZMM_CONTRACT_AUDIT` — `SE93` Report Transaction

Use an authorized customer package or `$TMP` only for an approved local experiment.

## Standard DDIC prerequisites

Before activation, confirm the target ECC release resolves:

- `EKKO-EBELN`
- `EKKO-LIFNR`
- `EKKO-EKORG`
- `EKKO-BSART`
- `EKKO-BSTYP`
- `EKKO-KDATB`
- `EKKO-KDATE`
- `EKKO-WAERS`
- `EKKO-KTWRT`
- `EKPO-KTMNG`
- `EKPO-ZWERT`
- `EKPO-LOEKZ`

## 1 — Exception

Create global class `ZCX_MM_CONTRACT_NOT_FOUND`, inheriting from `CX_STATIC_CHECK`.

Use:

`source/zcx_mm_contract_not_found.clas.abap`

Gate:

```text
Syntax ........ PASS
Activation .... PASS
```

## 2 — Datasource contract

Create interface `ZIF_MM_CONTRACT_SOURCE` from:

`source/zif_mm_contract_source.intf.abap`

The interface returns one transparent snapshot for one purchasing contract.

## 3 — Synthetic datasource

Create `ZCL_MM_CONTRACT_SOURCE_DEMO`.

This source exists so the domain rules can be tested without enterprise data.

## 4 — ECC datasource

Create `ZCL_MM_CONTRACT_SOURCE_ECC`.

Read-only scope:

```text
EKKO
 └── contract header / validity / vendor / purchasing context

EKPO
 └── active item target indicators
```

The first version does not traverse service-package tables.

## 5 — Audit service

Create `ZCL_MM_CONTRACT_AUDIT_SERVICE`.

Transparent states:

- `ACTIVE`
- `EXPIRING_SOON`
- `EXPIRED`
- `NOT_YET_VALID`
- `INVALID_VALIDITY`
- `VALIDITY_INCOMPLETE`
- `NO_ITEMS`

## 6 — ABAP Unit

Add the local test source:

`source/zcl_mm_contract_audit_service.clas.testclasses.abap`

Prepared vectors: **8**.

Do not publish a runtime `8/8 PASS` claim until it is actually observed in SAP.

## 7 — Executable report

Create executable program:

`ZMM_CONTRACT_AUDIT_REPORT`

Source:

`source/zmm_contract_audit_report.prog.abap`

Selection parameters:

- contract / purchasing document
- key date
- warning days

Expected output: one SALV audit row.

Execute first from `SE38` before creating a transaction code.

## 8 — Transaction code

In `SE93`, create:

```text
Transaction: ZMM_CONTRACT_AUDIT
Type:        Report Transaction / Program and selection screen
Program:     ZMM_CONTRACT_AUDIT_REPORT
Short text:  MM Contract Audit
```

## Runtime evidence gate

If this lab is eventually executed in an authorized SAP system, record only sanitized evidence:

```text
Exception class ........ PASS
Datasource interface ... PASS
Demo datasource ........ PASS
ECC datasource ......... PASS
Domain service ......... PASS
ABAP Unit .............. x/8 PASS
Report SE38 ............ PASS
SE93 transaction ....... PASS
SALV ................... PASS
```

Until then the source remains `RUNTIME_DEFERRED`.
