# ZEMP_LOGALI — Usage Analysis and Synthetic Replacement Design

[Versión en español](./ZEMP_LOGALI_ANALYSIS.es.md)

> `ZEMP_LOGALI` is not distributed anywhere in this evidence set and its structure is not documented in the training material we hold — everything below about its **shape** is inferred strictly from how the three consuming classes reference it, never assumed beyond that.

## 1. Which labs use it, and how

| Lab | Method | Operation | Reads or writes DB? | Compile-time DDIC dependency? |
|---|---|---|---|---|
| 05 (`zcl_lab_05_invoice_fq`) | `demo_2_concat_lines_tab` | `SELECT * FROM zemp_logali INTO TABLE @DATA(lt_employees)` (inline-declared table, generic downstream processing via RTTI) | Read-only, no DB write | **No** — the table's row type is inferred at runtime from the `SELECT *`, never named as a `TYPE zemp_logali` anywhere. Only the one method fails if the table is absent. |
| 06 (`zcl_lab_06_condition_fq`) | class-level `DATA`, `perform_loop_endloop` | Class-level `DATA mt_employees TYPE TABLE OF zemp_logali` and `DATA ms_employee TYPE zemp_logali`; `SELECT * FROM zemp_logali INTO TABLE @me->mt_employees`; `LOOP AT ... ir_out->write( ms_employee-email )` | Read-only, no DB write; result kept in memory only | **Yes** — `zemp_logali` is used as an explicit DDIC TYPE at class-definition level. The whole class fails to activate without it, not just this one method. |
| 08 (`zcl_lab_08_fieldsymbols_fq`) | local `FIELD-SYMBOLS`, `if_oo_adt_classrun~main` | `FIELD-SYMBOLS <ls_employee> TYPE zemp_logali`; `SELECT * FROM zemp_logali INTO TABLE @DATA(lt_employees)`; assigns/reads `<ls_employee>-email` and `<ls_employee>-name`, modifies in-memory rows only (`APPEND`/`INSERT`/`READ TABLE ... ASSIGNING`) | Read-only source SELECT; every mutation afterward is **in-memory only** on the local internal table — no `UPDATE`/`MODIFY zemp_logali` anywhere | **Yes** — same activation-blocking severity as lab-06 |

## 2. Fields the consuming code actually requires

Reading every field access across the three classes, the **minimum required shape** is:

| Field | Used in | How |
|---|---|---|
| `email` | lab-06 (`ms_employee-email`, printed), lab-08 (`<ls_employee>-email`, read and overwritten) | string-like field read and reassigned |
| `name` | lab-08 (`<ls_employee>-name`, read and overwritten, printed) | string-like field |
| (any other fields) | lab-05's `demo_2_concat_lines_tab` | accessed **only generically** through `cl_abap_structdescr`/`ASSIGN COMPONENT ... OF STRUCTURE` — it iterates whatever components exist and concatenates their values; it does not name any specific field |

No numeric/date/key field is ever referenced by name in the consuming code. Nothing in the three classes requires `ZEMP_LOGALI` to have more than an `email` and a `name` field — any additional fields are the training environment's own business modeling choice, not something this portfolio's code depends on.

## 3. Can it be replaced synthetically?

**Yes, fully.** None of the three consumers:
- writes to the database,
- requires a specific key/technical settings (transparent table, buffering, etc.),
- requires more than a couple of string-like fields,
- requires a specific row count (lab-06's loop and lab-08's loop both iterate whatever rows exist).

An in-memory internal table populated by a factory/fixture method satisfies every actual usage. **No new Z database table is needed** — creating one would be unnecessary DDIC-object overhead for what is, in every one of these three labs, pure in-memory table/field-symbol manipulation.

## 4. Design: `zcl_employee_fixture_fq`

A single local class exposing one public row `TYPE`, one public table `TYPE`, and one static factory method returning synthetic data — reused identically by the runtime-ready variants of labs 05, 06, and 08 (see `RUNTIME_VARIANT_MAPPING.md`).

```abap
CLASS zcl_employee_fixture_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_employee_fixture_fq,
             id     TYPE i,
             email  TYPE string,
             ape1   TYPE string,
             ape2   TYPE string,
             name   TYPE string,
             fechan TYPE d,
             fechaa TYPE d,
           END OF ty_employee_fixture_fq.
    TYPES tt_employee_fixture_fq TYPE STANDARD TABLE OF ty_employee_fixture_fq WITH EMPTY KEY.

    CLASS-METHODS get_employees
      RETURNING VALUE(rt_employees) TYPE tt_employee_fixture_fq.

ENDCLASS.

CLASS zcl_employee_fixture_fq IMPLEMENTATION.

  METHOD get_employees.
    rt_employees = VALUE #(
      ( id = 1 email = 'employee1@example.invalid' ape1 = 'perez'     ape2 = 'gomez'    name = 'juan'    fechan = '19900101' fechaa = '20220101' )
      ( id = 2 email = 'employee2@example.invalid' ape1 = 'lopez'     ape2 = 'martinez' name = 'ana'     fechan = '19920202' fechaa = '20220202' )
      ( id = 3 email = 'employee3@example.invalid' ape1 = 'torres'    ape2 = 'ruiz'     name = 'carlos'  fechan = '19850303' fechaa = '20220303' )
      ( id = 4 email = 'employee4@example.invalid' ape1 = 'hernandez' ape2 = 'jimenez'  name = 'laura'   fechan = '19960606' fechaa = '20220606' )
    ).
  ENDMETHOD.

ENDCLASS.
```

### Why this exact shape

- **Structure and literal values are not invented from nothing** — they are the same field layout and the same synthetic values (`id`/`email`/`ape1`/`ape2`/`name`/`fechan`/`fechaa`, `employee1@example.invalid` … `perezgomez`/`juan` etc.) already present in the student's **own**, independently-authored `zcl_lab_07_tables_fq` (Part I of the internal-tables lab), which explicitly comments "synthetic demo data, not real employees" and never touches `ZEMP_LOGALI` at all. Reusing this already-own, already-published pattern avoids inventing a new fictional dataset and keeps one consistent synthetic identity across the whole portfolio.
- Uses only `example.invalid` (an IANA-reserved non-routable domain, same convention already used in labs 05a/07/08's historical source), never a real or Logali-associated domain.
- Contains no Logali Group business logic, field naming, or proprietary structure — the `email`/`name` fields are the only ones any consumer actually needs; `id`/`ape1`/`ape2`/`fechan`/`fechaa` are carried along only for consistency with the lab-07 precedent, not because any of the three `ZEMP_LOGALI` consumers require them.
- A plain internal table + factory method, per the instruction to prefer `TYPES`/`VALUE`/factory methods over creating an unnecessary Z table.
- Named `zcl_employee_fixture_fq`, following the `_fq` personal-signature convention (`NAMING_CONVENTIONS.md`) for new portfolio-original objects.

## 5. What this does NOT do

- It does not modify, replace, or delete `zcl_lab_05_invoice_fq`, `zcl_lab_06_condition_fq`, or `zcl_lab_08_fieldsymbols_fq` — those remain byte-for-byte as published, still referencing `zemp_logali`, still `HISTORICAL_EXECUTION_EVIDENCE = YES` / `CURRENT_RUNTIME_VERIFICATION = PENDING`.
- It does not attempt to reconstruct the real `ZEMP_LOGALI` table, its actual field list, or any Logali-authored content.
- It does not touch any database table, real or synthetic — everything happens in an ABAP internal table in memory.
