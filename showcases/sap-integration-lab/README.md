# SAP Engineering Evidence Lab — Public Technical Portfolio

[Versión en español](./README.es.md)

> **Languages:** English + Spanish  
> **Scope:** SAP ECC MM, SAP IS-U / Work Management, CRM/SD, ABAP technical diagnostics, historical hands-on ABAP Cloud labs, and non-live S/4HANA client-side engineering examples.  
> **Evidence rule:** evidence classes are explicit; documentation, historical lab execution, public source and current runtime are not treated as equivalent.

This showcase combines sanitized enterprise knowledge with reviewable engineering artifacts. It does **not** claim live S/4HANA integration runtime, SAP Integration Suite/CPI implementation, productive OData/SOAP interfaces, or current execution of the historical ABAP Cloud labs unless a specific artifact states otherwise.

## Evidence model

Six evidence tiers are used across this lab, and they are **not equivalent** — each makes a narrower or wider claim than the others:

| Tier | Class | Meaning |
|---|---|---|
| 1 | `ENTERPRISE_VERIFIED` | Sanitized operational knowledge derived from real SAP work |
| 2 | `PUBLIC_SOURCE_EVIDENCE` | Reviewable public source exists in this repository |
| 3 | `HISTORICAL_EXECUTION_VERIFIED` | Personal lab source with documented historical execution evidence; no current-runtime claim is made or required |
| 4 | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` | Training practice directly confirmed by the account owner as personally typed, created and run; no independent artifact survived beyond that confirmation |
| 5 | `DOCUMENTATION_GROUNDED` | Architecture/technical study grounded in product documentation |
| 6 | `TRAINING_ONLY` | Completed training with no saved source artifact and no runtime claim |

Supporting, narrower classes: `PUBLIC_NORMALIZED_SOURCE` (a practice's source published under the portfolio's own `_fq` naming — the renamed copy itself is not independently re-executed), `EXECUTABLE_NON_LIVE_EXAMPLE` (executable/tested example without a live-connectivity claim), `NOT_YET_EVIDENCED` (no portfolio basis for a hands-on claim yet).

## Evidence available now

### SAP ECC MM — `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE`

[MM Evidence Track](./01-ecc/mm/README.md)

- Inventory & stock-risk analysis with read-only `MARA / MARC / MARD` ABAP source, SALV and source-reviewed scenarios.
- Service procurement / framework-contract diagnostics using `EKKO / EKPO`.
- Purchasing analytics over `EBAN → EKKO / EKPO → EKET`.
- Sanitized operational documentation and reproducible build guides.

The ECC packs are presented as reviewable source plus deterministic source/static review. No corporate ABAP Unit runtime claim is made.

### SAP ECC IS-U / Work Management — `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE`

[IS-U / WM Evidence Track](./01-ecc/isu/README.md)

Published evidence includes `ZWM_STATUS_AUDIT_LAB`, work-order status/history analysis, `IW38/IW32`, jobs, number-range governance, device-status regularization, seal-material enablement, CRM ↔ IS-U recovery, GIS ↔ SAP monitoring/reprocessing and other sanitized operational flows.

### ECC Technical Diagnostics — `ENTERPRISE_VERIFIED`

[ABAP Debugging & Technical Diagnostics](./01-ecc/technical-diagnostics/README.md)

Documented troubleshooting sequence:

`SE93 → SE24 / SE37 / SE38 / SE80 → debugger → ST22 / SM21 → SM50 / SM66`

### SAP ECC / CRM-SD — `ENTERPRISE_VERIFIED`

[CRM-SD Evidence Track](./01-ecc/sd/README.md)

Sanitized evidence covers a non-energy service billing workflow including customer/BP preparation, sales-area context, billing/output review and configured fiscal-output completion.

### Historical ABAP Cloud labs — `HISTORICAL_EXECUTION_VERIFIED`

[ABAP Cloud Historical Labs](./04-abap-labs/README.md)

- Curso 1's full 16-unit curriculum: 10 units with a personal hands-on lab (source + the account owner's own sanitized screenshots) across 8 base topics, 6 theory-only units with no lab.
- Historical execution evidence: **10/10** documented in private source submissions.
- No current-runtime claim is made or required for this track.
- Demonstrated historical topics include ABAP Core, ABAP Objects, classrun, internal tables, field symbols, Open SQL and exception handling.
- Five training-derived guides cover DDIC, abapGit, ATC, ABAP Cleaner and authorizations without presenting them as executed labs.
- An [optional reproducibility reference](./04-abap-labs/runtime-readiness/README.md) documents dependency analysis, a synthetic fixture and 3 runtime-ready source drafts — supporting material, not a portfolio blocker.

Historical screenshots and raw course material are not republished.

### Course 3 training practices — `OWNER_CONFIRMED_HANDS_ON_EXECUTION` + `PUBLIC_NORMALIZED_SOURCE`

[Course 3 Training Practices](./04-abap-labs/training-practices/README.md)

- 4 hands-on practices (abapGit, ATC, ABAP Cleaner, Authorizations) personally implemented by the account owner during structured training, confirmed directly by the account owner and normalized to the portfolio's `_fq` convention.
- No independent artifact (a personal screenshot, a personal tool export) survived beyond that confirmation — disclosed rather than hidden.
- Course 2 (ABAP Dictionary hands-on practice) is documented as `TRAINING_ONLY`: training and hands-on practice occurred, but no source artifact was saved to normalize or publish.

### SAP S/4HANA — mixed evidence classes

[S/4HANA Evidence Track](./02-s4hana/README.md)

**MM Procurement API Client — `EXECUTABLE_NON_LIVE_EXAMPLE`**

- Dependency-free TypeScript read-only PO/PR client.
- OData response validation, HTTPS enforcement and request correlation.
- Deterministic automated tests with a previously observed GitHub Actions gate of **6/6 pass**.
- **No claim of connectivity to a live S/4HANA tenant.**

**Migration Cockpit — `DOCUMENTATION_GROUNDED`**  
Study/technical guide covering migration objects, staging/direct transfer, mapping, simulation, monitoring and reconciliation.

**ABAP Cloud / Clean Core — `DOCUMENTATION_GROUNDED` + training context**  
Guide covering released objects/APIs, release contracts and ATC-oriented governance.

**RAP — `DOCUMENTATION_GROUNDED`**  
Architecture guide covering CDS → behavior → projection → service definition/binding → OData V4. No RAP runtime claim is made.

### Integration architecture & client-side patterns — `DOCUMENTATION_GROUNDED` + `EXECUTABLE_NON_LIVE_EXAMPLE`

[Integration Architecture Guide](./03-integration/README.md)

The material documents OData/REST/SOAP boundaries, idempotency, error mapping, correlation IDs, observability and secret separation. The S/4 procurement client is the executable example. **This is not presented as evidence of a live SAP integration implementation.**

## Explicitly not claimed

The current portfolio does not claim hands-on/runtime evidence for:

- SAP Integration Suite / CPI;
- live S/4HANA API connectivity;
- productive OData or SOAP service implementation;
- IDoc or RFC/BAPI integration runtime;
- Event Mesh;
- RAP/service-binding runtime;
- current ABAP Unit execution for the historical lab set.

## Visual evidence

[Visual Evidence Index](./visual-evidence/README.md)

Only legitimate, sanitized operational screenshots are published. Employer-authored manuals, third-party training screenshots and raw course evidence are not republished.

## Official SAP references

[SAP Official Reference Index](./OFFICIAL_SAP_REFERENCES.md)

Official SAP documentation is used to ground standard concepts; it does not substitute for runtime evidence.

## Portfolio-wide capability matrix

[SAP Capability Matrix](./00-profile/SAP_CAPABILITY_MATRIX.md)

The central matrix reconciles enterprise experience, historical labs, public source, non-live executable examples, documentation-grounded study and training.

## Bilingual standard

Substantial artifacts use `README.md` for English-first international documentation and `README.es.md` for the complete Spanish version. Code identifiers remain unchanged.

## Confidentiality and integrity

Public evidence excludes customer/company identities, real business objects, proprietary source, internal endpoints, credentials, private certificates and unsanitized enterprise/training screenshots.

---

Public profile: [Francisco Quinteros / JavierQuinan](https://github.com/JavierQuinan)
