# Evidence Record — ECC MM Inventory & Stock Risk

> **Current evidence state:** `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

## Environment boundary

- SAP product/context: SAP ECC / MM
- Target runtime: authorized development or sandbox system
- Runtime access status: deferred; enterprise development/CTS access is not currently being used for this portfolio artifact
- Runtime execution claim: **not made**

The absence of runtime execution is documented as an access/governance boundary, not represented as a technical PASS.

## Source objects

Recommended creation/activation order:

1. `ZCX_MM_STOCK_NOT_FOUND`
2. `ZIF_MM_STOCK_SOURCE`
3. `ZCL_MM_STOCK_SOURCE_DEMO`
4. `ZCL_MM_STOCK_SOURCE_ECC`
5. `ZCL_MM_STOCK_RISK_SERVICE`
6. local test include for `ZCL_MM_STOCK_RISK_SERVICE`
7. `ZMM_STOCK_RISK_REPORT`
8. `ZMM_STOCK_RISK` — SE93 Report Transaction

## Evidence matrix

| Object / layer | Source review | Static logic | SAP activation | SAP runtime | Notes |
|---|---|---|---|---|---|
| `ZCX_MM_STOCK_NOT_FOUND` | PASS | PASS | NOT OBSERVED | N/A | global static exception design |
| `ZIF_MM_STOCK_SOURCE` | PASS | PASS | NOT OBSERVED | N/A | datasource contract |
| `ZCL_MM_STOCK_SOURCE_DEMO` | PASS | PASS | NOT OBSERVED | NOT OBSERVED | deterministic synthetic datasource |
| `ZCL_MM_STOCK_SOURCE_ECC` | PASS | PASS | NOT OBSERVED | NOT OBSERVED | read-only ECC MM datasource |
| `ZCL_MM_STOCK_RISK_SERVICE` | PASS | PASS | NOT OBSERVED | NOT OBSERVED | domain decision logic |
| ABAP Unit test source | PASS | 6/6 vectors traced | NOT OBSERVED | NOT EXECUTED | static validation is not ABAP Unit runtime |
| `ZMM_STOCK_RISK_REPORT` | PASS | PASS | NOT OBSERVED | NOT OBSERVED | executable/SALV design |
| `ZMM_STOCK_RISK` (`SE93`) | PASS | PASS | NOT CREATED IN SAP | NOT OBSERVED | documented report-transaction procedure |

## Source-review hardening completed

The source was reviewed and changed to reduce semantic and compatibility risk:

- plant-level and storage-location unrestricted stock are separated
- diagnostic status uses plant-level unrestricted stock, not a single storage location
- `MARC-DISMM` MRP type is exposed
- materials with no reorder/safety thresholds return `NOT_CONFIGURED`
- ABAP Unit methods explicitly declare the propagated `CX_STATIC_CHECK` exception
- classic `CREATE OBJECT`, `CALL METHOD` and classic Open SQL are preferred
- runtime path remains read-only

See [`COMPATIBILITY.md`](./COMPATIBILITY.md).

## Static validation result

The six deterministic ABAP Unit vectors were traced against the current service implementation:

1. plant unrestricted stock above reorder point → `OK` — **STATIC PASS**
2. plant unrestricted stock exactly at reorder point → `REORDER` — **STATIC PASS**
3. plant unrestricted stock below safety stock → `CRITICAL` — **STATIC PASS**
4. shortage quantity calculated up to reorder point → expected `25` — **STATIC PASS**
5. absent reorder/safety thresholds → `NOT_CONFIGURED` — **STATIC PASS**
6. low selected-storage stock with sufficient plant stock → status based on plant stock — **STATIC PASS**

**Static vectors reviewed: 6/6**  
**Static mismatches found: 0**

See [`STATIC_VALIDATION.md`](./STATIC_VALIDATION.md) for the trace record.

### Runtime ABAP Unit result

- tests executed in SAP: **NOT EXECUTED**
- tests passed in SAP: **NOT CLAIMED**
- tests failed in SAP: **NOT CLAIMED**

The expected `6/6 PASS` result remains the runtime target, not a published runtime fact.

## ECC runtime scenario

The executable report and proposed `ZMM_STOCK_RISK` report transaction accept:

- material
- plant
- storage location

The ECC datasource reads only:

- `MARC-DISMM`
- `MARC-MINBE`
- `MARC-EISBE`
- `MARD-LABST` for the selected storage location
- `MARD-LABST` records for the material/plant to calculate a transparent gross plant unrestricted-stock total

The report should eventually be validated with non-sensitive/demo organizational data in an authorized environment.

## Reproducible SAP execution procedure

Runtime execution is fully documented even though it is deferred:

- [`BUILD_GUIDE.md`](./BUILD_GUIDE.md)
- [`BUILD_GUIDE.es.md`](./BUILD_GUIDE.es.md)
- [`RUNTIME_EXECUTION.md`](./RUNTIME_EXECUTION.md)
- [`RUNTIME_EXECUTION.es.md`](./RUNTIME_EXECUTION.es.md)
- [`VALIDATION_RESULTS_TEMPLATE.md`](./VALIDATION_RESULTS_TEMPLATE.md)

These define the `SE24`/`SE80` class/interface creation order, syntax/activation gates, ABAP Unit execution, `SE38` executable report and `SE93` report-transaction configuration.

## Functional boundary

This package is a stock-only early-warning diagnostic. It does not calculate SAP MRP availability, firmed receipts, requirements, MRP-area scope, storage-location exclusions, lot sizing, lead times or forecast behavior.

## Allowed portfolio claim

> Source-reviewed SAP ECC MM / ABAP Objects evidence pack with six deterministic test vectors statically validated, read-only MARC/MARD access design, SALV reporting structure and reproducible SE24/SE38/SE93 build and runtime procedures. Runtime execution is deferred until an authorized SAP development environment is available.

## Claims intentionally not made

- syntax check passed in a specific ECC release
- objects activated successfully in SAP
- ABAP Unit executed 6/6 in SAP
- `ZMM_STOCK_RISK` created/launched successfully in `SE93`
- SALV executed in an SAP runtime
- production validation

## Promotion path

When authorized runtime access becomes available:

1. create/activate all objects in order
2. record syntax/activation results
3. execute the six ABAP Unit tests
4. run `ZMM_STOCK_RISK_REPORT` in `SE38`
5. create and launch `ZMM_STOCK_RISK` in `SE93`
6. capture sanitized result evidence
7. promote to `RUNTIME_VALIDATED` and then `TEST_VALIDATED`
