# Procurement API Client — Source Evidence

> **Runtime boundary:** local/mock execution only; no SAP S/4HANA tenant connection is claimed.

This package is a dependency-free TypeScript proof of the client architecture described by the S/4HANA Procurement API lab.

## What is implemented

- read-only Purchase Order query method
- read-only Purchase Requisition query method
- injectable HTTP transport
- HTTPS enforcement for non-local endpoints
- OData `value` response validation
- `$top`, `$skip` and `$filter` query construction
- stable `SapApiError` with HTTP status and correlation/request ID capture
- timeout-aware Fetch transport
- six deterministic Node tests with synthetic responses

## Why dependency-free

Node 22 type stripping allows this small lab to execute TypeScript containing erasable type syntax without installing a runtime framework or test library. This keeps the evidence self-contained and avoids adding third-party dependencies merely to prove the client contract.

## Run

Requires Node `>=22.6.0`.

```bash
npm test
```

The test command runs:

```bash
node --experimental-strip-types --test src/*.test.ts
```

## Test vectors

1. Purchase Order OData page normalization
2. Purchase Requisition OData page normalization
3. empty OData page
4. HTTP 401 mapped to `SapApiError` with correlation ID
5. malformed/non-OData response rejected
6. insecure non-local HTTP base URL rejected

## Configuration boundary

No real SAP URL or credential is stored in the package.

A real adapter would receive configuration externally, for example:

```text
baseUrl
purchaseOrderServicePath
purchaseRequisitionServicePath
authHeader or a safer auth-provider abstraction
```

The current `authHeader` option exists only as a minimal transport boundary for the source lab. A production-grade client should use an external credential/token provider rather than retaining long-lived credentials in application configuration.

## Not implemented yet

- OAuth/token acquisition
- real SAP metadata discovery
- retry/backoff policy
- multi-page traversal
- response schemas per target S/4HANA release
- write operations
- SAP sandbox integration

Those remain separate milestones and will not be claimed prematurely.
