# SAP Integration Lab — Public Engineering Evidence

[Versión en español](./README.es.md)

> **Artifact type:** public SAP functional + engineering evidence  
> **Languages:** English + Spanish  
> **Evidence rule:** enterprise experience, source/static validation, CI, research/design and SAP runtime are always distinguished

This lab converts SAP operational experience and technical specialization into reviewable, non-confidential evidence. ECC, IS-U/WM, SD and S/4HANA are intentionally separated rather than blended into one generic “SAP” claim.

## Tracks

1. **SAP ECC MM** — materials, inventory, purchasing/services, classic ABAP
2. **SAP ECC IS-U / Work Management** — work orders, status, device/equipment, CRM integration
3. **SAP ECC / CRM-SD** — customer/sales-area/billing process evidence
4. **ECC Technical Diagnostics** — ABAP/debugging/runtime troubleshooting methodology
5. **SAP S/4HANA** — MM released APIs, Migration Cockpit, ABAP Cloud, RAP
6. **SAP Integration** — OData/REST/SOAP, resilient integration and observability patterns

## Evidence maturity

| State | Meaning |
|---|---|
| `PLANNED` | scenario identified |
| `RESEARCH_VALIDATED` | design grounded in authoritative/current documentation; no runtime claim |
| `DESIGN_READY` | architecture, boundaries and acceptance criteria documented |
| `SOURCE_READY` | reviewable source exists |
| `STATIC_VALIDATED` | source logic/deterministic vectors reviewed consistently; not executed in SAP |
| `LOCAL_TEST_VALIDATED` | automated tests executed outside SAP against deterministic local/mocked behavior |
| `CI_VALIDATED` | automated test gate observed successfully in CI |
| `EXECUTION_PROCEDURE_READY` | reproducible SAP build/activation/test/run procedure documented |
| `RUNTIME_DEFERRED` | SAP runtime deliberately deferred due authorized environment/CTS constraints |
| `RUNTIME_VALIDATED` | execution captured in an appropriate SAP environment |
| `TEST_VALIDATED` | SAP runtime plus reproducible test evidence |

## ECC Technical Diagnostics

[ABAP Debugging & Technical Diagnostics](./01-ecc/technical-diagnostics/README.md)

Published methodology:

`SE93 -> SE24/SE37/SE38/SE80 -> /H/breakpoints/debugger -> ST22/SM21 -> SM50/SM66`.

This demonstrates troubleshooting method without claiming Basis privileges or production debugging.

## SAP ECC MM

[MM Evidence Track](./01-ecc/mm/README.md)

### Inventory & Stock Risk

`SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

- ABAP OO and datasource abstraction
- read-only `MARA/MARC/MARD`
- SALV
- plant/storage stock semantics hardened
- six deterministic ABAP Unit vectors traced consistently
- reproducible `SE24/SE38/SE93` procedure

### Service Procurement & `ZMM_CONTRACT_AUDIT`

[Service Procurement & Framework Contracts](./01-ecc/mm/service-procurement/README.md)

`FUNCTIONAL_EVIDENCE_READY / ABAP_SOURCE_READY / STATIC_VALIDATED / RUNTIME_DEFERRED`

- framework-contract functional workflow derived from sanitized operational evidence
- read-only `EKKO/EKPO` datasource
- vendor/purchasing-organization/validity context
- target value and quantity/value item indicators
- SALV report source
- eight deterministic ABAP Unit vectors traced consistently
- bilingual build/evidence guide

Neither ABAP pack claims SAP activation/runtime while an authorized DEV/sandbox is not used for portfolio execution.

## SAP ECC IS-U / Work Management

[IS-U / WM Evidence Track](./01-ecc/isu/README.md)

Published sanitized evidence includes:

- [Work Management operations](./01-ecc/isu/functional-evidence/work-management-operations/README.md)
- [Work-order status audit](./01-ecc/isu/work-management/status-audit/README.md)
- [Batch work-order governance](./01-ecc/isu/work-management/batch-order-governance/README.md)
- [Seal material enablement — MM↔WM](./01-ecc/isu/work-management/seals-material-enablement/README.md)
- [Equipment consistency — IS-U↔CRM](./01-ecc/isu/device-management/pec-equipment-consistency/README.md)
- [Photovoltaic service onboarding](./01-ecc/isu/master-data/photovoltaic-service-onboarding/README.md)
- [CRM↔IS-U contract-end/DCDE recovery](./01-ecc/isu/crm-isu-integration/dcde-recovery/README.md)
- [Occasional metered service CRM→WM→CRM](./01-ecc/isu/crm-isu-integration/occasional-metered-service/README.md)

## SAP ECC / CRM-SD

[SD Evidence Track](./01-ecc/sd/README.md)

Published:

- [Non-Energy Service Billing Workflow](./01-ecc/sd/non-energy-billing/README.md)

## SAP S/4HANA

[S/4HANA Evidence Track](./02-s4hana/README.md)

### MM Procurement API Client

[Procurement API Lab](./02-s4hana/mm/procurement-api-lab/README.md)

`SOURCE_READY / LOCAL_TEST_VALIDATED / CI_VALIDATED / S4_RUNTIME_NOT_CLAIMED`

The first executable S/4 integration-side artifact is a dependency-free TypeScript read-only client demonstrating:

- Purchase Order and Purchase Requisition reads
- transport abstraction
- OData response validation
- query construction
- correlation/request ID handling
- HTTPS enforcement
- deterministic tests
- GitHub Actions quality gate

Observed CI result: **6 tests / 6 pass / 0 fail** on Node 22. This validates the client source, not connectivity to an S/4HANA tenant.

Released-interface direction:

- `I_PurchaseOrderAPI01`
- `API_PURCHASEORDER_2`
- `API_PURCHASEREQUISITION_2`

### Migration Cockpit

[Migration Cockpit Lab](./02-s4hana/migration-cockpit/README.md) — `RESEARCH_VALIDATED / RUNTIME_NOT_CLAIMED`

### ABAP Cloud / Clean Core

[ABAP Cloud Track](./02-s4hana/abap-cloud/README.md) — `RESEARCH_VALIDATED / IMPLEMENTATION_PLANNED`

### RAP

[RAP Evidence Roadmap](./02-s4hana/rap/README.md) — `DESIGN_READY / IMPLEMENTATION_PLANNED`

First planned BO: **MM Replenishment Review**.

## Bilingual standard

Substantial artifacts use `README.md` for English-first international documentation and `README.es.md` for the complete Spanish version. Code identifiers remain in English.

## Confidentiality / integrity rules

Never publish company/customer identities or source, real materials/vendors/contracts/installations/work orders/BP IDs/meters, proprietary Z source/configuration, internal endpoints, credentials, transport IDs, private certificates or unsanitized enterprise screenshots.

## Current evidence matrix

| Track | Public evidence | Maturity |
|---|---|---|
| ECC Technical Diagnostics | debugging/diagnostics procedure | `PROCEDURE_READY` |
| ECC MM Inventory | ABAP source + 6-vector static trace + runbook | `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED` |
| ECC MM Services | functional evidence + `ZMM_CONTRACT_AUDIT` source + 8-vector trace | `ABAP_SOURCE_READY / STATIC_VALIDATED / RUNTIME_DEFERRED` |
| ECC IS-U / WM | 8 sanitized operational/troubleshooting packs | `FUNCTIONAL_TECHNICAL_EVIDENCE_READY` |
| ECC / CRM-SD | non-energy billing pack | `FUNCTIONAL_EVIDENCE_READY` |
| S/4HANA MM APIs | TypeScript Procurement API client + CI | `SOURCE_READY / LOCAL_TEST_VALIDATED / CI_VALIDATED` |
| S/4HANA Migration | Migration Cockpit research/design | `RESEARCH_VALIDATED` |
| ABAP Cloud | Clean Core evidence architecture | `RESEARCH_VALIDATED / IMPLEMENTATION_PLANNED` |
| RAP | first BO architecture | `DESIGN_READY / IMPLEMENTATION_PLANNED` |

## Next engineering milestones

1. implement the synthetic **IS-U/WM `ZWM_STATUS_AUDIT_LAB`**
2. build ECC Purchasing Analytics for PR/PO visibility
3. harden the S/4 Procurement client with pagination/retry/release-specific schemas
4. create the first RAP source package when an appropriate ABAP Cloud workflow/environment is available
5. add SAP runtime proof only through an authorized environment

---

Public profile: [Francisco Quinteros / JavierQuinan](https://github.com/JavierQuinan)
