# Normalization Map

[Versión en español](./NORMALIZATION_MAP.es.md)

Original exercise names are not reproduced here in full (they carry a course-instance placeholder and are documented internally for the account owner's own audit trail) — this table records the naming decision and what changed, not a byte-for-byte diff against instructor material.

| Practice | Portfolio object | Ownership | Changes | Runtime status |
|---|---|---|---|---|
| abapGit | `zcl_c3_01_projects_fq` | `USER_AUTHORED_PRACTICE` | Renamed to the `_fq` convention, removed an unused empty class section; parameter-passing style and literals unchanged | `NORMALIZED_NOT_EXECUTED` |
| ATC | `zcl_c3_02_atc_demo_fq` | `USER_AUTHORED_PRACTICE` | Renamed to the `_fq` convention, removed an unused empty class section; the unfiltered query and the `##NO_TEXT` pragma fix are deliberately unchanged — they are the exercise's own ATC-finding/fix/exemption teaching content | `NORMALIZED_NOT_EXECUTED` |
| ABAP Cleaner | `zcl_c3_03_cleaner_demo_fq` | `USER_AUTHORED_PRACTICE` | Renamed to the `_fq` convention, removed an unused empty class section; logic otherwise unchanged — no fabricated "after cleanup" version | `NORMALIZED_NOT_EXECUTED` |
| Authorizations | `zcl_c3_04_dept_auth_fq` | `USER_AUTHORED_PRACTICE` | Renamed to the `_fq` convention, removed an unused empty class section; `AUTHORITY-CHECK`/query logic unchanged | `NORMALIZED_NOT_EXECUTED` |
| Authorizations — data element | `zde_dept_fq` | `USER_AUTHORED_PRACTICE` | Renamed per the already-documented `zde_<topic>_fq` convention (see [`../NAMING_CONVENTIONS.md`](../NAMING_CONVENTIONS.md)) | `NORMALIZED_NOT_EXECUTED` (DDIC object — created via ADT wizard, no `.abap` file) |
| Authorizations — authorization field | `ZAFDEPTFQ` | `USER_AUTHORED_PRACTICE` | New short, unsuffixed-style name (9 characters) — the SAP 10-character authorization-field name limit does not fit an underscore-suffixed `_fq` pattern | `NORMALIZED_NOT_EXECUTED` (DDIC object — no `.abap` file) |
| Authorizations — authorization object | `ZAODEPTFQ` | `USER_AUTHORED_PRACTICE` | New short, unsuffixed-style name (9 characters) — same 10-character constraint | `NORMALIZED_NOT_EXECUTED` (DDIC object — no `.abap` file) |

## Naming-length check

| Name | Length | Object type | SAP limit | Fits? |
|---|---|---|---|---|
| `zcl_c3_01_projects_fq` | 21 | Class | 30 | Yes |
| `zcl_c3_02_atc_demo_fq` | 21 | Class | 30 | Yes |
| `zcl_c3_03_cleaner_demo_fq` | 25 | Class | 30 | Yes |
| `zcl_c3_04_dept_auth_fq` | 22 | Class | 30 | Yes |
| `zde_dept_fq` | 11 | Data element | 30 | Yes |
| `ZAFDEPTFQ` | 9 | Authorization field | 10 | Yes |
| `ZAODEPTFQ` | 9 | Authorization object | 10 | Yes |

No naming collisions exist against the historical labs' object names (`zcl_lab_*`) or the runtime-readiness track's fixture/variant names (`zcl_employee_fixture_fq`, `zcl_lab_*_rt_fq`). These limits are standard ABAP repository-object guidance and should still be confirmed directly in ADT before creation.

## Course 2

No mapping exists — no code artifact was found to normalize. See `EVIDENCE_MATRIX.md`.
