# SAP Evidence Governance

This document defines the acceptance criteria for SAP evidence published in this portfolio.

## Evidence states

| State | Acceptance criteria |
|---|---|
| `PLANNED` | Scenario and expected learning/evidence outcome documented. |
| `SOURCE_READY` | Reviewable source exists in GitHub and has an explanation of assumptions and expected behavior. |
| `RUNTIME_VALIDATION_PENDING` | Source is ready to activate/run, but no runtime proof from an SAP system has been recorded yet. |
| `RUNTIME_VALIDATED` | Source was activated and executed in an appropriate SAP environment; execution evidence is documented. |
| `TEST_VALIDATED` | Runtime validation plus reproducible automated/unit test evidence. |

No artifact may be described as “executed”, “working in SAP”, “production-ready” or equivalent unless it reaches the corresponding state.

## Required evidence record

Each executable artifact must eventually include an `EVIDENCE.md` containing:

- SAP product/context (ECC, IS-U, S/4HANA, ABAP Cloud)
- system type (demo/sandbox/training/private enterprise environment)
- object names used
- activation result
- execution steps
- expected result
- actual result
- test result
- validation date
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
- ABAP Objects and ABAP Unit

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

The resulting artifact must state that it is a sanitized professional guide derived from real operational experience, not a vendor training document.

## Bilingual standard

Portfolio-facing technical documentation is English-first and accompanied by Spanish when the artifact is substantial.

Preferred convention:

- `README.md` — English
- `README.es.md` — Spanish
- `EVIDENCE.md` — English evidence record, optionally accompanied by `EVIDENCE.es.md`

Code identifiers remain in English unless SAP standard object naming dictates otherwise.

## Runtime-validation gate

For ABAP source, runtime validation should include at minimum:

1. object creation/import into an appropriate SAP development environment
2. successful syntax check/activation
3. executable scenario or callable class method
4. result capture with synthetic/demo data
5. ABAP Unit result when tests exist

Until these steps are documented, source remains `RUNTIME_VALIDATION_PENDING`.
