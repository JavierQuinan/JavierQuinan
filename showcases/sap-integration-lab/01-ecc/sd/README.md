# SAP ECC / CRM-SD — Evidence Track

[Versión en español](./README.es.md)

> **Scope:** customer/commercial setup, sales-area context and billing evidence derived from real operational guides  
> **Current maturity:** first sanitized functional evidence published

This track is separate from MM and IS-U/WM even when the enterprise process crosses module boundaries.

## Published evidence

### Non-Energy Service Billing

[Non-Energy Service Billing Workflow](./non-energy-billing/README.md)

Status: `FUNCTIONAL_EVIDENCE_READY`

The source-derived workflow covers:

- customer/business-partner identification or creation
- contact and preferred-channel validation
- commercial agreement/account context
- customer sales-area extension
- sales organization / distribution channel / division context
- creation of a non-energy service billing document through the configured enterprise process
- output review before finalization
- configured fiscal/output completion

This is explicitly documented as a customer-specific CRM/SD-oriented business process. It is **not** generalized into a fake universal `VF01` tutorial.

## Planned progression

Future SD evidence will be added only when supported by a real guide, synthetic lab or official research clearly labelled by source type.

Target topics:

- order-to-cash fundamentals
- customer/sales-area master data
- billing/output troubleshooting
- pricing/output concepts
- MM-SD / FI-SD integration boundaries
- S/4HANA Sales modernization as a separate track

## Confidentiality boundary

No company, customer, BP ID, address, sales-area code, invoice number, amount, tax endpoint or enterprise screenshot is published.
