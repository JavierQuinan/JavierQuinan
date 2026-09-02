# SAP Integration — Engineering Guide

[Versión en español](./README.es.md)

> **Scope:** integration patterns connecting SAP with external software systems

This guide links SAP evidence with the broader full-stack engineering portfolio. It documents the integration controls used across the public evidence and points to the executable S/4HANA Procurement API Client as the concrete source example.

## Integration patterns documented

### OData / REST

The public S/4HANA Procurement API Client demonstrates:

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

### SOAP / XML

The portfolio also documents SOAP/XML-heavy enterprise integration through the sanitized KOVI case study. Public evidence focuses on architecture, XML/XSD validation, asynchronous processing and failure handling without exposing fiscal/customer payloads.

### Idempotency

For integrations that may be retried, the engineering rule is:

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

A retry must not silently create duplicate business effects.

### Error classification

Errors should be separated into categories such as:

- authentication/authorization;
- transport/connectivity;
- timeout;
- validation/schema;
- business-rule rejection;
- remote-system technical failure;
- transient retryable failure;
- permanent/non-retryable failure.

This makes support and observability materially better than returning a generic “SAP error”.

### Correlation and traceability

Integration logs should preserve a correlation identifier across:

`caller → integration layer → SAP/API → worker/job → response`.

The public TypeScript client records returned correlation/request IDs when available.

### Observability

A useful integration record links technical events with business context without logging confidential payloads:

- operation name;
- safe business reference;
- correlation ID;
- start/end timestamps;
- result category;
- retry count;
- remote status/code;
- sanitized error detail.

### Secret/configuration separation

Public code must not contain:

- SAP credentials;
- RFC destinations;
- client secrets;
- private certificates;
- internal hostnames;
- productive payloads.

Configuration is externalized and examples use placeholders or synthetic values.

## Evidence available in this repository

| Evidence | What it demonstrates |
|---|---|
| S/4HANA Procurement API Client | TypeScript OData client, validation, correlation IDs, HTTPS and **6/6 CI tests** |
| KOVI public case study | SOAP/XML/XSD, async workers, certificate-handling architecture and failure boundaries |
| ECC diagnostics guides | transaction/object tracing and technical troubleshooting methodology |
| SAP operational guides | business-process context needed to interpret integration failures correctly |

## Evidence boundary

No internal endpoint, RFC destination, hostname, credential, certificate, customer payload or proprietary adapter source is published.
