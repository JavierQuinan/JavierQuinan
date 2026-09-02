# SAP Integration Lab — Evidencia Pública de Ingeniería

[English version](./README.md)

> **Tipo:** evidencia pública SAP funcional + técnica  
> **Idiomas:** Inglés + Español  
> **Regla:** experiencia empresarial, validación source/static, CI, investigación/diseño y runtime SAP siempre se diferencian

Este laboratorio transforma experiencia operativa SAP y especialización técnica en evidencia revisable y no confidencial. ECC, IS-U/WM, SD y S/4HANA se mantienen separados para evitar un claim genérico e impreciso de “SAP”.

## Líneas

1. **SAP ECC MM** — materiales, inventario, compras/servicios, ABAP clásico
2. **SAP ECC IS-U / Work Management** — OT, estados, equipos, integración CRM
3. **SAP ECC / CRM-SD** — cliente, área de ventas y facturación
4. **Diagnóstico técnico ECC** — ABAP/debugging/troubleshooting
5. **SAP S/4HANA** — APIs MM, Migration Cockpit, ABAP Cloud, RAP
6. **SAP Integration** — OData/REST/SOAP, resiliencia y observabilidad

## Madurez de evidencia

| Estado | Significado |
|---|---|
| `PLANNED` | escenario identificado |
| `RESEARCH_VALIDATED` | diseño respaldado por documentación autoritativa/actual; sin runtime |
| `DESIGN_READY` | arquitectura, límites y aceptación documentados |
| `SOURCE_READY` | existe source revisable |
| `STATIC_VALIDATED` | lógica/vectores revisados consistentemente; no ejecutado en SAP |
| `LOCAL_TEST_VALIDATED` | tests automatizados ejecutados fuera de SAP con comportamiento local/mock determinista |
| `CI_VALIDATED` | quality gate automatizado observado exitosamente en CI |
| `EXECUTION_PROCEDURE_READY` | procedimiento SAP reproducible de creación/activación/prueba/ejecución |
| `RUNTIME_DEFERRED` | runtime SAP diferido por restricciones de entorno/CTS autorizado |
| `RUNTIME_VALIDATED` | ejecución real SAP documentada |
| `TEST_VALIDATED` | runtime SAP + pruebas reproducibles |

## SAP ECC MM

[MM Evidence Track](./01-ecc/mm/README.es.md)

### Inventario y Riesgo de Stock

`SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

ABAP OO clásico, lectura `MARA/MARC/MARD`, SALV, seis vectores deterministas y procedimiento reproducible `SE24/SE38/SE93`.

### Contratación de Servicios y `ZMM_CONTRACT_AUDIT`

[Contratación de Servicios y Contratos Marco](./01-ecc/mm/service-procurement/README.es.md)

`FUNCTIONAL_EVIDENCE_READY / ABAP_SOURCE_READY / STATIC_VALIDATED / RUNTIME_DEFERRED`

Source read-only `EKKO/EKPO`, diagnóstico de vigencia contractual, SALV, ocho vectores deterministas y documentación bilingüe.

## SAP ECC IS-U / Work Management

[IS-U / WM Evidence Track](./01-ecc/isu/README.es.md)

### `ZWM_STATUS_AUDIT_LAB`

[Auditoría de Estados de OT](./01-ecc/isu/work-management/status-audit/README.es.md)

`FUNCTIONAL_TECHNICAL_EVIDENCE_READY / SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

El primer pack ABAP WM combina troubleshooting operativo sanitizado con source original read-only:

- `AUFK -> OBJNR`
- `JSTO -> STSMA`
- `JEST` activo/histórico
- resolución `TJ02T` / `TJ30T`
- contexto de cambios `JCDS`
- datasource ECC + demo
- servicio ABAP OO
- reporte SALV
- seis vectores ABAP Unit trazados consistentemente
- guía bilingüe `SE24/SE38/SE93`

La línea también contiene evidencia sanitizada de operación de OT, gobierno batch, sellos MM↔WM, consistencia de equipamiento, alta fotovoltaica, recuperación de fin contractual y servicio ocasional con medición.

## Diagnóstico técnico ECC

[ABAP Debugging & Technical Diagnostics](./01-ecc/technical-diagnostics/README.es.md)

Metodología: `SE93 -> SE24/SE37/SE38/SE80 -> /H/breakpoints/debugger -> ST22/SM21 -> SM50/SM66`.

## SAP ECC / CRM-SD

[SD Evidence Track](./01-ecc/sd/README.es.md) — evidencia sanitizada de facturación de servicios no energéticos.

## SAP S/4HANA

[S/4HANA Evidence Track](./02-s4hana/README.es.md)

### MM Procurement API Client

[Procurement API Lab](./02-s4hana/mm/procurement-api-lab/README.es.md)

`SOURCE_READY / LOCAL_TEST_VALIDATED / CI_VALIDATED / S4_RUNTIME_NOT_CLAIMED`

Cliente TypeScript read-only con lectura de pedidos/solicitudes, validación OData, correlation/request IDs, HTTPS obligatorio y quality gate observado en GitHub Actions: **6 tests / 6 pass / 0 fail** con Node 22.

Dirección de interfaces:

- `I_PurchaseOrderAPI01`
- `API_PURCHASEORDER_2`
- `API_PURCHASEREQUISITION_2`

### Migration Cockpit

[Migration Cockpit Lab](./02-s4hana/migration-cockpit/README.es.md) — `RESEARCH_VALIDATED / RUNTIME_NOT_CLAIMED`

### ABAP Cloud / Clean Core

[ABAP Cloud Track](./02-s4hana/abap-cloud/README.es.md) — `RESEARCH_VALIDATED / IMPLEMENTATION_PLANNED`

### RAP

[RAP Evidence Roadmap](./02-s4hana/rap/README.es.md) — `DESIGN_READY / IMPLEMENTATION_PLANNED`

## Evidencia visual

La [Política de Evidencia Visual](./VISUAL_EVIDENCE_POLICY.es.md) define cuándo pueden agregarse capturas, qué sanitización es obligatoria y la regla de no republicar material de terceros sin derechos claros.

Las capturas son evidencia de apoyo; source, tests y documentación reproducible siguen siendo la evidencia principal.

## Política bilingüe

`README.md` usa inglés técnico orientado al mercado internacional; `README.es.md` mantiene la versión completa en español. Los identificadores de código permanecen en inglés.

## Confidencialidad / integridad

Nunca se publica empresa/cliente ni código propietario, materiales/proveedores/contratos/instalaciones/OT/BP/medidores reales, source Z propietario, endpoints internos, credenciales, transportes, certificados privados o capturas empresariales no sanitizadas.

## Matriz actual

| Línea | Evidencia | Madurez |
|---|---|---|
| Diagnóstico ECC | debugging/troubleshooting | `PROCEDURE_READY` |
| ECC MM Inventario | ABAP source + 6 vectores + runbook | `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED` |
| ECC MM Servicios | `ZMM_CONTRACT_AUDIT` + 8 vectores | `SOURCE_READY / STATIC_VALIDATED / RUNTIME_DEFERRED` |
| ECC IS-U / WM Estados | `ZWM_STATUS_AUDIT_LAB` + 6 vectores | `SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED` |
| ECC IS-U / WM Operación | packs sanitizados | `FUNCTIONAL_TECHNICAL_EVIDENCE_READY` |
| ECC / CRM-SD | facturación no energética | `FUNCTIONAL_EVIDENCE_READY` |
| S/4 MM APIs | cliente TypeScript + CI | `SOURCE_READY / LOCAL_TEST_VALIDATED / CI_VALIDATED` |
| S/4 Migration | Migration Cockpit | `RESEARCH_VALIDATED` |
| ABAP Cloud | arquitectura Clean Core | `RESEARCH_VALIDATED / IMPLEMENTATION_PLANNED` |
| RAP | arquitectura del primer BO | `DESIGN_READY / IMPLEMENTATION_PLANNED` |

## Próximos hitos

1. construir **ECC MM Purchasing Analytics** para visibilidad PR/PO
2. construir `ZWM_ORDER_MONITOR_LAB` read-only/sintético
3. endurecer cliente S/4 con paginación/retry/schemas por release
4. crear primer source RAP cuando exista workflow/entorno ABAP Cloud adecuado
5. añadir runtime SAP solo mediante entorno autorizado
