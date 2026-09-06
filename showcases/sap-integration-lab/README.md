# SAP Engineering Evidence Lab — Public Technical Portfolio

[Versión en español](./README.es.md)

> **Languages:** English + Spanish  
> **Scope:** SAP ECC MM, SAP IS-U / Work Management, CRM/SD, ABAP technical diagnostics, historical hands-on ABAP Cloud labs, and non-live S/4HANA client-side engineering examples.  
> **Evidence rule:** evidence classes are explicit; documentation, historical lab execution, public source and current runtime are not treated as equivalent.

This showcase combines sanitized enterprise knowledge with reviewable engineering artifacts. It does **not** claim live S/4HANA integration runtime, SAP Integration Suite/CPI implementation, productive OData/SOAP interfaces, or current execution of the historical ABAP Cloud labs unless a specific artifact states otherwise.

## Evidence model

| Class | Meaning |
|---|---|
| `ENTERPRISE_VERIFIED` | Sanitized operational knowledge derived from real SAP work |
| `HANDS_ON_HISTORICAL` | Personal lab source with historical execution evidence; current re-execution may still be pending |
| `CURRENT_RUNTIME_VERIFIED` | Re-executed in a current environment with fresh evidence |
| `PUBLIC_SOURCE_EVIDENCE` | Reviewable public source exists |
| `EXECUTABLE_NON_LIVE_EXAMPLE` | Executable/tested example without a claim of live SAP connectivity |
| `DOCUMENTATION_GROUNDED` | Architecture/technical study grounded in product documentation |
| `TRAINING_ONLY` | Completed training without independent hands-on runtime evidence |
| `NOT_YET_EVIDENCED` | No portfolio evidence currently supports a hands-on claim |

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

### Historical ABAP Cloud labs — `HANDS_ON_HISTORICAL`

[ABAP Cloud Historical Labs](./04-abap-labs/README.md)

- 10 personal ABAP class source files across 8 base topics.
- Historical execution evidence: **10/10** documented in private source submissions.
- Current runtime re-verification: **0/10 — pending**.
- Demonstrated historical topics include ABAP Core, ABAP Objects, classrun, internal tables, field symbols, Open SQL and exception handling.
- Five training-derived guides cover DDIC, abapGit, ATC, ABAP Cleaner and authorizations without presenting them as executed labs.

Historical screenshots and raw course material are not republished.

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
