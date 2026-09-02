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
| `RUNTIME_VALIDATION_PENDING` | Source is ready to activate/run, but no SAP runtime proof has been recorded. |
| `RUNTIME_VALIDATED` | Activated/executed in an appropriate SAP environment with documented result. |
| `TEST_VALIDATED` | Runtime validation plus reproducible automated/unit-test evidence. |

`SOURCE_READY` does **not** mean `RUNTIME_VALIDATED`.

See [SAP Evidence Governance](./EVIDENCE_GOVERNANCE.md).

## Repository structure

```text
sap-integration-lab/
├── README.md
├── README.es.md
├── EVIDENCE_GOVERNANCE.md
├── 01-ecc/
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
- ABAP Unit

Classic direct-table evidence, when used, will be clearly labelled **ECC/classic** and will not be reused as proof of modern S/4HANA Clean Core design.

The first package is **ECC MM — Inventory & Reorder**. The current source is classified `SOURCE_READY / RUNTIME_VALIDATION_PENDING` until it is activated and tested in an SAP environment.

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
- `EVIDENCE.md` — runtime/test record

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

## Current evidence matrix

| Track | Functional evidence | Public source | Runtime proof | Status |
|---|---|---|---|---|
| ECC MM | Profile-level professional experience | First inventory/reorder source in branch | Pending | `SOURCE_READY / RUNTIME_VALIDATION_PENDING` |
| ECC IS-U / WM | Professional operational experience | Planned; guides will be incorporated | Pending | `PLANNED` |
| S/4HANA MM | Study/specialization track | Planned | Pending | `PLANNED` |
| ABAP Cloud / RAP | Study/specialization track | Planned | Pending | `PLANNED` |
| SAP Integration | Enterprise integration experience + software engineering | Planned | Pending | `PLANNED` |

## Next milestone

**SAP ECC MM — Inventory & Reorder Evidence Pack**

The target package will contain:

- domain model
- datasource abstraction
- synthetic/demo datasource
- ECC datasource implementation when runtime validation is available
- executable report
- ABAP Objects service layer
- ABAP Unit
- bilingual documentation
- `EVIDENCE.md` with activation/runtime/test record

Until runtime evidence exists, the artifact remains explicitly `RUNTIME_VALIDATION_PENDING`.

---

Public portfolio: [Francisco Quinteros / JavierQuinan](https://github.com/JavierQuinan)  
Portfolio policy: [Public Repository Portfolio Governance](../../docs/PORTFOLIO_GOVERNANCE.md)
