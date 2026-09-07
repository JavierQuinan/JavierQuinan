# Evidence Matrix — Course 2/3 Training Practices

[Versión en español](./EVIDENCE_MATRIX.es.md)

> **Scope rule:** this matrix describes only the material in `training-practices/`, a separate candidate set from the 10 historical labs in [`../labs/`](../labs/README.md). It does not change any status in [`../EVIDENCE_MATRIX.md`](../EVIDENCE_MATRIX.md).

## Course 3 practices

| Practice | Training | Hands-on execution | Saved source artifact | Portfolio normalized | Current-runtime claim | Status |
|---|---|---|---|---|---|---|
| abapGit (`zcl_c3_01_projects_fq`) | YES | OWNER_CONFIRMED_HANDS_ON_EXECUTION | YES (normalized) | YES | NO_CURRENT_RUNTIME_CLAIM | `USER_AUTHORED_PRACTICE` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` |
| ATC (`zcl_c3_02_atc_demo_fq`) | YES | OWNER_CONFIRMED_HANDS_ON_EXECUTION | YES (normalized) | YES | NO_CURRENT_RUNTIME_CLAIM | `USER_AUTHORED_PRACTICE` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` |
| ABAP Cleaner (`zcl_c3_03_cleaner_demo_fq`) | YES | OWNER_CONFIRMED_HANDS_ON_EXECUTION | YES (normalized) | YES | NO_CURRENT_RUNTIME_CLAIM | `USER_AUTHORED_PRACTICE` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` |
| Authorizations (`zcl_c3_04_dept_auth_fq`) | YES | OWNER_CONFIRMED_HANDS_ON_EXECUTION | YES (normalized) | YES | NO_CURRENT_RUNTIME_CLAIM | `USER_AUTHORED_PRACTICE` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` |

`Hands-on execution: OWNER_CONFIRMED_HANDS_ON_EXECUTION` means the account owner explicitly confirmed personally typing, creating, and running each original exercise in their own SAP trial environment. No independent artifact (a personal screenshot, a personal tool export) survived beyond that confirmation — see each practice's own page in `docs/` for the precise provenance wording used. `NO_CURRENT_RUNTIME_CLAIM` applies to the renamed portfolio copy specifically: it has not been independently re-executed after normalization; the underlying training practice was previously executed by the account owner.

## Course 2

| Area | Training | Hands-on practice | Saved source artifact | Current-runtime claim | Status |
|---|---|---|---|---|---|
| ABAP Dictionary (tables, lock objects, persistence settings, table relations) | YES | OWNER_CONFIRMED_HANDS_ON_EXECUTION | NO | NO_CURRENT_RUNTIME_CLAIM | `TRAINING_ONLY` / `NO_SAVED_SOURCE_ARTIFACT` |

No ABAP source, DDIC-object text, or code-bearing document was found for Course 2 beyond the instructor's own generic tutorial material. This is disclosed explicitly rather than represented by an empty or invented row.

## Status legend

- `USER_AUTHORED_PRACTICE`: the account owner's own hands-on act of typing/creating/running the original exercise, as distinct from the instructor-authored exercise template itself.
- `OWNER_CONFIRMED_HANDS_ON_EXECUTION`: the account owner directly confirms this execution; no independent artifact survived beyond that confirmation.
- `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE`: the practice's source is published under the portfolio's own `_fq` naming. The normalized, renamed copy itself has not been independently re-executed after renaming — execution refers to the original hands-on training practice confirmed by the account owner. This is a factual note, not a pending task.
- `NO_CURRENT_RUNTIME_CLAIM`: no current-runtime claim is made for the normalized copy.
- `TRAINING_ONLY` / `NO_SAVED_SOURCE_ARTIFACT`: training and hands-on practice occurred per the account owner's own training record, but no source artifact of any kind survived to normalize or publish.

## Relationship to the main historical track

This is a separate candidate set from a different course. It does not change:

- Historical labs (Curso 1, published): **10**
- Historical execution evidence: **10/10**
- Current-runtime claim (historical labs): none — `NO_CURRENT_RUNTIME_CLAIM`
- Current-runtime claim (these 4 new practices): none — `NO_CURRENT_RUNTIME_CLAIM`
