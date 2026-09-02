# SAP S/4HANA — ABAP Cloud / Clean Core Evidence Track

[Versión en español](./README.es.md)

> **Evidence type:** architecture/research track  
> **Status:** `RESEARCH_VALIDATED / IMPLEMENTATION_PLANNED`  
> **Runtime claim:** none

This track defines the rules that future S/4HANA technical evidence must satisfy. It is intentionally separate from classic ECC ABAP.

## Core principle

**Do not treat classic ECC access patterns as automatic proof of S/4HANA Clean Core engineering.**

Future ABAP Cloud evidence will prioritize released extension points and APIs.

## Release-contract awareness

SAP documents release contracts including:

- **C0 — Extend**: extensibility use cases
- **C1 — Use System-Internally**: stable consumption of released development objects inside the system across software components
- **C2 — Use as Remote API**: integration/side-by-side remote consumption

A future artifact must identify which released contract/API it relies on instead of merely stating “S/4 compatible”.

## Evidence rules

An ABAP Cloud artifact must document:

1. ABAP language version / target environment
2. released SAP objects consumed
3. release contract where relevant
4. why the approach is Clean Core-oriented
5. ATC/static checks expected
6. authorization model
7. extension boundary
8. test strategy
9. runtime evidence state

## Target progression

```text
ABAP fundamentals
      │
      ▼
Modern ABAP syntax
      │
      ▼
CDS view entities
      │
      ▼
Released APIs / C1 consumption
      │
      ▼
RAP business object
      │
      ▼
Service definition
      │
      ▼
OData V4 service binding
      │
      ▼
Authorization + tests + ATC
      │
      ▼
Side-by-side / integration patterns (C2)
```

## Planned evidence packs

### 1. Read-only MM analytical CDS lab

Goal: demonstrate a clean read model built only on released data sources appropriate to the target S/4HANA release.

Status: `PLANNED`.

### 2. RAP managed business object

Goal: create a self-contained custom business object demonstrating CDS, behavior definition, projection, service definition/binding and tests without modifying SAP standard persistence.

Status: `PLANNED`.

### 3. Sourcing & Procurement API client

Goal: consume an official released OData API from an external integration client, with secrets/configuration separated from Git and deterministic mock/contract tests.

Status: `DESIGN_READY`.

### 4. Clean Core decision record

Goal: compare classic ECC direct-table implementation with the S/4HANA released-API approach and explain why they are not interchangeable.

Status: `PLANNED`.

## ATC and quality gate

Future implementation evidence should include, where available:

- syntax/activation
- ATC result
- released-object check
- ABAP Unit
- behavior tests
- service metadata/runtime
- authorization test

No pass result will be invented without the relevant environment.

## Official reference

Public Released APIs: https://help.sap.com/docs/abap-cloud/abap-cloud/public-released-apis

RAP overview: https://help.sap.com/docs/abap-cloud/abap-rap/learn
