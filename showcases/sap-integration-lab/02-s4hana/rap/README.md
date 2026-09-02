# SAP S/4HANA — RAP Evidence Roadmap

[Versión en español](./README.es.md)

> **Status:** `DESIGN_READY / IMPLEMENTATION_PLANNED`  
> **Runtime claim:** none

This track will provide the first public S/4HANA application-development evidence using the ABAP RESTful Application Programming Model (RAP).

## RAP architecture target

```text
Persistence / released data source
          │
          ▼
CDS root view entity
          │
          ▼
Behavior Definition
          │
          ▼
Behavior Implementation
          │
          ▼
Projection View
          │
          ▼
Projection Behavior
          │
          ▼
Service Definition
          │
          ▼
Service Binding — OData V4
          │
          ▼
Fiori / API consumer
```

SAP documents service definitions as protocol-agnostic descriptions of which CDS entities are exposed, while service bindings connect those definitions to protocols such as OData. For transactional services, OData V4 is the preferred target where applicable.

## First portfolio BO

Planned custom domain:

**MM Replenishment Review / Reorder Review Case**

This will *not* modify SAP standard material master or MRP persistence.

Instead, it will model a custom review/workflow object that can store synthetic/manual review decisions around a material replenishment assessment.

Possible custom fields:

- review UUID
- material reference (synthetic in public evidence)
- plant reference
- review date
- risk status
- proposed action
- reviewer note
- workflow status
- created/changed timestamps

## Why this object

It creates a clean bridge from the classic ECC stock-risk diagnostic to a modern S/4HANA extension without pretending that the ECC report itself is a Clean Core solution.

```text
ECC evidence
MARC/MARD read-only diagnostic
             │
             │ conceptual business continuity
             ▼
S/4HANA RAP evidence
custom review BO + released integration/data sources
```

## Planned behavior

Operations:

- create review
- update review while open
- submit review
- approve/reject review
- close review

Validation examples:

- material/plant reference required
- proposed action required before submit
- closed records cannot be changed
- approval action only from submitted state

## Test design

Future evidence should include:

- behavior validation tests
- action/state-transition tests
- authorization tests
- negative tests
- EML-based test where practical
- service metadata/runtime evidence

## Authorization design

Authorization will be explicit and separate from UI visibility.

Planned roles/scopes for the synthetic lab:

- viewer
- reviewer
- approver

The exact implementation depends on the ABAP Cloud environment and will be documented once source is created.

## Evidence gate

```text
DESIGN_READY
    ↓
CDS_SOURCE_READY
    ↓
BEHAVIOR_SOURCE_READY
    ↓
SERVICE_SOURCE_READY
    ↓
STATIC_VALIDATED
    ↓
RUNTIME_VALIDATED
    ↓
TEST_VALIDATED
```

Current position: `DESIGN_READY`.

## Official references

- RAP learning/architecture: https://help.sap.com/docs/abap-cloud/abap-rap/learn
- Service Definition: https://help.sap.com/docs/abap-cloud/abap-rap/service-definition
- Service Binding: https://help.sap.com/docs/abap-cloud/abap-rap/service-binding
- RAP Business Object Contract: https://help.sap.com/docs/abap-cloud/abap-rap/rap-business-object-contract
