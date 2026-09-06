# Gap Analysis — Historical ABAP Cloud Lab Track

[Versión en español](./GAP_ANALYSIS.es.md)

> This document covers only `04-abap-labs/`. It is a track-level gap analysis, not a statement that the broader SAP Integration Lab lacks these capabilities.

## P0 — Reproducibility of existing labs

| Gap | Current evidence | Missing evidence | Recommended action | Verification |
|---|---|---|---|---|
| Current runtime verification for 10 historical labs | Source + private historical execution evidence | Fresh execution in a current SAP environment | Re-run each public lab copy, recreating only documented dependencies | Clean activation/execution evidence per lab |
| Reproducible dependency for `ZEMP_LOGALI`-based labs | Public source explains the dependency | A neutral public replacement table or adapter | Build an original synthetic table/model with `_fq` naming, then adapt the public variant | Current run without proprietary training-table dependency |
| Text symbol dependency in lab-04 | Source documents `TEXT-001` dependency | Recreated public text symbol or refactor | Recreate the text symbol or replace it with a self-contained constant in a future runtime branch | Current run |

## P1 — Testing and modern ABAP Cloud expansion

| Capability | Evidence in this track | Missing | Recommended next lab |
|---|---|---|---|
| ABAP Unit | None in this historical lab set | Test class + green runtime evidence | Add a local test class to a pure-logic lab such as arithmetic/conversions |
| CDS | None in this historical lab set | Original CDS source + preview/runtime evidence | Read-only CDS view over synthetic or released demo data |
| RAP | None in this historical lab set | Original BO, behavior and runtime evidence | Minimal managed RAP scenario over synthetic data |
| Service definition / binding | None in this historical lab set | Original service exposure | Extend the RAP scenario |
| OData hands-on ABAP exposure | None in this historical lab set | Service/runtime evidence | Extend the RAP scenario |

The broader SAP Integration Lab already contains documentation-grounded RAP material and executable OData integration evidence; the items above are specifically about creating **new hands-on ABAP labs**.

## P2 — Close training-to-lab gaps

| Capability | Current state in this track | Recommended evidence |
|---|---|---|
| ATC | Training-derived guide only | Run a suitable ATC variant against the public lab package and record actual findings |
| abapGit | Training-derived guide only | Link a real package/repository and capture a real branch/push workflow |
| ABAP Cleaner | Training-derived guide + manual illustration | Run the actual tool on one or two labs and review the diff |
| Authorizations | Training-derived guide only | Create an original authorization object/check scenario appropriate to the target environment |
| API consumption | No hands-on lab in this track | Consume a safe read-only API using a released HTTP client available in the chosen ABAP Cloud environment |

## P3 — Optional expansion

- Debugging walkthrough on one existing lab.
- Runtime/performance analysis of the largest internal-table lab.
- Transport-management evidence where the available environment permits it.
- Advanced RAP only after the P1 end-to-end scenario exists.

## Portfolio-wide context

Use the central [SAP Capability Matrix](../../00-profile/SAP_CAPABILITY_MATRIX.md) for global claims. `NOT_FOUND_IN_THIS_LAB_SET` is intentionally local to this track.
