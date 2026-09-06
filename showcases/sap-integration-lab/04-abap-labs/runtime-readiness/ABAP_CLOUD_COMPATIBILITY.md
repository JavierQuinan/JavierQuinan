# ABAP Cloud Compatibility Review

[Versión en español](./ABAP_CLOUD_COMPATIBILITY.es.md)

> Per-source classification, by static reading only. None of the phrases "Clean Core compliant," "ABAP Cloud verified," or "ATC clean" is used anywhere in this package — none of those have runtime/tooling evidence behind them yet. The categories below are the only claims made.

## Legend

| Category | Meaning |
|---|---|
| `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | Every construct found is a released ABAP Cloud language element or released API, by manual code reading — not yet confirmed by an actual ADT syntax check or ATC run |
| `LIKELY_COMPATIBLE_NEEDS_RUNTIME` | Mostly released constructs, with at least one specific element whose exact release status needs runtime/tooling confirmation |
| `CLASSIC_ABAP_DEPENDENCY` | Uses a construct tied to classic ABAP / non-released status (none found in this set — listed for completeness) |
| `COURSE_SPECIFIC_DEPENDENCY` | Depends on an object (`ZEMP_LOGALI`) that only exists in the training environment |
| `UNKNOWN` | Not enough information to classify |

## Classification

| Source | Category | Basis |
|---|---|---|
| `zcl_lab_01_var_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | Only `if_oo_adt_classrun`, `cl_abap_context_info`, elementary/structured types, `CONV`, `/dmo/employee_hr` (a released standard demo table) — no classic-ABAP constructs found |
| `zcl_lab_02_arithmetic_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | Pure arithmetic statements and built-in `sqrt( )` — no object dependency at all |
| `zcl_lab_03_datatypes_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | `cl_abap_context_info`, `utclong_current( )`, `utclong_add( )` — all released for ABAP Cloud |
| `zcl_lab_04_message_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | String/regex built-in functions only, plus a text-pool symbol (an ADT metadata feature, not a release-restricted API) |
| `zcl_lab_05_invoice_fq` | `COURSE_SPECIFIC_DEPENDENCY` | 7 of 8 methods are `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` on their own (string functions, `cl_abap_typedescr`/`cl_abap_structdescr` RTTI — both released); the 8th method (`demo_2_concat_lines_tab`) depends on `ZEMP_LOGALI`, which drives the whole-file classification |
| `zcl_lab_05_invoice_fqa` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | `OVERLAY`, `substring*`, `FIND`, `REPLACE`/`REPLACE REGEX`, `repeat( )`, `escape( )` with `cl_abap_format` — all released string-processing constructs, no external object |
| `zcl_lab_06_condition_fq` | `COURSE_SPECIFIC_DEPENDENCY` | 8 of 9 methods use only released constructs (`SWITCH`, `COND`, `DO`, `WHILE`, `CASE`, `TRY`/`CATCH cx_sy_zerodivide`); the class as a whole cannot activate without `ZEMP_LOGALI` because of the class-level `DATA` type references |
| `zcl_lab_07_tables_fq` | `LIKELY_COMPATIBLE_NEEDS_RUNTIME` | Own `ty_employee`/`VALUE #( )` logic is released-only; `/dmo/connection` reads/types are standard demo objects, which are normally released for ABAP Cloud trial/demo systems, but their actual presence and any package/API-state assignment restrictions need runtime confirmation |
| `zcl_lab_07_tables_fqa` | `LIKELY_COMPATIBLE_NEEDS_RUNTIME` | Same `/DMO/*` caveat as lab-07 (three tables here, not one), plus modern constructs (`ENUM`, `GROUP BY`/`FOR GROUPS`, `COLLECT`, `LET`, `BASE`, `RANGE OF`) that are released in current ABAP but should still be exercised once, live, given how many are used together in one class |
| `zcl_lab_08_fieldsymbols_fq` | `COURSE_SPECIFIC_DEPENDENCY` | Field-symbol techniques themselves (`ASSIGN`, `LOOP ... ASSIGNING`, `APPEND/INSERT ... ASSIGNING`, `READ TABLE ... ASSIGNING`) are released; blocked because the field symbol's TYPE is `zemp_logali`. Additionally uses `sy-datum` directly — see the open question below |

## Runtime-ready variants (not yet executed — reviewed for the same reasons)

| Source | Category | Basis |
|---|---|---|
| `zcl_employee_fixture_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | Local TYPEs, `VALUE #( )`, one static method — no external dependency of any kind |
| `zcl_lab_05_invoice_rt_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | Same as historical `zcl_lab_05_invoice_fq` minus the `ZEMP_LOGALI` SELECT, which was the only non-released-object dependency |
| `zcl_lab_06_condition_rt_fq` | `ABAP_CLOUD_COMPATIBLE_BY_REVIEW` | Same as historical `zcl_lab_06_condition_fq` minus the `ZEMP_LOGALI` type dependency |
| `zcl_lab_08_fieldsymbols_rt_fq` | `LIKELY_COMPATIBLE_NEEDS_RUNTIME` | Same as historical `zcl_lab_08_fieldsymbols_fq` minus the `ZEMP_LOGALI` type dependency; the `sy-datum` open question (below) still applies unchanged, since removing it was judged out of scope for a dependency-only fix |

## Open question: direct `sy-*` field access

`sy-datum` is read directly in `zcl_lab_08_fieldsymbols_fq` (and its runtime-ready variant). `sy-subrc` and `sy-index` are read directly in `zcl_lab_05_invoice_fq`, `zcl_lab_06_condition_fq`, and `zcl_lab_07_tables_fq`. Not all `sy-*` system fields carry the same release status across every ABAP Cloud development model (public cloud key-user/developer extensibility vs. on-premise/private-cloud ABAP Cloud vs. classic on-premise) — `sy-subrc` and `sy-index` are broadly documented as released; `sy-datum`'s status specifically should be confirmed with ADT's own syntax/release check (or the ABAP Cloud "check pragma"/quick-fix suggestions ADT surfaces when a construct isn't released for the assigned software component) rather than assumed either way here. This is listed as an open item for Phase 14, not resolved by this review.

## What is explicitly not claimed

- No source here is called "Clean Core compliant."
- No source here is called "ABAP Cloud verified."
- No source here is called "ATC clean."
- No compatibility claim above substitutes for an actual ADT activation + ATC run in the target system.
