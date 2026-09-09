# SAP S/4HANA — Training & Engineering Evidence Track

[Versión en español](./README.es.md)

> **Scope:** completed multi-module S/4HANA functional training, an explicitly non-live MM Procurement API client, Migration Cockpit concepts, released APIs, ABAP Cloud/Clean Core and RAP architecture  
> **Evidence rule:** training credentials, executable non-live examples and documentation-grounded study are separate evidence classes; none is presented as productive S/4HANA implementation/runtime experience

This track is deliberately separated from ECC. It records the actual S/4HANA training completed by the account owner and the modern-SAP engineering material that exists in the repository, without presenting classic ECC table access as Clean Core evidence or client-side examples as live SAP integration.

## Evidence available now

### 1. Multi-module S/4HANA functional training — `TRAINING_CREDENTIAL`

[Training & Credentials](../00-profile/TRAINING_AND_CREDENTIALS.md)

Completed **Especialización Internacional en SAP S/4 HANA desde cero — 240 academic hours**.

Academic record:

- SAP S/4 HANA MM — **20/20**
- SAP S/4 HANA PP — **16/20**
- SAP S/4 HANA SD — **18/20**
- SAP S/4 HANA FI — **18/20**
- SAP S/4 HANA PM — **18/20**
- **Final average — 18/20**

This credential demonstrates completed functional training across those modules. It is not represented as SAP-vendor certification or productive S/4HANA implementation, conversion or operations experience.

### 2. MM Procurement API Client — `EXECUTABLE_NON_LIVE_EXAMPLE`

[Procurement API Lab](./mm/procurement-api-lab/README.md)

A dependency-free TypeScript read-only client is versioned in this repository.

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

The evidence validates the client source and CI behavior; it does not claim connection to a live S/4HANA tenant or productive SAP OData implementation.

### 3. Migration Cockpit Technical Guide — `DOCUMENTATION_GROUNDED`

[Migration Cockpit Guide](./migration-cockpit/README.md)

Documentation-grounded guide covering:

- migration projects and migration objects
- staging-table and direct-transfer approaches
- mapping tasks
- simulation
- migration monitoring
- error handling and reconciliation concepts

This is a technical study/operating guide, not a claim of having executed a productive S/4HANA migration.

### 4. ABAP Cloud / Clean Core Technical Guide — `DOCUMENTATION_GROUNDED` + completed ABAP Cloud training context

[ABAP Cloud / Clean Core Guide](./abap-cloud/README.md)

Documentation-grounded guide covering:

- released-object/API discipline
- release contracts (`C0`, `C1`, `C2` where applicable)
- Clean Core decision boundaries
- ATC-oriented governance
- separation of internal released objects and remote APIs
- architecture rules for upgrade-safe extensions

The separate ABAP Cloud training track documents 200 hours of completed training/hands-on context. This guide does not add a runtime Clean Core or productive S/4 extension claim.

### 5. RAP Architecture Guide — `DOCUMENTATION_GROUNDED`

[RAP Architecture Guide](./rap/README.md)

The guide documents an MM replenishment-review scenario through:

`CDS root → Behavior Definition → Behavior Implementation → Projection → Service Definition → OData V4 Service Binding → Consumer`

It explains business-object boundaries, behavior ownership, service exposure and Clean Core considerations without claiming RAP runtime that is not present in the repository.

## ECC vs. S/4HANA boundary

ECC evidence may use classic Open SQL and standard tables when appropriate to the ECC scenario. S/4HANA material in this track prioritizes released APIs, documented extension points and explicit Clean Core reasoning, while the 240-hour specialization remains clearly classified as training.

## Evidence integrity

The repository distinguishes four things clearly:

1. **Completed S/4HANA training credential** — 240 hours across MM, PP, SD, FI and PM, final average 18/20.
2. **Executable source with observed tests/CI** — the TypeScript Procurement API Client, explicitly non-live.
3. **Technical guides grounded in SAP documentation** — Migration Cockpit, ABAP Cloud/Clean Core and RAP.
4. **Runtime not claimed** — no productive S/4HANA implementation, live tenant connectivity, productive OData/SOAP or RAP/service-binding runtime is stated without evidence.
