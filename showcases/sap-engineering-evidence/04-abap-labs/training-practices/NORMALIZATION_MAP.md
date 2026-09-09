# Normalization Map

[Versión en español](./NORMALIZATION_MAP.es.md)

Original exercise names are not reproduced here in full because they carry course-instance placeholders. This table records the portfolio naming decisions and the changes applied to the account owner's completed training practices; it is not a byte-for-byte reproduction of instructor material.

| Practice | Portfolio object | Ownership | Changes | Runtime boundary |
|---|---|---|---|---|
| abapGit | `zcl_c3_01_projects_fq` | `USER_AUTHORED_PRACTICE` | Renamed to the `_fq` convention; unused empty class section removed; parameter-passing structure and exercise literals preserved | Execution claim refers to the original owner-confirmed hands-on practice; normalized copy is public source evidence |
| ATC | `zcl_c3_02_atc_demo_fq` | `USER_AUTHORED_PRACTICE` | Renamed to `_fq`; unused empty class section removed; ATC exercise finding/fix content preserved | Execution claim refers to the original owner-confirmed hands-on practice; normalized copy is public source evidence |
| ABAP Cleaner | `zcl_c3_03_cleaner_demo_fq` | `USER_AUTHORED_PRACTICE` | Renamed to `_fq`; unused empty class section removed; no fabricated cleaned-after variant | Execution claim refers to the original owner-confirmed hands-on practice; normalized copy is public source evidence |
| Authorizations | `zcl_c3_04_dept_auth_fq` | `USER_AUTHORED_PRACTICE` | Renamed to `_fq`; unused empty class section removed; `AUTHORITY-CHECK`/query logic preserved | Execution claim refers to the original owner-confirmed hands-on practice; normalized copy is public source evidence |
| Authorizations — data element | `zde_dept_fq` | `USER_AUTHORED_PRACTICE` | Portfolio name follows the documented `zde_<topic>_fq` convention | DDIC object documented from the completed practice; no `.abap` file fabricated |
| Authorizations — authorization field | `ZAFDEPTFQ` | `USER_AUTHORED_PRACTICE` | Short portfolio name compatible with the 10-character authorization-field limit | DDIC object documented from the completed practice; no `.abap` file fabricated |
| Authorizations — authorization object | `ZAODEPTFQ` | `USER_AUTHORED_PRACTICE` | Short portfolio name compatible with the 10-character authorization-object limit | DDIC object documented from the completed practice; no `.abap` file fabricated |

## Naming-length check

| Name | Length | Object type | SAP limit | Fits? |
|---|---:|---|---:|---|
| `zcl_c3_01_projects_fq` | 21 | Class | 30 | Yes |
| `zcl_c3_02_atc_demo_fq` | 21 | Class | 30 | Yes |
| `zcl_c3_03_cleaner_demo_fq` | 25 | Class | 30 | Yes |
| `zcl_c3_04_dept_auth_fq` | 22 | Class | 30 | Yes |
| `zde_dept_fq` | 11 | Data element | 30 | Yes |
| `ZAFDEPTFQ` | 9 | Authorization field | 10 | Yes |
| `ZAODEPTFQ` | 9 | Authorization object | 10 | Yes |

The four normalized Course 3 class names do not collide with the historical Course 1 `zcl_lab_*` objects. The length checks above are part of the completed normalization record.

## Course 2

No mapping exists because no saved code artifact was available to normalize. Course 2 is represented by its completed hands-on DDIC training record without fabricated source; see [Evidence Matrix](./EVIDENCE_MATRIX.md).
