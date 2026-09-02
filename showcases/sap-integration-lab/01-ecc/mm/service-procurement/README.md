# SAP ECC MM — Service Procurement & Framework Contracts

[Versión en español](./README.es.md)

> **Track:** SAP ECC / Materials Management / Purchasing & Services  
> **Evidence status:** `FUNCTIONAL_EVIDENCE_READY / TECHNICAL_LAB_PLANNED`  
> **Runtime claim:** no custom ABAP runtime claim is made in this package

This evidence pack documents a sanitized professional workflow for long-term purchasing agreements used for recurring materials or service procurement.

The source material describes a framework/outline agreement as a long-term purchasing agreement with a vendor, validity dates, quantity/value limits and reusable conditions for future purchases or services. The original operational guide uses a create flow entered through `ME31` and verifies existing agreements with `ME33K`; this portfolio preserves that source-derived workflow as historical/operational evidence while clearly noting that standard SAP ECC contract processing commonly uses the contract transactions `ME31K`, `ME32K` and `ME33K`.

## Functional scenario

```text
Need for recurring service/material procurement
              │
              ▼
Check whether an agreement already exists
              │
              ▼
Vendor + purchasing organization + validity
              │
              ▼
Agreement header
              │
              ▼
Service/material item
              │
              ▼
Quantity / value / pricing conditions
              │
              ▼
Service catalog / contracted activities
              │
              ▼
Save + communicate agreement reference
              │
              ▼
Future procurement references the agreement
```

## Source-derived operating controls

The sanitized guide preserves these controls from the underlying material:

1. Check for an existing contract before creating a new one to prevent duplicates.
2. Select the vendor and organizational purchasing context.
3. Define start/end validity dates.
4. Maintain the offered/contracted value and commercial reference.
5. Create service-oriented item data where the agreement concerns services.
6. Maintain unit, quantity and price context.
7. Enter the contracted service/activity identifiers and quantities in the service catalog area.
8. Save the agreement and communicate the generated agreement reference through the authorized business process.

No real vendor, company, contract number, purchasing organization code, employee, email address or customer-specific configuration is published.

## Professional interpretation

This evidence demonstrates familiarity with:

- outline agreements / framework contracts
- vendor purchasing context
- validity periods
- quantity vs. value-oriented agreements
- service-item procurement
- service catalog / activity references
- procurement controls against duplicate agreements
- commercial conditions and follow-on procurement

## ECC technical model — planned lab

The next technical artifact for this topic will be a **read-only contract audit/report**, not a transaction that creates or changes purchasing documents.

Planned architecture:

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
      /                      \
ECC datasource             demo datasource
EKKO / EKPO               synthetic data
```

The first version will focus on safe, explainable evidence such as:

- agreement validity
- vendor context
- item count
- quantity/value agreement classification where available
- expiry risk
- missing/expired validity
- read-only reporting
- deterministic ABAP Unit vectors

Service-package details will only be added after the exact ECC service-document relationships are verified for the intended release. No proprietary `Z*` implementation will be copied.

## Evidence boundary

This is **functional professional evidence**, not proof that a custom purchasing program has been executed in SAP.

The public artifact does not include:

- employer/customer names
- vendor IDs
- agreement numbers
- purchasing organization codes
- real prices or contract values
- screenshots from enterprise systems
- internal custom transaction codes
- credentials or transport information

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

## Source note

This document is a sanitized transformation of user-provided operational material. It does not reproduce the original screenshots, organization identifiers or third-party formatting.
