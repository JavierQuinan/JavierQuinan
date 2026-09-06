# Catálogo de Laboratorios Históricos e Índice de Código

[English version](./README.md)

> Diez archivos ABAP curados provenientes de entregas personales históricas de laboratorio. Los registros privados de procedencia por laboratorio se conservan fuera del repositorio; este catálogo público declara contexto de formación, dependencias y sanitización sin publicar material original del curso ni capturas históricas.

| Objeto | Lab | Capacidad principal | Ejecución histórica | Runtime actual | Nota de reproducibilidad | Estado de publicación |
|---|---|---|---|---|---|---|
| `ZCL_LAB_01_VAR_FQ` | [source](./source/zcl_lab_01_var_fq.abap) | Tipos / ABAP Core | SÍ | PENDIENTE | Requiere datos demo `/DMO/EMPLOYEE_HR` | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_02_ARITHMETIC_FQ` | [source](./source/zcl_lab_02_arithmetic_fq.abap) | Aritmética / ABAP Core | SÍ | PENDIENTE | Autocontenido | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_03_DATATYPES_FQ` | [source](./source/zcl_lab_03_datatypes_fq.abap) | Conversiones / fechas | SÍ | PENDIENTE | Autocontenido | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_04_MESSAGE_FQ` | [source](./source/zcl_lab_04_message_fq.abap) | Texto / regex | SÍ | PENDIENTE | Recrear o refactorizar `TEXT-001` | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_05_INVOICE_FQ` | [source](./source/zcl_lab_05_invoice_fq.abap) | Strings + Open SQL | SÍ (variante original entregada) | PENDIENTE | Requiere reemplazar tabla de formación | `PUBLIC_SOURCE_READY_SANITIZED` |
| `ZCL_LAB_05_INVOICE_FQA` | [source](./source/zcl_lab_05_invoice_fqa.abap) | Strings / regex / escape | SÍ (variante original entregada) | PENDIENTE | Correo de ejemplo sanitizado | `PUBLIC_SOURCE_READY_SANITIZED` |
| `ZCL_LAB_06_CONDITION_FQ` | [source](./source/zcl_lab_06_condition_fq.abap) | Control de flujo / excepciones | SÍ (variante original entregada) | PENDIENTE | Requiere reemplazar tabla de formación | `PUBLIC_SOURCE_READY_SANITIZED` |
| `ZCL_LAB_07_TABLES_FQ` | [source](./source/zcl_lab_07_tables_fq.abap) | Tablas internas + Open SQL | SÍ (variante original entregada) | PENDIENTE | `/DMO/CONNECTION`; correos de ejemplo sanitizados | `PUBLIC_SOURCE_READY_SANITIZED` |
| `ZCL_LAB_07_TABLES_FQA` | [source](./source/zcl_lab_07_tables_fqa.abap) | Tablas internas avanzadas + Open SQL | SÍ | PENDIENTE | `/DMO/FLIGHT`, `/DMO/CONNECTION`, `/DMO/CARRIER` | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_08_FIELDSYMBOLS_FQ` | [source](./source/zcl_lab_08_fieldsymbols_fq.abap) | Field symbols | SÍ (variante original entregada) | PENDIENTE | Requiere reemplazar tabla de formación; correos sanitizados | `PUBLIC_SOURCE_READY_SANITIZED` |

## Semántica de estados

- `PUBLIC_SOURCE_READY`: seguro para revisión pública como código; la reverificación runtime actual sigue pendiente.
- `PUBLIC_SOURCE_READY_SANITIZED`: el código público difiere de la variante histórica entregada únicamente por sanitizaciones no funcionales de literales/comentarios claramente declaradas.
- `Ejecución histórica: SÍ` **no** significa que la ejecución actual haya sido revalidada.

Consulta el [Roadmap de Laboratorios Futuros](../docs/FUTURE_LAB_ROADMAP.es.md) para el plan de reproducibilidad.


## Límite de procedencia

Los documentos fuente privados son entregas personales de formación. Los metadatos del documento respaldan la procedencia bajo el perfil de Office de Francisco Quinteros, pero no se tratan como prueba independiente de cada elemento incrustado. Las capturas históricas permanecen privadas. Las variantes públicas que sanitizan literales de ejemplo se etiquetan expresamente y el runtime actual continúa pendiente.
