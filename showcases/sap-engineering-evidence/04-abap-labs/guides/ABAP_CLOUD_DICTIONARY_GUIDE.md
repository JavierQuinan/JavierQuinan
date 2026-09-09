# ABAP Cloud Dictionary Guide

[Versión en español](./ABAP_CLOUD_DICTIONARY_GUIDE.es.md)

## Status

`TRAINING_DERIVED_GUIDE` + `OWNER_CONFIRMED_HANDS_ON_EXECUTION` — independently written from completed Course 2 training. The account owner confirms the DDIC exercises were performed hands-on in ADT; no saved source artifact is published because none was retained.

## Scope

Course 2 covered domains, data elements, database tables, structures, lock objects, persistence adjustments, table relationships and Dynamic Cache. This guide records those completed training topics without fabricating repository objects or source files.

## Core concepts

- **Domain:** technical value definition such as type, length, decimals and optional fixed values.
- **Data element:** semantic reusable type information layered on top of a domain or built-in type.
- **Database table:** persistent repository object with fields and a key.
- **Structure:** reusable non-persistent structured type.
- **Foreign-key relationship:** relationship metadata between fields/tables; exact runtime/value-help effects depend on the consuming technology.
- **Lock object:** repository object defining logical lock parameters for SAP enqueue processing.
- **Persistence adjustment:** controlled handling of Dictionary changes that affect persisted database structures.
- **Dynamic Cache:** training topic concerning cache/buffering behavior and its technical implications.

## Locking: classic ABAP vs. ABAP Cloud

Activating a lock object generates `ENQUEUE_*` / `DEQUEUE_*` function modules in classic ABAP. In ABAP Cloud developer extensibility, direct use of those generated function modules is not permitted; SAP documents the generic lock API based on `CL_ABAP_LOCK_OBJECT_FACTORY` / `IF_ABAP_LOCK_OBJECT` for supported scenarios.

This distinction is retained as technical guidance; it is not presented as evidence of a separately published lock-object implementation.

## Common failure modes

- Changing a persisted type without considering existing data.
- Treating buffering/caching as a universal performance fix.
- Assuming a Dictionary relationship automatically enforces business authorization rules.
- Mixing classic enqueue-call patterns into code presented as ABAP Cloud.

## Clean Core boundary

Persistence can remain private to an owning package while consumers use released service/API surfaces. Direct table access across unrelated components is not presented here as a Clean Core integration boundary.

## Provenance and evidence status

The training context is supported by the completed `SAP ABAP Cloud - Diccionario de datos` credential. Hands-on execution is owner-confirmed. No Course 2 `.abap` source, DDIC export or instructor material is republished, and no synthetic DDIC object is fabricated to fill that absence.

## Official reference

- SAP Help — Lock Objects / developer extensibility: https://help.sap.com/docs/SAP_S4HANA_CLOUD/6aa39f1ac05441e5a23f484f31e477e7/06d03eda843643b7a64acfb67edf521b.html
