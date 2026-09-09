# SAP S/4HANA MM — Procurement API Client Example

[Versión en español](./README.es.md)

> **Evidence type:** executable non-live client-side example based on documented released SAP interfaces  
> **Status:** `SOURCE_READY / LOCAL_TEST_VALIDATED / CI_VALIDATED / S4_RUNTIME_NOT_CLAIMED`  
> **Scope:** Purchase Requisitions + Purchase Orders

This example contrasts classic ECC purchasing source with a client-side S/4HANA API approach. It demonstrates TypeScript client behavior and testable API-consumption patterns only; it is not presented as productive SAP interface implementation or live S/4HANA experience.

## Architectural contrast

```text
Classic ECC evidence                 S/4HANA client-side example
--------------------                 ---------------------------
ABAP report/service                  External TypeScript client
        │                                      │
        ▼                                      ▼
EKKO / EKPO                           Documented released API
classic Open SQL                              │
                                      ┌───────┴────────┐
                                      ▼                ▼
                               Purchase Requisition  Purchase Order
```

## Documented released-interface direction

Purchase Orders:

- CDS interface: `I_PurchaseOrderAPI01`
- OData V4 API family: `API_PURCHASEORDER_2`

Purchase Requisitions:

- OData V4 API family: `API_PURCHASEREQUISITION_2`

Exact service paths, fields, authentication and availability must be verified against the target S/4HANA release before any real connectivity claim can be made.

## Source implementation

A dependency-free TypeScript client is versioned under [`client/`](./client/README.md).

Implemented source evidence:

- read-only Purchase Order queries
- read-only Purchase Requisition queries
- injectable HTTP transport
- OData `value` response validation
- `$top`, `$skip` and `$filter` query construction
- stable remote API error mapping
- correlation/request ID capture
- HTTPS enforcement outside localhost
- timeout-aware Fetch transport
- deterministic synthetic contract tests
- GitHub Actions quality gate with `contents: read`

## Test evidence

Six deterministic tests are versioned and passed both locally and in GitHub Actions with Node 22:

1. Purchase Order OData normalization
2. Purchase Requisition OData normalization
3. empty OData page
4. HTTP 401 mapped with correlation ID
5. malformed/non-OData response rejected
6. insecure non-local HTTP endpoint rejected

Recorded CI result:

```text
Executed: 6
Passed:   6
Failed:   0
```

This is **client/source validation**, not SAP S/4HANA tenant runtime validation.

## Security boundary

No real SAP URL, user, password, OAuth client secret, bearer-style token, cookie, certificate/private key or production payload is stored in this example.

The current source remains intentionally read-only. Any future real authentication would need to be supplied externally and separately evidenced.

## What this proves now

- TypeScript API-client implementation
- OData response handling in the published source
- transport abstraction and deterministic contract testing
- error/correlation-ID handling
- secure-by-default endpoint validation
- reproducible CI validation
- understanding of documented released-interface boundaries
- bilingual technical documentation

## What is not claimed

- productive SAP interface implementation
- SAP Integration Suite / CPI experience
- connection to a real S/4HANA tenant
- metadata verification against a specific release
- OAuth/token acquisition against SAP
- real SAP authorization success
- end-to-end S/4HANA runtime
- write/create/change operations

## Possible future validation

Only if a legitimate S/4HANA sandbox/tenant becomes available could a separate evidence item document:

- connectivity
- API metadata verification
- sanitized read-only request
- observed runtime result

Until such evidence exists, no S/4HANA runtime or productive-interface claim is made.

## Evidence maturity

`RESEARCH_VALIDATED -> DESIGN_READY -> SOURCE_READY -> LOCAL_TEST_VALIDATED -> CI_VALIDATED -> RUNTIME_VALIDATED`

Current position: **`SOURCE_READY / LOCAL_TEST_VALIDATED / CI_VALIDATED`**.
