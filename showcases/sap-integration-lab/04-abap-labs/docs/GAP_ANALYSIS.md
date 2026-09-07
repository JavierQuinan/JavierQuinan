# Gap Analysis — Historical ABAP Cloud Lab Track

[Versión en español](./GAP_ANALYSIS.es.md)

> This document covers only `04-abap-labs/`. It is a track-level gap analysis, not a statement that the broader SAP Integration Lab lacks these capabilities. **This track's current scope is complete** — nothing below is a blocker to that; everything here is `OPTIONAL_FUTURE_EXPANSION`, listed for transparency about what a next-generation lab set could add.

## Already closed by this track

- **10 historical labs**, `HISTORICAL_EXECUTION_VERIFIED`, no current-runtime claim made or required.
- **abapGit, ATC, ABAP Cleaner, Authorizations hands-on practice** — previously listed here as training-only gaps, now closed via [Course 3 Training Practices](../training-practices/README.md) (`OWNER_CONFIRMED_HANDS_ON_EXECUTION`, normalized `_fq` source published).
- **`ZEMP_LOGALI` reproducibility and the `TEXT-001` dependency** — analyzed and documented in the [optional runtime-readiness reference](../runtime-readiness/README.md), including a synthetic `_fq` fixture and 3 runtime-ready source drafts. This reference exists because it has technical value, not because this track requires it to close.

## `OPTIONAL_FUTURE_EXPANSION` — next-generation original labs

| Capability | Evidence in this track | Recommended next lab, if pursued |
|---|---|---|
| ABAP Unit | None in this historical lab set | A local test class added to a pure-logic lab such as arithmetic/conversions |
| CDS | None in this historical lab set | A read-only CDS view over synthetic or released demo data |
| RAP | None in this historical lab set | A minimal managed RAP scenario over synthetic data |
| Service definition / binding | None in this historical lab set | An extension of the RAP scenario above |
| OData hands-on ABAP exposure | None in this historical lab set | An extension of the RAP scenario above |
| API consumption | No hands-on lab in this track | A safe read-only HTTP client lab in the ABAP Cloud environment |

The broader SAP Integration Lab already contains documentation-grounded RAP material and an executable non-live OData client-side example; the items above are specifically about a **future, original hands-on ABAP lab generation** — never a requirement to close the current track.

## `OPTIONAL_FUTURE_EXPANSION` — Course 2 original labs

Course 2 (ABAP Dictionary hands-on training: domains, data elements, tables, lock objects, persistence settings, table relations, Dynamic Cache) is `TRAINING_ONLY` — practiced hands-on, but no source artifact was saved to normalize or publish. A future, entirely original DDIC lab (own scenario, own `_fq` naming, built and run independently of the course exercise) could close this gap, but is optional future work, not a requirement of the current scope.

## Portfolio-wide context

Use the central [SAP Capability Matrix](../../00-profile/SAP_CAPABILITY_MATRIX.md) for global claims. `NOT_FOUND_IN_THIS_LAB_SET` is intentionally local to this track.
