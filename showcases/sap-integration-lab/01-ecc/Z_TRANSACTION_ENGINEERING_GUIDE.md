# SAP ECC — Z Transaction Engineering Guide

[Versión en español](./Z_TRANSACTION_ENGINEERING_GUIDE.es.md)

This guide explains the engineering pattern used by the **existing custom transaction/report artifacts** in this portfolio. It contains no speculative lab list.

## Existing portfolio artifacts

| Artifact | Domain | Type | Reviewable evidence |
|---|---|---|---|
| `ZMM_STOCK_RISK` | ECC MM | read-only report transaction | ABAP OO · `MARA/MARC/MARD` · SALV · 6 source-reviewed scenarios |
| `ZMM_CONTRACT_AUDIT` | ECC MM Services | read-only report transaction | `EKKO/EKPO` · contract diagnostics · SALV · 8 source-reviewed scenarios |
| `ZMM_PURCH_ANALYTICS` | ECC MM Purchasing | read-only report transaction | `EBAN/EKKO/EKPO/EKET` · SALV · 7 source-reviewed scenarios |
| `ZWM_STATUS_AUDIT_LAB` | ECC IS-U / WM | read-only report transaction | `AUFK/JSTO/JEST/TJ02T/TJ30T/JCDS` · SALV · 6 source-reviewed scenarios |

## Engineering pattern

```text
Business/diagnostic scenario
          ↓
Datasource interface
     ┌────┴────┐
     ▼         ▼
ECC source   Demo source
     └────┬────┘
          ▼
ABAP Objects service
          ↓
Deterministic test scenarios
          ↓
Executable report / SALV
          ↓
SE93 Report Transaction definition
```

This structure separates:

- SAP table/API access;
- business/diagnostic logic;
- synthetic deterministic data;
- presentation/output.

## SE24 — global objects

The existing packs use global exception classes, interfaces and service/datasource classes. The build guides define the dependency order so objects can be recreated coherently.

Typical sequence:

1. exception class;
2. datasource interface;
3. demo datasource;
4. ECC datasource;
5. domain service;
6. local ABAP Unit classes.

## SE38 — executable report

Each pack includes an executable report source with a bounded selection screen and SALV output. The report delegates domain logic to the service instead of embedding all selection/business rules in `START-OF-SELECTION`.

## SE93 — report transaction

The transaction-code pattern is:

```text
SE93
  ↓
Create transaction code
  ↓
Report Transaction / Program and selection screen
  ↓
Assign executable Z report
  ↓
Package / transport according to environment governance
```

The portfolio does not publish customer-specific authorization objects or transport identifiers.

## Read-only policy

All four existing artifacts are diagnostic/read-only evidence. Their source does not contain business-document database updates or transaction commits.

The portfolio deliberately avoids direct-table editing as a troubleshooting or development pattern.

## Test-evidence wording

ABAP Unit source is included in the packs. Deterministic scenarios are described as **source-reviewed** unless actual SAP test execution evidence exists. This avoids presenting static code review as executed SAP runtime.

## Public-data policy

Portfolio source and screenshots use synthetic or sanitized identifiers. Never include:

- customer/company names;
- real materials, vendors, contracts or purchase documents;
- real work orders, installations, contract accounts or meters;
- usernames/SID/client/transport IDs;
- internal URLs/RFC destinations;
- proprietary customer Z source;
- credentials or private certificates.

## Evidence links

- [Inventory & Stock Risk](./mm/inventory-reorder/README.md)
- [Service Procurement & Contract Audit](./mm/service-procurement/README.md)
- [Purchasing Analytics](./mm/purchasing-analytics/README.md)
- [Work Order Status Audit](./isu/work-management/status-audit/README.md)
