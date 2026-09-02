# SAP S/4HANA — Engineering Evidence Track

[Versión en español](./README.es.md)

> **Scope:** S/4HANA MM integration, Migration Cockpit, released APIs, ABAP Cloud and RAP architecture  
> **Evidence rule:** this page lists only material that already exists in the repository

This track is deliberately separated from ECC. It documents current S/4HANA integration and extensibility concepts without presenting classic ECC table access as Clean Core evidence.

## Evidence available now

### 1. MM Procurement API Client

[Procurement API Lab](./mm/procurement-api-lab/README.md)

A real, dependency-free TypeScript read-only client is versioned in this repository.

Implemented evidence:

- Purchase Order reads
- Purchase Requisition reads
- OData response validation
- transport abstraction
- query construction
- correlation/request-ID handling
- HTTPS enforcement
- deterministic error handling
- automated tests
- GitHub Actions quality gate

Observed CI result: **6 tests / 6 pass / 0 fail** on Node 22.

Released-interface direction documented by the lab:

- `I_PurchaseOrderAPI01`
- `API_PURCHASEORDER_2`
- `API_PURCHASEREQUISITION_2`

The evidence validates the client source and CI behavior; it does not claim connection to a live S/4HANA tenant.

### 2. Migration Cockpit Technical Guide

[Migration Cockpit Guide](./migration-cockpit/README.md)

Documentation-grounded guide covering:

- migration projects and migration objects
- staging-table and direct-transfer approaches
- mapping tasks
- simulation
- migration monitoring
- error handling and reconciliation concepts

This is a technical study/operating guide, not a claim of having executed a productive S/4HANA migration.

### 3. ABAP Cloud / Clean Core Technical Guide

[ABAP Cloud / Clean Core Guide](./abap-cloud/README.md)

Documentation-grounded guide covering:

- released-object/API discipline
- release contracts (`C0`, `C1`, `C2` where applicable)
- Clean Core decision boundaries
- ATC-oriented governance
- separation of internal released objects and remote APIs
- architecture rules for upgrade-safe extensions

### 4. RAP Architecture Guide

[RAP Architecture Guide](./rap/README.md)

The guide documents an MM replenishment-review scenario through:

`CDS root → Behavior Definition → Behavior Implementation → Projection → Service Definition → OData V4 Service Binding → Consumer`

It explains business-object boundaries, behavior ownership, service exposure and Clean Core considerations without claiming RAP runtime that is not present in the repository.

## ECC vs. S/4HANA boundary

ECC evidence may use classic Open SQL and standard tables when appropriate to the ECC scenario. S/4HANA evidence in this track prioritizes released APIs, documented extension points and explicit Clean Core reasoning.

## Evidence integrity

The repository distinguishes three things clearly:

1. **Executable source with observed tests/CI** — the TypeScript Procurement API Client.
2. **Technical guides grounded in SAP documentation** — Migration Cockpit, ABAP Cloud/Clean Core and RAP.
3. **Runtime not claimed** — no live S/4HANA tenant execution is stated without evidence.
