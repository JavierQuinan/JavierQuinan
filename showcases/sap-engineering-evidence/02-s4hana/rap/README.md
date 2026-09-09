# SAP S/4HANA — RAP Architecture Guide

[Versión en español](./README.es.md)

> **Evidence type:** documentation-grounded architecture guide  
> **Runtime claim:** none

This guide explains the ABAP RESTful Application Programming Model (RAP) using a bounded MM replenishment-review scenario. It is presented as architecture evidence, not as an activated RAP application.

## RAP architecture

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

The guide distinguishes the protocol-agnostic service definition from the service binding that exposes the model through a protocol such as OData.

## Architecture case: MM Replenishment Review

The case is a **custom review/workflow business object** around a replenishment assessment. It deliberately avoids modifying SAP standard material-master or MRP persistence.

Example custom fields:

- review UUID
- material reference
- plant reference
- review date
- risk status
- proposed action
- reviewer note
- workflow status
- created/changed timestamps

Public examples use synthetic identifiers.

## Business-object boundary

```text
Classic ECC diagnostic evidence
MARC/MARD read-only stock assessment
             │
             │ business concept only
             ▼
RAP architecture guide
custom review BO + released S/4HANA boundaries
```

The architecture keeps the diagnostic calculation separate from SAP standard persistence. The custom BO owns review decisions and workflow state only.

## Behavior model

Documented operations:

- create review
- update an open review
- submit review
- approve or reject a submitted review
- close review

Documented validations:

- material/plant reference required;
- proposed action required before submission;
- closed records are immutable;
- approval/rejection is valid only from submitted state.

## Authorization model

The guide separates authorization from UI visibility.

Illustrative scopes for the synthetic scenario:

- **viewer** — read review cases;
- **reviewer** — create/update/submit cases;
- **approver** — approve/reject submitted cases.

Actual SAP authorization implementation is not claimed by this artifact.

## Test design guide

A RAP implementation of this design should be reviewed against:

- field/behavior validation cases;
- state-transition cases;
- negative authorization cases;
- immutable-state cases;
- EML-based behavior tests where appropriate;
- service metadata and authorization boundaries.

These are documented acceptance criteria, not fabricated runtime results.

## What this guide demonstrates

- RAP layer separation;
- custom business-object ownership;
- behavior/state-machine design;
- validation design;
- projection/service exposure reasoning;
- OData V4 service-binding awareness;
- authorization/test boundaries;
- Clean Core separation from classic ECC logic.

## Evidence boundary

This repository contains the RAP architecture guide and related Clean Core reasoning. It does not claim CDS activation, behavior runtime, OData service publication or RAP tests executed in an SAP tenant.
