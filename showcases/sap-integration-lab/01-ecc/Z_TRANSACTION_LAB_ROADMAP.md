# SAP ECC — Z Transaction Lab Roadmap

[Versión en español](./Z_TRANSACTION_LAB_ROADMAP.es.md)

> This roadmap converts real functional experience into original, publishable ABAP engineering evidence. It does not reproduce third-party code, customizing, or internal development names.

## Principles

1. Every Z transaction must solve a verifiable business scenario.
2. Standard APIs/BAPIs are preferred over direct table editing or batch input.
3. Any write process must provide simulation/dry-run before commit.
4. Organizational values, customers, orders, installations and users remain synthetic or sanitized.
5. Every lab includes EN/ES documentation, ABAP Unit where applicable and an `EVIDENCE.md` runtime gate.
6. ECC/IS-U evidence remains separate from S/4HANA/ABAP Cloud evidence.

## Lab 01 — `ZMM_STOCK_RISK`

**Domain:** ECC MM  
**Type:** Report Transaction / read-only  
**Status:** source ready, runtime validation pending

Goal: material/plant/storage-location stock-risk diagnostic using `MARC` and `MARD`, OO service design, SALV and ABAP Unit.

## Lab 02 — `ZWM_ORDER_MONITOR_LAB`

**Domain:** ECC IS-U / WM  
**Type:** read-only monitor

Goal: build an original work-order monitor inspired by professional `IW38` operating patterns, with order type, status, work center and date filters, without copying private layouts or organizational codes.

Target evidence:

- selection and filtering
- system/user status handling
- ALV/SALV output
- controlled navigation to standard order display when authorized
- transformation/filtering tests

## Lab 03 — `ZWM_ORDER_CREATE_LAB`

**Domain:** ECC IS-U / WM / PM-CS order processing  
**Type:** transactional lab

Goal: individual and mass order creation using synthetic data and standard interfaces available in the system. For maintenance/service orders, `BAPI_ALM_ORDER_MAINTAIN` will be evaluated before custom alternatives.

Mandatory controls:

- pre-validation
- simulation mode
- row-level messages
- explicit commit only after validation
- rollback on error
- no organizational hardcoding

## Lab 04 — `ZWM_RELEASE_PLAN_LAB`

**Domain:** ECC WM / background processing  
**Type:** planning and jobs

Goal: demonstrate automated release planning with generic parameters, frequency, allowed execution window, exclusions and monitoring.

Target evidence:

- planning parameters
- background-job scheduling
- day/window exclusions
- application log
- observability through standard tools such as `SM37`

The private Z transaction and internal configuration from operational guides will not be copied.

## Lab 05 — `ZWM_MASS_CLOSE_LAB`

**Domain:** ECC WM / PM-CS  
**Type:** controlled mass update

Goal: technical completion of synthetic/eligible orders using a standard API when supported by the target release.

Safety rules:

- mandatory dry-run
- eligible orders only
- exclude pending material-consumption scenarios until corresponding validation exists
- log per order
- controlled retry/idempotency
- commit only for a consistent unit of work

## Lab 06 — `ZWM_STATUS_AUDIT_LAB`

**Domain:** ECC WM / status management  
**Type:** read-only troubleshooting

Goal: audit active and historical order statuses using standard status mechanisms and read-only queries, with no real order identifiers in public evidence.

## Promotion path

Every lab follows:

`PLANNED -> SOURCE_READY -> RUNTIME_VALIDATION_PENDING -> RUNTIME_VALIDATED -> TEST_VALIDATED`

No runtime claim is published until execution is observed in an authorized SAP system.

## Public technical basis

SAP documents `SE93` Transaction Maintenance with report, dialog, OO, variant and parameter transaction types. For PM/CS order maintenance, SAP exposes `BAPI_ALM_ORDER_MAINTAIN` as a standard interface in multiple maintenance scenarios.
