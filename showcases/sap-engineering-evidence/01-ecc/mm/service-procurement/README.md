# SAP ECC MM — Service Procurement & Framework Contracts

[Versión en español](./README.es.md)

> **Track:** SAP ECC / Materials Management / Purchasing & Services  
> **Evidence:** sanitized operational guide · original read-only ABAP source · deterministic source review

This pack combines sanitized professional knowledge of long-term purchasing agreements with an original read-only ABAP engineering artifact.

## Functional evidence

The operational guide supports a workflow around:

- checking for an existing agreement before creating a duplicate;
- vendor and purchasing-organization context;
- validity start/end;
- quantity/value-oriented agreements;
- service-oriented positions;
- units, quantities and commercial values;
- service/activity catalogue maintenance;
- follow-on procurement referencing an existing agreement.

The source guide uses `ME31` in its specific operational context and `ME33K` for existing-contract review. This public version preserves that fact without treating it as a universal rule; classic SAP contract processing commonly uses the `ME31K / ME32K / ME33K` family.

## Technical evidence — `ZMM_CONTRACT_AUDIT`

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

Supporting exception:

`ZCX_MM_CONTRACT_NOT_FOUND`

## Read-only ECC model

The source uses:

- `EKKO-KDATB` / `EKKO-KDATE` — validity start/end;
- `EKKO-LIFNR` — vendor;
- `EKKO-EKORG` — purchasing organization;
- `EKKO-KTWRT` — target value;
- `EKPO-KTMNG` — target quantity;
- `EKPO-ZWERT` — item target value;
- `EKPO-LOEKZ` — deleted-item exclusion.

Only purchasing documents with `BSTYP = 'K'` are accepted by the ECC datasource.

The source intentionally does not traverse service-package hierarchy tables because that relationship is release/scenario-specific and is not required to prove the contract-audit logic implemented here.

## Diagnostic states

- `ACTIVE`
- `EXPIRING_SOON`
- `EXPIRED`
- `NOT_YET_VALID`
- `INVALID_VALIDITY`
- `VALIDITY_INCOMPLETE`
- `NO_ITEMS`

The report also exposes days to expiry, active-item count and quantity/value target indicators.

## Deterministic scenario review

Eight ABAP Unit scenarios are versioned and were traced consistently against the current source:

```text
Scenarios reviewed: 8
Consistent:         8
Mismatches:         0
```

This is source/static review, not a claim of ABAP Unit execution in a corporate SAP system.

## Reproducible evidence

- [Technical Lab](./TECHNICAL_LAB.md)
- [Build Guide](./BUILD_GUIDE.md)
- [Guía de construcción](./BUILD_GUIDE.es.md)
- [Static Validation](./STATIC_VALIDATION.md)
- [Evidence Record](./EVIDENCE.md)
- [`source/`](./source/)

## What this evidence demonstrates

- service-procurement and framework-contract reasoning;
- classic ECC purchasing-document structure;
- ABAP Objects and datasource abstraction;
- explicit contract-validity rules;
- synthetic deterministic test data;
- SALV reporting;
- bilingual functional/technical documentation;
- read-only design and confidentiality discipline.

## Evidence boundary

The artifact creates or changes no purchasing document and contains no database write or transaction commit.

It does not claim to replace release strategy, service entry, pricing/condition technique, source determination, contract consumption, account assignment, invoice verification or service-package processing.

The repository presents source/static evidence and reproducible construction instructions; it does not claim activation or execution of these custom objects in a specific corporate SAP system.

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
