# SAP S/4HANA — Migration Cockpit Technical Guide

[Versión en español](./README.es.md)

> **Evidence type:** documentation-grounded technical guide  
> **Boundary:** no productive S/4HANA migration runtime is claimed

This guide documents the SAP S/4HANA Migration Cockpit workflow, its control points and a reproducible synthetic migration runbook. It is intentionally separated from the ECC evidence track.

## Migration approaches

The guide distinguishes two primary cockpit approaches:

1. **Staging tables** — source data is prepared outside the target business objects and loaded into migration staging structures.
2. **Direct transfer from an SAP source system** — supported migration objects transfer data directly from the configured source scenario.

The selected approach depends on the migration object, source system and target product/release.

## End-to-end lifecycle

```text
Create migration project
        ↓
Select migration scenario
        ↓
Select migration objects
        ↓
Prepare source/staging data
        ↓
Transfer / prepare data
        ↓
Resolve mapping tasks
        ↓
Simulate migration
        ↓
Review issues and corrections
        ↓
Execute migration
        ↓
Monitor results
        ↓
Reconcile business data
```

## Migration objects

A migration object defines the business-data structure and migration behavior for a bounded domain. A professional review records:

- object name and scenario;
- source approach;
- field documentation;
- required/optional attributes;
- mapping tasks;
- instance scope;
- dependencies;
- simulation result;
- migration result;
- reconciliation result.

## Staging-table workflow

```text
Source data
   ↓
Template / ETL preparation
   ↓
Staging tables
   ↓
Prepare / transfer from staging
   ↓
Mapping
   ↓
Simulation
   ↓
Migration
   ↓
Reconciliation
```

The guide treats simulation as a control gate, not as an optional cosmetic step. Simulation is used to surface mapping/data-quality issues before the actual target write.

## Synthetic migration runbook

The following runbook is complete enough to reproduce the analysis with synthetic data without publishing enterprise records.

### 1. Define scope

Document:

- target migration object;
- source approach (`staging` or `direct transfer`);
- organizational scope;
- expected record count;
- dependencies on previously migrated objects.

### 2. Build a data dictionary

For each field record:

| Field | Required | Source meaning | Target meaning | Validation |
|---|---|---|---|---|
| Key | yes | synthetic source identifier | migration-object key | unique, non-empty |
| Date | scenario-specific | business date | SAP target date | valid format/range |
| Org value | scenario-specific | source organization | SAP target organization | mapped value exists |
| Code/value | scenario-specific | source code | SAP target code | mapping resolved |

### 3. Prepare synthetic source data

Rules:

- no real customer/vendor/material/BP identifiers;
- no production addresses or financial values;
- enough rows to cover valid, invalid, duplicate and unmapped cases;
- stable identifiers so reconciliation is repeatable.

### 4. Pre-validation

Check before cockpit processing:

- required keys populated;
- mandatory attributes present;
- dates valid;
- duplicates identified;
- code/value mappings defined;
- organizational dependencies resolved;
- referential dependencies understood;
- source file/table encoding and delimiters verified where relevant.

### 5. Mapping review

Maintain an explicit source-to-target table:

| Source value | Target value | Rule | Status |
|---|---|---|---|
| `SRC_A` | `TGT_A` | direct mapping | resolved |
| `SRC_B` | — | no target equivalent | issue |

### 6. Simulation review

Record:

- object/instance scope;
- number of records processed;
- errors/warnings;
- new mapping tasks;
- rejected records;
- corrective action.

A simulation issue is treated as evidence to correct the dataset or mapping, not something to hide from the final record.

### 7. Migration result review

Record:

- migrated count;
- rejected count;
- warnings;
- object-specific post-processing;
- technical messages relevant to reconciliation.

### 8. Reconciliation

Reconcile:

- expected vs. migrated record count;
- rejected records with reason;
- key business totals where applicable;
- representative sample records;
- dependent-object consistency;
- absence of sensitive source data in Git.

## Error catalogue template

| Category | Example | Root cause | Correction |
|---|---|---|---|
| Required field | missing mandatory value | incomplete source data | complete source field |
| Mapping | source code has no target value | mapping not maintained | create/approve mapping |
| Duplicate | repeated source key | source quality issue | deduplicate according to rule |
| Dependency | referenced object missing | migration sequence issue | migrate dependency first |
| Format | invalid date/number | source formatting | normalize source representation |

## Monitoring checklist

For every migration review, capture:

- project/scenario;
- migration object;
- source approach;
- instance scope;
- preparation status;
- mapping status;
- simulation status;
- migration status;
- rejected/error records;
- reconciliation outcome.

## Migration Object Modeler boundary

Migration Object Modeler (`LTMOM`) is not presented here as hands-on custom-model expertise. The guide only describes standard Migration Cockpit workflow and the governance required to evaluate a migration run.

## What this guide demonstrates

- staging vs. direct-transfer reasoning;
- migration-object scoping;
- source-to-target mapping discipline;
- simulation as a control gate;
- error/rejection handling;
- reconciliation methodology;
- privacy-aware synthetic evidence design.

## Evidence boundary

This repository contains the guide and synthetic runbook. It does not claim productive S/4HANA migration execution, LTMOM custom-object implementation or target-system runtime results.
