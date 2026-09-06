# ADT Execution Guide

[Versión en español](./ADT_EXECUTION_GUIDE.es.md)

> Practical steps for running any of these 10 labs through **ABAP Development Tools (ADT) for Eclipse**. This is the only supported way to compile and run these classes — **VS Code does not execute ABAP.** VS Code / this repository's local checkout is only where the source text lives; the actual class object, activation, and execution all happen inside a real ABAP Cloud system, reached through Eclipse ADT.

## 0. Why not VS Code

ABAP is not a locally-interpreted or locally-compiled language in the way JavaScript or Python are. A `.abap` file on disk is just source text — there is no local ABAP runtime, no `abap run file.abap` command, and no VS Code extension that executes ABAP against a real kernel. The class must be created as a **repository object inside an ABAP system** (via ADT, which talks to that system over an RFC/HTTP-based connection), compiled by that system's own kernel, and executed there. Every step below assumes Eclipse with the ABAP Development Tools plugin installed, connected to a system where an ABAP Cloud-compatible development model is available (an ABAP trial system, a BTP ABAP Environment/Steampunk instance, or an on-premise system enabled for ABAP Cloud development).

## 1. Package selection

- In the Project Explorer, expand the target ABAP Cloud system connection.
- Under `$TMP` (local, non-transportable) or an existing customer package with a transport route, decide where the lab classes will live.
  - `$TMP` is the fastest option for a personal re-verification pass with no intent to transport the objects anywhere — appropriate here, since this is local verification, not a delivery.
  - If a customer package is used instead, a transport request will be prompted for on the first activation; any request created is local to the account owner's system and is not part of this review's own file changes.
- The fixture class (`zcl_employee_fixture_fq`) and any lab that consumes it (05/06/08 runtime-ready variants) **must be created in the same package** so the static-method call (`zcl_employee_fixture_fq=>get_employees( )`) resolves without a cross-package authorization/visibility issue.

## 2. Class creation / import

There is no "import a `.abap` file" wizard in ADT for a brand-new class — instead:

1. Right-click the target package → **New → ABAP Class**.
2. Enter the exact class name (e.g. `ZCL_LAB_01_VAR_FQ`) and a short description.
3. ADT scaffolds a minimal `CLASS ... DEFINITION ... ENDCLASS. CLASS ... IMPLEMENTATION ... ENDCLASS.` skeleton and opens the source editor.
4. Select all the generated skeleton text and replace it entirely with the full content of the corresponding `.abap` file from this evidence package (historical source for labs 01–04, 05a, 07, 07a; the matching `source/*.abap` file for labs 05/06/08's runtime-ready variants, and for `zcl_employee_fixture_fq` itself).
5. Save (`Ctrl+S`).

## 3. Source paste / import

- Paste the entire file content, including the leading `"!` ABAP Doc comment lines — these are valid ABAP Doc syntax and will not cause a syntax error; they are useful because they carry the same provenance/dependency notes as the local `.abap` file.
- Do not paste `PROVENANCE.md`/README content — only the `.abap` source itself goes into the class editor.

## 4. Activation

- `Ctrl+F3` or the Activate (green circular arrow) toolbar button.
- ADT runs a syntax check as part of activation. Two outcomes:
  - **Success:** the class turns green in the Project Explorer; the "Execute As Console Application" run option becomes available.
  - **Failure:** the Problems view lists the exact error. See Section 5.

## 5. Syntax errors — what to expect for each dependency type

| Symptom | Cause | What to do |
|---|---|---|
| `Type "ZEMP_LOGALI" is unknown` or similar, at class-level `DATA`/`FIELD-SYMBOLS` | `ZEMP_LOGALI` doesn't exist in this system (labs 06/08 historical) | Use the runtime-ready variant instead — do not attempt to fix the historical class |
| `"ZEMP_LOGALI" is not an active/existing database table`, at runtime only (not activation) | Same table missing, but only referenced via `SELECT` (lab 05 historical, method `demo_2_concat_lines_tab`) | Either accept that one method will fail at runtime (the other 7 succeed) or use `zcl_lab_05_invoice_rt_fq` instead |
| `Text symbol 001 is not maintained` / similar | `TEXT-001` not yet created (lab 04) | Follow `LAB04_TEXT_ELEMENT_DECISION.md` steps 1–4 before activating |
| `Type "/DMO/CONNECTION"` (or `/DMO/FLIGHT`, `/DMO/CARRIER`, `/DMO/EMPLOYEE_HR`) `is unknown` | The SAP Flight Reference Scenario demo content is not installed/activated in this system | Confirm via SAP's own demo-data activation report for the target system type (varies by trial vs. BTP ABAP Environment vs. on-premise) — this is a system-provisioning question, out of scope for this code-level review |
| A construct is underlined with an ABAP Cloud "release" warning/error (e.g. around `sy-datum`) | The construct is not released for the software component the package is assigned to | This is exactly the `LIKELY_COMPATIBLE_NEEDS_RUNTIME` case flagged in `ABAP_CLOUD_COMPATIBILITY.md` — record the exact message, do not silently rewrite the historical source to avoid it |
| Class name exceeds allowed length | See `RUNTIME_VARIANT_MAPPING.md`'s naming-length section | The `_rt_fq`/`_rt_fqa` suffix used here was chosen specifically to fit; if ADT still rejects a name, that is new information to record, not to guess around |

## 6. Console execution

- Right-click the activated class → **Run As → 1 Console Application** (or select the class and press `F9`, or use the green "Run" toolbar button with the class selected).
- ADT opens a **Console** view; `if_oo_adt_classrun~main`'s `out->write( )` calls print there, one call per visual block.

## 7. Application log / output

- The **Console** view is the primary output for these classes (they use `if_oo_adt_classrun_out`, not the classic Application Log (`SLG1`) or list output (`WRITE` in a report) — none of the 10 labs are reports, all are console-application classes).
- If a method raises an uncaught exception (e.g. running the historical `zcl_lab_06_condition_fq` without `ZEMP_LOGALI`), ADT shows a short-dump-style error in the Console view or a dialog — this is expected for the known-blocked historical classes and is itself valid evidence of the blocking dependency, not a tooling failure.

## 8. ABAP Console

- Same view as Section 6/7 — "ABAP Console" and "Console" refer to the same output panel in current ADT versions. There is no separate SAP GUI screen involved for these `if_oo_adt_classrun` classes.

## 9. Dependency resolution

- Resolve dependencies **before** activation, in this order: (a) any Z object referenced as a compile-time TYPE (only `ZEMP_LOGALI`, for historical labs 06/08 — use the runtime-ready variant instead of trying to provision the Z table), (b) any text element (lab 04), (c) any `/DMO/*` object's actual presence (labs 01, 05 method 2, 07, 07a — check via Data Preview, Section below), (d) any same-package prerequisite class (the fixture, for labs 05/06/08 runtime-ready variants).
- To check a `/DMO/*` table's presence and content: in Project Explorer, navigate to it (or use `Navigate → Open ABAP Development Object` and type the name), right-click → **Open With → Data Preview** (or press `F8` with it selected). This runs a live `SELECT` against the target system and shows actual rows — use it to confirm the row counts and filter values noted in `DMO_DEPENDENCY_CHECK.md` before trusting a lab's expected output.

## 10. Evidence capture

- Capture the **Console** view content after a successful run, and the **Project Explorer** entry showing the class as activated, as the minimum pair of screenshots per lab.
- Before saving/sharing any screenshot: apply the sanitization checklist in `RUNTIME_EVIDENCE_CHECKLIST.md` — in particular, crop the `iduser` column for lab 07a's `A01` output block (see `RUNTIME_EXECUTION_PLAN.md`, Lab 07a, item 9), and check window titles/tab labels for any system ID, tenant, or connection alias visible in the Eclipse chrome around the Console view before cropping the final image.
- Do not include any other open editor tab, Project Explorer branch, or notification/toast that might show a hostname, tenant ID, or username outside of what each lab's own instructions call out.

## Not covered here

No screenshots from any third-party source (Logali Group course material, GEM Educa material, or any other party) are included in this guide or should ever be included in captured evidence — see `00_AUDIT/COPYRIGHT_CLASSIFICATION.md` in the main evidence package for the governing rule.
