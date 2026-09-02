# SAP ECC IS-U / CRM — Equipment Consistency Across Technical and Commercial Views

[Versión en español](./README.es.md)

> **Evidence type:** sanitized device/equipment management guide  
> **Status:** `FUNCTIONAL_EVIDENCE_READY`  
> **Scope:** technical equipment assignment ↔ commercial/contract representation consistency

This evidence documents a controlled process for maintaining consistency between technical equipment assignments in IS-U and the commercial/contract representation maintained through CRM.

The source guide emphasizes an important architectural rule: a local technical change must not leave the commercial/contract view inconsistent. When the business meaning of the equipment must change, the complete upstream CRM process should be used rather than treating the technical assignment as an isolated record.

## Process model

```text
Locate service point / technical context
          │
          ▼
Review technical installation/equipment assignments
          │
          ▼
Authorized removal/modification when appropriate
          │
          ▼
Save technical result
          │
          ▼
Cross-check commercial/contract view
          │
      ┌───┴────┐
      ▼        ▼
consistent   inconsistent/business change required
      │        │
      ▼        ▼
complete    execute normal CRM product/tariff change flow
```

## Source-derived search paths

The guide demonstrates multiple ways to resolve the technical service context, including commercial identifiers, installation/serial-number information and notification/service-point identifiers.

The public version does not expose any real contract account, installation, serial number, notification point or address.

## Technical assignment control

The source procedure allows an authorized user to review equipment assigned to the technical installation/service point and remove an assignment where the approved process requires it.

A critical constraint from the source is preserved:

> adding or changing equipment that represents a business/product change must follow the configured CRM process instead of being forced only through the technical assignment screen.

## Cross-system validation

After the technical operation, compare the resulting equipment context with the commercial/contract view.

Questions:

- Does the technical equipment assignment match the commercial product/tariff state?
- Did a technical-only change accidentally alter a business attribute?
- Is a CRM product/change process required to restore the intended integrated state?
- Are both layers showing the same equipment intent after completion?

## Troubleshooting principle

```text
Technical assignment correctness
            +
Commercial contract correctness
            =
Integrated process correctness
```

A technically saved record is not enough if the contract/product state tells a different story.

## Safe operating boundary

- Do not add equipment through a shortcut when the configured process requires CRM.
- Do not alter contract/product semantics from a purely technical view.
- Validate both technical and commercial representations after changes.
- Use the normal product/tariff-change process for business-level equipment changes.

## Public boundary

Removed from source:

- company/implementation names
- employees
- service-point IDs
- addresses
- installation IDs
- equipment/serial numbers
- customer-specific program/product codes
- screenshots

## What this proves

- IS-U device/equipment context troubleshooting
- technical vs. commercial master-data awareness
- CRM ↔ IS-U consistency validation
- process-integrity thinking
- avoidance of technical shortcuts that break business semantics
