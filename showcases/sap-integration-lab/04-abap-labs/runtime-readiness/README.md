# Runtime Readiness — ABAP Cloud Historical Labs

[Versión en español](./README.es.md)

> **Status:** `OPTIONAL_REPRODUCIBILITY_REFERENCE`. The 10 historical labs in [`../labs/`](../labs/README.md) are `HISTORICAL_EXECUTION_VERIFIED` and require nothing further to close that track. This folder is supporting technical material for anyone who later chooses to re-execute them in a current SAP environment — dependency analysis, a synthetic fixture, runtime-ready source drafts and ADT execution guidance — not a pending task or a blocker.

## Current status

- **Historical execution:** 10/10 (documented privately, per the parent [Evidence Matrix](../EVIDENCE_MATRIX.md)).
- **Current-runtime claim:** none — this track does not assert current-environment re-execution. Re-executing the material in this folder is optional future work, should the account owner choose to pursue it.

## What this folder contains

| Document | Covers |
|---|---|
| [Runtime Dependency Matrix](./RUNTIME_DEPENDENCY_MATRIX.md) | Every class/table/type/text-symbol dependency found in the 10 historical sources, by static reading |
| [ZEMP_LOGALI Analysis](./ZEMP_LOGALI_ANALYSIS.md) | Usage analysis of the training-specific `ZEMP_LOGALI` table and the synthetic replacement design |
| [Runtime Variant Mapping](./RUNTIME_VARIANT_MAPPING.md) | Maps each historical lab to its runtime-ready variant (only where one exists), with the naming-length rationale |
| [Lab 04 Text Element Decision](./LAB04_TEXT_ELEMENT_DECISION.md) | Why `TEXT-001` is kept, and exact ADT steps to create it |
| [DMO Dependency Check](./DMO_DEPENDENCY_CHECK.md) | Every `/DMO/*` object referenced, availability `UNKNOWN` until checked live |
| [ABAP Cloud Compatibility](./ABAP_CLOUD_COMPATIBILITY.md) | Per-source compatibility classification, no unearned claims |
| [Runtime Execution Plan](./RUNTIME_EXECUTION_PLAN.md) | Step-by-step execution plan for all 10 labs, in recommended order |
| [ADT Execution Guide](./ADT_EXECUTION_GUIDE.md) | Practical ADT/Eclipse instructions — package, activation, syntax errors, evidence capture |
| [Runtime Evidence Checklist](./RUNTIME_EVIDENCE_CHECKLIST.md) | What fresh evidence to capture per lab, and the sanitization checklist to apply before publishing it |

## Runtime-ready variants

Only 3 of the 10 historical labs needed a code variant to remove a reproducibility blocker (all others are already dependency-free or blocked only by a non-code setup step — see the Dependency Matrix):

| Historical | Runtime-ready | Status |
|---|---|---|
| `zcl_lab_05_invoice_fq` | [`source/zcl_lab_05_invoice_rt_fq.abap`](./source/zcl_lab_05_invoice_rt_fq.abap) | `PUBLIC_RUNTIME_READY_DRAFT` |
| `zcl_lab_06_condition_fq` | [`source/zcl_lab_06_condition_rt_fq.abap`](./source/zcl_lab_06_condition_rt_fq.abap) | `PUBLIC_RUNTIME_READY_DRAFT` |
| `zcl_lab_08_fieldsymbols_fq` | [`source/zcl_lab_08_fieldsymbols_rt_fq.abap`](./source/zcl_lab_08_fieldsymbols_rt_fq.abap) | `PUBLIC_RUNTIME_READY_DRAFT` |

None of these three has been activated or executed in any ABAP system yet, and none needs to be for this portfolio track to be complete. They are optional reference drafts — useful if anyone later exercises them in ADT, not a requirement of this track.

## Synthetic support

[`source/zcl_employee_fixture_fq.abap`](./source/zcl_employee_fixture_fq.abap) — an original, own class providing synthetic in-memory employee-like demo data, replacing the training-specific `ZEMP_LOGALI` table for the three runtime-ready variants above. Uses only its own `TYPES`, `VALUE #( )` literals, and reserved `example.invalid` addresses. See [ZEMP_LOGALI Analysis](./ZEMP_LOGALI_ANALYSIS.md) for the full design rationale — no Logali Group content, structure, or naming is reproduced.

## Historical source vs. runtime-ready source

**These are not the same thing.** The 10 files in [`../labs/source/`](../labs/README.md) are the historical, byte-for-byte-unchanged submissions with their own execution evidence from 2025. The 4 files in [`source/`](./source/) here are new, original, unexecuted drafts written specifically to remove the `ZEMP_LOGALI` reproducibility blocker. Nothing in `../labs/source/` was modified to produce this folder.

## If this material is ever exercised in ADT

None of the following blocks this track's completion — they are only relevant if the account owner chooses to re-execute this material later:

- `/DMO/*` availability in the target system — `AVAILABILITY = UNKNOWN` for all objects (see [DMO Dependency Check](./DMO_DEPENDENCY_CHECK.md)).
- `TEXT-001` decision and creation in ADT — documented but not executed (see [Lab 04 Text Element Decision](./LAB04_TEXT_ELEMENT_DECISION.md)).
- ADT activation and execution of all 10 historical labs plus the 3 runtime-ready variants — not yet performed (see [Runtime Execution Plan](./RUNTIME_EXECUTION_PLAN.md)).

No claim beyond the above is made anywhere in this folder.
