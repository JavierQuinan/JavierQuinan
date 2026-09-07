# Catálogo de Laboratorios Históricos

[English version](./README.md)

> Curso 1 (Logali Group) es un currículo de 16 unidades. 10 unidades incluyen un laboratorio hands-on personal con una entrega en Word y evidencia embebida, confirmada como trabajo propio del propietario vía metadatos del documento; las otras 6 unidades son solo-teoría (sin ejercicio de Laboratorio, sin documento Word personal) y se listan por separado abajo como temas de currículo, no laboratorios.

## Los 10 laboratorios hands-on

| Lab | Unidad | Tema | Objeto | Imágenes de evidencia |
|---|---|---|---|---|
| [lab-01](./lab-01/README.es.md) | 2 | Variables y tipos de datos | `ZCL_LAB_01_VAR_FQ` | 1 |
| [lab-02](./lab-02/README.es.md) | 3 | Operaciones aritméticas | `ZCL_LAB_02_ARITHMETIC_FQ` | 1 |
| [lab-03](./lab-03/README.es.md) | 4 | Conversiones de tipos de datos | `ZCL_LAB_03_DATATYPES_FQ` | 2 |
| [lab-04](./lab-04/README.es.md) | 5 | Procesamiento de campos de texto | `ZCL_LAB_04_MESSAGE_FQ` | 1 |
| [lab-05](./lab-05/README.es.md) | 6 | Operaciones con strings (Parte I) | `ZCL_LAB_05_INVOICE_FQ` | 1 |
| [lab-05a](./lab-05a/README.es.md) | 7 | Operaciones con strings (Parte II) | `ZCL_LAB_05_INVOICE_FQA` | 1 |
| [lab-06](./lab-06/README.es.md) | 8 | Estructuras de control | `ZCL_LAB_06_CONDITION_FQ` | 2 |
| [lab-07](./lab-07/README.es.md) | 10 | Tablas internas (Parte I) | `ZCL_LAB_07_TABLES_FQ` | 3 |
| [lab-07a](./lab-07a/README.es.md) | 11 | Tablas internas (Parte II, avanzado) | `ZCL_LAB_07_TABLES_FQA` | 7 |
| [lab-08](./lab-08/README.es.md) | 13 | Field symbols | `ZCL_LAB_08_FIELDSYMBOLS_FQ` | 1 |

Cada carpeta de laboratorio contiene un README bilingüe (estado, procedencia, objeto, qué demuestra, evidencia propia embebida, nota de sanitización) y enlaza a su source `.abap` en [`../source/`](../source/). Los archivos fuente no se modifican — el propio README de cada laboratorio indica exactamente qué, si algo, fue redactado de sus capturas y por qué.

## Temas del currículo de Curso 1 sin laboratorio hands-on (6 de 16 unidades)

Estas unidades se estudiaron (PDF de teoría, y en la mayoría de los casos un registro personal de intento de examen) pero no tienen ejercicio de Laboratorio, ni entrega personal en Word, ni captura personal embebida — así que no se crea carpeta de laboratorio para ellas, para evitar representar un tema como hands-on cuando no existe ningún artefacto hands-on.

| Unidad | Tema |
|---|---|
| 1 | Herramientas y entornos de desarrollo (tooling de Eclipse ADT) |
| 9 | Estructuras y Tipos Locales |
| 12 | Expresiones Constructor |
| 14 | Depuración de Programas |
| 15 | Programación dinámica |
| 16 | Performance |

## Semántica de estados

- `HISTORICAL_EXECUTION_VERIFIED`: existe source más evidencia documentada de ejecución histórica, incluyendo la(s) propia(s) captura(s) del propietario de la entrega de formación original.
- `TRAINING_ONLY` (tabla de temas de currículo arriba): estudiado, sin ningún artefacto hands-on guardado.

## Límite de procedencia

Los documentos fuente privados son entregas personales de formación. Los metadatos del documento (`docProps/core.xml`) respaldan la procedencia bajo el perfil de Office de Francisco Quinteros para cada uno de los 10 laboratorios hands-on anteriores. Los PDFs completos del curso (Documentación/Laboratorio/Solución/Test) no se republican — solo se publican el propio source `.abap` del propietario y sus propias capturas embebidas, sanitizadas según la nota propia de cada laboratorio.
