# SAP Integration Lab — Public Engineering Evidence

[Versión en español](./README.es.md)

> **Artifact type:** public SAP engineering and functional-evidence lab  
> **Current status:** in construction  
> **Primary rule:** source code is never presented as executed in SAP until activation/runtime evidence exists  
> **Languages:** English + Spanish

This lab converts SAP functional experience plus ABAP/ABAP Cloud specialization into reviewable, reproducible and non-confidential public evidence.

The portfolio intentionally separates four technical contexts that must not be conflated:

1. **SAP ECC — Materials Management (MM)**
2. **SAP ECC — IS-U / Work Management**
3. **SAP S/4HANA — MM, CDS, released APIs, ABAP Cloud and RAP**
4. **SAP Integration — OData, REST, SOAP/XML and observability patterns**

## Evidence maturity model

| State | Meaning |
|---|---|
| `PLANNED` | Scenario designed; implementation not yet complete. |
| `SOURCE_READY` | Reviewable source/documentation is available in GitHub. |
| `STATIC_VALIDATED` | Source logic and deterministic test vectors have been reviewed consistently; no SAP runtime claim is implied. |
| `EXECUTION_PROCEDURE_READY` | Reproducible SAP object-creation, activation, test and execution steps are documented. |
| `RUNTIME_DEFERRED` | Runtime execution is deferred because an authorized development/sandbox environment or required CTS permissions are not available for the portfolio exercise. |
| `RUNTIME_VALIDATED` | Activated/executed in an appropriate SAP environment with documented result. |
| `TEST_VALIDATED` | Runtime validation plus reproducible automated/unit-test evidence. |

`STATIC_VALIDATED` does **not** mean `RUNTIME_VALIDATED`.

See [SAP Evidence Governance](./EVIDENCE_GOVERNANCE.md).

## Repository structure

```text
sap-integration-lab/
├── README.md
├── README.es.md
├── EVIDENCE_GOVERNANCE.md
├── 01-ecc/
│   ├── technical-diagnostics/
│   ├── mm/
│   │   ├── inventory-reorder/
│   │   ├── purchasing/
│   │   └── service-procurement/
│   └── isu/
│       ├── master-data/
│       ├── device-management/
│       ├── work-management/
│       └── crm-isu-integration/
├── 02-s4hana/
│   ├── mm/
│   ├── cds/
│   ├── released-apis/
│   ├── abap-cloud/
│   └── rap/
└── 03-integration/
    ├── odata/
    ├── rest/
    ├── soap-xml/
    └── observability/
```

## 01 — SAP ECC

### ECC Technical Diagnostics

[ABAP Debugging & Technical Diagnostics](./01-ecc/technical-diagnostics/README.md) documents a sanitized troubleshooting workflow across:

- `SE93` — transaction-to-object identification
- `SE24` — ABAP classes
- `SE37` — function modules
- `SE38` — programs/reports
- `SE80` — integrated repository navigation
- `/H` and breakpoints
- ABAP Debugger inspection
- `ST22` — short dumps
- `SM21` — system log context
- `SM50` vs. `SM66` — local vs. global work-process analysis

This track proves technical method and troubleshooting knowledge without claiming privileged Basis access or production debugging.

### ECC Materials Management (MM)

This track demonstrates classic MM domain knowledge and ABAP engineering without exposing employer/customer implementation.

Target evidence:

- material / plant / storage-location concepts
- inventory and reorder analysis
- purchase requisitions
- purchase orders
- delivery/schedule concepts
- service procurement
- classic Open SQL where appropriate
- SALV/ALV reporting
- ABAP Objects
- ABAP Unit source and test design

Classic direct-table evidence, when used, is clearly labelled **ECC/classic** and is not reused as proof of modern S/4HANA Clean Core design.

The first package, **ECC MM — Inventory & Stock Risk**, is now classified `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`:

- source and hardening review complete
- six deterministic vectors traced successfully against the current implementation
- reproducible `SE24` / `SE38` / `SE93` build and runtime procedure documented
- SAP activation/ABAP Unit execution not claimed until an authorized development environment is available

### ECC IS-U / Work Management

IS-U remains an independent evidence line rather than being grouped under S/4HANA.

Planned functional/technical areas:

- installation and contract lifecycle concepts
- device management
- work-order lifecycle
- workflow/status/event handling
- CRM ↔ IS-U interaction
- Work Management ↔ external systems / GIS
- operational troubleshooting

User-authored professional MM/WM guides will be incorporated here when each topic is reached, after confidentiality sanitization.

## 02 — SAP S/4HANA

S/4HANA evidence will focus on current extensibility and integration approaches instead of mechanically reproducing ECC patterns.

Target evidence:

- CDS View Entities
- released APIs
- OData
- ABAP Cloud
- Clean Core-oriented design
- RAP business objects
- behavior definitions and implementations
- service definitions/bindings
- automated tests
- migration-cockpit knowledge separated from classic ECC development evidence

The S/4HANA track has its own evidence gate. A classic ECC report does not qualify as an S/4HANA artifact by itself.

## 03 — SAP Integration

This line connects SAP with the broader full-stack engineering portfolio.

Planned patterns:

- REST/OData consumption
- SOAP/XML processing
- message transformations
- idempotent integration handling
- correlation IDs
- retry and error mapping
- audit/observability
- safe configuration and secret separation

## Bilingual standard

Portfolio-facing technical documentation is **English-first** for international review, with a complete Spanish version for substantial artifacts.

Preferred convention:

- `README.md` — English
- `README.es.md` — Español
- `EVIDENCE.md` — evidence record

Code identifiers remain in English. Functional terminology may be shown bilingually where useful:

- Purchase Requisition / Solicitud de pedido
- Purchase Order / Pedido de compra
- Work Order / Orden de trabajo
- Utility Installation / Instalación IS-U

## Confidentiality boundary

Never publish:

- employer/customer source code
- real company/customer identities
- real contracts, installations, devices/meters or work orders
- internal users, endpoints, hostnames or RFC destinations
- production screenshots without sanitization
- passwords, tokens or credentials
- private P12/PFX/PEM material
- third-party training screenshots or copyrighted pages as portfolio assets without publication rights

## Current evidence matrix

| Track | Functional evidence | Public source / guide | Runtime proof | Status |
|---|---|---|---|---|
| ECC Technical Diagnostics | Troubleshooting methodology | Debugging/diagnostics guide | Not required for methodology claim | `PROCEDURE_READY` |
| ECC MM | Profile-level professional experience + technical source | Inventory/stock-risk pack | Deferred until authorized DEV/sandbox | `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY` |
| ECC IS-U / WM | Professional operational experience | Planned; sanitized guides being incorporated | Pending | `PLANNED` |
| S/4HANA MM | Study/specialization track | Planned | Pending | `PLANNED` |
| ABAP Cloud / RAP | Study/specialization track | Planned | Pending | `PLANNED` |
| SAP Integration | Enterprise integration experience + software engineering | Planned | Pending | `PLANNED` |

## Next milestones

1. expand ECC MM with purchasing and service-procurement evidence
2. incorporate sanitized IS-U / Work Management operational guides
3. build the S/4HANA evidence line separately, including migration-cockpit process knowledge
4. add real ABAP runtime evidence later when an authorized sandbox/DEV environment becomes available

---

Public portfolio: [Francisco Quinteros / JavierQuinan](https://github.com/JavierQuinan)  
Portfolio policy: [Public Repository Portfolio Governance](../../docs/PORTFOLIO_GOVERNANCE.md)
