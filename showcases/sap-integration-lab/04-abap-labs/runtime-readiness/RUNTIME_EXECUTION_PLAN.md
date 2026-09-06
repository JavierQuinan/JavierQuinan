# Runtime Execution Plan

[Versión en español](./RUNTIME_EXECUTION_PLAN.es.md)

> Execution order and per-lab checklist for turning historical evidence into current runtime evidence, one lab at a time, per Issue #36. No lab here has been executed by this review — `CURRENT_RUNTIME_STATUS = NOT_REEXECUTED` for all 10 until the account owner runs them in a real ABAP Cloud system and supplies evidence back. This plan does not claim any execution occurred.

## Recommended order and why

`01 → 02 → 03 → 04 → 05 → 05a → 06 → 07 → 07a → 08`

Rationale: labs with zero external dependency first (01–03, in numeric order since 01 only needs one DMO table check), then the one text-element setup step (04), then the `ZEMP_LOGALI`-affected labs paired with their runtime-ready counterparts (05, 06, 08 — done in original numeric order, not grouped, to keep the sequence predictable), then the two `/DMO/*`-heaviest labs (07, 07a) once the DMO checks from labs 01/05 have already established a working pattern. This is a suggestion, not a requirement — labs are independent of each other and can be run in any order or in parallel across sessions.

---

## Lab 01 — `zcl_lab_01_var_fq`

1. **Object to create:** none — class already exists as historical source; import/paste as-is.
2. **Package:** any local/customer package with a valid transport assignment in the target system (existing lab package, if the historical labs were originally authored under one, or a new dedicated package — account owner's choice).
3. **Prerequisites:** none beyond ADT connectivity.
4. **Dependencies:** `/dmo/employee_hr` must exist — see `DMO_DEPENDENCY_CHECK.md`.
5. **Activation procedure:** paste source into a new global class named `zcl_lab_01_var_fq` implementing `if_oo_adt_classrun`; activate (`Ctrl+F3`).
6. **Execution procedure:** right-click the class → Run As → "Console Application" (or `F9`).
7. **Expected behavior based on source:** prints elementary-type values, the `mty_customer` structure, one row from `/dmo/employee_hr`, the barcode conversion, and inline-declared values — see the class's own `[section headers]` in the source for exact order.
8. **Evidence required:** ADT Console output screenshot showing the full run with no runtime dump, plus the Project Explorer showing the class activated (green).
9. **Sanitization required:** none expected — no user-identifying data, no tenant/system data printed by this class (see `RUNTIME_EVIDENCE_CHECKLIST.md` for the general checklist to double-check anyway).
10. **Rollback/cleanup:** none required if the class is meant to stay; if run in a throwaway package, delete the class afterward via ADT.

## Lab 02 — `zcl_lab_02_arithmetic_fq`

1. **Object to create:** none — historical source as-is.
2. **Package:** same as lab 01 or a new one.
3. **Prerequisites:** none.
4. **Dependencies:** none — zero external objects.
5. **Activation procedure:** create global class, paste source, activate.
6. **Execution procedure:** Run As → Console Application.
7. **Expected behavior:** prints 8 numbered arithmetic results (`ADD`/`SUBTRACT`/`MULTIPLY`/`DIVIDE`/`DIV`/`MOD`/`**`/`sqrt`), values fully deterministic from the literals in the source.
8. **Evidence required:** ADT Console output screenshot showing all 8 lines.
9. **Sanitization required:** none — output is purely numeric, no identifying data.
10. **Rollback/cleanup:** delete if in a throwaway package.

## Lab 03 — `zcl_lab_03_datatypes_fq`

1. **Object to create:** none — historical source as-is.
2. **Package:** same as above.
3. **Prerequisites:** none.
4. **Dependencies:** none — only released `cl_abap_context_info`/`utclong_*` APIs.
5. **Activation procedure:** create global class, paste source, activate.
6. **Execution procedure:** Run As → Console Application.
7. **Expected behavior:** prints type-conversion results, truncation/rounding, inline declarations, forced conversion, and — **note** — the current system date/time and current UTC timestamp (these will legitimately differ from the 2025 historical run; that is expected and correct, not an error).
8. **Evidence required:** ADT Console output screenshot.
9. **Sanitization required:** the printed system date/time/UTC timestamp is not itself sensitive (it is not a tenant/account identifier), but confirm it is not accompanied by any other system banner text before capturing.
10. **Rollback/cleanup:** delete if in a throwaway package.

## Lab 04 — `zcl_lab_04_message_fq`

1. **Object to create:** none — historical source as-is, plus a Text Elements entry (not source code).
2. **Package:** same as above.
3. **Prerequisites:** create `TEXT-001` in the class's Text Elements tab **before** activating — see `LAB04_TEXT_ELEMENT_DECISION.md` for exact steps.
4. **Dependencies:** none besides the text symbol.
5. **Activation procedure:** create global class, paste source, maintain `TEXT-001`, activate both the Text Elements sub-object and the class.
6. **Execution procedure:** Run As → Console Application.
7. **Expected behavior:** prints the `TEXT-001` value, string-description function results (`STRLEN`/`NUMOFCHAR`/`COUNT`/`FIND`), case-conversion results, and two regex validation results (phone pattern against the placeholder string `'Agregar cualquier teléfono'`, email pattern against `'Agregar cualquier correo'` — both placeholders are expected to print as **invalid**, since they don't match the regex; this is the historical source's own literal content, not a bug).
8. **Evidence required:** ADT Console output screenshot.
9. **Sanitization required:** none — no real phone/email is used, only the literal placeholder strings already in the source.
10. **Rollback/cleanup:** delete if in a throwaway package; the Text Elements entry is deleted along with the class.

## Lab 05 — `zcl_lab_05_invoice_fq` (historical) and `zcl_lab_05_invoice_rt_fq` (runtime-ready)

1. **Object to create:** the historical class as-is; **additionally**, `zcl_employee_fixture_fq` and `zcl_lab_05_invoice_rt_fq` if the runtime-ready path is used (recommended, since `ZEMP_LOGALI` is not expected to exist in the target system).
2. **Package:** same as above; the fixture class and both variants of lab 05 should live in the same package so the `=>` static-method call resolves.
3. **Prerequisites:** none for the historical class's 7 unaffected methods; the fixture class must be created and activated first if running the runtime-ready variant.
4. **Dependencies:** `zemp_logali` (historical, method `demo_2_concat_lines_tab` only) — expected `NOT_AVAILABLE`; `zcl_employee_fixture_fq` (runtime-ready).
5. **Activation procedure:** (a) create+activate `zcl_employee_fixture_fq` from `source/zcl_employee_fixture_fq.abap`; (b) create+activate `zcl_lab_05_invoice_rt_fq` from `source/zcl_lab_05_invoice_rt_fq.abap`; (c) optionally also create+activate the historical `zcl_lab_05_invoice_fq` to confirm the *other 7 methods* run identically (method 2 will raise a "table doesn't exist" style error/dump if `ZEMP_LOGALI` is genuinely absent — expected, not a defect).
6. **Execution procedure:** Run As → Console Application on whichever class(es) were activated.
7. **Expected behavior:** 8 numbered string-operation results (`CONCAT`, `CONCATENATE LINES OF`, `CONDENSE`/`REPLACE`, `SPLIT`, `SHIFT`, `STRLEN`/`NUMOFCHAR`, `TRANSLATE`, insert+`REVERSE`); in the runtime-ready variant, method 2's output will show the 4 synthetic fixture rows concatenated into one line instead of `ZEMP_LOGALI` rows.
8. **Evidence required:** ADT Console output screenshot for the runtime-ready run (and, if attempted, the historical run showing the expected method-2 failure with the other 7 methods succeeding).
9. **Sanitization required:** none — fixture data uses `example.invalid`, no real identifiers.
10. **Rollback/cleanup:** delete throwaway objects; keep `zcl_employee_fixture_fq` if labs 06/08 will be run in the same session (they reuse it).

## Lab 05a — `zcl_lab_05_invoice_fqa`

1. **Object to create:** none — historical source as-is.
2. **Package:** same as above.
3. **Prerequisites:** none.
4. **Dependencies:** none — fully self-contained.
5. **Activation procedure:** create global class, paste source, activate.
6. **Execution procedure:** Run As → Console Application.
7. **Expected behavior:** `OVERLAY`, `substring`/`substring_before`/`substring_after`, `FIND`+`count`, `REPLACE`, one regex email-format validation against the literal `learner@example.com` (expected **valid** — it matches the pattern), leading-zero stripping via `REPLACE REGEX`, `repeat( )`, and three `escape( )` formats (URL, JSON, string-template).
8. **Evidence required:** ADT Console output screenshot.
9. **Sanitization required:** none — `learner@example.com` is the historical source's own synthetic literal (see the class's own header comment), not a real address; no other sensitive data is printed.
10. **Rollback/cleanup:** delete if in a throwaway package.

## Lab 06 — `zcl_lab_06_condition_fq` (blocked) and `zcl_lab_06_condition_rt_fq` (runtime-ready, mandatory path)

1. **Object to create:** `zcl_employee_fixture_fq` (if not already created for lab 05) and `zcl_lab_06_condition_rt_fq`. The historical `zcl_lab_06_condition_fq` **cannot even activate** without `ZEMP_LOGALI` existing (class-level DDIC type reference), so it is not expected to be usable for a fresh activation attempt unless `ZEMP_LOGALI` is separately provisioned by the account owner.
2. **Package:** same package as the fixture class.
3. **Prerequisites:** `zcl_employee_fixture_fq` created and activated first.
4. **Dependencies:** `zcl_employee_fixture_fq` (runtime-ready path).
5. **Activation procedure:** create+activate `zcl_lab_06_condition_rt_fq` from `source/zcl_lab_06_condition_rt_fq.abap`.
6. **Execution procedure:** Run As → Console Application.
7. **Expected behavior:** 9 numbered control-structure demonstrations (`IF`, `CASE`, `DO`, `CHECK`, `SWITCH`, `COND`, `WHILE`, a loop over the 4 fixture rows printing each `email`, and a real `TRY`/`CATCH cx_sy_zerodivide` sequence across 5 iterations where the 5th iteration divides by zero and is caught).
8. **Evidence required:** ADT Console output screenshot, including the caught-exception line.
9. **Sanitization required:** none — fixture emails are `@example.invalid`.
10. **Rollback/cleanup:** delete throwaway objects; keep the fixture if lab 08 follows.

## Lab 07 — `zcl_lab_07_tables_fq`

1. **Object to create:** none — historical source as-is.
2. **Package:** same as above.
3. **Prerequisites:** confirm `/dmo/connection` exists and returns rows for `carrier_id = 'LH'`, `connection_id > '0400'`, `distance_unit = 'KM'` (see `DMO_DEPENDENCY_CHECK.md`).
4. **Dependencies:** `/dmo/connection`.
5. **Activation procedure:** create global class, paste source, activate.
6. **Execution procedure:** Run As → Console Application.
7. **Expected behavior:** 9 numbered internal-table activities using the class's own synthetic `ty_employee` records (1–6) for the first three, then `/dmo/connection`-backed reads/`MOVE-CORRESPONDING`/`READ TABLE`/`line_exists`/`line_index` for the rest.
8. **Evidence required:** ADT Console output screenshot; if any `/DMO/CONNECTION`-dependent section returns an empty result unexpectedly, capture that too (it is diagnostic information, not a failure to hide).
9. **Sanitization required:** none — the employee data is the class's own synthetic literals (`employee1@example.invalid`, etc., already disclosed as "not real employees" in the source's own comment); `/DMO/CONNECTION` data is standard SAP demo data, not personal data.
10. **Rollback/cleanup:** delete if in a throwaway package.

## Lab 07a — `zcl_lab_07_tables_fqa`

1. **Object to create:** none — historical source as-is.
2. **Package:** same as above.
3. **Prerequisites:** confirm `/dmo/flight`, `/dmo/connection`, `/dmo/carrier` all exist and return rows for the filters used (`carrier_id = 'SQ'`, `seats_max = 140`, `price BETWEEN 200 AND 400`, `airport_from_id = 'FRA'`) — see `DMO_DEPENDENCY_CHECK.md`.
4. **Dependencies:** `/dmo/flight`, `/dmo/connection`, `/dmo/carrier`.
5. **Activation procedure:** create global class, paste source, activate.
6. **Execution procedure:** Run As → Console Application.
7. **Expected behavior:** 15 numbered activities (`A01`–`A15`) covering `FOR`, nested `FOR`, multi-line `SELECT`, `SORT`, `MODIFY`, `DELETE`, `CLEAR`/`FREE`, `COLLECT`, `LET`, `BASE`, three `GROUP BY` variants, `RANGE` tables, and `ENUM` values — exact row counts depend on the live `/DMO/*` data in the target system.
8. **Evidence required:** ADT Console output screenshot for each of the 15 activities (or one continuous scroll capture) **with the `A01` block's `iduser` column cropped or redacted** — see item 9.
9. **Sanitization required:** **mandatory crop/redaction of the `A01 - LT_FLIGHTS` table's `iduser` column.** `add_flights_with_for( )` calls `cl_abap_context_info=>get_user_technical_name( )` and embeds the *current, real* technical username of whoever executes this in every one of the 15 synthetic rows it generates. This is not hardcoded in the source (so the source file itself is clean), but any **fresh screenshot** of this lab's output will contain a real, current, potentially personally-identifying technical username unless that column is cropped or blacked out before saving/publishing the evidence.
10. **Rollback/cleanup:** delete if in a throwaway package.

## Lab 08 — `zcl_lab_08_fieldsymbols_fq` (blocked) and `zcl_lab_08_fieldsymbols_rt_fq` (runtime-ready, mandatory path)

1. **Object to create:** `zcl_employee_fixture_fq` (if not already created) and `zcl_lab_08_fieldsymbols_rt_fq`. The historical class **cannot activate** without `ZEMP_LOGALI` (field-symbol DDIC type reference), same as lab 06.
2. **Package:** same package as the fixture class.
3. **Prerequisites:** `zcl_employee_fixture_fq` created and activated first.
4. **Dependencies:** `zcl_employee_fixture_fq`.
5. **Activation procedure:** create+activate `zcl_lab_08_fieldsymbols_rt_fq` from `source/zcl_lab_08_fieldsymbols_rt_fq.abap`.
6. **Execution procedure:** Run As → Console Application.
7. **Expected behavior:** scalar field-symbol reassignment, bulk email update over the 4 fixture rows via `LOOP ... ASSIGNING`, `APPEND ... ASSIGNING`, `INSERT ... ASSIGNING` at index 2, `READ TABLE ... ASSIGNING` + field update, and a date-field coercion cast printing today's date (via `sy-datum` — see the open compatibility question in `ABAP_CLOUD_COMPATIBILITY.md`; if ADT flags it, that is exactly the kind of runtime finding this plan exists to surface, not something to silently work around).
8. **Evidence required:** ADT Console output screenshot.
9. **Sanitization required:** none — all data is fixture-synthetic (`@example.invalid`) or the current system date, which is not tenant/account-identifying on its own.
10. **Rollback/cleanup:** delete throwaway objects; the fixture class can be deleted last if no further lab needs it.

---

## What promotes a lab to `CURRENT_RUNTIME_VERIFIED`

Per Issue #36 and Phase 10 of this task: **nothing in this document promotes any lab.** A lab may only be proposed for `CURRENT_RUNTIME_VERIFIED` after the account owner has actually performed steps 5–8 above in a real system and supplied the resulting evidence (sanitized per `RUNTIME_EVIDENCE_CHECKLIST.md`) back to this review. Each lab is promoted individually — never in bulk — and only as a **proposal**, never as a direct edit to any published claim.
