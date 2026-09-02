# Source Review — ECC MM Inventory & Stock Risk

> **Review status:** completed at source level; runtime validation in SAP ECC is still pending.

## Findings fixed

1. **Plant vs. storage-location semantics**  
   The original version compared plant-level `MARC` thresholds directly with one storage location's `MARD-LABST`. The hardened model separates selected-storage stock from gross plant unrestricted stock and bases the diagnostic status on the plant total.

2. **MRP context visibility**  
   `MARC-DISMM` is now exposed so the report does not present reorder/safety thresholds without showing the planning type context.

3. **Base unit visibility**  
   `MARA-MEINS` is now included so displayed quantities have unit context.

4. **Unconfigured thresholds**  
   When reorder point and safety stock are both initial, the result is `NOT_CONFIGURED` rather than a misleading reorder signal.

5. **Static exception handling in ABAP Unit**  
   Test methods now explicitly declare `RAISING ZCX_MM_STOCK_NOT_FOUND`, matching the `CX_STATIC_CHECK` contract.

6. **Classic ECC syntax posture**  
   Core runtime prefers `CREATE OBJECT`, `CALL METHOD`, explicit `DATA` and classic Open SQL. Modern syntax is avoided where it does not add value.

7. **Read-only boundary**  
   Runtime code contains no update/insert/modify/delete/commit behavior.

8. **Authorization boundary**  
   The lab relies on the standard transaction-start control for its SE93 report transaction and deliberately does not invent customer-specific business-data authorization objects.

## Remaining runtime questions

These cannot be resolved from source review alone:

- exact target ECC / NetWeaver release compatibility
- object activation result
- ABAP Unit execution result
- SE93 transaction launch result
- SALV behavior on the target system
- customer-specific authorization design

Those remain tracked in `EVIDENCE.md` and must be validated only in an authorized DEV/sandbox.
