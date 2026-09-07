# Runtime Dependency Matrix

[Versión en español](./RUNTIME_DEPENDENCY_MATRIX.es.md)

> Exact technical inventory of every class, table, type, text symbol, and system dependency found in the 10 published ABAP source files at `showcases/sap-integration-lab/04-abap-labs/labs/source/` (read from `origin/main`, not modified). No availability is assumed — anything not verifiable by static reading is `UNKNOWN` until checked in a real ABAP Cloud system. This matrix feeds Issue #36, P0 items 1 and 5.

## Legend — Dependency Type

| Type | Meaning |
|---|---|
| `STANDARD_ABAP` | Core language keyword/statement/built-in function, no object dependency |
| `ABAP_CLOUD_RELEASED` | A released API class/method for the ABAP Cloud programming model (e.g. `cl_abap_context_info`) |
| `DMO` | Standard SAP Flight Reference Scenario demo object (`/DMO/*`) |
| `COURSE_SPECIFIC` | Object provided only by the Logali Group training environment, not part of any standard SAP delivery |
| `CUSTOM_Z` | A customer-namespace object that would need to be created new (none found as a *required new* object yet — see notes) |
| `TEXT_ELEMENT` | ABAP text-pool symbol, maintained in ADT, not part of the source file |
| `UNKNOWN` | Cannot be classified from static source alone |

## Matrix

| Lab | Object | Dependency | Type | Current availability | Blocking | Recommended action |
|---|---|---|---|---|---|---|
| 01 | `if_oo_adt_classrun`, `if_oo_adt_classrun_out` | Interface | ABAP_CLOUD_RELEASED | Available (released ABAP Cloud API) | No | None |
| 01 | `cl_abap_context_info=>get_system_date/get_system_time` | Class/methods | ABAP_CLOUD_RELEASED | Available | No | None |
| 01 | `/dmo/employee_hr` | Standard demo table (`SELECT SINGLE`) | DMO | UNKNOWN | Yes, if absent from target system | Verify in ADT Data Preview before running (see `DMO_DEPENDENCY_CHECK.md`) |
| 01 | `mty_customer` | Local structured TYPE | STANDARD_ABAP | Available (defined inline) | No | None |
| 02 | — | Pure arithmetic (`ADD`/`SUBTRACT`/`MULTIPLY`/`DIVIDE`/`DIV`/`MOD`/`**`/`sqrt( )`) | STANDARD_ABAP | Available | No | None |
| 03 | `cl_abap_context_info=>get_system_date/get_system_time` | Class/methods | ABAP_CLOUD_RELEASED | Available | No | None |
| 03 | `utclong_current( )`, `utclong_add( )` | Built-in functions | STANDARD_ABAP | Available | No | None |
| 04 | `TEXT-001` | Text-pool symbol | TEXT_ELEMENT | Not present (text pool content is not part of the `.abap` source file) | **Yes** — referencing an unmaintained text symbol fails activation | Create `TEXT-001` in ADT's "Text Elements" tab before activating — see `LAB04_TEXT_ELEMENT_DECISION.md` |
| 04 | `strlen`, `numofchar`, `count`, `FIND`, `to_upper/to_lower/to_mixed`, `reverse`, `contains( regex = )` | Built-in string/regex functions | STANDARD_ABAP | Available | No | None |
| 05 | `zemp_logali` | Z table (runtime `SELECT *`, method `demo_2_concat_lines_tab` only) | COURSE_SPECIFIC | Not available outside the Logali Group course environment | Yes, for that one method only — the other 7 methods in the class are unaffected | Use `zcl_employee_fixture_fq` in the runtime-ready variant (see Phase 2/3) |
| 05 | `cl_abap_typedescr`, `cl_abap_structdescr` | RTTI classes | STANDARD_ABAP | Available | No | None |
| 05a | — | Pure string ops (`OVERLAY`, `substring*`, `FIND`, `REPLACE`, `contains`, `REPLACE REGEX`, `repeat`, `escape`), `cl_abap_format` | STANDARD_ABAP / ABAP_CLOUD_RELEASED | Available | No | None |
| 06 | `zemp_logali` | Z table — **compile-time TYPE** for class-level `DATA mt_employees TYPE TABLE OF zemp_logali` and `DATA ms_employee TYPE zemp_logali`, plus a runtime `SELECT *` in `perform_loop_endloop` | COURSE_SPECIFIC | Not available outside the Logali Group course environment | **Yes — activation-blocking.** Unlike lab-05, this is a DDIC type reference, not just a runtime `SELECT`; the class will not activate at all without `ZEMP_LOGALI` existing | Runtime-ready variant is mandatory (see `RUNTIME_VARIANT_MAPPING.md`) — replace the DDIC type reference with a local type and the fixture class |
| 06 | `cx_sy_zerodivide` | Standard exception class | ABAP_CLOUD_RELEASED | Available | No | None |
| 06 | `cl_abap_context_info=>get_system_time` | Class/method | ABAP_CLOUD_RELEASED | Available | No | None |
| 06 | `SWITCH`, `COND`, `DO`/`ENDDO`, `WHILE`/`ENDWHILE`, `CASE`/`ENDCASE`, `TRY`/`CATCH` | Statements | STANDARD_ABAP | Available | No | None |
| 07 | `/dmo/connection` | Standard demo table — **compile-time TYPE** (`TYPES tt_connection TYPE STANDARD TABLE OF /dmo/connection`) and runtime `SELECT` | DMO | UNKNOWN | Yes, if absent from target system (activation-blocking, not just runtime) | Verify in ADT before running |
| 07 | `ty_employee` (id/email/ape1/ape2/name/fechan/fechaa) | Local own TYPE + literal `VALUE #( )` data | STANDARD_ABAP | Available (self-contained, no `ZEMP_LOGALI` dependency in this lab) | No | None — this lab already has no course dependency |
| 07 | `line_exists( )`, `line_index( )` | Built-in table functions | STANDARD_ABAP | Available | No | None |
| 07a | `/dmo/flight`, `/dmo/connection`, `/dmo/carrier` | Standard demo tables — **compile-time TYPE** (3× `STANDARD TABLE OF /dmo/...`) and multiple `SELECT`s | DMO | UNKNOWN | Yes, if any of the three is absent (activation-blocking) | Verify all three in ADT before running |
| 07a | `/dmo/carrier_id`, `/dmo/connection_id`, `/dmo/plane_seats_occupied`, `/dmo/flight_date`, `/dmo/airport_from_id`, `/dmo/airport_to_id`, `/dmo/flight_price` | DMO data elements used as field TYPEs in local structures | DMO | UNKNOWN (same package as the tables above; typically ships together) | Yes, same as above | Verify alongside the 3 tables |
| 07a | `land1` | Standard SAP Basis data element (country key) | STANDARD_ABAP | Available (core Basis DDIC element, not DMO-specific) | No | None |
| 07a | `cl_abap_context_info=>get_user_technical_name( )` | Class/method | ABAP_CLOUD_RELEASED | Available | No (not blocking) — **but see sanitization note** | The returned value is the *executing* system's own technical username, embedded into the `A01` output table (`iduser` field). Not a hardcoded identifier, but it will be real, current, personally-identifying data in any fresh evidence capture — must be cropped/redacted (see `RUNTIME_EVIDENCE_CHECKLIST.md`) |
| 07a | `BEGIN OF ENUM ... BASE TYPE`, `GROUP BY`/`FOR GROUPS`, `COLLECT`, `LET`, `BASE`, `RANGE OF` | Modern ABAP constructs | STANDARD_ABAP | Available | No | None |
| 08 | `zemp_logali` | Z table — **compile-time TYPE** for `FIELD-SYMBOLS <ls_employee> TYPE zemp_logali` plus a runtime `SELECT *` | COURSE_SPECIFIC | Not available outside the Logali Group course environment | **Yes — activation-blocking**, same severity as lab-06 | Runtime-ready variant is mandatory |
| 08 | `sy-datum` | System field, direct read | STANDARD_ABAP | Available, but release status under strict ABAP Cloud contracts varies by development model | LIKELY_COMPATIBLE_NEEDS_RUNTIME — see `ABAP_CLOUD_COMPATIBILITY.md` | Confirm with ADT's ABAP Cloud syntax check; if flagged, replace with `cl_abap_context_info=>get_system_date( )` in the runtime-ready variant only |
| 05/06/07/08 | `sy-subrc`, `sy-index` | System fields, read-only | STANDARD_ABAP / ABAP_CLOUD_RELEASED | Available (released for ABAP Cloud) | No | None |

## Summary

- **No labs use CDS views, RAP artifacts, Behavior Definitions, Service Definitions/Bindings, or OData.** None found in the historical labs, Course 2, or Course 3 practices.
- **No custom Z objects are required to exist** for any of the 10 labs to compile as historical source — the only customer-namespace object referenced is `ZEMP_LOGALI`, which is course-provided, not something this portfolio needs to author from scratch (a *replacement* is designed in Phase 2/3, not a recreation of `ZEMP_LOGALI` itself).
- **3 labs (06, 08, and partially 05) are blocked by `ZEMP_LOGALI`.** Labs 06 and 08 are blocked at activation time (DDIC type reference); lab 05 is blocked only at runtime for one of its eight methods.
- **1 lab (04) is blocked by a missing text element**, not a code dependency.
- **3 labs (01, 07, 07a) depend on `/DMO/*` objects** whose presence in the target system is `UNKNOWN` until checked.
- **4 labs (02, 03, 05a) plus most of lab 07's own logic have zero external dependency** beyond released ABAP Cloud APIs and standard language constructs.
