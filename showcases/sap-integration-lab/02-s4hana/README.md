# SAP S/4HANA — Engineering Evidence Track

[Versión en español](./README.es.md)

> **Scope:** S/4HANA MM, Migration Cockpit, released APIs, ABAP Cloud and RAP  
> **Current maturity:** research validated; multiple designs ready; runtime not claimed

This track is deliberately separated from ECC. It focuses on current SAP extensibility, integration and migration practices rather than rebranding classic ECC patterns as S/4HANA evidence.

## Published evidence

### 1. Procurement API Lab — S/4HANA MM

[Procurement API Evidence Lab](./mm/procurement-api-lab/README.md)

Status: `RESEARCH_VALIDATED / DESIGN_READY / RUNTIME_NOT_CLAIMED`

Selected released interfaces:

- `I_PurchaseOrderAPI01`
- `API_PURCHASEORDER_2` — Purchase Order OData V4
- `API_PURCHASEREQUISITION_2` — Purchase Requisition OData V4

The lab defines a future TypeScript read-only integration client with typed adapters, pagination, error mapping, correlation IDs, secret separation and deterministic contract tests.

### 2. Migration Cockpit

[Migration Cockpit Evidence Lab](./migration-cockpit/README.md)

Status: `RESEARCH_VALIDATED / RUNTIME_NOT_CLAIMED`

Documents the official migration-project lifecycle:

- migration project/scenario
- migration objects
- staging-table vs. direct-transfer approaches
- mapping tasks
- simulation
- migration
- monitoring
- reconciliation

This is research/study evidence, not a claim of having executed a productive S/4HANA migration.

### 3. ABAP Cloud / Clean Core

[ABAP Cloud / Clean Core Evidence Track](./abap-cloud/README.md)

Status: `RESEARCH_VALIDATED / IMPLEMENTATION_PLANNED`

Documents:

- released-object/API discipline
- release-contract awareness (`C0`, `C1`, `C2` where relevant)
- Clean Core decision boundaries
- ATC/test/runtime gates
- future CDS/API/RAP evidence packs

### 4. RAP

[RAP Evidence Roadmap](./rap/README.md)

Status: `DESIGN_READY / IMPLEMENTATION_PLANNED`

First planned business object: **MM Replenishment Review** — a custom review/workflow BO that bridges the business concept from the ECC stock-risk lab without modifying SAP material/MRP standard persistence.

Target architecture:

`CDS root -> Behavior -> Projection -> Service Definition -> OData V4 Service Binding -> Consumer`.

## Evidence rule

A direct-table ECC report does not qualify as S/4HANA evidence by itself. S/4HANA artifacts favor released interfaces, upgrade-safe extension points and explicit Clean Core reasoning.

## Next implementation sequence

1. source-ready TypeScript Procurement API client with mock/contract tests
2. CDS analytical/read-model evidence on verified released data sources
3. RAP custom business object source
4. ATC/released-object evidence when an appropriate environment is available
5. authorized sandbox runtime only when legitimately accessible

## Runtime gate

No artifact is described as running on S/4HANA until actual activation/API execution evidence is captured. Research, design, source, static validation and runtime are separate maturity states.
