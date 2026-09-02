# SAP ECC IS-U / Work Management — Evidence Track

[Versión en español](./README.es.md)

> **Scope:** SAP ECC IS-U / Work Management  
> **Current maturity:** functional evidence available; public technical artifacts planned

This track is intentionally independent from S/4HANA. It will document sanitized professional evidence from real operational experience in utilities processes and Work Management.

## Evidence areas

- installation and contract lifecycle concepts
- device management
- work-order lifecycle
- workflow, statuses and event handling
- CRM ↔ IS-U operational interaction
- Work Management ↔ GIS/external-system integration patterns
- troubleshooting and incident-resolution guides

## Functional evidence policy

User-authored professional MM/WM guides can be incorporated as primary functional evidence when each topic is reached. Before publication they will be sanitized to remove employer/customer identifiers, real documents, users, endpoints and confidential configuration.

The published artifact will state whether it is:

- sanitized professional guide derived from operational experience
- synthetic technical exercise
- ABAP implementation
- runtime-validated SAP artifact

## Technical evidence boundary

No real installation, contract account, contract, business partner, device/meter, work order or customer identifier may appear in public evidence.

Any ABAP artifact created for this track will follow the same runtime-validation gate defined in `EVIDENCE_GOVERNANCE.md`.
