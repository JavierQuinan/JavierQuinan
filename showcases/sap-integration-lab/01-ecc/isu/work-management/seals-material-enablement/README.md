# SAP ECC MM ↔ IS-U/WM — Seal Material Enablement

[Versión en español](./README.es.md)

> **Evidence type:** sanitized cross-module support case  
> **Status:** `FUNCTIONAL_EVIDENCE_READY`  
> **Scope:** material master availability → seal-management enablement → work-order material usage

This evidence documents a cross-module support scenario where seal materials already exist in the SAP material master but still require enablement/configuration in the seal-management process before they can be consumed operationally in work orders.

The source ticket contained real organization names, ticket IDs and material numbers; none are published here.

## Process relationship

```text
Material requirement for field work
          │
          ▼
Material created/extended in SAP MM
          │
          ▼
Validate material attributes/context
          │
          ▼
Enable/configure material in Seal Management
          │
          ▼
Make seal type available to WM process
          │
          ▼
Use in work order / field execution
          │
          ▼
Record/consume material according to process
```

## Troubleshooting principle

A material existing in `MM01/MM03` context does not by itself prove that every downstream application can use it.

When a material is unavailable in a field-service/seal workflow, verify both layers:

1. **MM layer** — material exists and is extended/configured for the required organizational context.
2. **Seal/WM layer** — the corresponding seal category/type/configuration is available for the work-order process.

## Diagnostic checklist

- Is the material master record present?
- Is the material extended to the required plant/storage context?
- Is the material intended for the seal-management process?
- Does the seal-management configuration reference/recognize the material?
- Is the required seal category/type active?
- Is the work-order process configured to expose that seal/material option?
- Does the downstream consumption/material-movement process recognize the selected material?

## Cross-module insight

This case demonstrates that master-data readiness is multi-layered:

```text
MM master-data readiness
        ≠
WM application readiness
```

A support analyst must trace the dependency rather than recreating the material or forcing a work-order entry.

## Public boundary

Never publish:

- material numbers from the enterprise system
- ticket IDs
- organization/business-unit names
- internal seal categories/configuration values
- screenshots with operational data
- custom program or transport identifiers

## Future technical lab

A public synthetic lab can model:

- material eligibility rules
- seal-type mapping
- work-order material selection
- material-consumption validation
- configuration consistency report

without copying customer-specific Seal Management configuration.

## What this proves

- SAP MM ↔ IS-U/WM integration awareness
- material-master vs. application-configuration distinction
- field-service material enablement troubleshooting
- downstream-consumption thinking
- support-case sanitization and traceability
