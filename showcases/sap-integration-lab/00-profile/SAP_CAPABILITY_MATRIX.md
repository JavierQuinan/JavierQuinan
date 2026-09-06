# SAP Capability Matrix

[Versión en español](./SAP_CAPABILITY_MATRIX.es.md)

This matrix distinguishes real enterprise experience, historical hands-on labs, public source, executable non-live examples, documentation-grounded study and training.

| Domain | Capability | Evidence class | Current public evidence / boundary |
|---|---|---|---|
| SAP ECC MM | Inventory / stock-risk analysis | `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Read-only `MARA/MARC/MARD` ABAP pack, SALV, source-reviewed scenarios, sanitized MM01 guide |
| SAP ECC MM | Service procurement / framework-contract diagnostics | `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Read-only `EKKO/EKPO` audit source, SALV, validity diagnostics, bilingual build guide |
| SAP ECC MM | Purchasing analytics | `PUBLIC_SOURCE_EVIDENCE` | `EBAN → EKKO/EKPO → EKET` source, PO-category guard and downstream/schedule diagnostics |
| SAP IS-U / WM | Work-order analysis and lifecycle | `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Sanitized `IW38/IW32` knowledge plus `ZWM_STATUS_AUDIT_LAB` source |
| SAP IS-U / WM | Device / meter troubleshooting | `ENTERPRISE_VERIFIED` | Sanitized operational guides for device-status and related WM/IS-U flows |
| SAP IS-U / CRM | Contract-end / DCDE recovery | `ENTERPRISE_VERIFIED` | Sanitized CRM ↔ IS-U recovery evidence; this does not imply a generic integration-platform claim |
| SAP technical diagnostics | Object discovery, debugging, dumps and process analysis | `ENTERPRISE_VERIFIED` | `SE93`, `SE24/37/38/80`, debugger, `ST22`, `SM21`, `SM50/66` sequence |
| SAP CRM/SD | Non-energy service billing workflow | `ENTERPRISE_VERIFIED` | Sanitized customer/BP, sales-area and billing/output workflow |
| ABAP Cloud historical labs | Core / Objects / classrun / internal tables / field symbols / Open SQL / exceptions | `HANDS_ON_HISTORICAL` + `PUBLIC_SOURCE_EVIDENCE` | 10 personal source files with historical execution evidence; **0/10 current runtime reverified** |
| S/4HANA MM | Procurement API client | `EXECUTABLE_NON_LIVE_EXAMPLE` | TypeScript PO/PR client, OData validation, HTTPS guard, request correlation and 6/6 observed CI tests; **no live S/4 tenant claim** |
| S/4HANA | Migration concepts | `DOCUMENTATION_GROUNDED` | Migration objects, staging/direct transfer, mapping, simulation, monitoring and reconciliation |
| ABAP Cloud / Clean Core | Released API/object governance | `DOCUMENTATION_GROUNDED` + `TRAINING_ONLY` context | Clean Core guide plus completed training; no Clean Core runtime claim from the historical labs |
| RAP | Architecture | `DOCUMENTATION_GROUNDED` | CDS → behavior → projection → service definition/binding → OData V4 architecture guide; **no RAP runtime claim** |
| ABAP | ABAP Unit design patterns in other public packs | `PUBLIC_SOURCE_EVIDENCE` | Deterministic test scenarios reviewed at source level; no corporate/current runtime execution claim |
| ABAP tooling | abapGit / ATC / ABAP Cleaner / authorizations | `TRAINING_ONLY` in the historical track | Training-derived guides; independent hands-on tooling evidence remains future work |
| Integration architecture | OData / REST / SOAP resilience patterns | `DOCUMENTATION_GROUNDED` + `EXECUTABLE_NON_LIVE_EXAMPLE` | Architecture guide + non-live S/4 client; **not evidence of a productive SAP integration implementation** |
| SAP Integration Suite / CPI | Runtime implementation | `NOT_YET_EVIDENCED` | No current hands-on/runtime evidence published |
| Productive SAP APIs / interfaces | Live OData/SOAP/IDoc/RFC/BAPI runtime | `NOT_YET_EVIDENCED` | No current live integration claim published |

## Recruiter summary

**Functional / process strength:** SAP ECC MM · SAP IS-U / Work Management · CRM/SD  
**Technical strength:** ABAP Objects · SALV · debugging · status/data analysis · historical ABAP Cloud labs  
**Modern SAP evidence boundary:** ABAP Cloud hands-on historical evidence · Clean Core/RAP documentation-grounded study · S/4HANA client-side non-live example
