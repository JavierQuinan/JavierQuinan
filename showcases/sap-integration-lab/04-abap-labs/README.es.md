# Laboratorios Históricos de ABAP Cloud — Evidencia de Ingeniería

[English version](./README.md)

> **Alcance:** evidencia pública curada proveniente de entregas personales históricas de laboratorio ABAP Cloud a lo largo del currículo completo de 16 unidades de Curso 1.  
> **Límite de evidencia:** los 10 laboratorios hands-on conservan su evidencia documentada de ejecución histórica, incluyendo las propias capturas sanitizadas del propietario. No se afirma ni se exige una reejecución de runtime actual para este track del portfolio.

Este track complementa el [SAP Engineering Evidence Lab](../README.es.md). No reemplaza la [Matriz de Capacidades SAP](../00-profile/SAP_CAPABILITY_MATRIX.es.md) global del portfolio.

## Evidencia publicada

- **10 archivos de clases ABAP**, uno por cada laboratorio hands-on, en 8 temas base: tipos, aritmética, conversiones, procesamiento de texto/strings, estructuras de control, tablas internas y field symbols.
- **16/16 unidades de Curso 1 contabilizadas**: 10 con un laboratorio hands-on personal (source + las propias capturas sanitizadas del propietario), 6 unidades solo-teoría sin ejercicio de Laboratorio — ver el [catálogo de laboratorios](./labs/README.es.md) para el desglose completo.
- **Evidencia histórica de ejecución:** 10/10 documentada en entregas fuente privadas y mostrada vía las propias capturas sanitizadas del propietario, publicadas por laboratorio.
- **Claim de runtime actual:** ninguno — este track queda cerrado sobre evidencia histórica documentada; ver [Referencia de Runtime-Readiness](./runtime-readiness/README.es.md) para material opcional de reproducibilidad, no bloqueante.
- **5 guías derivadas de formación:** ABAP Dictionary/DDIC, abapGit, ATC, ABAP Cleaner y autorizaciones.
- **4 prácticas hands-on de Curso 3**, confirmadas por el propietario y normalizadas a source `_fq` — ver [Prácticas de Formación](./training-practices/README.es.md).
- **Documentación bilingüe:** inglés + español.

## Límites de evidencia actuales

- **CDS, RAP, Behavior Definitions, Service Definitions/Bindings, OData, y ABAP Unit:** no presentes en ningún lugar de los laboratorios históricos, Curso 2, ni las prácticas de Curso 3 — no existe ningún objeto de este tipo en este track, y ninguno se afirma.
- **abapGit, ATC, ABAP Cleaner, Autorizaciones:** existe evidencia hands-on vía [Prácticas de Formación de Curso 3](./training-practices/README.es.md) (`OWNER_CONFIRMED_HANDS_ON_EXECUTION`), separada de los 10 laboratorios históricos anteriores.
- **Curso 2 (ABAP Dictionary):** la formación hands-on ocurrió, pero no se guardó ningún artefacto de source para normalizar o publicar — ver [Prácticas de Formación — Matriz de Evidencia](./training-practices/EVIDENCE_MATRIX.es.md).
- **Dependencias de `ZEMP_LOGALI` y `TEXT-001`** (labs 05, 06, 08, 04): documentadas, con un reemplazo sintético `_fq` opcional y pasos de configuración en la [Referencia de Runtime-Readiness](./runtime-readiness/README.es.md) — no un requisito para cerrar este track.

Un estado como `NOT_FOUND_IN_THIS_LAB_SET` (ver [Matriz de Evidencia](./EVIDENCE_MATRIX.es.md)) se limita a este track histórico. El portfolio global ya contiene arquitectura RAP basada en documentación, patrones ABAP Unit revisados a nivel de source y un ejemplo ejecutable no-live de cliente OData.

## Límites de evidencia

Los metadatos del documento respaldan la procedencia bajo el perfil de Office de Francisco Quinteros para los 10 laboratorios hands-on, pero no se tratan como prueba independiente de cada elemento incrustado. Los archivos crudos del curso (PDFs de Documentación/Laboratorio/Solución/Test) no se republican — solo se publican el propio source `.abap` del propietario y sus propias capturas embebidas, cada una sanitizada según la nota documentada de su propio laboratorio. El contexto del curso, las dependencias externas y las decisiones de sanitización se declaran en el [catálogo de laboratorios](./labs/README.es.md).

## Navegación

- [Matriz de Evidencia](./EVIDENCE_MATRIX.es.md)
- [Catálogo Histórico de Labs y Source](./labs/README.es.md)
- [Referencia de Runtime-Readiness](./runtime-readiness/README.es.md) (material opcional de reproducibilidad)
- [Prácticas de Formación de Curso 3](./training-practices/README.es.md)
- [Convenciones de Nomenclatura](./NAMING_CONVENTIONS.es.md)
- [Guías derivadas de formación](./guides/)
- [Formación y Credenciales central](../00-profile/TRAINING_AND_CREDENTIALS.es.md)

## Política de publicación

Este track excluye archivos crudos de cursos, PDFs de certificados, QR/identificadores de credenciales, credenciales y registros privados de auditoría. Las capturas publicadas se limitan a las propias capturas embebidas del propietario, sanitizadas para eliminar identificadores de cuenta, hostnames de tenant, nombres de usuario técnicos y datos del entorno de formación. El alcance de este track está completo sobre evidencia de ejecución histórica documentada y formación hands-on confirmada por el propietario.
