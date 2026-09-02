# SAP Evidence Governance

This document defines the acceptance criteria for SAP evidence published in this portfolio.

## Evidence states

| State | Acceptance criteria |
|---|---|
| `PLANNED` | Scenario and expected learning/evidence outcome documented. |
| `SOURCE_READY` | Reviewable source exists in GitHub and has an explanation of assumptions and expected behavior. |
| `STATIC_VALIDATED` | Source logic, dependencies, decision paths and deterministic test vectors have been reviewed consistently at source level; this is not runtime execution. |
| `EXECUTION_PROCEDURE_READY` | A reproducible object-by-object creation, activation, test and execution procedure is documented for an authorized SAP environment. |
| `RUNTIME_DEFERRED` | Runtime execution is intentionally deferred because an authorized SAP DEV/sandbox or required development/CTS access is not available. This is an environment constraint, not a successful runtime result. |
| `RUNTIME_VALIDATED` | Source was activated and executed in an appropriate SAP environment; execution evidence is documented. |
| `TEST_VALIDATED` | Runtime validation plus reproducible automated/unit-test evidence. |

No artifact may be described as “executed”, “working in SAP”, “6/6 ABAP Unit passed”, “production-ready” or equivalent unless it reaches the corresponding runtime/test state.

`STATIC_VALIDATED` and `EXECUTION_PROCEDURE_READY` are legitimate professional evidence states. They allow a portfolio artifact to progress without inventing enterprise runtime access.

## Required evidence record

Each executable artifact must eventually include an `EVIDENCE.md` containing:

- SAP product/context (ECC, IS-U, S/4HANA, ABAP Cloud)
- environment availability/boundary
- object names used
- source/static-review result
- activation result when actually observed
- execution steps
- expected result
- actual runtime result when actually observed
- test result, distinguishing static vectors from executed ABAP Unit
- validation date when applicable
- screenshots/log excerpts only when sanitized
- known limitations

Production/customer identifiers must never be included.

## Product boundaries

### SAP ECC MM

Classic MM evidence can demonstrate:

- material/plant/storage-location concepts
- inventory analysis
- purchase requisitions and purchase orders
- service procurement
- classic Open SQL where appropriate
- ALV/SALV reporting
- ABAP Objects and ABAP Unit source

Any direct-table example must be explicitly labelled as ECC/classic evidence and must not be reused to claim a modern S/4HANA Clean Core design.

### SAP ECC IS-U / Work Management

IS-U evidence is a separate track. Functional evidence can be derived from sanitized user-authored guides and real troubleshooting knowledge.

Technical/public artifacts must not expose real:

- business partners
- contract accounts
- contracts
- installations
- devices/meters
- work orders
- users
- customer/company configuration
- internal integration endpoints

### SAP S/4HANA

S/4HANA evidence should prioritize modern extensibility and released interfaces:

- CDS View Entities
- released APIs
- OData services
- ABAP Cloud language/version constraints
- RAP
- Clean Core-compatible design

Legacy ECC patterns do not automatically qualify as S/4HANA evidence.

### SAP Integration

Integration evidence may cover:

- OData
- REST
- SOAP/XML
- message transformation
- idempotency
- correlation IDs
- retry/error mapping
- audit and observability

Secrets and internal destinations remain external to Git.

## Functional-guide policy

User-authored SAP MM and SAP IS-U/WM guides may be incorporated as high-value functional evidence after sanitization.

Before publication, remove or replace:

- employer/customer names
- real IDs/documents
- usernames
- URLs/hostnames
- screenshots with confidential information
- custom object details that reveal proprietary implementation when not necessary

The resulting artifact must state whether it is:

- a sanitized professional guide derived from real operational experience, or
- an original technical reference synthesized from study/training material.

Third-party screenshots, logos and copyrighted training pages are not republished as portfolio assets unless explicit publication rights exist.

## Bilingual standard

Portfolio-facing technical documentation is English-first and accompanied by Spanish when the artifact is substantial.

Preferred convention:

- `README.md` — English
- `README.es.md` — Spanish
- `EVIDENCE.md` — English evidence record, optionally accompanied by `EVIDENCE.es.md`

Code identifiers remain in English unless SAP standard object naming dictates otherwise.

## Runtime-validation gate

For ABAP source, true runtime validation still requires at minimum:

1. object creation/import into an appropriate authorized SAP development environment
2. successful syntax check/activation
3. executable scenario or callable class method
4. result capture with synthetic/demo data
5. ABAP Unit execution result when tests exist

If enterprise governance prevents those steps, the correct state is:

`STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

This state may be promoted later without redesign when an authorized sandbox/DEV environment becomes available.
