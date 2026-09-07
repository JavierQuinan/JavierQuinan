# Runtime Variant Mapping

[Versión en español](./RUNTIME_VARIANT_MAPPING.es.md)

> Maps every historical lab class to its runtime-ready variant (only where one was actually needed), states the exact reason, and confirms ABAP object-naming length constraints. Historical sources are never modified — variants live only in `source/` and are new, additional files.

## Naming-length check (before choosing a suffix)

ABAP global class names (`CLAS`) are limited to 30 characters. The illustrative suffix in the original brief (`_runtime_fq`, 8 extra characters) was checked against all 10 historical names and **exceeds 30 characters for 4 of them** once combined with the existing name length:

| Historical name | Length | `+_runtime_fq` (+8) | Fits in 30? |
|---|---|---|---|
| `zcl_lab_01_var_fq` | 17 | 25 | Yes |
| `zcl_lab_02_arithmetic_fq` | 24 | 32 | **No** |
| `zcl_lab_03_datatypes_fq` | 23 | 31 | **No** |
| `zcl_lab_04_message_fq` | 21 | 29 | Yes (not needed — see below) |
| `zcl_lab_05_invoice_fq` | 21 | 29 | Yes |
| `zcl_lab_05_invoice_fqa` | 22 | 30 | Exactly at the limit (not needed — see below) |
| `zcl_lab_06_condition_fq` | 23 | 31 | **No** |
| `zcl_lab_07_tables_fq` | 20 | 28 | Yes (not needed — see below) |
| `zcl_lab_07_tables_fqa` | 21 | 29 | Yes (not needed — see below) |
| `zcl_lab_08_fieldsymbols_fq` | 26 | 34 | **No** |

Since 4 of the names that would actually need a variant (02/03/06/08 pattern) fail with the illustrative 8-character suffix, this package uses a shorter, equally explicit suffix instead: **`_rt_fq` / `_rt_fqa`** (`_rt` = 3 characters). Recomputed:

| Historical name | Length | `+_rt` (+3) inserted before `_fq`/`_fqa` | Fits in 30? |
|---|---|---|---|
| `zcl_lab_05_invoice_fq` → `zcl_lab_05_invoice_rt_fq` | 21 | 24 | Yes |
| `zcl_lab_06_condition_fq` → `zcl_lab_06_condition_rt_fq` | 23 | 26 | Yes |
| `zcl_lab_08_fieldsymbols_fq` → `zcl_lab_08_fieldsymbols_rt_fq` | 26 | 29 | Yes |

**Open verification item:** the 30-character limit above is the standard ABAP repository-object constraint for `CLAS`; it should still be confirmed directly in ADT (attempting to create the class, or checking Object Navigator's name-field constraint) before activation, since exact limits can depend on the system release — see `ADT_EXECUTION_GUIDE.md` and Phase 14 open questions.

## Mapping table

| Historical | Runtime-ready | Reason a variant exists | Only method(s) changed |
|---|---|---|---|
| `zcl_lab_01_var_fq` | *(none)* | No course-specific dependency; only `/dmo/employee_hr` availability needs runtime confirmation, no code change | — |
| `zcl_lab_02_arithmetic_fq` | *(none)* | Zero external dependency | — |
| `zcl_lab_03_datatypes_fq` | *(none)* | Zero external dependency | — |
| `zcl_lab_04_message_fq` | *(none)* | `TEXT-001` is an ADT text-pool setup step, not a code problem — see `LAB04_TEXT_ELEMENT_DECISION.md` | — |
| `zcl_lab_05_invoice_fq` | `zcl_lab_05_invoice_rt_fq` | Removes the `ZEMP_LOGALI` runtime dependency in one method | `demo_2_concat_lines_tab` only |
| `zcl_lab_05_invoice_fqa` | *(none)* | Zero external dependency (already fully self-contained) | — |
| `zcl_lab_06_condition_fq` | `zcl_lab_06_condition_rt_fq` | Removes the `ZEMP_LOGALI` **compile-time DDIC type** dependency that blocks activation | Class-level `DATA` types + `perform_loop_endloop` |
| `zcl_lab_07_tables_fq` | *(none)* | Already self-contained; only `/dmo/connection` availability needs runtime confirmation, no code change | — |
| `zcl_lab_07_tables_fqa` | *(none)* | Already self-contained; only `/dmo/flight`, `/dmo/connection`, `/dmo/carrier` availability needs runtime confirmation, no code change | — |
| `zcl_lab_08_fieldsymbols_fq` | `zcl_lab_08_fieldsymbols_rt_fq` | Removes the `ZEMP_LOGALI` **compile-time DDIC type** dependency (field symbol typed against it) that blocks activation | `FIELD-SYMBOLS` type + fixture call |
| *(new, not a lab)* | `zcl_employee_fixture_fq` | Shared synthetic data source consumed by the three runtime-ready variants above | n/a |

**7 of 10 historical labs need no code variant at all.** Only labs 05, 06, and 08 do, and in each case the change is limited to the exact lines that referenced `ZEMP_LOGALI` — no other method, literal, or control-flow logic is touched. This is by design (see Phase 3 instruction: "generar solo cuando sea necesario").

## Full diff summary per variant

### `zcl_lab_05_invoice_fq` → `zcl_lab_05_invoice_rt_fq`
- Class name renamed (required — ABAP classes with historical/course-blocking dependencies can't share a name with their own fix).
- Method `demo_2_concat_lines_tab`: `SELECT * FROM zemp_logali INTO TABLE @DATA(lt_employees).` replaced with `DATA(lt_employees) = zcl_employee_fixture_fq=>get_employees( ).`
- Everything else byte-for-byte identical (7 other methods, `struct_to_line`, all literals).

### `zcl_lab_06_condition_fq` → `zcl_lab_06_condition_rt_fq`
- Class name renamed.
- Class-level `DATA mt_employees TYPE TABLE OF zemp_logali` → `DATA mt_employees TYPE zcl_employee_fixture_fq=>tt_employee_fixture_fq`.
- Class-level `DATA ms_employee TYPE zemp_logali` → `DATA ms_employee TYPE zcl_employee_fixture_fq=>ty_employee_fixture_fq`.
- Method `perform_loop_endloop`: `SELECT * FROM zemp_logali INTO TABLE @me->mt_employees.` replaced with `me->mt_employees = zcl_employee_fixture_fq=>get_employees( ).`
- Everything else byte-for-byte identical (8 other methods, all literals, the real `cx_sy_zerodivide` exception handling).

### `zcl_lab_08_fieldsymbols_fq` → `zcl_lab_08_fieldsymbols_rt_fq`
- Class name renamed.
- `FIELD-SYMBOLS <ls_employee> TYPE zemp_logali` → `FIELD-SYMBOLS <ls_employee> TYPE zcl_employee_fixture_fq=>ty_employee_fixture_fq`.
- `SELECT * FROM zemp_logali INTO TABLE @DATA(lt_employees).` replaced with `DATA(lt_employees) = zcl_employee_fixture_fq=>get_employees( ).`
- Everything else byte-for-byte identical (all 6 field-symbol activities, all literals, `sy-datum` coercion cast kept as-is — see `ABAP_CLOUD_COMPATIBILITY.md` for the one open question on that field).

## What is explicitly NOT done

- The 3 historical classes (`zcl_lab_05_invoice_fq`, `zcl_lab_06_condition_fq`, `zcl_lab_08_fieldsymbols_fq`) are **not modified, replaced, or deleted** — they remain exactly as published, still `HISTORICAL_EXECUTION_EVIDENCE = YES` / `CURRENT_RUNTIME_VERIFICATION = NO_CURRENT_RUNTIME_CLAIM`.
- No runtime-ready variant has been executed. Their status is `NOT_YET_EXECUTED`, not `CURRENT_RUNTIME_VERIFIED` — that status can only be proposed after real execution evidence exists (see Phase 10 / `CURRENT_RUNTIME_VERIFICATION.md` in Phase 7).
- The runtime-ready variants are not published to GitHub — they exist only under this local `_RUNTIME_WORK/source/` folder.
