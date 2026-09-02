# SAP Evidence Governance

This document defines how SAP evidence is labelled in this portfolio. It does not use roadmap states; an artifact is described only by evidence that already exists.

## Evidence labels

| Label | Meaning |
|---|---|
| `FUNCTIONAL_GUIDE` | Sanitized operational/process guide derived from legitimate hands-on material. |
| `TECHNICAL_GUIDE` | Original technical reference grounded in available source material and/or authoritative documentation. |
| `SOURCE_REVIEWED` | Reviewable source exists in GitHub and its assumptions, dependencies and boundaries are documented. |
| `STATIC_SCENARIOS_REVIEWED` | Deterministic source/test scenarios were traced consistently against the current implementation; this is not runtime execution. |
| `BUILD_GUIDE_INCLUDED` | Reproducible object-by-object construction/execution instructions exist. |
| `LOCAL_TESTED` | Automated tests were actually executed outside SAP against local/synthetic/mocked behavior. |
| `CI_TESTED` | An automated CI gate was actually observed successfully. |
| `SAP_RUNTIME_EVIDENCE` | Activation/execution evidence from an appropriate SAP environment exists and is explicitly documented. |
| `SAP_TEST_EVIDENCE` | Executed SAP test evidence exists, such as observed ABAP Unit results. |

No artifact is described as “executed in SAP”, “working in SAP”, “ABAP Unit passed” or “production-ready” unless the corresponding runtime/test evidence is actually available.

Absence of SAP runtime evidence is expressed simply as **“SAP runtime is not claimed by this artifact.”** It is not presented as a future task or promotion promise.

## Evidence record

An `EVIDENCE.md` may record:

- SAP product/context (`ECC`, `IS-U`, `S/4HANA`, `ABAP Cloud`);
- source objects included;
- functional/technical source basis;
- static source-review result;
- local/CI test result when actually observed;
- SAP runtime/test result only when actually observed;
- reproducible build/execution instructions;
- known functional boundaries;
- sanitized screenshots/log excerpts when publication is legitimate.

Production/customer identifiers are never included.

## Product boundaries

### SAP ECC MM

Classic MM evidence may demonstrate:

- material/plant/storage-location concepts;
- inventory analysis;
- purchase requisitions and purchase orders;
- service procurement;
- classic Open SQL where appropriate;
- ALV/SALV reporting;
- ABAP Objects and ABAP Unit source.

Direct-table examples are explicitly labelled as ECC/classic evidence and are not reused as Clean Core claims.

### SAP ECC IS-U / Work Management

IS-U / WM evidence may combine sanitized operational guides with original read-only technical source.

Public artifacts exclude real:

- business partners;
- contract accounts;
- contracts;
- installations;
- devices/meters;
- work orders;
- users;
- company/customer configuration;
- internal integration endpoints.

### SAP S/4HANA

S/4HANA evidence is split between:

- executable integration-side source with observed local/CI tests where available; and
- technical guides covering released interfaces, Migration Cockpit, ABAP Cloud/Clean Core and RAP architecture.

Classic ECC source is never relabelled as S/4HANA Clean Core source.

### SAP Integration

Integration evidence may cover:

- OData;
- REST;
- SOAP/XML;
- message transformation;
- idempotency;
- correlation IDs;
- retry/error mapping;
- audit and observability.

Secrets and internal destinations remain outside Git.

## Functional-guide policy

SAP MM, IS-U/WM, CRM and SD guides may be included after sanitization when they legitimately support professional evidence.

Before publication, remove or replace:

- employer/customer names;
- real IDs/documents;
- usernames;
- URLs/hostnames;
- confidential screenshots;
- proprietary custom-object details that are not necessary to explain the process.

The resulting artifact states whether it is:

- a sanitized professional guide derived from operational material; or
- an original technical guide synthesized from study/training/official documentation.

Third-party screenshots, logos and training pages are not republished unless publication rights are clear.

## Visual-evidence policy

Screenshots are supporting evidence when they are legitimate to publish and sufficiently sanitized.

A visual asset should document:

- its technical purpose;
- what was redacted/replaced;
- what the screenshot demonstrates;
- what it does not demonstrate.

See [`VISUAL_EVIDENCE_POLICY.md`](./VISUAL_EVIDENCE_POLICY.md) and [`visual-evidence/`](./visual-evidence/README.md).

## Bilingual standard

Portfolio-facing technical documentation is English-first and accompanied by Spanish for substantial artifacts.

Preferred convention:

- `README.md` — English;
- `README.es.md` — Spanish;
- code identifiers — English unless SAP standard naming dictates otherwise.

## Current integrity rule

Every recruiter-facing claim must be answerable by pointing to an existing guide, source file, test record, CI run or sanitized visual asset in the repository. If the evidence does not exist, the claim is omitted rather than represented as a roadmap item.
