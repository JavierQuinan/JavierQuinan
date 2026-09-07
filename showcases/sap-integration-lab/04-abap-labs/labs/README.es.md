# Catálogo de Laboratorios Históricos e Índice de Código

[English version](./README.md)

> Diez archivos ABAP curados provenientes de entregas personales históricas de laboratorio. Los registros privados de procedencia por laboratorio se conservan fuera del repositorio; este catálogo público declara contexto de formación, dependencias y sanitización sin publicar material original del curso ni capturas históricas.

| Objeto | Lab | Capacidad principal | Ejecución histórica | Claim de runtime actual | Nota de reproducibilidad | Estado de publicación |
|---|---|---|---|---|---|---|
| `ZCL_LAB_01_VAR_FQ` | [source](./source/zcl_lab_01_var_fq.abap) | Tipos / ABAP Core | SÍ | NO_CURRENT_RUNTIME_CLAIM | Requiere datos demo `/DMO/EMPLOYEE_HR` | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_02_ARITHMETIC_FQ` | [source](./source/zcl_lab_02_arithmetic_fq.abap) | Aritmética / ABAP Core | SÍ | NO_CURRENT_RUNTIME_CLAIM | Autocontenido | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_03_DATATYPES_FQ` | [source](./source/zcl_lab_03_datatypes_fq.abap) | Conversiones / fechas | SÍ | NO_CURRENT_RUNTIME_CLAIM | Autocontenido | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_04_MESSAGE_FQ` | [source](./source/zcl_lab_04_message_fq.abap) | Texto / regex | SÍ | NO_CURRENT_RUNTIME_CLAIM | Recrear o refactorizar `TEXT-001` | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_05_INVOICE_FQ` | [source](./source/zcl_lab_05_invoice_fq.abap) | Strings + Open SQL | SÍ (variante original entregada) | NO_CURRENT_RUNTIME_CLAIM | Requiere reemplazar tabla de formación | `PUBLIC_SOURCE_READY_SANITIZED` |
| `ZCL_LAB_05_INVOICE_FQA` | [source](./source/zcl_lab_05_invoice_fqa.abap) | Strings / regex / escape | SÍ (variante original entregada) | NO_CURRENT_RUNTIME_CLAIM | Correo de ejemplo sanitizado | `PUBLIC_SOURCE_READY_SANITIZED` |
| `ZCL_LAB_06_CONDITION_FQ` | [source](./source/zcl_lab_06_condition_fq.abap) | Control de flujo / excepciones | SÍ (variante original entregada) | NO_CURRENT_RUNTIME_CLAIM | Requiere reemplazar tabla de formación | `PUBLIC_SOURCE_READY_SANITIZED` |
| `ZCL_LAB_07_TABLES_FQ` | [source](./source/zcl_lab_07_tables_fq.abap) | Tablas internas + Open SQL | SÍ (variante original entregada) | NO_CURRENT_RUNTIME_CLAIM | `/DMO/CONNECTION`; correos de ejemplo sanitizados | `PUBLIC_SOURCE_READY_SANITIZED` |
| `ZCL_LAB_07_TABLES_FQA` | [source](./source/zcl_lab_07_tables_fqa.abap) | Tablas internas avanzadas + Open SQL | SÍ | NO_CURRENT_RUNTIME_CLAIM | `/DMO/FLIGHT`, `/DMO/CONNECTION`, `/DMO/CARRIER` | `PUBLIC_SOURCE_READY` |
| `ZCL_LAB_08_FIELDSYMBOLS_FQ` | [source](./source/zcl_lab_08_fieldsymbols_fq.abap) | Field symbols | SÍ (variante original entregada) | NO_CURRENT_RUNTIME_CLAIM | Requiere reemplazar tabla de formación; correos sanitizados | `PUBLIC_SOURCE_READY_SANITIZED` |

## Semántica de estados

- `PUBLIC_SOURCE_READY`: seguro para revisión pública como código, respaldado por evidencia documentada de ejecución histórica. No se afirma ni se exige runtime actual para este track.
- `PUBLIC_SOURCE_READY_SANITIZED`: el código público difiere de la variante histórica entregada únicamente por sanitizaciones no funcionales de literales/comentarios claramente declaradas.
- `Ejecución histórica: SÍ` significa que existe evidencia de ejecución histórica — es un claim distinto y más estrecho que la reejecución en un entorno actual, que este track no afirma.

Una [referencia opcional y no bloqueante de reproducibilidad](../runtime-readiness/README.es.md) documenta análisis de dependencias y 3 borradores de source runtime-ready para quien más adelante decida reejecutar estos laboratorios — es material de apoyo, no un requisito de este track.

## Límite de procedencia

Los documentos fuente privados son entregas personales de formación. Los metadatos del documento respaldan la procedencia bajo el perfil de Office de Francisco Quinteros, pero no se tratan como prueba independiente de cada elemento incrustado. Las capturas históricas permanecen privadas. Las variantes públicas que sanitizan literales de ejemplo se etiquetan expresamente; este track no afirma runtime actual.
