# Build Guide — `ZMM_CONTRACT_AUDIT`

[Versión en español](./BUILD_GUIDE.es.md)

> **Goal:** reproduce the read-only Contract Audit in an authorized SAP ECC development/sandbox using the versioned source in this repository.

## Object order

Create and activate one object at a time:

1. `ZCX_MM_CONTRACT_NOT_FOUND` — `SE24`
2. `ZIF_MM_CONTRACT_SOURCE` — `SE24` / `SE80`
3. `ZCL_MM_CONTRACT_SOURCE_DEMO` — `SE24`
4. `ZCL_MM_CONTRACT_SOURCE_ECC` — `SE24`
5. `ZCL_MM_CONTRACT_AUDIT_SERVICE` — `SE24`
6. local ABAP Unit test classes
7. `ZMM_CONTRACT_AUDIT_REPORT` — `SE38` / `SE80`
8. `ZMM_CONTRACT_AUDIT` — `SE93` Report Transaction

Use an authorized customer package or `$TMP` only for an approved local experiment.

## Standard DDIC prerequisites

Confirm the target ECC release resolves:

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

Create global class `ZCX_MM_CONTRACT_NOT_FOUND`, inheriting from `CX_STATIC_CHECK`, using:

`source/zcx_mm_contract_not_found.clas.abap`

Verification checkpoint: Syntax Check + activation.

## 2 — Datasource contract

Create interface `ZIF_MM_CONTRACT_SOURCE` from:

`source/zif_mm_contract_source.intf.abap`

The interface returns one transparent snapshot for one purchasing contract.

## 3 — Synthetic datasource

Create `ZCL_MM_CONTRACT_SOURCE_DEMO`.

This source supports deterministic domain-rule verification without enterprise data.

## 4 — ECC datasource

Create `ZCL_MM_CONTRACT_SOURCE_ECC`.

Read-only scope:

```text
EKKO
 └── contract header / validity / vendor / purchasing context

EKPO
 └── active item target indicators
```

Only `EKKO-BSTYP = 'K'` purchasing contracts are accepted. Deleted items are excluded from active-item counts.

Service-package hierarchy is outside this artifact's scope; the guide does not present it as an unimplemented promise.

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

Add:

`source/zcl_mm_contract_audit_service.clas.testclasses.abap`

Repository source review:

```text
Scenarios reviewed: 8
Consistent:        8
Mismatches:        0
```

When executing ABAP Unit in SAP, record only the observed result. Do not infer a runtime `8/8 PASS` from source review.

## 7 — Executable report

Create executable program `ZMM_CONTRACT_AUDIT_REPORT` from:

`source/zmm_contract_audit_report.prog.abap`

Selection parameters:

- contract / purchasing document
- key date
- warning days

Expected output: one SALV audit row. Execute first from `SE38` before creating the transaction code.

## 8 — Transaction code

In `SE93`, create:

```text
Transaction: ZMM_CONTRACT_AUDIT
Type:        Report Transaction / Program and selection screen
Program:     ZMM_CONTRACT_AUDIT_REPORT
Short text:  MM Contract Audit
```

## Result recording

For an authorized execution, record only observed, sanitized values:

```text
Exception class:
Datasource interface:
Demo datasource:
ECC datasource:
Domain service:
ABAP Unit total/pass/fail:
Report SE38:
SE93 transaction:
SALV observed:
```

Leave non-observed fields blank. Do not publish vendor, contract, organization, plant, amount, SID/client, user or transport values.

## Evidence represented by this guide

This guide is complete as a **reproducible construction and verification procedure** for the versioned source. Runtime results are claimed only when separately recorded from an actual authorized SAP execution.
