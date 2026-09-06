# /DMO/* Dependency Check

[Versión en español](./DMO_DEPENDENCY_CHECK.es.md)

> Every `/DMO/*` reference found across the 10 published sources, by static reading only. `AVAILABILITY = UNKNOWN` for all of them until checked directly in the target ABAP Cloud system (ADT Data Preview or a `SELECT` test). Nothing here assumes the SAP Flight Reference Scenario is installed — it usually is, on ABAP trial/demo systems, but this must not be asserted without checking.

## Tables

| Object | Used by lab | Purpose | Required fields | Fallback strategy | Can be replaced synthetically? | Status |
|---|---|---|---|---|---|---|
| `/DMO/EMPLOYEE_HR` | 01 | `SELECT SINGLE *` into a Dictionary-backed structure, printed as-is | None named individually — the whole row is printed generically | If absent: the class still activates (it's only a runtime `SELECT`, not a compile-time type for a local structure — `DATA ms_employees TYPE /dmo/employee_hr` **is** a compile-time type reference, so absence of the table as a DDIC object blocks activation, not just the `SELECT`) | Not recommended for lab-01 specifically — the exercise's own point in this section is reading a real Dictionary-backed structure; a synthetic local structure would still demonstrate the type system but would weaken the "read from Dictionary-backed structure" claim. Prefer verifying `/DMO/EMPLOYEE_HR` exists over forking this lab. | `AVAILABILITY = UNKNOWN` |
| `/DMO/CONNECTION` | 07, 07a | `SELECT` into `tt_connection`/`mt_airline` (compile-time `STANDARD TABLE OF /dmo/connection` type in both labs); read, sort, modify (in-memory), delete (in-memory), group-by in 07a | `carrier_id`, `connection_id`, `airport_from_id`, `airport_to_id`, `distance_unit`, `departure_time` | If absent: both labs fail to activate (compile-time type dependency) | Not recommended — labs 07/07a's stated purpose is specifically to demonstrate internal-table operations *against real SAP flight-model demo data*; a synthetic substitute would need re-scoping the lab's own claim, which is out of scope for this reproducibility pass (see Phase 11 — no new lab content yet) | `AVAILABILITY = UNKNOWN` |
| `/DMO/FLIGHT` | 07a | `SELECT` into `mt_flights_type` (compile-time `STANDARD TABLE OF /dmo/flight` type); used in `nested_for`, `collect_records`, `use_let`, `use_base`, `use_range_tables` | `carrier_id`, `connection_id`, `client`, `seats_occupied`, `seats_max`, `flight_date`, `price` | If absent: class fails to activate | Not recommended, same reasoning as `/DMO/CONNECTION` above | `AVAILABILITY = UNKNOWN` |
| `/DMO/CARRIER` | 07a | `SELECT * FROM /dmo/carrier` into `mt_scarr` (compile-time `STANDARD TABLE OF /dmo/carrier` type); used only in `use_let` to look up an airline name | `carrier_id`, `name` | If absent: class fails to activate | Not recommended, same reasoning | `AVAILABILITY = UNKNOWN` |

## Data elements (used as field TYPEs, not as tables)

| Object | Used by lab | Purpose | Fallback strategy | Can be replaced synthetically? | Status |
|---|---|---|---|---|---|
| `/DMO/CARRIER_ID` | 07a | Field type for `aircode`/`carrier_id` in local structures | Ships in the same package as `/DMO/CARRIER`/`/DMO/CONNECTION`/`/DMO/FLIGHT` — verify together | Not recommended in isolation | `AVAILABILITY = UNKNOWN` |
| `/DMO/CONNECTION_ID` | 07a | Field type for `flightnum`/`connection_id` | Same as above | Not recommended in isolation | `AVAILABILITY = UNKNOWN` |
| `/DMO/AIRPORT_FROM_ID`, `/DMO/AIRPORT_TO_ID` | 07a | Field types for route endpoints | Same as above | Not recommended in isolation | `AVAILABILITY = UNKNOWN` |
| `/DMO/PLANE_SEATS_OCCUPIED` | 07a | Field type for `seat`/`seats` | Same as above | Not recommended in isolation | `AVAILABILITY = UNKNOWN` |
| `/DMO/FLIGHT_DATE` | 07a | Field type for `flightdate` | Same as above | Not recommended in isolation | `AVAILABILITY = UNKNOWN` |
| `/DMO/FLIGHT_PRICE` | 07a | Field type for `bookings`, and for the `RANGE OF /dmo/flight_price` used in `use_range_tables` | Same as above | Not recommended in isolation | `AVAILABILITY = UNKNOWN` |

## Not a DMO dependency (noted to avoid confusion)

`LAND1` (used in `ty_flights-key`, lab 07a) is a **standard SAP Basis** data element (country key), not part of the `/DMO/*` package. It ships with every SAP system's base Dictionary and is not expected to be a reproducibility risk — included here only so it is not mistakenly chased as a missing DMO object.

## How to check (summary — full steps in `ADT_EXECUTION_GUIDE.md`)

For each table above: open it in ADT's Data Preview (`F8` on the object, or right-click → "Open With" → "Data Preview") in the target system, confirm it returns at least the rows the relevant `WHERE` clauses expect (e.g. `carrier_id = 'LH'`/`'SQ'`, `connection_id > '0400'`, `distance_unit = 'KM'`, `airport_from_id = 'FRA'`, `price BETWEEN 200 AND 400`). Record the actual row count and a sanitized sample in the lab's own evidence file per `RUNTIME_EVIDENCE_CHECKLIST.md` — do not assume the WHERE-clause filters will return non-empty results just because the table exists.

## Status of this document

All rows are `AVAILABILITY = UNKNOWN` by design, per the governing instruction not to presuppose SAP object availability. This must be updated only after a real check in ADT, by the account owner — not fabricated or inferred here.
