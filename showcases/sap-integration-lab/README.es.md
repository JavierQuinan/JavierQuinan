# SAP Engineering Evidence Lab — Portafolio Técnico Público

[English version](./README.md)

> **Idiomas:** Inglés + Español  
> **Alcance:** SAP ECC MM, SAP IS-U / Work Management, CRM/SD, diagnóstico técnico ABAP, laboratorios históricos hands-on de ABAP Cloud y ejemplos no-live de ingeniería client-side para S/4HANA.  
> **Regla de evidencia:** las clases de evidencia son explícitas; documentación, ejecución histórica de laboratorio, source público y runtime actual no se tratan como equivalentes.

Este showcase combina conocimiento enterprise sanitizado con artefactos de ingeniería revisables. **No** afirma runtime de integración real con S/4HANA, implementación SAP Integration Suite/CPI, interfaces OData/SOAP productivas ni ejecución actual de los laboratorios históricos ABAP Cloud salvo que un artefacto específico lo indique.

## Modelo de evidencia

Se usan seis niveles de evidencia en este lab, y **no son equivalentes** — cada uno hace un claim más estrecho o más amplio que los demás:

| Nivel | Clase | Significado |
|---|---|---|
| 1 | `ENTERPRISE_VERIFIED` | Conocimiento operativo sanitizado derivado de trabajo SAP real |
| 2 | `PUBLIC_SOURCE_EVIDENCE` | Existe source público revisable en este repositorio |
| 3 | `HISTORICAL_EXECUTION_VERIFIED` | Source de laboratorio personal con evidencia documentada de ejecución histórica; no se afirma ni se exige runtime actual |
| 4 | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` | Práctica de formación confirmada directamente por el propietario como tecleada, creada y ejecutada personalmente; no sobrevivió ningún artefacto independiente más allá de esa confirmación |
| 5 | `DOCUMENTATION_GROUNDED` | Estudio técnico/arquitectónico basado en documentación de producto |
| 6 | `TRAINING_ONLY` | Formación completada sin artefacto de source guardado y sin claim de runtime |

Clases de apoyo, más estrechas: `PUBLIC_NORMALIZED_SOURCE` (el source de una práctica publicado bajo la propia nomenclatura `_fq` del portfolio — la copia renombrada en sí no se reejecuta de forma independiente), `EXECUTABLE_NON_LIVE_EXAMPLE` (ejemplo ejecutable/testeado sin afirmar conectividad real), `NOT_YET_EVIDENCED` (sin base de portfolio todavía para un claim hands-on).

## Evidencia disponible actualmente

### SAP ECC MM — `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE`

[Línea de Evidencia MM](./01-ecc/mm/README.es.md)

- Análisis de inventario/riesgo de stock con source ABAP read-only sobre `MARA / MARC / MARD`, SALV y escenarios revisados a nivel de source.
- Diagnóstico de contratación de servicios/contratos marco con `EKKO / EKPO`.
- Analítica de compras sobre `EBAN → EKKO / EKPO → EKET`.
- Documentación operativa sanitizada y guías reproducibles de construcción.

Los packs ECC se presentan como source revisable más revisión determinista del código/escenarios. No se afirma runtime corporativo de ABAP Unit.

### SAP ECC IS-U / Work Management — `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE`

[Línea de Evidencia IS-U / WM](./01-ecc/isu/README.es.md)

La evidencia publicada incluye `ZWM_STATUS_AUDIT_LAB`, análisis de estados/históricos de OT, `IW38/IW32`, jobs, gobierno de rangos, regularización de estados de dispositivos, sellos, recuperación CRM ↔ IS-U, monitoreo/reproceso GIS ↔ SAP y otros flujos operativos sanitizados.

### Diagnóstico técnico ECC — `ENTERPRISE_VERIFIED`

[ABAP Debugging & Technical Diagnostics](./01-ecc/technical-diagnostics/README.es.md)

Secuencia documentada:

`SE93 → SE24 / SE37 / SE38 / SE80 → debugger → ST22 / SM21 → SM50 / SM66`

### SAP ECC / CRM-SD — `ENTERPRISE_VERIFIED`

[Línea de Evidencia CRM-SD](./01-ecc/sd/README.es.md)

La evidencia sanitizada cubre un flujo de facturación de servicios no energéticos: preparación cliente/BP, contexto de área de ventas, revisión billing/output y finalización del output fiscal configurado.

### Laboratorios históricos ABAP Cloud — `HISTORICAL_EXECUTION_VERIFIED`

[Laboratorios Históricos ABAP Cloud](./04-abap-labs/README.es.md)

- 10 archivos source de clases ABAP personales en 8 temas base.
- Evidencia histórica de ejecución: **10/10** documentada en entregas fuente privadas.
- No se afirma ni se exige runtime actual para este track.
- Temas históricos demostrados: ABAP Core, ABAP Objects, classrun, tablas internas, field symbols, Open SQL y manejo de excepciones.
- Cinco guías derivadas de formación cubren DDIC, abapGit, ATC, ABAP Cleaner y autorizaciones sin presentarlas como labs ejecutados.
- Una [referencia opcional de reproducibilidad](./04-abap-labs/runtime-readiness/README.es.md) documenta análisis de dependencias, una fixture sintética y 3 borradores de source runtime-ready — material de apoyo, no un bloqueador de portfolio.

No se republican screenshots históricos ni material bruto de los cursos.

### Prácticas de formación de Curso 3 — `OWNER_CONFIRMED_HANDS_ON_EXECUTION` + `PUBLIC_NORMALIZED_SOURCE`

[Prácticas de Formación de Curso 3](./04-abap-labs/training-practices/README.es.md)

- 4 prácticas hands-on (abapGit, ATC, ABAP Cleaner, Autorizaciones) implementadas personalmente por el propietario durante formación estructurada, confirmadas directamente por él y normalizadas a la convención `_fq` del portfolio.
- No sobrevivió ningún artefacto independiente (una captura propia, una exportación propia de herramienta) más allá de esa confirmación — revelado en lugar de ocultado.
- Curso 2 (práctica hands-on de ABAP Dictionary) se documenta como `TRAINING_ONLY`: la formación y la práctica hands-on ocurrieron, pero no se guardó ningún artefacto de source para normalizar o publicar.

### SAP S/4HANA — clases de evidencia mixtas

[Línea de Evidencia S/4HANA](./02-s4hana/README.es.md)

**MM Procurement API Client — `EXECUTABLE_NON_LIVE_EXAMPLE`**

- Cliente TypeScript read-only para PO/PR sin dependencias externas.
- Validación de respuestas OData, obligación HTTPS y correlación de requests.
- Tests automatizados deterministas con un gate de GitHub Actions previamente observado de **6/6 pass**.
- **No se afirma conectividad con un tenant S/4HANA real.**

**Migration Cockpit — `DOCUMENTATION_GROUNDED`**  
Guía de estudio/técnica sobre objetos de migración, staging/direct transfer, mapping, simulación, monitoreo y reconciliación.

**ABAP Cloud / Clean Core — `DOCUMENTATION_GROUNDED` + contexto de formación**  
Guía sobre objetos/APIs liberados, release contracts y gobierno orientado a ATC.

**RAP — `DOCUMENTATION_GROUNDED`**  
Arquitectura CDS → behavior → projection → service definition/binding → OData V4. No se afirma runtime RAP.

### Arquitectura de integración y patrones client-side — `DOCUMENTATION_GROUNDED` + `EXECUTABLE_NON_LIVE_EXAMPLE`

[Guía de Arquitectura de Integración](./03-integration/README.es.md)

El material documenta límites OData/REST/SOAP, idempotencia, mapeo de errores, correlation IDs, observabilidad y separación de secretos. El cliente de procurement S/4 es el ejemplo ejecutable. **Esto no se presenta como evidencia de una integración SAP real en runtime.**

## Claims que explícitamente no se hacen

El portfolio actual no afirma evidencia hands-on/runtime para:

- SAP Integration Suite / CPI;
- conectividad real a APIs S/4HANA;
- implementación productiva de servicios OData o SOAP;
- runtime IDoc o RFC/BAPI;
- Event Mesh;
- runtime RAP/service binding;
- ejecución actual de ABAP Unit para el set histórico de labs.

## Evidencia visual

[Índice de Evidencia Visual](./visual-evidence/README.es.md)

Solo se publican capturas operativas legítimas y sanitizadas. No se republican manuales del empleador, screenshots de formación de terceros ni evidencia bruta de los cursos.

## Referencias oficiales SAP

[Índice de Referencias Oficiales SAP](./OFFICIAL_SAP_REFERENCES.es.md)

La documentación oficial SAP respalda conceptos estándar; no sustituye evidencia runtime.

## Matriz global de capacidades

[Matriz de Capacidades SAP](./00-profile/SAP_CAPABILITY_MATRIX.es.md)

La matriz central reconcilia experiencia enterprise, labs históricos, source público, ejemplos ejecutables no-live, estudio basado en documentación y formación.

## Política bilingüe

Los artefactos principales usan `README.md` para documentación English-first y `README.es.md` para la versión completa en español. Los identificadores de código se conservan.

## Confidencialidad e integridad

La evidencia pública excluye identidades de empresa/cliente, objetos reales de negocio, source propietario, endpoints internos, credenciales, certificados privados y screenshots enterprise/formativos no sanitizados.
