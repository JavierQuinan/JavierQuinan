# SAP ECC MM ↔ IS-U/WM — Seal Enablement and Consumption

[Versión en español](./README.es.md)

> **Evidence type:** sanitized cross-module operational case  
> **Status:** `FUNCTIONAL_EVIDENCE_READY`  
> **Scope:** material availability → seal management → work-order consumption → test-environment support

This evidence documents the relationship between SAP MM, Seal Management and Work Management, complemented by the contributed operational guide for `ZCONS_SELLOS` and the use of `MMPV` in test/replica environments.

## Contributed evidence guide

- [ZCONS_SELLOS: Seal consumption](./CONSUMO_SELLOS_GUIDE.es.md) (Spanish original; no separate English translation exists for this guide)

The documented upload structure uses the columns `MATERIAL`, `ORDEN`, `SERIE` and `UBICACIÓN`.

### MMPV evidence

![MMPV in test environment](./evidence/figure-03.webp)

The screenshot belongs to the contributed guide and documents accounting-period extension in test environments through `MMPV`.

## Process relationship

```text
Material requirement for field work
          │
          ▼
Material created/extended in SAP MM
          │
          ▼
Enable/configure in Seal Management
          │
          ▼
Make seal type available to WM
          │
          ▼
Use in work order / field execution
          │
          ▼
ZCONS_SELLOS / consumption according to process
```

## Troubleshooting principle

A material existing in `MM01/MM03` context does not automatically mean every downstream application can use it.

When a material is unavailable in a field/seal workflow, validate two layers:

1. **MM** — material exists and is correctly extended/configured for the required organizational context.
2. **Seal/WM** — corresponding seal category/type/configuration is available for the work-order process.

## Diagnostic checklist

- Does the material exist?
- Is it extended to the required plant/storage location?
- Does it belong to the seal-management process?
- Does seal configuration recognize/reference the material?
- Is the seal category/type active?
- Does the work order expose that material/seal option?
- Does the downstream consumption/material-movement process recognize the selected material?

## Cross-module insight

```text
MM master-data availability
        ≠
WM application availability
```

## What this proves

- SAP MM ↔ IS-U/WM integration awareness;
- seal management and consumption through an operational process;
- upload-file structure for `ZCONS_SELLOS`;
- use of `MMPV` in test/replica environments;
- troubleshooting of field-material enablement.
