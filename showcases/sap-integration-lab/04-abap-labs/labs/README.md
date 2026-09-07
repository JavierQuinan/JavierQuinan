# Historical Lab Catalog

[Versión en español](./README.es.md)

> Curso 1 (Logali Group) is a 16-unit curriculum. 10 units include a personal hands-on lab with a Word submission and embedded evidence, confirmed as the account owner's own work via document metadata; the other 6 units are theory-only (no Laboratorio exercise, no personal Word document) and are listed separately below as curriculum topics, not labs.

## The 10 hands-on labs

| Lab | Unit | Topic | Object | Evidence images |
|---|---|---|---|---|
| [lab-01](./lab-01/README.md) | 2 | Variables and data types | `ZCL_LAB_01_VAR_FQ` | 1 |
| [lab-02](./lab-02/README.md) | 3 | Arithmetic operations | `ZCL_LAB_02_ARITHMETIC_FQ` | 1 |
| [lab-03](./lab-03/README.md) | 4 | Data type conversions | `ZCL_LAB_03_DATATYPES_FQ` | 2 |
| [lab-04](./lab-04/README.md) | 5 | Text field processing | `ZCL_LAB_04_MESSAGE_FQ` | 1 |
| [lab-05](./lab-05/README.md) | 6 | String operations (Part I) | `ZCL_LAB_05_INVOICE_FQ` | 1 |
| [lab-05a](./lab-05a/README.md) | 7 | String operations (Part II) | `ZCL_LAB_05_INVOICE_FQA` | 1 |
| [lab-06](./lab-06/README.md) | 8 | Control structures | `ZCL_LAB_06_CONDITION_FQ` | 2 |
| [lab-07](./lab-07/README.md) | 10 | Internal tables (Part I) | `ZCL_LAB_07_TABLES_FQ` | 3 |
| [lab-07a](./lab-07a/README.md) | 11 | Internal tables (Part II, advanced) | `ZCL_LAB_07_TABLES_FQA` | 7 |
| [lab-08](./lab-08/README.md) | 13 | Field symbols | `ZCL_LAB_08_FIELDSYMBOLS_FQ` | 1 |

Each lab folder contains a bilingual README (status, provenance, object, what it demonstrates, embedded own evidence, sanitization note) and links to its `.abap` source in [`../source/`](../source/). Source files are unmodified — every lab's own README states exactly what, if anything, was redacted from its screenshots and why.

## Curso 1 curriculum topics without a hands-on lab (6 of 16 units)

These units were studied (theory PDF, and in most cases a personal quiz-attempt record) but have no Laboratorio exercise, no personal Word submission, and no embedded personal screenshot — so no lab folder is created for them, to avoid representing a topic as hands-on when no hands-on artifact exists.

| Unit | Topic |
|---|---|
| 1 | Herramientas y entornos de desarrollo (Eclipse ADT tooling) |
| 9 | Estructuras y Tipos Locales |
| 12 | Expresiones Constructor |
| 14 | Depuración de Programas |
| 15 | Programación dinámica |
| 16 | Performance |

## Status semantics

- `HISTORICAL_EXECUTION_VERIFIED`: source plus documented historical execution evidence exists, including the account owner's own screenshot(s) from the original training submission.
- `TRAINING_ONLY` (curriculum topics table above): studied, with no saved hands-on artifact.

## Provenance boundary

The private source documents are personal training submissions. Document metadata (`docProps/core.xml`) supports provenance under Francisco Quinteros' Office profile for every one of the 10 hands-on labs above. Full course PDFs (Documentación/Laboratorio/Solución/Test) are not republished — only the account owner's own `.abap` source and the account owner's own embedded screenshots are published, sanitized per each lab's own note.
