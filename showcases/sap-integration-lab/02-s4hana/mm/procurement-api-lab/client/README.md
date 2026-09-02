# Procurement API Client — Source Evidence

[Versión en español](./README.es.md)

> **Status:** `SOURCE_READY / LOCAL_TEST_VALIDATED / CI_PENDING`  
> **Runtime boundary:** local/mock execution only; no SAP S/4HANA tenant connection is claimed.

This package is a dependency-free TypeScript implementation of the client architecture described by the S/4HANA Procurement API lab.

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
- GitHub Actions quality gate

## Why dependency-free

Node 22 type stripping lets this focused lab execute erasable TypeScript syntax without adding a runtime/test framework solely for portfolio evidence.

## Run

Requires Node `>=22.6.0`.

```bash
npm test
```

Equivalent command:

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

Recorded local result:

```text
Executed: 6
Passed:   6
Failed:   0
```

CI validation is a separate evidence gate and is only claimed after the GitHub Actions run is observed green.

## Configuration boundary

No real SAP URL or credential is stored in the package. A real adapter would receive configuration externally, including service paths and authentication through a credential/token-provider abstraction.

The current `authHeader` option is a minimal source-lab transport boundary. A production-grade integration should not retain long-lived credentials in committed application configuration.

## Not implemented yet

- OAuth/token acquisition
- real SAP metadata discovery
- retry/backoff policy
- multi-page traversal
- release-specific response schemas
- write operations
- SAP sandbox integration

Those remain separate milestones and are not claimed prematurely.
