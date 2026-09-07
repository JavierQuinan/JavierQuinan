# Evidence Matrix — Course 2/3 Training Practices

[Versión en español](./EVIDENCE_MATRIX.es.md)

> **Scope rule:** this matrix describes only the material in `training-practices/`, a separate candidate set from the 10 historical labs in [`../labs/`](../labs/README.md). It does not change any status in [`../EVIDENCE_MATRIX.md`](../EVIDENCE_MATRIX.md).

## Course 3 practices

| Practice | Training | Hands-on execution | Saved source artifact | Portfolio normalized | Current runtime verification | Status |
|---|---|---|---|---|---|---|
| abapGit (`zcl_c3_01_projects_fq`) | YES | YES (account owner confirmed) | YES (normalized) | YES | NO | `USER_AUTHORED_PRACTICE` / `NORMALIZED_NOT_EXECUTED` |
| ATC (`zcl_c3_02_atc_demo_fq`) | YES | YES (account owner confirmed) | YES (normalized) | YES | NO | `USER_AUTHORED_PRACTICE` / `NORMALIZED_NOT_EXECUTED` |
| ABAP Cleaner (`zcl_c3_03_cleaner_demo_fq`) | YES | YES (account owner confirmed) | YES (normalized) | YES | NO | `USER_AUTHORED_PRACTICE` / `NORMALIZED_NOT_EXECUTED` |
| Authorizations (`zcl_c3_04_dept_auth_fq`) | YES | YES (account owner confirmed) | YES (normalized) | YES | NO | `USER_AUTHORED_PRACTICE` / `NORMALIZED_NOT_EXECUTED` |

`Hands-on execution: account owner confirmed` means the account owner explicitly confirmed personally typing, creating, and running each original exercise in their own SAP trial environment. No independent artifact (a personal screenshot, a personal tool export) survived beyond that confirmation — see each practice's own page in `docs/` for the precise provenance wording used.

## Course 2

| Area | Training | Hands-on practice | Saved source artifact | Current runtime verification | Status |
|---|---|---|---|---|---|
| ABAP Dictionary (tables, lock objects, persistence settings, table relations) | YES | YES | NO | NO | `TRAINING_ONLY` |

No ABAP source, DDIC-object text, or code-bearing document was found for Course 2 beyond the instructor's own generic tutorial material. This is disclosed explicitly rather than represented by an empty or invented row.

## Status legend

- `USER_AUTHORED_PRACTICE`: the account owner's own hands-on act of typing/creating/running the original exercise, as distinct from the instructor-authored exercise template itself.
- `NORMALIZED_NOT_EXECUTED`: the portfolio-normalized source exists and has not yet been re-activated or re-run.
- `NEEDS_ADT_VERIFICATION`: re-execution in a real ABAP Cloud system is required before any current-runtime claim.
- `TRAINING_ONLY`: studied and, per the account owner's own training records, practiced, but no source artifact of any kind survived to normalize or publish.

## Relationship to the main historical track

This is a separate candidate set from a different course. It does not change:

- Historical labs (Curso 1, published): **10**
- Historical execution evidence: **10/10**
- Current runtime verification (historical labs): **0/10**
- Current runtime verification (these 4 new practices): **0/4**
