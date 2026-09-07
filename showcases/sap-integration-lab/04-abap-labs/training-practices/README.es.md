# Prácticas de Formación Curso 2/3

[English version](./README.md)

> **Alcance:** prácticas ABAP hands-on del Curso 3 de Logali Group (abapGit, ATC, ABAP Cleaner, Autorizaciones), implementadas personalmente durante formación estructurada y normalizadas para uso en portfolio. Este es un conjunto de candidatos separado de los 10 laboratorios históricos en [`../labs/`](../labs/README.es.md) — no cambia ningún estado allí.

## Qué es esto

Cuatro prácticas, cada una siguiendo el patrón: una plantilla de ejercicio suministrada por el instructor → la propia ejecución hands-on del propietario en su propio entorno trial de SAP, confirmada directamente por el propietario → normalización para portfolio (renombrado a la convención `_fq`, eliminación de declaraciones muertas). Ninguna de las cuatro se reclama como un algoritmo inventado de forma independiente; cada página en `docs/` indica la procedencia precisa.

## Estado actual

- **Formación:** SÍ tanto para Curso 2 como para Curso 3.
- **Ejecución hands-on:** `OWNER_CONFIRMED_HANDS_ON_EXECUTION` para las 4 prácticas de Curso 3 siguientes — el propietario confirma directamente haber tecleado, creado y ejecutado personalmente cada una durante formación estructurada. Curso 2 no produjo ningún artefacto de fuente guardado — ver `EVIDENCE_MATRIX.es.md`.
- **Source de portfolio:** `PUBLIC_NORMALIZED_SOURCE` — publicado bajo la propia nomenclatura `_fq` del portfolio. La copia renombrada en sí no ha sido reejecutada de forma independiente; la ejecución se refiere a la práctica de formación hands-on original confirmada por el propietario. No se afirma runtime actual para las copias renombradas.

## Prácticas

| Práctica | Objeto | Docs |
|---|---|---|
| abapGit | [`source/zcl_c3_01_projects_fq.abap`](./source/zcl_c3_01_projects_fq.abap) | [ABAPGIT_PRACTICE.es.md](./docs/ABAPGIT_PRACTICE.es.md) |
| ATC (ABAP Test Cockpit) | [`source/zcl_c3_02_atc_demo_fq.abap`](./source/zcl_c3_02_atc_demo_fq.abap) | [ATC_PRACTICE.es.md](./docs/ATC_PRACTICE.es.md) |
| ABAP Cleaner | [`source/zcl_c3_03_cleaner_demo_fq.abap`](./source/zcl_c3_03_cleaner_demo_fq.abap) | [ABAP_CLEANER_PRACTICE.es.md](./docs/ABAP_CLEANER_PRACTICE.es.md) |
| Autorizaciones | [`source/zcl_c3_04_dept_auth_fq.abap`](./source/zcl_c3_04_dept_auth_fq.abap) | [AUTHORIZATIONS_PRACTICE.es.md](./docs/AUTHORIZATIONS_PRACTICE.es.md) |

## Curso 2

Revisado por completo. No se encontró ningún fuente ABAP, texto de objeto DDIC, ni documento con código más allá del material de tutorial genérico propio del instructor — representado honestamente en `EVIDENCE_MATRIX.es.md` como `TRAINING = YES`, `HANDS_ON_PRACTICE = YES`, `OWNER_CONFIRMED_HANDS_ON_EXECUTION = YES`, `SAVED_SOURCE_ARTIFACT = NO`, `NO_CURRENT_RUNTIME_CLAIM`, en lugar de fabricar un archivo fuente.

## Navegación

- [Matriz de Evidencia](./EVIDENCE_MATRIX.es.md)
- [Mapa de Normalización](./NORMALIZATION_MAP.es.md)
- [Docs de prácticas](./docs/)
- [Fuente](./source/)

## Política de publicación

Esta carpeta excluye PDFs del instructor, archivos Word, capturas, el fuente de plantilla original del instructor con sufijo `_USER`, manuales de solución genéricos, texto de curso de terceros, y certificados. Solo se publican aquí el fuente `.abap` normalizado propio del propietario y documentación técnica original.
