# SAP S/4HANA — ABAP Cloud / Clean Core Technical Guide

[Versión en español](./README.es.md)

> **Evidence type:** documentation-grounded architecture guide  
> **Runtime claim:** none

This guide explains the engineering rules used in this portfolio to distinguish classic ECC ABAP from S/4HANA Clean Core / ABAP Cloud design.

## Core principle

**Classic ECC access patterns are not presented as automatic proof of S/4HANA Clean Core engineering.**

S/4HANA extensions should prefer released SAP objects, released APIs and documented extension points appropriate to the target release.

## Release-contract awareness

The guide records the practical distinction between release contracts used in ABAP Cloud scenarios:

- **C0 — Extend**: extensibility-oriented use cases.
- **C1 — Use System-Internally**: released objects intended for stable internal consumption across software components.
- **C2 — Use as Remote API**: released remote interfaces for integration/side-by-side consumption.

The engineering rule is simple: an artifact should identify the released object/API it relies on and the intended consumption boundary instead of making a generic “S/4 compatible” claim.

## Clean Core review checklist

For any ABAP Cloud/S/4HANA extension, review:

1. target ABAP language version/environment;
2. released SAP objects consumed;
3. release contract where relevant;
4. extension boundary and ownership;
5. whether standard persistence is modified or bypassed;
6. authorization model;
7. test strategy;
8. ATC/static-quality expectations;
9. API/service exposure boundary;
10. evidence actually available for the artifact.

## ECC vs. Clean Core decision record

| Question | Classic ECC example | Clean Core / S/4HANA direction |
|---|---|---|
| Data access | Open SQL on standard tables where appropriate | released CDS/API/object first |
| Remote integration | custom RFC/table-oriented patterns may exist | released remote APIs/OData where available |
| Upgrade safety | customer code must be reviewed against upgrades | released contracts and supported extension points reduce coupling |
| Business object extension | exits/BAdIs/custom tables depending on release | released extensibility + RAP/ABAP Cloud when applicable |
| Quality gate | syntax, ATC/custom checks, ABAP Unit | released-object checks, ATC, tests, service/authorization checks |

## Architecture sequence documented in this portfolio

```text
Released data/API selection
        ↓
Clean read model / CDS boundary
        ↓
Business object behavior when required
        ↓
Projection + service definition
        ↓
OData V4 / released integration surface
        ↓
Authorization + tests + ATC-oriented review
```

## Existing repository evidence connected to this guide

- [S/4HANA MM Procurement API Client](../mm/procurement-api-lab/README.md) — executable TypeScript read-only client with **6/6 CI tests**.
- [RAP Architecture Guide](../rap/README.md) — documented CDS/behavior/projection/service architecture.
- [Migration Cockpit Technical Guide](../migration-cockpit/README.md) — documented migration lifecycle and controls.
- ECC MM ABAP packs under [`../../01-ecc/mm`](../../01-ecc/mm/README.md) — intentionally labelled classic ECC rather than Clean Core.

## What this guide demonstrates

- awareness of released-object governance;
- ability to separate ECC implementation patterns from S/4HANA extension patterns;
- release-contract reasoning;
- Clean Core architecture review;
- ATC/test/authorization considerations;
- integration boundary awareness.

## Evidence boundary

This document is a technical architecture guide. It does not claim ABAP Cloud runtime, ATC execution or RAP activation in an SAP tenant.
