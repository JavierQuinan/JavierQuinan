# SAP S/4HANA — Migration Cockpit Evidence Lab

[Versión en español](./README.es.md)

> **Evidence type:** official-documentation-based study/design evidence  
> **Status:** `RESEARCH_VALIDATED / RUNTIME_NOT_CLAIMED`  
> **Boundary:** this is not presented as hands-on production migration experience

This lab documents the SAP S/4HANA Migration Cockpit workflow using current SAP Help Portal documentation as the source of truth.

It is deliberately separate from the ECC evidence track.

## Supported migration approaches

SAP documents two primary approaches for the S/4HANA Migration Cockpit:

1. **Migrate data using staging tables**
2. **Migrate data directly from an SAP source system**

The appropriate approach depends on the source scenario and available migration objects.

## Migration-project lifecycle

```text
Create migration project
        │
        ▼
Select migration scenario
        │
        ▼
Select migration objects
        │
        ▼
Prepare source/staging data
        │
        ▼
Transfer / prepare data
        │
        ▼
Process mapping tasks
        │
        ▼
Simulate migration
        │
        ├── issues/mapping tasks → correct and repeat
        │
        ▼
Migrate
        │
        ▼
Monitor activities/results
        │
        ▼
Business reconciliation
```

## Migration objects

The cockpit uses **migration objects** to define the business data to be transferred.

For each object, the project can expose:

- documentation
- active/custom view scope
- table structure for staging scenarios
- mapping tasks
- migration-object instances
- preparation/simulation/migration activities

A future portfolio exercise should choose one bounded object rather than claiming a full-system migration.

## Staging-table approach

SAP creates one or more staging tables for each relevant migration object.

Source data can be loaded using:

- provided template files, or
- appropriate external tooling such as SAP Data Services / controlled database-loading processes where supported.

Depending on product/version/scenario, staging tables can be located in an appropriate local or remote SAP HANA schema configured for the migration project.

### Staging flow

```text
Source data
   │
   ▼
Template / ETL process
   │
   ▼
Staging tables
   │
   ▼
Prepare / transfer from staging
   │
   ▼
Mapping
   │
   ▼
Simulation
   │
   ▼
Migration
```

## Simulation gate

Simulation is a critical control.

SAP documents that simulation does not write the business data to the target system but allows migration messages/issues to be reviewed. New mapping tasks can appear after simulation; they must be resolved and simulation repeated before migration continues.

Therefore a professional migration evidence record should never jump directly from file preparation to “migrated”.

## Monitoring

Migration activities are monitored through the project/cockpit monitoring capabilities.

Evidence should record:

- migration object
- source approach
- object-instance scope
- preparation result
- mapping tasks
- simulation result
- migration result
- rejected/error records
- reconciliation outcome

## Portfolio lab design

First future hands-on exercise:

**Synthetic Business Data Migration Runbook**

Target deliverables:

```text
MIGRATION_SCENARIO.md
DATA_DICTIONARY.md
SOURCE_TO_TARGET_MAPPING.md
SYNTHETIC_DATA.csv
PRE_VALIDATION.md
SIMULATION_RESULTS.md
ERROR_CATALOG.md
RECONCILIATION.md
POST_MIGRATION_CHECKLIST.md
```

No real enterprise dataset will be published.

## Data-quality gates

Before simulation:

- required keys populated
- mandatory attributes present
- dates valid
- code/value mappings defined
- organizational dependencies resolved
- duplicates identified
- referential dependencies understood

After migration:

- migrated count reconciled
- rejected count explained
- key business totals reconciled where relevant
- sample records functionally verified
- no sensitive source data committed to Git

## Migration Object Modeler boundary

`LTMOM` / migration-object modelling is an advanced extension topic and will be treated separately. The portfolio will not imply custom migration-object expertise until an actual model/design artifact is produced.

## Evidence maturity

```text
RESEARCH_VALIDATED
        ↓
LAB_DESIGNED
        ↓
SYNTHETIC_DATA_READY
        ↓
RUNTIME_VALIDATION_PENDING
        ↓
RUNTIME_VALIDATED
```

Current position: `RESEARCH_VALIDATED`.

## Official sources

- SAP S/4HANA Data Migration: https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/6e7648c7d6a844e69ee9d24d00cfc464.html
- Migrate Your Data — Migration Cockpit: https://help.sap.com/docs/PRODUCT_ID/29193bf0ebdd4583930b2176cb993268/2f0dbe4111214bcf9b2d57eca26f0525.html
- Migrate Data Using Staging Tables: https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/87ffdbfebd504116b497c02d51ce5b58.html
- Simulating the Migration: https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/0ee46d72aa734da6ba5d9285da4d7148.html
- Public training material — staging/direct transfer: https://help.sap.com/docs/PRODUCT_ID/ffaed9ee977247e689972af70212149e/8bc93e781ddd463a9710bf5d505d58c9.html
