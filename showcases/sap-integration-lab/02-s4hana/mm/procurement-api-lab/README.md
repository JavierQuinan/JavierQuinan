# SAP S/4HANA MM — Procurement API Evidence Lab

[Versión en español](./README.es.md)

> **Evidence type:** Clean Core integration design based on released SAP interfaces  
> **Status:** `RESEARCH_VALIDATED / DESIGN_READY / RUNTIME_NOT_CLAIMED`  
> **Scope:** Purchase Requisitions + Purchase Orders

This lab documents how the MM purchasing evidence evolves from classic ECC read-only table access to a modern S/4HANA integration approach based on released CDS/API surfaces.

## Architectural contrast

```text
Classic ECC evidence
--------------------
ABAP report/service
      │
      ▼
EKKO / EKPO
classic Open SQL

          ≠

S/4HANA Clean Core evidence
---------------------------
External/app extension
      │
      ▼
Released OData / CDS API
      │
      ├── Purchase Requisition API
      └── Purchase Order API
```

The ECC pattern remains valid evidence for its own track. It is not reused as proof of Clean Core design.

## Official interfaces selected

### Purchase Orders

- CDS interface: `I_PurchaseOrderAPI01`
- OData V4 API: `API_PURCHASEORDER_2`

### Purchase Requisitions

- OData V4 API: `API_PURCHASEREQUISITION_2`

Exact availability, fields and operations must always be checked against the target S/4HANA release/API documentation before implementation.

## Target portfolio scenario

**Procurement Visibility Client**

A small external TypeScript application will eventually demonstrate:

```text
Configuration / secret provider
            │
            ▼
SAP Procurement API Client
            │
     ┌──────┴──────┐
     ▼             ▼
Purchase Req.    Purchase Orders
     │             │
     └──────┬──────┘
            ▼
Normalized domain model
            │
            ▼
Validation / status mapping
            │
            ▼
CLI or REST facade
            │
            ▼
Contract tests + mock SAP adapter
```

## First implementation boundary

Phase 1 will be **read-only**.

Planned capabilities:

- retrieve purchasing-document data from a configured released API
- normalize SAP response structures into a small local domain model
- filter/summarize PR/PO status and business references
- expose correlation IDs for diagnostics
- handle pagination where required
- map HTTP/API errors into stable application errors
- keep credentials outside Git
- run deterministic tests against mock responses

No create/change operation will be enabled until the read-only client and security model are validated.

## Security model

Never commit:

- S/4 tenant URLs when confidential
- usernames/passwords
- OAuth client secrets
- certificates/private keys
- bearer tokens
- cookies
- production payloads

Configuration contract:

```text
SAP_BASE_URL=<external configuration>
SAP_AUTH_MODE=<configured outside source>
SAP_CLIENT_ID=<secret provider>
SAP_CLIENT_SECRET=<secret provider>
```

These are documentation placeholders only.

## Integration controls

The future client must implement:

- timeout
- retry only for safe/transient conditions
- no blind retry of non-idempotent writes
- correlation/request ID logging
- sanitized error logging
- pagination guard
- response schema validation
- API-version/release documentation

## Contract-test plan

Synthetic fixtures will cover:

1. successful purchase requisition read
2. successful purchase order read
3. empty result set
4. pagination/multiple pages
5. unauthorized response
6. forbidden response
7. throttling/transient server error
8. malformed/unexpected response
9. timeout
10. correlation ID propagation

## Clean Core decision

This lab intentionally prefers a released remote API for integration rather than building an external dependency on SAP internal tables.

That distinction is the key architectural evidence:

```text
Need: external procurement integration

Do not couple external app
      directly to EKKO/EKPO
              │
              ▼
Use a released remote interface
when available for the target release
```

## Future implementation milestones

### P1 — Source-ready TypeScript client

- package isolated under this lab
- typed request/response adapter
- runtime configuration validation
- mock SAP adapter
- unit/contract tests

### P2 — CI

- install
- lint
- typecheck
- tests
- secret scan

### P3 — Authorized sandbox integration

Only if an SAP S/4HANA sandbox is legitimately available:

- connectivity test
- API metadata verification
- sanitized read-only request
- runtime evidence

Until P3, no S/4 runtime claim is made.

## Evidence maturity

`RESEARCH_VALIDATED -> DESIGN_READY -> SOURCE_READY -> STATIC_VALIDATED -> RUNTIME_VALIDATED`

Current position: **`DESIGN_READY`**.

## Official references

- Purchase Order CDS `I_PurchaseOrderAPI01`: SAP Help Portal
- Purchase Order OData V4 `API_PURCHASEORDER_2`: SAP Business Accelerator Hub / SAP Help
- Purchase Requisition OData V4 `API_PURCHASEREQUISITION_2`: SAP Business Accelerator Hub / SAP Help
- ABAP Cloud released APIs: https://help.sap.com/docs/abap-cloud/abap-cloud/public-released-apis
