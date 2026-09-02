# SAP S/4HANA MM — Procurement API Evidence Lab

[Versión en español](./README.es.md)

> **Evidence type:** Clean Core integration evidence based on released SAP interfaces  
> **Status:** `SOURCE_READY / LOCAL_TEST_VALIDATED / CI_PENDING / S4_RUNTIME_NOT_CLAIMED`  
> **Scope:** Purchase Requisitions + Purchase Orders

This lab demonstrates how classic ECC purchasing evidence evolves into a modern S/4HANA integration design without treating direct table access as a Clean Core integration pattern.

## Architectural contrast

```text
Classic ECC evidence                 S/4HANA Clean Core evidence
--------------------                 ---------------------------
ABAP report/service                  External/application extension
        │                                      │
        ▼                                      ▼
EKKO / EKPO                           Released OData / CDS API
classic Open SQL                              │
                                      ┌───────┴────────┐
                                      ▼                ▼
                               Purchase Requisition  Purchase Order
```

## Released-interface direction

Purchase Orders:

- CDS interface: `I_PurchaseOrderAPI01`
- OData V4 API family: `API_PURCHASEORDER_2`

Purchase Requisitions:

- OData V4 API family: `API_PURCHASEREQUISITION_2`

Exact service paths, fields, authentication and availability must always be verified against the target S/4HANA release before connecting to a real tenant.

## Source implementation

A dependency-free TypeScript client is versioned under [`client/`](./client/README.md).

Implemented source evidence:

- read-only Purchase Order queries
- read-only Purchase Requisition queries
- injectable HTTP transport
- OData `value` response validation
- `$top`, `$skip` and `$filter` query construction
- stable SAP API error mapping
- correlation/request ID capture
- HTTPS enforcement outside localhost
- timeout-aware Fetch transport
- deterministic synthetic contract tests
- GitHub Actions quality gate

Architecture:

```text
External configuration
        │
        ▼
ProcurementApiClient
        │
        ├── Purchase Orders
        └── Purchase Requisitions
        │
        ▼
HttpTransport abstraction
        ├── FetchTransport
        └── synthetic test transport
        │
        ▼
Normalized ProcurementDocument[]
```

## Test evidence

Six deterministic tests are versioned and were executed locally with Node 22:

1. Purchase Order OData normalization
2. Purchase Requisition OData normalization
3. empty OData page
4. HTTP 401 mapped with correlation ID
5. malformed/non-OData response rejected
6. insecure non-local HTTP endpoint rejected

Local result recorded during development:

```text
Executed: 6
Passed:   6
Failed:   0
```

GitHub Actions verification is tracked separately. The lab must not claim CI validation until the workflow run is observed successfully.

## Security boundary

No real SAP URL, user, password, OAuth client secret, bearer token, cookie, certificate/private key or production payload is stored in this lab.

The current source remains intentionally read-only. Real authentication should be supplied through an external credential/token provider rather than committed application configuration.

## What this proves now

- understanding of the ECC-to-S/4HANA integration boundary
- released-API / Clean Core-oriented design
- TypeScript integration-client engineering
- transport abstraction and deterministic contract testing
- error/correlation-ID handling
- secure-by-default endpoint validation
- bilingual technical documentation

## What is not claimed

- connection to a real S/4HANA tenant
- metadata verification against a specific release
- OAuth/token acquisition
- real SAP authorization success
- end-to-end S/4HANA runtime
- write/create/change operations

## Next milestones

### P2 — CI validation

GitHub Actions executes the deterministic client tests using Node 22. Once observed green, the evidence can add `CI_VALIDATED`.

### P3 — Integration hardening

- pagination traversal
- transient-error retry policy for safe reads
- release-specific response schemas
- metadata/capability checks
- external auth-provider abstraction

### P4 — Authorized sandbox integration

Only when a legitimate S/4HANA sandbox/tenant is available:

- connectivity
- API metadata verification
- sanitized read-only request
- documented runtime result

Until P4, no S/4 runtime claim is made.

## Evidence maturity

`RESEARCH_VALIDATED -> DESIGN_READY -> SOURCE_READY -> LOCAL_TEST_VALIDATED -> CI_VALIDATED -> RUNTIME_VALIDATED`

Current position: **`SOURCE_READY / LOCAL_TEST_VALIDATED / CI_PENDING`**.
