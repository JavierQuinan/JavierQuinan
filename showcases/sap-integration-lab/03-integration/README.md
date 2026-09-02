# SAP Integration — Engineering Evidence Track

[Versión en español](./README.es.md)

> **Scope:** integration patterns connecting SAP with external software systems  
> **Current maturity:** planned / architecture defined

This track links SAP evidence with the broader full-stack engineering portfolio.

## Planned patterns

- OData consumption
- REST integration
- SOAP/XML processing
- message transformation
- idempotency
- correlation IDs
- retry/error mapping
- audit trails and observability
- secure secret/configuration separation

## Evidence boundary

No internal endpoint, RFC destination, hostname, credential, certificate or customer payload is published.

Integration examples use synthetic payloads and explicit environment configuration.

## Planned artifacts

1. OData consumer with typed mapping and error handling.
2. SOAP/XML transformation example with deterministic fixtures.
3. Idempotent integration handler with correlation/audit IDs.
4. Retry/error classification example.
5. Observability example connecting technical failures with business-process context.
