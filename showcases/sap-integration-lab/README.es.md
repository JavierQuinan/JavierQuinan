# SAP Integration Lab — Evidencia Pública de Ingeniería

[English version](./README.md)

> **Idiomas:** Inglés + Español  
> **Alcance:** SAP ECC MM, SAP IS-U / Work Management, CRM/SD, diagnóstico ABAP e integración S/4HANA  
> **Regla de evidencia:** cada afirmación de esta página apunta a material que ya existe en este repositorio

Este laboratorio presenta conocimiento operativo sanitizado, guías técnicas originales, source ABAP revisable y un cliente de integración ejecutable. ECC y S/4HANA se mantienen separados para no presentar experiencia SAP clásica como si fuera runtime Clean Core.

## Evidencia disponible actualmente

### SAP ECC MM

[Línea de Evidencia MM](./01-ecc/mm/README.es.md)

**Inventario y Riesgo de Stock**

- source original ABAP Objects
- datasource read-only sobre `MARA / MARC / MARD`
- separación semántica planta vs. almacén
- source de reporte SALV
- 6 escenarios ABAP Unit deterministas revisados a nivel de source
- guía reproducible `SE24 / SE38 / SE93`
- guía operativa sanitizada de MM01 con evidencia visual

**Contratación de Servicios / `ZMM_CONTRACT_AUDIT`**

- guía sanitizada de contrato marco/servicios
- source ABAP original read-only sobre `EKKO / EKPO`
- diagnóstico de vigencia contractual
- source SALV
- 8 escenarios ABAP Unit deterministas revisados a nivel de source
- guía bilingüe de construcción y evidencia

**Purchasing Analytics / `ZMM_PURCH_ANALYTICS`**

- source original read-only `EBAN → EKKO / EKPO → EKET`
- control de categoría Purchase Order (`EKKO-BSTYP = 'F'`)
- diagnósticos `PR_ONLY`, referencia downstream y líneas de reparto
- source SALV
- 7 escenarios ABAP Unit deterministas revisados a nivel de source
- documentación bilingüe de source/build

Los packs ABAP ECC se presentan como **source revisable + validación estática determinista + guías reproducibles de construcción**. No se afirma activación corporativa SAP ni ejecución de ABAP Unit dentro de un sistema empresarial.

### SAP ECC IS-U / Work Management

[Línea de Evidencia IS-U / WM](./01-ecc/isu/README.es.md)

**`ZWM_STATUS_AUDIT_LAB`**

- source ABAP original read-only sobre `AUFK`, `JSTO`, `JEST`, `TJ02T`, `TJ30T` y `JCDS`
- interpretación de estados activos vs. históricos
- consideración del perfil de estado de usuario mediante `STSMA`
- datasource ECC + datasource sintético
- servicio ABAP Objects y reporte SALV
- 6 escenarios ABAP Unit deterministas revisados a nivel de source
- guía bilingüe `SE24 / SE38 / SE93`

**Evidencia operativa**

Las guías sanitizadas cubren:

- análisis de órdenes y layouts con `IW38`
- ciclo de vida de OT y cierre técnico
- conceptos de asignación/liberación/cierre mediante `IW32`
- monitoreo de background jobs con `SM37`
- procesamiento masivo controlado
- habilitación de materiales de sellos MM ↔ WM
- consistencia de equipamiento IS-U ↔ CRM
- alta de servicio fotovoltaico
- recuperación CRM ↔ IS-U de fin contractual/DCDE
- servicio ocasional con medición CRM → WM → CRM

### Diagnóstico técnico ECC

[ABAP Debugging & Technical Diagnostics](./01-ecc/technical-diagnostics/README.es.md)

Secuencia documentada:

`SE93 → SE24 / SE37 / SE38 / SE80 → /H / breakpoints / debugger → ST22 / SM21 → SM50 / SM66`

Las guías explican identificación de objetos, debugging, análisis de dumps, monitoreo de procesos y límites de escalamiento sin publicar credenciales corporativas ni source propietario.

### SAP ECC / CRM-SD

[Línea de Evidencia CRM-SD](./01-ecc/sd/README.es.md)

La evidencia publicada cubre un flujo sanitizado de facturación de servicios no energéticos: preparación de cliente/BP, contexto comercial, extensión de área de ventas, revisión de facturación/output y finalización del output fiscal configurado.

### SAP S/4HANA

[Línea de Evidencia S/4HANA](./02-s4hana/README.es.md)

**MM Procurement API Client**

- cliente TypeScript read-only sin dependencias externas
- lectura de Purchase Orders y Purchase Requisitions
- validación de respuestas OData
- abstracción de transporte
- correlation/request IDs
- obligación de HTTPS
- tests automatizados deterministas
- quality gate de GitHub Actions observado en **6 tests / 6 pass / 0 fail** con Node 22

El cliente demuestra ingeniería del lado de integración. No se afirma conectividad con un tenant S/4HANA real.

**Guía Técnica Migration Cockpit**

Guía basada en documentación que cubre objetos de migración, enfoques staging/direct transfer, mapping, simulación, monitoreo de migración y reconciliación.

**Guía Técnica ABAP Cloud / Clean Core**

Guía basada en documentación sobre objetos/APIs liberados, release contracts, gobierno orientado a ATC y límites Clean Core.

**Guía de Arquitectura RAP**

Guía que cubre CDS data model, behavior definition/implementation, projection, service definition/binding y exposición OData V4 usando un escenario de revisión de reposición MM.

### SAP Integration

[Guía de Ingeniería de Integración](./03-integration/README.es.md)

Documenta límites OData/REST/SOAP, idempotencia, mapeo de errores, correlation IDs, observabilidad y separación de secretos. El S/4 Procurement API Client es el ejemplo ejecutable de integración de este repositorio.

## Evidencia visual

[Índice de Evidencia Visual](./visual-evidence/README.es.md)

La evidencia visual se utiliza cuando la imagen puede publicarse legítimamente y sanitizarse sin perder su valor técnico. Actualmente se incluyen capturas sanitizadas de SAP MM01 que muestran acceso, selección de vistas, niveles organizativos y verificación de extensión de material.

No se republican screenshots de manuales elaborados por terceros ni material formativo externo. Su contenido técnico se transforma en guías explicativas originales.

## Matriz de evidencia

| Área | Evidencia disponible |
|---|---|
| ECC MM Inventario | ABAP source · SALV · 6 escenarios revisados · guía de construcción · visuales MM01 sanitizados |
| ECC MM Servicios | guía funcional · `ZMM_CONTRACT_AUDIT` · SALV · 8 escenarios revisados |
| ECC MM Purchasing | `ZMM_PURCH_ANALYTICS` · SALV · 7 escenarios revisados |
| ECC IS-U / WM | guías operativas · `ZWM_STATUS_AUDIT_LAB` · SALV · 6 escenarios revisados |
| ECC Diagnóstico | SE24/SE37/SE38/SE80/SE93 · debugger · ST22 · SM21 · SM50/SM66 |
| ECC CRM/SD | flujo sanitizado de facturación no energética |
| S/4HANA MM | cliente TypeScript Procurement API · **6/6 tests CI** |
| S/4HANA Migration | guía técnica de estudio/operación |
| ABAP Cloud / Clean Core | guía técnica de arquitectura/gobierno |
| RAP | guía técnica de arquitectura |
| Integración | guía de resiliencia/observabilidad OData/REST/SOAP + cliente TypeScript ejecutable |

## Política bilingüe

Los artefactos principales usan `README.md` para documentación técnica English-first y `README.es.md` para la versión completa en español. Los identificadores de código permanecen en inglés.

## Confidencialidad e integridad

La evidencia pública excluye empresa/cliente, materiales/proveedores/contratos/instalaciones/OT/BP/medidores reales, source Z propietario, endpoints internos, credenciales, transportes, certificados privados y capturas corporativas no sanitizadas.
