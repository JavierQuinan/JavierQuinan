# Laboratorios Históricos de ABAP Cloud — Evidencia de Ingeniería

[English version](./README.md)

> **Alcance:** evidencia pública curada proveniente de entregas personales históricas de laboratorio ABAP Cloud a lo largo del currículo completo de 16 unidades de Curso 1.  
> **Límite de evidencia:** los 10 laboratorios hands-on conservan evidencia documentada de ejecución histórica, incluyendo las propias capturas sanitizadas del propietario. Este track no afirma runtime actual.

Este track complementa el [SAP Engineering Evidence Lab](../README.es.md). No reemplaza la [Matriz de Capacidades SAP](../00-profile/SAP_CAPABILITY_MATRIX.es.md) global del portfolio.

## Evidencia publicada

- **10 archivos de clases ABAP**, uno por cada laboratorio hands-on, en 8 temas base: tipos, aritmética, conversiones, procesamiento de texto/strings, estructuras de control, tablas internas y field symbols.
- **16/16 unidades de Curso 1 contabilizadas**: 10 con un laboratorio hands-on personal (source + las propias capturas sanitizadas del propietario), 6 unidades solo-teoría sin ejercicio de Laboratorio — ver el [catálogo de laboratorios](./labs/README.es.md) para el desglose completo.
- **Evidencia histórica de ejecución:** 10/10 documentada en las entregas personales originales y representada públicamente por 20 capturas propias sanitizadas.
- **5 guías derivadas de formación:** ABAP Dictionary/DDIC, abapGit, ATC, ABAP Cleaner y autorizaciones.
- **4 prácticas hands-on de Curso 3**, confirmadas por el propietario y normalizadas a source `_fq` — ver [Prácticas de Formación](./training-practices/README.es.md).
- **Documentación bilingüe:** inglés + español.

## Límites de evidencia actuales

- **CDS, RAP, Behavior Definitions, Service Definitions/Bindings, OData y ABAP Unit:** no se representa ningún objeto hands-on de estos tipos dentro de este track histórico/de prácticas de curso, y ninguno se afirma aquí.
- **abapGit, ATC, ABAP Cleaner, Autorizaciones:** existe evidencia hands-on vía [Prácticas de Formación de Curso 3](./training-practices/README.es.md) (`OWNER_CONFIRMED_HANDS_ON_EXECUTION`), separada de los 10 laboratorios históricos.
- **Curso 2 (ABAP Dictionary):** la formación hands-on ocurrió, pero no existe un artefacto de source guardado para publicar — ver [Prácticas de Formación — Matriz de Evidencia](./training-practices/EVIDENCE_MATRIX.es.md).
- **Dependencias históricas específicas del curso:** los sources originales se conservan sin cambios cuando hacen referencia a objetos como `ZEMP_LOGALI` o `TEXT-001`; esas referencias forman parte del contexto histórico preservado y no se presentan como evidencia de runtime actual.

Un estado como `NOT_EVIDENCED_IN_THIS_LAB_SET` (ver [Matriz de Evidencia](./EVIDENCE_MATRIX.es.md)) se limita a este track. El portfolio global contiene por separado arquitectura RAP basada en documentación, patrones ABAP Unit revisados a nivel de source y un ejemplo ejecutable no-live de cliente OData.

## Procedencia y límite de publicación

Los metadatos del documento respaldan la procedencia bajo el perfil de Office de Francisco Quinteros para los 10 laboratorios hands-on, pero no se tratan como prueba independiente de cada elemento incrustado. Los archivos crudos del curso (PDFs de Documentación/Laboratorio/Solución/Test) no se republican. La evidencia pública se limita al propio source `.abap` del propietario y sus propias capturas embebidas, sanitizadas según la nota documentada de cada laboratorio.

## Navegación

- [Matriz de Evidencia](./EVIDENCE_MATRIX.es.md)
- [Catálogo Histórico de Labs y Source](./labs/README.es.md)
- [Prácticas de Formación de Curso 3](./training-practices/README.es.md)
- [Convenciones de Nomenclatura](./NAMING_CONVENTIONS.es.md)
- [Guías derivadas de formación](./guides/)
- [Formación y Credenciales central](../00-profile/TRAINING_AND_CREDENTIALS.es.md)

## Política de publicación

Este track excluye archivos crudos de cursos, PDFs de certificados, QR/identificadores de credenciales y registros privados de auditoría. Las capturas publicadas se limitan a las propias capturas embebidas del propietario, sanitizadas para eliminar identificadores de cuenta, hostnames de tenant, nombres de usuario técnicos y datos del entorno de formación. El alcance está completo sobre evidencia de ejecución histórica documentada y formación hands-on confirmada por el propietario.
