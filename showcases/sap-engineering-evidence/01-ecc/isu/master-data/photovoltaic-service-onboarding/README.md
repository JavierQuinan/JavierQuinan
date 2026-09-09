# SAP ECC IS-U / CRM — Photovoltaic Service Onboarding & Master-Data Chain

[Versión en español](./README.es.md)

> **Evidence type:** sanitized functional integration guide  
> **Status:** `FUNCTIONAL_EVIDENCE_READY`  
> **Scope:** IS-U technical master data + CRM contract/service onboarding

This evidence pack documents the business/technical dependency chain required to onboard a specialized utility service whose contract setup depends on correctly prepared IS-U technical master data.

The original operational material concerns a photovoltaic tariff/service scenario. The public version keeps the reusable SAP process structure but removes company names, model-object IDs, customer identifiers, custom class values, tariff codes, organizational codes and screenshots.

## Process architecture

```text
External/GIS service identifier
            │
            ▼
IS-U Connection Object
       (`ES55` flow)
            │
            ▼
Premise / technical-location context
            │
            ▼
Point of Delivery / Supply Point
       (`ES60` flow)
            │
            ▼
Utility Installation
       (`ES30` flow)
            │
            ▼
Service/contract technical context
            │
            ▼
CRM Business Partner / Account context
            │
            ▼
CRM Contract Management
            │
            ▼
Specialized service/tariff onboarding
```

## Functional preconditions

Before creating the service contract, verify:

- authorized access to the relevant IS-U/CRM functions
- required external/service identifier has been provided by the upstream process
- model/reference master data is approved for the scenario
- dates are aligned across technical and contractual objects
- the specialized service/tariff is the intended use case

## Step-by-step sanitized workflow

### 1. Obtain the external service/context identifier

The source process starts by obtaining a utility/service identifier from an external/GIS-related process before creating the SAP IS-U technical chain.

Public evidence never stores the real identifier.

### 2. Create the connection object — `ES55`

Create the new connection object using an approved model/reference where the implementation requires it.

Maintain:

- service address
- required connection characteristics
- organizational/technical context according to authorized configuration

Record the newly generated connection-object identifier only inside the enterprise process; do not publish it.

### 3. Validate premise / technical placement context

The source procedure includes a technical-location/premise review step before continuing. The reusable lesson is that technical placement and organizational values must remain consistent across the objects in the service chain.

### 4. Create the point of supply — `ES60`

Create a new point of supply using the approved model/reference and assign the connection object created in the previous step.

Validate address/location and relevant service-point context before saving.

### 5. Create the installation — `ES30`

Create the utility installation and link it to the new point of supply.

Key controls:

- effective dates must follow the business scenario
- point-of-supply relationship must be correct
- notification/service-point context must use the identifier produced by the authorized upstream process
- sector/organizational attributes must match the intended service

### 6. Move to CRM

Once technical master data exists, continue in CRM:

1. create or identify the business partner/customer;
2. create/identify the required commercial/account context;
3. resolve the utility/service identifier;
4. create the contract through contract management;
5. select the configured photovoltaic/specialized service product/tariff;
6. complete and validate the onboarding process.

## Change-of-customer / ownership scenario

The source material also distinguishes customer-change scenarios. The public pattern is:

1. review/update the connection-object characteristics if required;
2. complete the prior customer's contract-end process through the normal flow;
3. create/identify the new customer and commercial context;
4. reuse the valid technical service chain;
5. onboard the new contract against the correct service identifier.

## Cross-system consistency controls

```text
Connection Object
      │
      ├── address/characteristics
      │
Point of Supply
      │
      ├── connection-object link
      │
Installation
      │
      ├── effective date / service context
      │
CRM Contract
      │
      └── product/tariff + customer/commercial context
```

A downstream contract should not be treated as isolated from the upstream technical master data.

## Troubleshooting questions

When onboarding fails, check:

- Was the upstream service identifier created and linked correctly?
- Does the connection object contain the required technical characteristics?
- Is the point of supply linked to the intended connection object?
- Is the installation linked to the intended point of supply?
- Are effective dates coherent?
- Does CRM resolve the same technical/service context?
- Is the selected contract product/tariff valid for the intended specialized scenario?

## Confidentiality boundary

Removed from the source material:

- company/vendor names
- model connection-object IDs
- model point-of-supply IDs
- model installation IDs
- customer/service identifiers
- custom class names and values
- tariff/product codes
- business-role IDs
- screenshots
- addresses and personal data

## What this proves

- IS-U technical master-data dependency awareness
- connection-object / supply-point / installation relationships
- CRM ↔ IS-U contract onboarding reasoning
- effective-date discipline
- customer-change process awareness
- cross-system master-data consistency checks
- confidentiality-aware operational documentation
