# Personal ABAP Naming Convention

[Versión en español](./NAMING_CONVENTIONS.es.md)

This document records naming patterns that are already present in the public ABAP evidence.

## Historical class pattern

```text
zcl_lab_<NN>_<topic>_fq[a]
```

| Segment | Meaning | Observed |
|---|---|---|
| `zcl_` | Customer-namespace class prefix | all 10 historical classes |
| `lab_` | Personal lab marker | all 10 historical classes |
| `<NN>` | Two-digit personal sequence | `01`–`08` |
| `<topic>` | Short English topic descriptor | `var`, `arithmetic`, `datatypes`, `message`, `invoice`, `condition`, `tables`, `fieldsymbols` |
| `_fq` | Personal suffix for Francisco Quinteros | all base classes |
| optional `a` | Continuation of the same numbered topic | `05a`, `07a` |

## Confirmed historical mapping

| Lab | Course unit | Topic | Class |
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

## Course 3 normalized pattern

The four published Course 3 practices use the same personal suffix while keeping the course/practice sequence explicit:

- `zcl_c3_01_projects_fq`
- `zcl_c3_02_atc_demo_fq`
- `zcl_c3_03_cleaner_demo_fq`
- `zcl_c3_04_dept_auth_fq`

The authorization practice also documents the technically valid shortened DDIC names `zde_dept_fq`, `ZAFDEPTFQ` and `ZAODEPTFQ` where SAP object-name limits apply.

## Current naming rule

- Use `_fq` for portfolio-owned/normalized objects when the SAP object type and technical name limit allow it.
- Use a shortened `FQ` suffix where a strict SAP object-name limit makes literal `_fq` invalid.
- Use `_fqa` only for an actual continuation of the same numbered historical lab topic.
- Preserve historical source names unchanged; normalization is represented through separate portfolio copies when applicable.

## Evidence boundary

The historical Course 1 set is class-based. Course 2 has no saved source artifact. Course 3 contributes the four normalized class sources and the documented authorization-object naming above. No naming convention is claimed for object types not represented by current public evidence.
