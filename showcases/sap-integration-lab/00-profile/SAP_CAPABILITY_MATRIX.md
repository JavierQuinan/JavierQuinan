# SAP Capability Matrix

[Versión en español](./SAP_CAPABILITY_MATRIX.es.md)

This matrix makes the distinction between enterprise experience, public engineering evidence and completed training explicit.

| Domain | Capability | Evidence class | Current public evidence |
|---|---|---|---|
| SAP ECC MM | Inventory / stock-risk analysis | Public source + enterprise-sanitized | `MARA/MARC/MARD` read-only ABAP pack, SALV source, deterministic source-reviewed scenarios, MM01 sanitized guide |
| SAP ECC MM | Service procurement / framework-contract diagnostics | Public source + enterprise-sanitized | `EKKO/EKPO` read-only audit source, SALV, validity diagnostics, bilingual build guide |
| SAP ECC MM | Purchasing analytics | Public source | `EBAN → EKKO/EKPO → EKET` source, PO-category guard, schedule-line/downstream diagnostics |
| SAP IS-U / WM | Work-order analysis and lifecycle | Enterprise-sanitized + public source | `IW38/IW32` operational guides plus `ZWM_STATUS_AUDIT_LAB` source over status/history tables |
| SAP IS-U / WM | Device / meter operational troubleshooting | Enterprise-sanitized | Sanitized guides for device-status regularization and related WM/IS-U flows |
| SAP IS-U / CRM | Contract-end / DCDE recovery and integration troubleshooting | Enterprise-sanitized | Sanitized CRM ↔ IS-U recovery guides and integration evidence |
| SAP technical diagnostics | Object discovery, debugging, dumps and process analysis | Enterprise-sanitized | `SE93`, `SE24/37/38/80`, debugger, `ST22`, `SM21`, `SM50/66` troubleshooting sequence |
| SAP CRM/SD | Non-energy service billing workflow | Enterprise-sanitized | Sanitized customer/BP, sales-area, billing/output workflow documentation |
| S/4HANA MM | Procurement API integration | Executable public engineering evidence | Dependency-free TypeScript PO/PR client, OData validation, HTTPS guard, request correlation, 6/6 CI tests |
| S/4HANA | Migration concepts | Documentation-grounded public guide | Migration objects, staging/direct transfer, mapping, simulation, monitoring and reconciliation |
| ABAP Cloud / Clean Core | Released API/object governance | Documentation-grounded + completed training | Public Clean Core guide plus completed ABAP Cloud training |
| RAP | Architecture | Documentation-grounded public guide | CDS → behavior → projection → service definition/binding → OData V4 architecture guide |
| ABAP | Objects, SALV, modular source structure | Public engineering evidence | Multiple reviewable ABAP packs across MM and IS-U/WM |
| ABAP | ABAP Unit design patterns | Public source evidence | Deterministic test scenarios included/reviewed at source level; no claim of corporate runtime execution |
| ABAP | abapGit, ATC, ABAP Cleaner, authorizations | Completed training | Third-party course-completion credential; lab evidence is published only when independently supplied and sanitized |
| Integration | OData / REST / SOAP resilience | Public engineering evidence | Integration guide covering idempotency, error mapping, correlation IDs, observability and secret separation |

## Evidence classes

- **Enterprise-sanitized** — operational knowledge derived from real enterprise work, rewritten to remove employer/customer-confidential information.
- **Public source** — reviewable source code exists in this repository.
- **Executable public engineering evidence** — code plus automated tests/CI evidence exists in this repository.
- **Documentation-grounded** — architecture/technical guide is grounded in official product documentation and clearly separated from runtime claims.
- **Completed training** — a course/diploma credential was supplied; training alone is not treated as production evidence.

## Recruiter summary

**Functional / process strength:** SAP ECC MM · SAP IS-U / Work Management · CRM/SD  
**Technical strength:** ABAP Objects · SALV · debugging · status/data analysis · integration engineering  
**Modern SAP learning/evidence:** ABAP Cloud · Clean Core · RAP · S/4HANA APIs · ATC · abapGit
