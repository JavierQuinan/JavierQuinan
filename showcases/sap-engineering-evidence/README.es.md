# SAP Engineering Evidence Lab — Portafolio Técnico Público

[English version](./README.md)

> **Idiomas:** Inglés + Español  
> **Alcance enterprise principal:** SAP ECC MM, SAP IS-U / Work Management y diagnóstico técnico SAP.  
> **Contexto enterprise complementario:** flujos específicos CRM ↔ IS-U y CRM/SD donde existe evidencia sanitizada; CRM no se posiciona como especialidad principal.  
> **Alcance formativo / SAP moderno:** formación S/4HANA multidominio completada, laboratorios históricos hands-on de ABAP Cloud, prácticas ABAP de formación completadas, estudio SAP moderno basado en documentación y ejemplos no-live client-side para S/4HANA.  
> **Regla de evidencia:** las clases de evidencia son explícitas; experiencia enterprise, contexto funcional complementario, credenciales de formación, ejecución histórica, formación hands-on confirmada, source público, estudio basado en documentación y ejemplos ejecutables no-live no se tratan como equivalentes.

Este showcase combina conocimiento enterprise sanitizado con artefactos de ingeniería revisables. **No** afirma implementación productiva S/4HANA, conectividad live a APIs S/4HANA, implementación SAP Integration Suite/CPI, interfaces OData/SOAP productivas ni capacidades runtime no respaldadas por un artefacto específico.

## Modelo de evidencia

| Clase | Significado |
|---|---|
| `ENTERPRISE_VERIFIED` | Conocimiento operativo sanitizado derivado de trabajo SAP real |
| `PUBLIC_SOURCE_EVIDENCE` | Existe source público revisable en este repositorio |
| `HISTORICAL_EXECUTION_VERIFIED` | Source de laboratorio personal con evidencia documentada de ejecución histórica |
| `OWNER_CONFIRMED_HANDS_ON_EXECUTION` | Práctica de formación confirmada por el propietario como tecleada, creada y ejecutada personalmente |
| `PUBLIC_NORMALIZED_SOURCE` | Source revisable de práctica publicado bajo la propia nomenclatura `_fq` del portfolio |
| `TRAINING_CREDENTIAL` | Credencial de formación de tercero completada; acredita formación, no experiencia productiva de implementación ni certificación oficial de SAP |
| `EXECUTABLE_NON_LIVE_EXAMPLE` | Ejemplo ejecutable/testeado sin claim de conectividad SAP real |
| `DOCUMENTATION_GROUNDED` | Estudio técnico/arquitectónico basado en documentación de producto |
| `TRAINING_ONLY` | Formación completada sin artefacto de source guardado y sin claim de runtime |

## Evidencia disponible actualmente

### SAP ECC MM — `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE`

[Línea de Evidencia MM](./01-ecc/mm/README.es.md)

- Análisis de inventario/riesgo de stock con source ABAP read-only sobre `MARA / MARC / MARD`, SALV y escenarios revisados.
- Diagnóstico de contratación de servicios/contratos marco con `EKKO / EKPO`.
- Analítica de compras sobre `EBAN → EKKO / EKPO → EKET`.
- Documentación operativa sanitizada y guías reproducibles de construcción.

Los packs ECC se presentan como source revisable más revisión determinista del código/escenarios. No se afirma runtime corporativo de ABAP Unit.

### SAP ECC IS-U / Work Management — `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE`

[Línea de Evidencia IS-U / WM](./01-ecc/isu/README.es.md)

La evidencia publicada incluye `ZWM_STATUS_AUDIT_LAB`, análisis de estados/históricos de OT, `IW38/IW32`, jobs, gobierno de rangos, regularización de estados de dispositivos, habilitación de materiales/sellos, recuperación CRM ↔ IS-U, monitoreo/reproceso GIS ↔ SAP y otros flujos operativos sanitizados.

### Diagnóstico técnico ECC — `ENTERPRISE_VERIFIED`

[ABAP Debugging & Technical Diagnostics](./01-ecc/technical-diagnostics/README.es.md)

Secuencia documentada:

`SE93 → SE24 / SE37 / SE38 / SE80 → debugger → ST22 / SM21 → SM50 / SM66`

### SAP ECC / CRM-SD — contexto funcional complementario · `ENTERPRISE_VERIFIED`

[Línea de Evidencia CRM-SD](./01-ecc/sd/README.es.md)

La evidencia sanitizada cubre un flujo específico de facturación de servicios no energéticos: preparación cliente/BP, contexto de área de ventas, revisión billing/output y finalización del output fiscal configurado. Esta evidencia se conserva como contexto funcional enterprise; **no** se utiliza para posicionar CRM como especialidad principal.

### Curso 1 — laboratorios históricos ABAP Cloud

[Laboratorios Históricos ABAP Cloud](./04-abap-labs/README.es.md)

- **16/16 unidades del currículo contabilizadas.**
- **10 laboratorios hands-on** con evidencia documentada de ejecución histórica.
- **10 sources `.abap` públicos preservados** con nomenclatura personal `_fq`.
- **20 capturas propias sanitizadas de Eclipse ADT** extraídas de las entregas Word personales originales.
- Seis unidades son temas curriculares solo-teoría y se identifican explícitamente como no-laboratorios.
- Temas históricos demostrados: ABAP Core, ABAP Objects, classrun, tablas internas, field symbols, Open SQL y manejo de excepciones.

### Curso 2 — ABAP Cloud Dictionary / DDIC

Se documenta formación hands-on completada en dominios, elementos de datos, tablas de base de datos, ajustes de persistencia, lock objects, relaciones entre tablas y Dynamic Cache. No existe un artefacto de source/export guardado para publicar y no se fabrica source para cubrir esa ausencia.

Contexto de formación: [Formación y Credenciales SAP](./00-profile/TRAINING_AND_CREDENTIALS.es.md) y [Guía de ABAP Cloud Dictionary](./04-abap-labs/guides/ABAP_CLOUD_DICTIONARY_GUIDE.es.md).

### Curso 3 — `OWNER_CONFIRMED_HANDS_ON_EXECUTION` + `PUBLIC_NORMALIZED_SOURCE`

[Prácticas de Formación de Curso 3](./04-abap-labs/training-practices/README.es.md)

Cuatro prácticas hands-on están documentadas con procedencia formativa precisa y source público normalizado `_fq`:

- abapGit — `zcl_c3_01_projects_fq`
- ATC — `zcl_c3_02_atc_demo_fq`
- ABAP Cleaner — `zcl_c3_03_cleaner_demo_fq`
- Autorizaciones — `zcl_c3_04_dept_auth_fq`

El claim de ejecución corresponde a la práctica hands-on original confirmada por el propietario. Las copias públicas normalizadas se presentan como evidencia de source y no llevan un claim separado de runtime actual.

### SAP S/4HANA — clases de evidencia mixtas

[Línea de Evidencia S/4HANA](./02-s4hana/README.es.md)

**Formación funcional multidominio — `TRAINING_CREDENTIAL`**

- **Especialización Internacional en SAP S/4 HANA desde cero — 240 horas académicas**.
- Registro de módulos aprobados: **MM 20/20 · PP 16/20 · SD 18/20 · FI 18/20 · PM 18/20**.
- Promedio académico final: **18/20**.
- Esta credencial acredita formación S/4HANA completada; no se presenta como certificación oficial SAP ni como experiencia productiva de implementación, conversión u operación S/4HANA.

[Registro de formación y credenciales](./00-profile/TRAINING_AND_CREDENTIALS.es.md)

**MM Procurement API Client — `EXECUTABLE_NON_LIVE_EXAMPLE`**

- Cliente TypeScript read-only para PO/PR sin dependencias externas.
- Validación de respuestas OData, obligación HTTPS y correlación de requests.
- Tests automatizados deterministas con un gate de GitHub Actions previamente observado de **6/6 pass**.
- Sin claim de conectividad con un tenant S/4HANA real.

**Migration Cockpit — `DOCUMENTATION_GROUNDED`**  
Guía técnica sobre objetos de migración, staging/direct transfer, mapping, simulación, monitoreo y reconciliación.

**ABAP Cloud / Clean Core — `DOCUMENTATION_GROUNDED` + contexto de formación completada**  
Guía sobre objetos/APIs liberados, release contracts y gobierno orientado a ATC.

**RAP — `DOCUMENTATION_GROUNDED`**  
Arquitectura CDS → behavior → projection → service definition/binding → OData V4. No se afirma runtime RAP.

### Estudio de arquitectura de APIs externas — `DOCUMENTATION_GROUNDED` + `EXECUTABLE_NON_LIVE_EXAMPLE`

[Estudio de Arquitectura de APIs Externas](./03-api-architecture/README.es.md)

Este material documenta conceptos OData/REST/SOAP como idempotencia, mapeo de errores, correlation IDs, observabilidad y separación de secretos. El cliente procurement S/4 es el único ejemplo ejecutable relacionado con SAP y es explícitamente local/no-live. Esta sección **no** constituye evidencia de implementación productiva de interfaces SAP, middleware, CPI/Integration Suite ni conectividad SAP real.

## Límites de claims

Este portfolio no afirma runtime de SAP Integration Suite/CPI, conectividad live a APIs S/4HANA, OData/SOAP productivo, runtime IDoc/RFC/BAPI, Event Mesh, runtime RAP/service-binding ni ninguna otra capacidad que no esté respaldada por la evidencia enlazada arriba. La formación S/4HANA y ABAP Cloud completada no se eleva silenciosamente a experiencia productiva de proyecto.

## Formación y credenciales

[Formación y Credenciales SAP](./00-profile/TRAINING_AND_CREDENTIALS.es.md)

Los registros recruiter-facing de formación fueron reconciliados contra los archivos reales de certificados del propietario. Las credenciales públicas seleccionadas para el portfolio se respaldan con un único PDF/imagen canónica del certificado y se indexan desde el [índice general de credenciales](../../docs/CREDENTIALS.es.md). La evidencia de certificados se mantiene separada del material bruto del curso y no eleva la clasificación de la credencial más allá de la redacción del documento emisor.

## Evidencia visual

[Índice de Evidencia Visual](./visual-evidence/README.es.md)

Solo se publican visuales legítimos y sanitizados. El track de Curso 1 incluye 20 capturas propias de Eclipse ADT. Se excluyen screenshots sensibles de empresa/cliente, páginas con branding del instructor y activos crudos de formación de terceros.

## Referencias oficiales SAP

[Índice de Referencias Oficiales SAP](./OFFICIAL_SAP_REFERENCES.es.md)

La documentación oficial SAP respalda conceptos estándar; no sustituye evidencia hands-on.

## Matriz global de capacidades

[Matriz de Capacidades SAP](./00-profile/SAP_CAPABILITY_MATRIX.es.md)

La matriz central reconcilia experiencia enterprise, contexto funcional complementario, credenciales de formación, labs históricos, formación hands-on completada, source público, ejemplos ejecutables no-live y estudio basado en documentación.

## Estado de sanitización

[Estado de Sanitización Pública SAP](./SANITIZATION_STATUS.es.md)

## Confidencialidad e integridad

La evidencia pública excluye identidades de empresa/cliente, identificadores reales de objetos de negocio, source propietario, endpoints internos, credenciales secretas y datos enterprise/formativos no sanitizados. Los PDFs/imágenes canónicos de certificados seleccionados intencionalmente como evidencia profesional pública están permitidos bajo la política de credenciales.
