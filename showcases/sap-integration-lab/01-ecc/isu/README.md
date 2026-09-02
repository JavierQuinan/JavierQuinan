# SAP ECC IS-U / Work Management — Evidence Track

[Versión en español](./README.es.md)

> **Scope:** SAP ECC IS-U / Work Management  
> **Current maturity:** sanitized functional evidence published; technical ABAP artifacts planned

This track is intentionally independent from S/4HANA. It documents sanitized professional evidence derived from real operational experience in utilities processes and Work Management.

## Published functional evidence

- [Work Management operations — sanitized version](./functional-evidence/work-management-operations/README.md)

The published evidence covers IW38 usage, work-order lifecycle, individual/mass creation, IW32 assignment/release/completion, controlled mass processing, automated release planning, SM37 monitoring, CRM ↔ WM flow and consistency between technical and commercial equipment data.

## Evidence areas

- installation and contract lifecycle concepts
- device management
- work-order lifecycle
- workflow, statuses and event handling
- CRM ↔ IS-U operational interaction
- Work Management ↔ GIS/external-system integration patterns
- troubleshooting and incident-resolution guides

## Functional evidence policy

Professional MM/WM guides are incorporated as primary functional evidence after sanitization. Public versions exclude company/customer names, people, IDs, real documents, screenshots, organizational codes, endpoints and confidential configuration. Organization-specific Z-development names are abstracted when publication would expose internal design.

The published artifact clearly states whether it is:

- sanitized professional guide derived from operational experience
- synthetic technical exercise
- ABAP implementation
- runtime-validated SAP artifact

## Technical evidence boundary

No real installation, contract account, contract, business partner, device/meter, work order or customer identifier may appear in public evidence.

Any ABAP artifact created for this track will follow the same runtime-validation gate defined in `EVIDENCE_GOVERNANCE.md`.
