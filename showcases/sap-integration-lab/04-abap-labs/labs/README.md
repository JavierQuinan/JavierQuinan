# Historical Lab Catalog & Code Index

[Versión en español](./README.es.md)

> Ten curated ABAP source files from historical personal lab submissions. Private per-lab provenance records are retained off-repository; this public catalog discloses course context, dependencies and sanitization status without publishing the original course material or historical screenshots.

| Object | Lab | Main capability | Historical execution | Current runtime | Reproducibility note | Publication status |
|---|---|---|---|---|---|---|
| `ZCL_LAB_01_VAR_FQ` | [source](./source/zcl_lab_01_var_fq.abap) | Data types / ABAP Core | YES | PENDING | Requires `/DMO/EMPLOYEE_HR` demo data | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_02_ARITHMETIC_FQ` | [source](./source/zcl_lab_02_arithmetic_fq.abap) | Arithmetic / ABAP Core | YES | PENDING | Self-contained | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_03_DATATYPES_FQ` | [source](./source/zcl_lab_03_datatypes_fq.abap) | Conversions / dates | YES | PENDING | Self-contained | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_04_MESSAGE_FQ` | [source](./source/zcl_lab_04_message_fq.abap) | Text / regex | YES | PENDING | Recreate or refactor `TEXT-001` | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_05_INVOICE_FQ` | [source](./source/zcl_lab_05_invoice_fq.abap) | Strings + Open SQL | YES (original submitted variant) | PENDING | Requires training-table replacement | `PUBLIC_SOURCE_READY_SANITIZED` |
| `ZCL_LAB_05_INVOICE_FQA` | [source](./source/zcl_lab_05_invoice_fqa.abap) | Strings / regex / escape | YES (original submitted variant) | PENDING | Public sample email sanitized | `PUBLIC_SOURCE_READY_SANITIZED` |
| `ZCL_LAB_06_CONDITION_FQ` | [source](./source/zcl_lab_06_condition_fq.abap) | Control flow / exceptions | YES (original submitted variant) | PENDING | Requires training-table replacement | `PUBLIC_SOURCE_READY_SANITIZED` |
| `ZCL_LAB_07_TABLES_FQ` | [source](./source/zcl_lab_07_tables_fq.abap) | Internal tables + Open SQL | YES (original submitted variant) | PENDING | `/DMO/CONNECTION`; sample emails sanitized | `PUBLIC_SOURCE_READY_SANITIZED` |
| `ZCL_LAB_07_TABLES_FQA` | [source](./source/zcl_lab_07_tables_fqa.abap) | Advanced internal tables + Open SQL | YES | PENDING | `/DMO/FLIGHT`, `/DMO/CONNECTION`, `/DMO/CARRIER` | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_08_FIELDSYMBOLS_FQ` | [source](./source/zcl_lab_08_fieldsymbols_fq.abap) | Field symbols | YES (original submitted variant) | PENDING | Requires training-table replacement; sample emails sanitized | `PUBLIC_SOURCE_READY_SANITIZED` |

## Status semantics

- `PUBLIC_SOURCE_READY`: safe to review publicly as source; current runtime re-verification is still pending.
- `PUBLIC_SOURCE_READY_SANITIZED`: public source differs from the historical submitted variant only in disclosed non-functional sample-literal/comment sanitization.
- `Historical execution: YES` does **not** mean current execution has been revalidated.

See [Future Lab Roadmap](../docs/FUTURE_LAB_ROADMAP.md) for the reproducibility plan.


## Provenance boundary

The private source documents are personal training submissions. Document metadata supports provenance under Francisco Quinteros' Office profile but is not treated as independent proof of every embedded element. Historical screenshots remain private. Public source variants that sanitize sample literals are labeled accordingly, and current runtime remains pending.
