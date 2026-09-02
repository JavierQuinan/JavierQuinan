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

## SAP ECC MM

[MM Evidence Track](./01-ecc/mm/README.md)

### Inventory & Stock Risk

`SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

Classic ABAP OO, read-only `MARA/MARC/MARD`, SALV, six deterministic vectors and reproducible `SE24/SE38/SE93` procedure.

### Service Procurement & `ZMM_CONTRACT_AUDIT`

[Service Procurement & Framework Contracts](./01-ecc/mm/service-procurement/README.md)

`FUNCTIONAL_EVIDENCE_READY / ABAP_SOURCE_READY / STATIC_VALIDATED / RUNTIME_DEFERRED`

Read-only `EKKO/EKPO` source, contract-validity diagnostics, SALV, eight deterministic vectors and bilingual build/evidence documentation.

### Purchasing Analytics & `ZMM_PURCH_ANALYTICS`

[Purchasing Analytics](./01-ecc/mm/purchasing-analytics/README.md)

`SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

Read-only PR→PO→schedule-line visibility using `EBAN`, `EKKO`, `EKPO` and `EKET`, with datasource abstraction, SALV and seven deterministic ABAP Unit vectors. The lab treats a PR without a PO as a valid `PR_ONLY` state rather than automatically calling it an error.

## SAP ECC IS-U / Work Management

[IS-U / WM Evidence Track](./01-ecc/isu/README.md)

### `ZWM_STATUS_AUDIT_LAB`

[Work Order Status Audit](./01-ecc/isu/work-management/status-audit/README.md)

`FUNCTIONAL_TECHNICAL_EVIDENCE_READY / SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

Original read-only source over `AUFK/JSTO/JEST/TJ02T/TJ30T/JCDS`, ECC/demo datasource abstraction, ABAP OO service, SALV and six deterministic vectors.

Additional sanitized WM/IS-U evidence includes work-order operations, batch governance, seal-material enablement, equipment consistency, photovoltaic onboarding, CRM contract-end recovery and occasional metered-service flow.

## ECC Technical Diagnostics

[ABAP Debugging & Technical Diagnostics](./01-ecc/technical-diagnostics/README.md)

Methodology: `SE93 -> SE24/SE37/SE38/SE80 -> /H/breakpoints/debugger -> ST22/SM21 -> SM50/SM66`.

## SAP ECC / CRM-SD

[SD Evidence Track](./01-ecc/sd/README.md) — sanitized non-energy service billing evidence.

## SAP S/4HANA

[S/4HANA Evidence Track](./02-s4hana/README.md)

### MM Procurement API Client

[Procurement API Lab](./02-s4hana/mm/procurement-api-lab/README.md)

`SOURCE_READY / LOCAL_TEST_VALIDATED / CI_VALIDATED / S4_RUNTIME_NOT_CLAIMED`

The first executable S/4 integration-side artifact is a dependency-free TypeScript read-only client with Purchase Order/Requisition reads, OData validation, correlation/request IDs, HTTPS enforcement and a GitHub Actions gate observed at **6 tests / 6 pass / 0 fail** on Node 22.

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

## Visual evidence

[Visual Evidence Policy](./VISUAL_EVIDENCE_POLICY.md) defines when screenshots may be added, required sanitization and the rule against republishing third-party training material without clear publication rights.

Screenshots are supporting evidence only; source, tests and reproducible documentation remain the primary evidence.

## Bilingual standard

Substantial artifacts use `README.md` for English-first international documentation and `README.es.md` for complete Spanish documentation. Code identifiers remain in English.

## Confidentiality / integrity rules

Never publish customer/company identities, real materials/vendors/contracts/installations/work orders/BP IDs/meters, proprietary employer/customer Z source, internal endpoints, credentials, transport IDs, private certificates or unsanitized enterprise screenshots.

## Current evidence matrix

| Track | Public evidence | Maturity |
|---|---|---|
| ECC Technical Diagnostics | debugging/diagnostics procedure | `PROCEDURE_READY` |
| ECC MM Inventory | ABAP source + 6-vector static trace + runbook | `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED` |
| ECC MM Services | `ZMM_CONTRACT_AUDIT` + 8-vector trace | `SOURCE_READY / STATIC_VALIDATED / RUNTIME_DEFERRED` |
| ECC MM Purchasing | `ZMM_PURCH_ANALYTICS` + 7-vector trace | `SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED` |
| ECC IS-U / WM Status | `ZWM_STATUS_AUDIT_LAB` + 6-vector trace | `SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED` |
| ECC IS-U / WM Operations | sanitized operational/troubleshooting packs | `FUNCTIONAL_TECHNICAL_EVIDENCE_READY` |
| ECC / CRM-SD | non-energy billing pack | `FUNCTIONAL_EVIDENCE_READY` |
| S/4HANA MM APIs | TypeScript Procurement API client + CI | `SOURCE_READY / LOCAL_TEST_VALIDATED / CI_VALIDATED` |
| S/4HANA Migration | Migration Cockpit research/design | `RESEARCH_VALIDATED` |
| ABAP Cloud | Clean Core evidence architecture | `RESEARCH_VALIDATED / IMPLEMENTATION_PLANNED` |
| RAP | first BO architecture | `DESIGN_READY / IMPLEMENTATION_PLANNED` |

## Next engineering milestones

1. build `ZWM_ORDER_MONITOR_LAB` for read-only/synthetic work-order monitoring
2. deepen MM purchasing evidence only through bounded, verified scenarios (for example GR/history visibility)
3. harden the S/4 Procurement client with pagination/retry/release-specific schemas
4. create the first RAP source package when an appropriate ABAP Cloud workflow/environment is available
5. add SAP runtime proof only through an authorized environment

---

Public profile: [Francisco Quinteros / JavierQuinan](https://github.com/JavierQuinan)
