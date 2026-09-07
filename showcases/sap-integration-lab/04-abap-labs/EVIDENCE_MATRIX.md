# Evidence Matrix — Historical ABAP Cloud Lab Set

[Versión en español](./EVIDENCE_MATRIX.es.md)

> **Scope rule:** this matrix describes only the material in `04-abap-labs/`. It is not the portfolio-wide SAP capability matrix. For the broader view, see [SAP Capability Matrix](../00-profile/SAP_CAPABILITY_MATRIX.md).

> **Unit count:** Curso 1 is a 16-unit curriculum. 10 units have a personal hands-on lab (source + own screenshots); 6 units are theory-only with no Laboratorio exercise and no lab folder — see the [lab catalog](./labs/README.md) for the exact breakdown. "10 labs" and "16 units" are not in tension: they describe two different things.

`Historical Runtime Evidence: YES` means the private source submission contains execution evidence consistent with the submitted implementation. `NO_CURRENT_RUNTIME_CLAIM` means this track does not assert current-environment re-execution — it is a closed, factual scope statement, not an open task.

| Capability | Training context | Existing lab in this set | Code | Historical runtime evidence | Current-runtime claim | Guide | Track status |
|---|---|---|---|---|---|---|---|
| ABAP Core | YES | YES (8/10 labs) | YES | YES | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| ABAP Objects | YES | YES (10/10) | YES | YES | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| ABAP Cloud classrun pattern | YES | YES (10/10) | YES | YES | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| ADT / Eclipse | YES | Indirect through all classrun labs | N/A | YES (indirect) | NO_CURRENT_RUNTIME_CLAIM | — | `LAB_FOUND` |
| Internal Tables | YES | YES (`lab-07`, `lab-07a`) | YES | YES | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| Field Symbols | YES | YES (`lab-08`) | YES | YES | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| Open SQL | YES | YES (`lab-05`, `lab-06`, `lab-07`, `lab-07a`) | YES | YES | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| Exception Handling | YES | YES (`lab-06`) | YES | YES | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| Custom interface authoring (`zif_*`) | NO | NO | NO | NO | N/A | — | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| ABAP Dictionary / DDIC | YES | NO | NO | NO | N/A | YES | `TRAINING_ONLY_IN_THIS_TRACK` |
| CDS | NO in this source set | NO | NO | NO | N/A | NO | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| RAP | NO in this source set | NO | NO | NO | N/A | NO | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| Behavior Definitions | NO | NO | NO | NO | N/A | NO | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| Service Definitions / Bindings | NO | NO | NO | NO | N/A | NO | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| OData hands-on ABAP lab | NO | NO | NO | NO | N/A | NO | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| ABAP Unit lab | NO | NO | NO | NO | N/A | NO | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| ATC hands-on practice | YES | YES — [`training-practices/`](./training-practices/README.md) (`zcl_c3_02_atc_demo_fq`) | YES | N/A (training-practice, not historical-lab evidence) | NO_CURRENT_RUNTIME_CLAIM | YES | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` |
| ABAP Cleaner hands-on practice | YES | YES — [`training-practices/`](./training-practices/README.md) (`zcl_c3_03_cleaner_demo_fq`) | YES | N/A (training-practice, not historical-lab evidence) | NO_CURRENT_RUNTIME_CLAIM | YES | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` |
| abapGit hands-on practice | YES | YES — [`training-practices/`](./training-practices/README.md) (`zcl_c3_01_projects_fq`) | YES | N/A (training-practice, not historical-lab evidence) | NO_CURRENT_RUNTIME_CLAIM | YES | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` |
| Authorizations hands-on practice | YES | YES — [`training-practices/`](./training-practices/README.md) (`zcl_c3_04_dept_auth_fq`) | YES | N/A (training-practice, not historical-lab evidence) | NO_CURRENT_RUNTIME_CLAIM | YES | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` |
| Debugging | YES (theory) | NO | NO | NO | N/A | NO | `TRAINING_ONLY_IN_THIS_TRACK` |
| Performance | YES (theory) | NO | NO | NO | N/A | NO | `TRAINING_ONLY_IN_THIS_TRACK` |
| Transport management | YES (topic) | NO | NO | NO | N/A | NO | `TRAINING_ONLY_IN_THIS_TRACK` |

## Portfolio-wide context

The statuses above are deliberately local to this lab set. Elsewhere in the SAP Integration Lab there is already additional evidence, including:

- documentation-grounded RAP architecture;
- source-reviewed ABAP Unit design patterns in other ABAP packs;
- an executable non-live OData client-side example in the S/4HANA procurement client;
- enterprise-sanitized debugging and specific cross-system operational evidence, without a generic integration-platform claim.

Those artifacts remain classified separately in the central [SAP Capability Matrix](../00-profile/SAP_CAPABILITY_MATRIX.md).

## Status legend

- `HISTORICAL_EXECUTION_VERIFIED`: submitted source plus documented historical execution evidence exists. No current-runtime claim is made or required.
- `OWNER_CONFIRMED_HANDS_ON_EXECUTION`: the account owner directly confirms personally typing, creating and running this training practice; see [Training Practices](./training-practices/README.md) for the exact provenance wording per practice.
- `LAB_FOUND`: indirect or partial lab evidence exists.
- `TRAINING_ONLY_IN_THIS_TRACK`: studied and documented here, with no saved source artifact and no hands-on-lab claim in this historical set.
- `NOT_EVIDENCED_IN_THIS_LAB_SET`: no lab/source evidence in this historical set; this is **not** a portfolio-wide absence claim.
- `NO_CURRENT_RUNTIME_CLAIM`: this track does not assert current-environment re-execution.
