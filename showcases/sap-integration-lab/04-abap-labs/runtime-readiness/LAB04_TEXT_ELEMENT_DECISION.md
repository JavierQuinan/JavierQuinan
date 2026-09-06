# Lab 04 — TEXT-001 Decision

[Versión en español](./LAB04_TEXT_ELEMENT_DECISION.es.md)

## A. Should `TEXT-001` be kept as a text element?

**Yes — kept, no code fork created.**

## B. Would it be better replaced in a runtime-ready variant?

**No.** `zcl_lab_04_message_fq` needs **no runtime-ready code variant at all.** Unlike `ZEMP_LOGALI`, `TEXT-001` is not a missing object that the code depends on — it is a standard ABAP class attribute (the "Text Elements" tab in ADT/SE24) that exists on every class and simply needs its symbol `001` maintained with any short string. This is a one-time ADT setup action, identical in every target system, not a reproducibility gap in the code itself.

## C. What does the exercise actually demonstrate?

Lab 04's stated purpose (per its own header comment and section `[1]`) is specifically to demonstrate **ABAP text-pool symbols** as a language feature, before moving on to string-description functions (`STRLEN`, `NUMOFCHAR`, `COUNT`, `FIND`), case-conversion functions, and regex validation. `out->write( |{ TEXT-001 }| )` is section `[1]` of the class — it is the deliberate subject being taught, not incidental scaffolding.

## Why not replace it with a literal string?

Replacing `{ TEXT-001 }` with a hardcoded string literal (e.g. `'Some label'`) would make the class compile without any ADT setup step, but it would **remove the one piece of evidence in this entire 10-lab set that text-pool symbols were ever used** — destroying exactly the technical point the lab exists to make. Per the governing instruction ("no cambies código solo para que compile si destruye el objetivo técnico"), this is not done. `TEXT-001` stays in both the historical source and in any future execution of it — there is no separate runtime-ready file for lab-04.

## If kept: exact steps to create `TEXT-001` in ADT

1. Open `zcl_lab_04_message_fq` in ADT (create/import the class first if it doesn't exist yet in the target system — see `ADT_EXECUTION_GUIDE.md`).
2. In the class editor, open the **"Text Elements"** tab (bottom tab strip, alongside "Source Code", next to where local test classes would appear).
3. In the **"Text Symbols"** sub-tab, add a new row:
   - **Symbol:** `001`
   - **Text:** any short label is sufficient for the exercise's purpose — e.g. `Símbolos de texto` (matching the section header already printed just before it) or `Text symbol demo`. The exact wording is not technically significant; what matters is that the symbol exists and is activated.
   - **Length:** leave at the ADT-computed default for the text entered.
4. Save and activate the Text Elements sub-object (this activates independently from — but is required before — the class's own activation succeeding, since the class source references `TEXT-001` directly).
5. Activate the class itself (`Ctrl+F3` or the Activate toolbar button in ADT).
6. If activation still reports a "text symbol not found" style error, re-check step 3 was saved under symbol `001` specifically (not `1` or `TEXT001`) and that the Text Elements sub-object shows as activated (green) in the Project Explorer.

No other code change is required in `zcl_lab_04_message_fq` for it to run once `TEXT-001` exists.

## Status

- `zcl_lab_04_message_fq`: unchanged, no runtime-ready fork exists or is planned.
- Blocking factor: `TEXT-001` missing (an ADT configuration step, not a code defect) — see `RUNTIME_DEPENDENCY_MATRIX.md`.
- Recommended action before this lab's re-execution: perform steps 1–5 above in the target ABAP Cloud system, then follow `RUNTIME_EXECUTION_PLAN.md` / `ADT_EXECUTION_GUIDE.md` for the rest of the run.
