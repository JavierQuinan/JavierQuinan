# Personal ABAP Naming Convention

[Versión en español](./NAMING_CONVENTIONS.es.md)

> This document records the naming pattern observed in the 10 historical class-based lab units. It does not claim that the same prefix scheme has already been used for CDS, RAP, DDIC or test objects.

## Observed class pattern

```text
zcl_lab_<NN>_<topic>_fq[a]
```

| Segment | Meaning | Observed |
|---|---|---|
| `zcl_` | Customer-namespace class prefix | all 10 classes |
| `lab_` | Personal lab marker | all 10 classes |
| `<NN>` | Two-digit personal sequence | `01`–`08` |
| `<topic>` | Short English topic descriptor | `var`, `arithmetic`, `datatypes`, `message`, `invoice`, `condition`, `tables`, `fieldsymbols` |
| `_fq` | Personal suffix for Francisco Quinteros | all base classes |
| optional `a` | Continuation of the same numbered topic | `05a`, `07a` |

## Confirmed mapping

| Unit | Course unit | Topic | Class |
|---|---|---|---|
| 01 | UNIDAD_2 | Variables / basic concepts | `zcl_lab_01_var_fq` |
| 02 | UNIDAD_3 | Arithmetic | `zcl_lab_02_arithmetic_fq` |
| 03 | UNIDAD_4 | Type conversions | `zcl_lab_03_datatypes_fq` |
| 04 | UNIDAD_5 | Text processing | `zcl_lab_04_message_fq` |
| 05 | UNIDAD_6 | String operations I | `zcl_lab_05_invoice_fq` |
| 05a | UNIDAD_7 | String operations II | `zcl_lab_05_invoice_fqa` |
| 06 | UNIDAD_8 | Control structures | `zcl_lab_06_condition_fq` |
| 07 | UNIDAD_10 | Internal tables I | `zcl_lab_07_tables_fq` |
| 07a | UNIDAD_11 | Internal tables II | `zcl_lab_07_tables_fqa` |
| 08 | UNIDAD_13 | Field symbols | `zcl_lab_08_fieldsymbols_fq` |

## Evidence boundary

This historical set contains class-based labs only. It does not contain an authored custom interface, CDS view, behavior definition, service definition/binding, DDIC persistence object or ABAP Unit test class.

## Rule for future evidence

For new original portfolio objects:

1. keep the `_fq` suffix where the SAP object type and naming limits make it technically valid;
2. use SAP-recommended/house naming conventions for the object type instead of inventing a prefix only to match this lab series;
3. document the exact naming decision in the future lab;
4. do not use `_fqa` unless the object is genuinely a continuation of the same numbered lab topic.

The only convention evidenced today is the class pattern above. Future CDS/RAP/DDIC/test naming will be established when those objects are actually built.
