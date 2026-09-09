# External API Architecture Study — SAP-Adjacent, Non-Live

[Versión en español](./README.es.md)

> **Scope:** documentation-grounded API/interface design concepts plus one executable, local/non-live S/4HANA client example. This document is not evidence of productive SAP interface, middleware, CPI/Integration Suite or live-connectivity experience.

This study connects general full-stack API engineering concepts with the explicitly non-live S/4HANA Procurement API Client published in this repository. It separates reviewable source and architectural study from professional SAP runtime claims.

## OData / REST client-side concepts

The public S/4HANA Procurement API Client demonstrates only the behavior present in its source and tests:

- external configuration;
- read-only API consumption;
- query construction;
- OData response validation;
- transport abstraction;
- HTTP error mapping;
- correlation/request-ID capture;
- timeout handling;
- HTTPS enforcement;
- deterministic automated tests;
- GitHub Actions validation.

See: [`../02-s4hana/mm/procurement-api-lab`](../02-s4hana/mm/procurement-api-lab/README.md).

The client does **not** demonstrate a live S/4HANA tenant connection, productive OData implementation, SAP middleware configuration, destination setup or corporate runtime behavior.

## SOAP / XML context outside SAP

The portfolio separately contains real software-engineering evidence involving SOAP/XML/XSD in the sanitized KOVI case study. That evidence belongs to the software-product track and must not be reinterpreted as SAP interface experience.

## Documentation-grounded resilience concepts

The following patterns are retained as architecture study because they are useful for API clients and distributed systems generally. They are not represented as productive SAP implementation evidence.

### Idempotency

```text
External request/event
        ↓
Stable business/idempotency key
        ↓
Check prior processing state
        ↓
Process once
        ↓
Persist result / correlation ID
        ↓
Return/replay deterministic outcome
```

### Error classification

A client/interface design may distinguish:

- authentication/authorization;
- transport/connectivity;
- timeout;
- validation/schema;
- business-rule rejection;
- remote-system technical failure;
- transient retryable failure;
- permanent/non-retryable failure.

### Correlation and traceability

A generic distributed-system trace may preserve a correlation identifier across:

`caller → client/service layer → remote API → worker/job → response`

The public TypeScript client records returned correlation/request IDs when available.

### Observability

A safe technical record may include:

- operation name;
- safe business reference;
- correlation ID;
- start/end timestamps;
- result category;
- retry count;
- remote status/code;
- sanitized error detail.

### Secret/configuration separation

Public examples must not contain:

- SAP credentials;
- RFC destinations;
- client secrets;
- private certificates;
- internal hostnames;
- productive payloads.

Configuration is externalized and examples use placeholders or synthetic values.

## Evidence classification

| Artifact | Classification | What it supports |
|---|---|---|
| S/4HANA Procurement API Client | `EXECUTABLE_NON_LIVE_EXAMPLE` | TypeScript client behavior, OData parsing/validation, HTTPS guard, request correlation and observed CI tests |
| This document | `DOCUMENTATION_GROUNDED` | Architecture study only |
| KOVI public case study | Separate software-product evidence | SOAP/XML/XSD and async processing outside SAP |
| ECC diagnostics/operational guides | `ENTERPRISE_VERIFIED` where explicitly classified | SAP troubleshooting/process context, not interface implementation |

## Claim boundary

No productive SAP interface implementation, SAP Integration Suite/CPI work, live S/4HANA API connectivity, IDoc/RFC/BAPI runtime, middleware configuration or customer SAP endpoint is claimed by this study.
