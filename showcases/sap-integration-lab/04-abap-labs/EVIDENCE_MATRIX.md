# Evidence Matrix — Historical ABAP Cloud Lab Set

[Versión en español](./EVIDENCE_MATRIX.es.md)

> **Scope rule:** this matrix describes only the material in `04-abap-labs/`. It is not the portfolio-wide SAP capability matrix. For the broader view, see [SAP Capability Matrix](../00-profile/SAP_CAPABILITY_MATRIX.md).

`Historical Runtime Evidence: YES` means the private source submission contains execution evidence consistent with the submitted implementation. `Current Runtime Verification: PENDING` means the public copy has not yet been re-executed in a current SAP environment.

| Capability | Training context | Existing lab in this set | Code | Historical runtime evidence | Current runtime verification | Guide | Track status |
|---|---|---|---|---|---|---|---|
| ABAP Core | YES | YES (8/10 units) | YES | YES | PENDING | — | `VERIFIED_HISTORICAL` |
| ABAP Objects | YES | YES (10/10) | YES | YES | PENDING | — | `VERIFIED_HISTORICAL` |
| ABAP Cloud classrun pattern | YES | YES (10/10) | YES | YES | PENDING | — | `VERIFIED_HISTORICAL` |
| ADT / Eclipse | YES | Indirect through all classrun labs | N/A | YES (indirect) | PENDING | — | `LAB_FOUND` |
| Internal Tables | YES | YES (`lab-07`, `lab-07a`) | YES | YES | PENDING | — | `VERIFIED_HISTORICAL` |
| Field Symbols | YES | YES (`lab-08`) | YES | YES | PENDING | — | `VERIFIED_HISTORICAL` |
| Open SQL | YES | YES (`lab-05`, `lab-06`, `lab-07`, `lab-07a`) | YES | YES | PENDING | — | `VERIFIED_HISTORICAL` |
| Exception Handling | YES | YES (`lab-06`) | YES | YES | PENDING | — | `VERIFIED_HISTORICAL` |
| Custom interface authoring (`zif_*`) | NO | NO | NO | NO | N/A | — | `NOT_FOUND_IN_THIS_LAB_SET` |
| ABAP Dictionary / DDIC | YES | NO | NO | NO | N/A | YES | `TRAINING_ONLY_IN_THIS_TRACK` |
| CDS | NO in this source set | NO | NO | NO | N/A | NO | `NOT_FOUND_IN_THIS_LAB_SET` |
| RAP | NO in this source set | NO | NO | NO | N/A | NO | `NOT_FOUND_IN_THIS_LAB_SET` |
| Behavior Definitions | NO | NO | NO | NO | N/A | NO | `NOT_FOUND_IN_THIS_LAB_SET` |
| Service Definitions / Bindings | NO | NO | NO | NO | N/A | NO | `NOT_FOUND_IN_THIS_LAB_SET` |
| OData hands-on ABAP lab | NO | NO | NO | NO | N/A | NO | `NOT_FOUND_IN_THIS_LAB_SET` |
| ABAP Unit lab | NO | NO | NO | NO | N/A | NO | `NOT_FOUND_IN_THIS_LAB_SET` |
| ATC runtime evidence | YES | NO | NO | NO | N/A | YES | `TRAINING_ONLY_IN_THIS_TRACK` |
| ABAP Cleaner runtime evidence | YES | NO | NO | NO | N/A | YES | `TRAINING_ONLY_IN_THIS_TRACK` |
| abapGit runtime evidence | YES | NO | NO | NO | N/A | YES | `TRAINING_ONLY_IN_THIS_TRACK` |
| Authorizations hands-on lab | YES | NO | NO | NO | N/A | YES | `TRAINING_ONLY_IN_THIS_TRACK` |
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

- `VERIFIED_HISTORICAL`: submitted source plus historical execution evidence exists; current re-execution is still pending.
- `LAB_FOUND`: indirect or partial lab evidence exists.
- `TRAINING_ONLY_IN_THIS_TRACK`: studied and documented here, but no hands-on lab in this historical set.
- `NOT_FOUND_IN_THIS_LAB_SET`: no lab/source evidence in this historical set; this is **not** a portfolio-wide absence claim.
- `PENDING`: current runtime re-verification has not yet been completed.
