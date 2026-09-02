# SAP ECC MM — Service Procurement & Framework Contracts

[Versión en español](./README.es.md)

> **Track:** SAP ECC / Materials Management / Purchasing & Services  
> **Status:** `FUNCTIONAL_EVIDENCE_READY / ABAP_SOURCE_READY / STATIC_VALIDATED / RUNTIME_DEFERRED`

This pack combines sanitized professional knowledge of long-term purchasing agreements with an original read-only ABAP engineering artifact.

## Functional evidence

The underlying operational guide demonstrates a workflow around:

- checking for an existing agreement before creating a duplicate
- vendor and purchasing-organization context
- validity start/end
- quantity/value-oriented agreements
- service-oriented positions
- units, quantities and commercial values
- service/activity catalog maintenance
- follow-on procurement referencing an existing agreement

The source guide used `ME31` in its operational context and `ME33K` for existing-contract review. This public version preserves that fact without presenting it as a universal standard; classic SAP contract processing commonly uses the `ME31K / ME32K / ME33K` family.

No real company, vendor, contract, purchasing organization, amount, user or screenshot is published.

## Technical evidence — `ZMM_CONTRACT_AUDIT`

The planned auditor is now implemented as reviewable source:

```text
ZMM_CONTRACT_AUDIT
        │
        ▼
ZMM_CONTRACT_AUDIT_REPORT
        │
        ▼
ZCL_MM_CONTRACT_AUDIT_SERVICE
        │
        ▼
ZIF_MM_CONTRACT_SOURCE
   ├── ZCL_MM_CONTRACT_SOURCE_ECC  → EKKO / EKPO
   └── ZCL_MM_CONTRACT_SOURCE_DEMO → synthetic data
```

Supporting object:

`ZCX_MM_CONTRACT_NOT_FOUND`

## Read-only ECC model

The first version uses standard purchasing-contract fields that are independently documented in SAP material:

- `EKKO-KDATB` / `EKKO-KDATE` — validity start/end
- `EKKO-LIFNR` — vendor
- `EKKO-EKORG` — purchasing organization
- `EKKO-KTWRT` — target value
- `EKPO-KTMNG` — target quantity at item level
- `EKPO-ZWERT` — target value at item level
- `EKPO-LOEKZ` — deleted-item exclusion

Only purchasing documents with `BSTYP = 'K'` are accepted by the ECC datasource.

The first source deliberately does **not** traverse service-package hierarchy tables. That remains a release/scenario-specific future extension.

## Diagnostic states

- `ACTIVE`
- `EXPIRING_SOON`
- `EXPIRED`
- `NOT_YET_VALID`
- `INVALID_VALIDITY`
- `VALIDITY_INCOMPLETE`
- `NO_ITEMS`

The report also exposes days to expiry, active-item count and quantity/value target indicators.

## Test design

Eight deterministic ABAP Unit vectors are versioned and were traced at source level:

```text
Vectors reviewed: 8
Consistent:       8
Mismatches:       0
```

This is **static/source validation**, not an SAP runtime test claim.

## Reproduce the lab

- [Technical Lab](./TECHNICAL_LAB.md)
- [Build Guide](./BUILD_GUIDE.md)
- [Guía de construcción](./BUILD_GUIDE.es.md)
- [Static Validation](./STATIC_VALIDATION.md)
- [Evidence Record](./EVIDENCE.md)
- [`source/`](./source/)

## Evidence boundary

This source does not create or change purchasing documents and contains no write statement or transaction commit.

It does not claim to replace:

- release strategy
- service entry
- pricing/condition technique
- source determination
- contract consumption
- account assignment
- invoice verification
- service-package processing

SAP activation, ABAP Unit runtime and SE93 execution remain deferred until an authorized DEV/sandbox is available.

## Bilingual terminology

| English | Español |
|---|---|
| Outline agreement | Acuerdo marco / contrato marco |
| Purchase contract | Contrato de compras |
| Vendor | Proveedor |
| Validity period | Período de vigencia |
| Quantity contract | Contrato por cantidad |
| Value contract | Contrato por valor |
| Service item | Posición de servicio |
| Service catalog | Catálogo de prestaciones/servicios |
