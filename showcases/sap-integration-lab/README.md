# SAP Engineering Evidence Lab — Public Technical Portfolio

[Versión en español](./README.es.md)

> **Languages:** English + Spanish  
> **Scope:** SAP ECC MM, SAP IS-U / Work Management, CRM/SD, ABAP technical diagnostics, historical hands-on ABAP Cloud labs, completed ABAP training practices, and non-live S/4HANA client-side engineering examples.  
> **Evidence rule:** evidence classes are explicit; enterprise experience, historical execution, owner-confirmed training, public source, documentation-grounded study and executable non-live examples are not treated as equivalent.

This showcase combines sanitized enterprise knowledge with reviewable engineering artifacts. It does **not** claim live S/4HANA integration runtime, SAP Integration Suite/CPI implementation, productive OData/SOAP interfaces, or runtime capabilities not supported by a specific artifact.

## Evidence model

| Class | Meaning |
|---|---|
| `ENTERPRISE_VERIFIED` | Sanitized operational knowledge derived from real SAP work |
| `PUBLIC_SOURCE_EVIDENCE` | Reviewable public source exists in this repository |
| `HISTORICAL_EXECUTION_VERIFIED` | Personal lab source with documented historical execution evidence |
| `OWNER_CONFIRMED_HANDS_ON_EXECUTION` | Training practice directly confirmed by the account owner as personally typed, created and run |
| `PUBLIC_NORMALIZED_SOURCE` | Reviewable practice source published under the portfolio's own `_fq` naming |
| `EXECUTABLE_NON_LIVE_EXAMPLE` | Executable/tested example without a live SAP-connectivity claim |
| `DOCUMENTATION_GROUNDED` | Architecture/technical study grounded in product documentation |
| `TRAINING_ONLY` | Completed training with no saved source artifact and no runtime claim |

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

### Curso 1 — historical ABAP Cloud labs

[ABAP Cloud Historical Labs](./04-abap-labs/README.md)

- **16/16 curriculum units accounted for.**
- **10 hands-on labs** with documented historical execution evidence.
- **10 preserved public `.abap` sources** using the personal `_fq` convention.
- **20 owned, sanitized Eclipse ADT screenshots** extracted from the original personal Word submissions.
- Six units are theory-only curriculum topics and are explicitly not represented as labs.
- Demonstrated historical topics include ABAP Core, ABAP Objects, classrun, internal tables, field symbols, Open SQL and exception handling.

### Curso 2 — ABAP Cloud Dictionary / DDIC

Completed hands-on training is documented for domains, data elements, database tables, persistence adjustments, lock objects, table relationships and Dynamic Cache. No saved source/export artifact is represented, and no source is fabricated to fill that absence.

Training context: [SAP Training & Credentials](./00-profile/TRAINING_AND_CREDENTIALS.md) and [ABAP Cloud Dictionary Guide](./04-abap-labs/guides/ABAP_CLOUD_DICTIONARY_GUIDE.md).

### Curso 3 — `OWNER_CONFIRMED_HANDS_ON_EXECUTION` + `PUBLIC_NORMALIZED_SOURCE`

[Course 3 Training Practices](./04-abap-labs/training-practices/README.md)

Four hands-on practices are documented with precise training provenance and public normalized `_fq` source:

- abapGit — `zcl_c3_01_projects_fq`
- ATC — `zcl_c3_02_atc_demo_fq`
- ABAP Cleaner — `zcl_c3_03_cleaner_demo_fq`
- Authorizations — `zcl_c3_04_dept_auth_fq`

The execution claim refers to the original hands-on training practice confirmed by the account owner. The normalized public copies are source evidence and do not carry a separate current-runtime claim.

### SAP S/4HANA — mixed evidence classes

[S/4HANA Evidence Track](./02-s4hana/README.md)

**MM Procurement API Client — `EXECUTABLE_NON_LIVE_EXAMPLE`**

- Dependency-free TypeScript read-only PO/PR client.
- OData response validation, HTTPS enforcement and request correlation.
- Deterministic automated tests with a previously observed GitHub Actions gate of **6/6 pass**.
- No claim of connectivity to a live S/4HANA tenant.

**Migration Cockpit — `DOCUMENTATION_GROUNDED`**  
Technical guide covering migration objects, staging/direct transfer, mapping, simulation, monitoring and reconciliation.

**ABAP Cloud / Clean Core — `DOCUMENTATION_GROUNDED` + completed training context**  
Guide covering released objects/APIs, release contracts and ATC-oriented governance.

**RAP — `DOCUMENTATION_GROUNDED`**  
Architecture guide covering CDS → behavior → projection → service definition/binding → OData V4. No RAP runtime claim is made.

### Integration architecture & client-side patterns — `DOCUMENTATION_GROUNDED` + `EXECUTABLE_NON_LIVE_EXAMPLE`

[Integration Architecture Guide](./03-integration/README.md)

The material documents OData/REST/SOAP boundaries, idempotency, error mapping, correlation IDs, observability and secret separation. The S/4 procurement client is the executable example. This is not presented as evidence of a live SAP integration implementation.

## Claim boundaries

This portfolio does not claim SAP Integration Suite/CPI runtime, live S/4HANA API connectivity, productive OData/SOAP, IDoc/RFC/BAPI runtime, Event Mesh, RAP/service-binding runtime, or any other capability not supported by the evidence linked above.

## Training & credentials

[SAP Training & Credentials](./00-profile/TRAINING_AND_CREDENTIALS.md)

Recruiter-facing training records are reconciled against the account owner's actual certificate files. Public credentials selected for the portfolio are backed by one canonical certificate PDF/image and indexed from the [general credentials index](../../docs/CREDENTIALS.md). Certificate evidence is kept separate from raw course material and does not upgrade the credential classification beyond the wording of the issuing document.

## Visual evidence

[Visual Evidence Index](./visual-evidence/README.md)

Only legitimate, sanitized visuals are published. The Curso 1 track includes 20 owned Eclipse ADT screenshots. Employer/customer-sensitive screenshots, instructor-branded course pages and raw third-party training assets are excluded.

## Official SAP references

[SAP Official Reference Index](./OFFICIAL_SAP_REFERENCES.md)

Official SAP documentation is used to ground standard concepts; it does not substitute for hands-on evidence.

## Portfolio-wide capability matrix

[SAP Capability Matrix](./00-profile/SAP_CAPABILITY_MATRIX.md)

The central matrix reconciles enterprise experience, historical labs, completed hands-on training, public source, non-live executable examples and documentation-grounded study.

## Sanitization status

[SAP Public Sanitization Status](./SANITIZATION_STATUS.md)

## Confidentiality and integrity

Public evidence excludes customer/company identities, real business-object identifiers, proprietary source, internal endpoints, secret credentials and unsanitized enterprise/training data. Canonical certificate PDFs/images intentionally selected as public professional evidence are permitted under the credential-evidence policy.

---

Public profile: [Francisco Quinteros / JavierQuinan](https://github.com/JavierQuinan)
