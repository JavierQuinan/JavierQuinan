# SAP Integration Lab — Public Engineering Evidence

[Versión en español](./README.es.md)

> **Languages:** English + Spanish  
> **Scope:** SAP ECC MM, SAP IS-U / Work Management, CRM/SD, ABAP diagnostics and S/4HANA integration  
> **Evidence rule:** every statement below points to material that exists in this repository now

This lab presents sanitized operational knowledge, original technical guides, reviewable ABAP source and an executable integration client. ECC and S/4HANA are intentionally separated so classic SAP experience is not presented as Clean Core runtime experience.

## Evidence available now

### SAP ECC MM

[MM Evidence Track](./01-ecc/mm/README.md)

**Inventory & Stock Risk**

- original ABAP Objects source
- read-only `MARA / MARC / MARD` datasource
- plant vs. storage-location stock semantics
- SALV report source
- 6 deterministic ABAP Unit scenarios reviewed at source level
- reproducible `SE24 / SE38 / SE93` build guide
- sanitized MM01 operational guide with visual evidence

**Service Procurement / `ZMM_CONTRACT_AUDIT`**

- sanitized framework-contract/service-procurement guide
- original read-only `EKKO / EKPO` ABAP source
- contract-validity diagnostics
- SALV report source
- 8 deterministic ABAP Unit scenarios reviewed at source level
- bilingual build and evidence guide

**Purchasing Analytics / `ZMM_PURCH_ANALYTICS`**

- original read-only `EBAN → EKKO / EKPO → EKET` source
- purchase-order category guard (`EKKO-BSTYP = 'F'`)
- `PR_ONLY`, downstream-reference and schedule-line diagnostics
- SALV report source
- 7 deterministic ABAP Unit scenarios reviewed at source level
- bilingual source-review/build documentation

The ECC ABAP packs are presented as **reviewable source + deterministic static validation + reproducible build guides**. No claim of corporate SAP activation or executed ABAP Unit runtime is made.

### SAP ECC IS-U / Work Management

[IS-U / WM Evidence Track](./01-ecc/isu/README.md)

**`ZWM_STATUS_AUDIT_LAB`**

- original read-only ABAP source over `AUFK`, `JSTO`, `JEST`, `TJ02T`, `TJ30T` and `JCDS`
- active vs. historical status interpretation
- user-status profile awareness through `STSMA`
- ECC + synthetic datasource abstraction
- ABAP Objects audit service and SALV report
- 6 deterministic ABAP Unit scenarios reviewed at source level
- bilingual `SE24 / SE38 / SE93` guide

**Operational evidence**

Sanitized guides cover:

- `IW38` work-order analysis and layouts
- work-order lifecycle and technical completion
- `IW32` assignment/release/completion concepts
- background-job monitoring with `SM37`
- controlled batch processing
- `AUFTRAG` work-order number-range governance (`SNRO`) and `RSNUMHOT` consumption monitoring
- batch work-order cancellation via SAP GUI Scripting
- meter dual-status regularization (`IQ09 / EG35 / EG36 / EG50 / EG34`)
- seal-material enablement across MM ↔ WM
- equipment consistency across IS-U ↔ CRM
- photovoltaic service onboarding
- CRM ↔ IS-U contract-end/DCDE recovery
- GIS ↔ SAP CUEN monitoring and reprocessing (`ZMONICUEN / ZGISDMT`)
- occasional metered-service flow CRM → WM → CRM

### ECC Technical Diagnostics

[ABAP Debugging & Technical Diagnostics](./01-ecc/technical-diagnostics/README.md)

Documented troubleshooting sequence:

`SE93 → SE24 / SE37 / SE38 / SE80 → /H / breakpoints / debugger → ST22 / SM21 → SM50 / SM66`

The guides explain object discovery, debugging, dump analysis, process monitoring and escalation boundaries without publishing corporate credentials or proprietary source.

### SAP ECC / CRM-SD

[CRM-SD Evidence Track](./01-ecc/sd/README.md)

Published evidence covers a sanitized non-energy service billing workflow: customer/business-partner preparation, commercial context, sales-area extension, billing/output review and configured fiscal-output completion.

### SAP S/4HANA

[S/4HANA Evidence Track](./02-s4hana/README.md)

**MM Procurement API Client**

- dependency-free TypeScript read-only client
- Purchase Order and Purchase Requisition reads
- OData response validation
- transport abstraction
- correlation/request-ID handling
- HTTPS enforcement
- deterministic automated tests
- GitHub Actions quality gate observed at **6 tests / 6 pass / 0 fail** on Node 22

The client demonstrates integration-side engineering. It does not claim connectivity to a live S/4HANA tenant.

**Migration Cockpit Technical Guide**

Documentation-grounded guide covering migration objects, staging/direct-transfer approaches, mapping, simulation, migration monitoring and reconciliation concepts.

**ABAP Cloud / Clean Core Technical Guide**

Documentation-grounded guide covering released objects/APIs, release contracts, ATC-oriented governance and Clean Core boundaries.

**RAP Architecture Guide**

Architecture guide covering CDS data model, behavior definition/implementation, projection, service definition/binding and OData V4 exposure using an MM replenishment-review scenario.

### SAP Integration

[Integration Engineering Guide](./03-integration/README.md)

Documents OData/REST/SOAP integration boundaries, idempotency, error mapping, correlation IDs, observability and secret separation. The S/4 Procurement API Client is the executable integration example in this repository.

## Visual evidence

[Visual Evidence Index](./visual-evidence/README.md)

Visual evidence is used when the source image can be published legitimately and sanitized without losing its technical value. Current visual evidence includes 59 sanitized screenshots across 8 operational guides: MM01 material extension, `AUFTRAG`/`SNRO` number-range expansion, `RSNUMHOT` range monitoring, batch work-order cancellation via SAP GUI Scripting, meter dual-status regularization, CRM ↔ IS-U DCDE recovery, GIS ↔ SAP CUEN monitoring/reprocessing and `ZCONS_SELLOS`/`MMPV` seal consumption.

Screenshots from employer-authored manuals or third-party training material are **not republished**. Their technical content is converted into original explanatory guides instead.

## Official SAP references

[SAP Official Reference Index](./OFFICIAL_SAP_REFERENCES.md)

The index links the portfolio guides to authoritative SAP Help documentation for material-master extension/MM01, Class Builder/SE24, report transactions/SE93, ABAP Unit, work-order status data, S/4HANA procurement APIs, Migration Cockpit, ABAP Cloud released APIs and RAP. Official references validate standard concepts; they do not replace the evidence boundaries stated in each artifact.

## Evidence matrix

| Area | Evidence available |
|---|---|
| ECC MM Inventory | ABAP source · SALV · 6 source-reviewed scenarios · build guide · sanitized MM01 visuals |
| ECC MM Services | functional guide · `ZMM_CONTRACT_AUDIT` source · SALV · 8 source-reviewed scenarios |
| ECC MM Purchasing | `ZMM_PURCH_ANALYTICS` source · SALV · 7 source-reviewed scenarios |
| ECC IS-U / WM | operational guides · `ZWM_STATUS_AUDIT_LAB` source · SALV · 6 source-reviewed scenarios · 50 sanitized visuals (number-range, batch OT, device status, DCDE, CUEN, seals) |
| ECC Diagnostics | SE24/SE37/SE38/SE80/SE93 · debugger · ST22 · SM21 · SM50/SM66 guides |
| ECC CRM/SD | sanitized non-energy billing workflow |
| S/4HANA MM | TypeScript Procurement API client · **6/6 CI tests** |
| S/4HANA Migration | technical study/operating guide |
| ABAP Cloud / Clean Core | technical architecture/governance guide |
| RAP | technical architecture guide |
| Integration | OData/REST/SOAP resilience and observability guide + executable TypeScript client |

## Bilingual standard

Substantial artifacts use `README.md` for English-first international documentation and `README.es.md` for the complete Spanish version. Code identifiers remain in English.

## Confidentiality and integrity

Public evidence excludes customer/company identities, real materials/vendors/contracts/installations/work orders/BP IDs/meters, proprietary Z source, internal endpoints, credentials, transport IDs, private certificates and unsanitized enterprise screenshots.

---

Public profile: [Francisco Quinteros / JavierQuinan](https://github.com/JavierQuinan)
