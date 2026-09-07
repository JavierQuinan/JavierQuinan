# Course 2/3 Training Practices

[Versión en español](./README.es.md)

> **Scope:** hands-on ABAP practices from Logali Group Curso 3 (abapGit, ATC, ABAP Cleaner, Authorizations), personally implemented during structured training and normalized for portfolio use. This is a separate candidate set from the 10 historical labs in [`../labs/`](../labs/README.md) — it does not change any status there.

## What this is

Four practices, each following the pattern: an instructor-supplied exercise template → the account owner's own hands-on execution in their own SAP trial environment → portfolio normalization (renaming to the `_fq` convention, removing dead declarations) → pending re-verification. None of the four is claimed as an independently-invented algorithm; each page in `docs/` states the precise provenance.

## Current status

- **Training:** YES for both Curso 2 and Curso 3.
- **Hands-on execution:** confirmed by the account owner for all 4 Curso 3 practices below. Curso 2 yielded no saved source artifact — see `EVIDENCE_MATRIX.md`.
- **Current runtime verification:** 0/4 for the practices below. Unchanged from the historical track's own 0/10.

## Practices

| Practice | Object | Docs |
|---|---|---|
| abapGit | [`source/zcl_c3_01_projects_fq.abap`](./source/zcl_c3_01_projects_fq.abap) | [ABAPGIT_PRACTICE.md](./docs/ABAPGIT_PRACTICE.md) |
| ATC (ABAP Test Cockpit) | [`source/zcl_c3_02_atc_demo_fq.abap`](./source/zcl_c3_02_atc_demo_fq.abap) | [ATC_PRACTICE.md](./docs/ATC_PRACTICE.md) |
| ABAP Cleaner | [`source/zcl_c3_03_cleaner_demo_fq.abap`](./source/zcl_c3_03_cleaner_demo_fq.abap) | [ABAP_CLEANER_PRACTICE.md](./docs/ABAP_CLEANER_PRACTICE.md) |
| Authorizations | [`source/zcl_c3_04_dept_auth_fq.abap`](./source/zcl_c3_04_dept_auth_fq.abap) | [AUTHORIZATIONS_PRACTICE.md](./docs/AUTHORIZATIONS_PRACTICE.md) |

## Course 2

Reviewed in full. No ABAP source, DDIC-object text, or code-bearing document was found beyond the instructor's own generic tutorial material — represented honestly in `EVIDENCE_MATRIX.md` as `TRAINING = YES`, `HANDS_ON_PRACTICE = YES`, `SAVED_SOURCE_ARTIFACT = NO`, `CURRENT_RUNTIME_VERIFIED = NO`, rather than by fabricating a source file.

## Navigation

- [Evidence Matrix](./EVIDENCE_MATRIX.md)
- [Normalization Map](./NORMALIZATION_MAP.md)
- [Practice docs](./docs/)
- [Source](./source/)

## Publication policy

This folder excludes instructor PDFs, Word files, screenshots, the original `_USER`-suffixed instructor template source, generic solution manuals, third-party course text, and certificates. Only the account owner's own normalized `.abap` source and original technical documentation are published here.
