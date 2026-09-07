# SAP Capability Matrix

[Versión en español](./SAP_CAPABILITY_MATRIX.es.md)

This matrix contains only capabilities supported by current public evidence, documented historical execution, completed training or real enterprise experience.

| Domain | Capability | Evidence class | Current public evidence / boundary |
|---|---|---|---|
| SAP ECC MM | Inventory / stock-risk analysis | `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Read-only `MARA/MARC/MARD` ABAP pack, SALV, source-reviewed scenarios, sanitized MM01 guide |
| SAP ECC MM | Service procurement / framework-contract diagnostics | `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Read-only `EKKO/EKPO` audit source, SALV, validity diagnostics, bilingual build guide |
| SAP ECC MM | Purchasing analytics | `PUBLIC_SOURCE_EVIDENCE` | `EBAN → EKKO/EKPO → EKET` source, PO-category guard and downstream/schedule diagnostics |
| SAP IS-U / WM | Work-order analysis and lifecycle | `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Sanitized `IW38/IW32` knowledge plus `ZWM_STATUS_AUDIT_LAB` source |
| SAP IS-U / WM | Device / meter troubleshooting | `ENTERPRISE_VERIFIED` | Sanitized operational guides for device-status and related WM/IS-U flows |
| SAP IS-U / CRM | Contract-end / DCDE recovery | `ENTERPRISE_VERIFIED` | Sanitized CRM ↔ IS-U recovery evidence; no generic integration-platform claim |
| SAP technical diagnostics | Object discovery, debugging, dumps and process analysis | `ENTERPRISE_VERIFIED` | `SE93`, `SE24/37/38/80`, debugger, `ST22`, `SM21`, `SM50/66` sequence |
| SAP CRM/SD | Non-energy service billing workflow | `ENTERPRISE_VERIFIED` | Sanitized customer/BP, sales-area and billing/output workflow |
| ABAP Cloud historical labs | Core / Objects / classrun / internal tables / field symbols / Open SQL / exceptions | `HISTORICAL_EXECUTION_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Curso 1: 16 units accounted for, 10 personal hands-on labs, 10 public source files and 20 owned sanitized ADT screenshots |
| ABAP tooling | abapGit / ATC / ABAP Cleaner / authorizations | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` + `PUBLIC_NORMALIZED_SOURCE` | Four Course 3 practices with `_fq` normalized source and precise training provenance |
| ABAP Cloud Dictionary / DDIC | Domains, data elements, tables, lock objects, persistence, relations, Dynamic Cache | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` + `TRAINING_ONLY` | Course 2 hands-on training completed; no saved source artifact is represented |
| S/4HANA MM | Procurement API client | `EXECUTABLE_NON_LIVE_EXAMPLE` | TypeScript PO/PR client, OData validation, HTTPS guard, request correlation and 6/6 observed CI tests; no live S/4 tenant claim |
| S/4HANA | Migration concepts | `DOCUMENTATION_GROUNDED` | Migration objects, staging/direct transfer, mapping, simulation, monitoring and reconciliation |
| ABAP Cloud / Clean Core | Released API/object governance | `DOCUMENTATION_GROUNDED` + completed training | Clean Core guide plus completed ABAP Cloud training; no runtime compliance claim from the historical labs |
| RAP | Architecture | `DOCUMENTATION_GROUNDED` | CDS → behavior → projection → service definition/binding → OData V4 architecture guide; no RAP runtime claim |
| ABAP | ABAP Unit design patterns in other public packs | `PUBLIC_SOURCE_EVIDENCE` | Deterministic test scenarios reviewed at source level; no current runtime execution claim |
| Integration architecture | OData / REST / SOAP resilience patterns | `DOCUMENTATION_GROUNDED` + `EXECUTABLE_NON_LIVE_EXAMPLE` | Architecture guide + non-live S/4 client; not evidence of productive SAP integration implementation |

## Claim boundary

This matrix does not claim SAP Integration Suite/CPI runtime, live S/4HANA API connectivity, productive OData/SOAP, IDoc/RFC/BAPI runtime, Event Mesh or RAP/service-binding runtime. Those capabilities are simply outside the evidence represented here.

## Recruiter summary

**Functional / process strength:** SAP ECC MM · SAP IS-U / Work Management · CRM/SD  
**Technical strength:** ABAP Objects · SALV · debugging · status/data analysis · 10 historical ABAP Cloud hands-on labs · 4 Course 3 tooling practices  
**Modern SAP evidence boundary:** ABAP Cloud historical hands-on evidence · completed DDIC/tooling training · Clean Core/RAP documentation-grounded study · S/4HANA client-side non-live example
