# SAP Integration Lab — Evidencia Pública de Ingeniería

[English version](./README.md)

> **Tipo:** evidencia pública SAP funcional + técnica  
> **Idiomas:** Inglés + Español  
> **Regla:** experiencia funcional, validación source/static, investigación/diseño y runtime SAP siempre se diferencian

Este laboratorio transforma experiencia operativa SAP y especialización técnica en evidencia revisable y no confidencial. ECC, IS-U/WM, SD y S/4HANA se mantienen separados para evitar un claim genérico e impreciso de “SAP”.

## Líneas

1. **SAP ECC MM** — materiales, inventario, compras/servicios, ABAP clásico
2. **SAP ECC IS-U / Work Management** — OT, estados, equipos, integración CRM
3. **SAP ECC / CRM-SD** — cliente, área de ventas y facturación
4. **Diagnóstico técnico ECC** — ABAP/debugging/troubleshooting runtime
5. **SAP S/4HANA** — APIs MM, Migration Cockpit, ABAP Cloud, RAP
6. **SAP Integration** — OData/REST/SOAP, resiliencia y observabilidad

## Madurez de evidencia

| Estado | Significado |
|---|---|
| `PLANNED` | escenario identificado |
| `RESEARCH_VALIDATED` | diseño basado en documentación autorizada/actual; sin claim runtime |
| `DESIGN_READY` | arquitectura, límites y criterios documentados |
| `SOURCE_READY` | existe source revisable |
| `STATIC_VALIDATED` | lógica/vectores revisados consistentemente; no ejecutado en SAP |
| `EXECUTION_PROCEDURE_READY` | procedimiento reproducible de creación/activación/prueba/ejecución |
| `RUNTIME_DEFERRED` | runtime diferido por restricciones de entorno/CTS autorizado |
| `RUNTIME_VALIDATED` | ejecución real documentada |
| `TEST_VALIDATED` | runtime + pruebas reproducibles |

## Diagnóstico técnico ECC

[ABAP Debugging & Technical Diagnostics](./01-ecc/technical-diagnostics/README.es.md)

Metodología publicada:

`SE93 -> SE24/SE37/SE38/SE80 -> /H/breakpoints/debugger -> ST22/SM21 -> SM50/SM66`.

Demuestra método de troubleshooting sin afirmar privilegios Basis ni debugging productivo.

## SAP ECC MM

[MM Evidence Track](./01-ecc/mm/README.es.md)

### Inventario y riesgo de stock

Estado: `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

- ABAP OO clásico
- lectura `MARA/MARC/MARD`
- SALV
- semántica planta/almacén endurecida
- seis vectores deterministas trazados consistentemente
- runbook SE24/SE38/SE93
- no se afirma activación/ABAP Unit runtime real

### Contratación de servicios / contratos marco

Estado: `FUNCTIONAL_EVIDENCE_READY / TECHNICAL_LAB_PLANNED`

- acuerdos de largo plazo
- proveedor/vigencia/cantidad-valor
- posiciones/catálogo de servicios
- control de duplicidad
- diseño `ZMM_CONTRACT_AUDIT` read-only sobre contexto estándar de compras

## SAP ECC IS-U / Work Management

[IS-U / WM Evidence Track](./01-ecc/isu/README.es.md)

Evidencia sanitizada publicada:

- [Operación Work Management](./01-ecc/isu/functional-evidence/work-management-operations/README.es.md)
- [Auditoría de estados de OT](./01-ecc/isu/work-management/status-audit/README.es.md)
- [Gobierno de cierre masivo](./01-ecc/isu/work-management/batch-order-governance/README.es.md)
- [Habilitación de materiales de sellos — MM↔WM](./01-ecc/isu/work-management/seals-material-enablement/README.es.md)
- [Consistencia de equipamiento — IS-U↔CRM](./01-ecc/isu/device-management/pec-equipment-consistency/README.es.md)
- [Alta de servicio fotovoltaico](./01-ecc/isu/master-data/photovoltaic-service-onboarding/README.es.md)
- [Recuperación CRM↔IS-U de fin contractual/DCDE](./01-ecc/isu/crm-isu-integration/dcde-recovery/README.es.md)
- [Servicio ocasional con medición CRM→WM→CRM](./01-ecc/isu/crm-isu-integration/occasional-metered-service/README.es.md)

Son artefactos de proceso/troubleshooting derivados de guías operativas después de sanitización. No publican IDs empresariales, screenshots, implementación Z propietaria ni atajos de manipulación directa.

## SAP ECC / CRM-SD

[SD Evidence Track](./01-ecc/sd/README.es.md)

Publicado:

- [Facturación de Servicios No Energéticos](./01-ecc/sd/non-energy-billing/README.es.md) — cliente/BP, contexto comercial, extensión de área de ventas, facturación, revisión de output y finalización fiscal configurada.

El flujo se mantiene rotulado como específico del proceso fuente en lugar de generalizarlo como estándar universal.

## SAP S/4HANA

[S/4HANA Evidence Track](./02-s4hana/README.es.md)

### APIs MM Procurement

[Procurement API Lab](./02-s4hana/mm/procurement-api-lab/README.es.md)

Estado: `RESEARCH_VALIDATED / DESIGN_READY / RUNTIME_NOT_CLAIMED`

Interfaces elegidas para evidencia Clean Core futura:

- `I_PurchaseOrderAPI01`
- `API_PURCHASEORDER_2`
- `API_PURCHASEREQUISITION_2`

### Migration Cockpit

[Migration Cockpit Lab](./02-s4hana/migration-cockpit/README.es.md)

Estado: `RESEARCH_VALIDATED / RUNTIME_NOT_CLAIMED`

Cubre proyectos/objetos de migración, staging vs. direct transfer, mapping, simulación, migración, monitoreo y reconciliación.

### ABAP Cloud / Clean Core

[ABAP Cloud Track](./02-s4hana/abap-cloud/README.es.md)

Estado: `RESEARCH_VALIDATED / IMPLEMENTATION_PLANNED`

Cubre APIs/objetos liberados, release contracts, ATC y límites Clean Core.

### RAP

[RAP Evidence Roadmap](./02-s4hana/rap/README.es.md)

Estado: `DESIGN_READY / IMPLEMENTATION_PLANNED`

Primer BO previsto: **MM Replenishment Review**, extensión custom de revisión/workflow sin modificar persistencia estándar de material/MRP.

## Política bilingüe

- `README.md` → inglés técnico orientado a mercado internacional
- `README.es.md` → versión completa en español

El código permanece en inglés y se traduce terminología funcional cuando aporta valor.

## Confidencialidad / integridad

Nunca publicar:

- empresa/cliente o código fuente propietario
- materiales, proveedores, contratos, instalaciones, OT, BP/clientes o medidores reales
- configuración/source de desarrollos Z internos
- usuarios, URLs, destinos RFC, SID/mandante/transportes
- credenciales, tokens o certificados privados
- screenshots productivos o páginas formativas de terceros sin derechos

## Matriz actual

| Línea | Evidencia | Madurez |
|---|---|---|
| Diagnóstico ECC | procedimiento debugging/troubleshooting | `PROCEDURE_READY` |
| ECC MM Inventario | ABAP source + trace estático + runbook | `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED` |
| ECC MM Servicios | contrato marco + diseño técnico | `FUNCTIONAL_EVIDENCE_READY / DESIGN_READY` |
| ECC IS-U / WM | 8 packs sanitizados | `FUNCTIONAL_TECHNICAL_EVIDENCE_READY` |
| ECC / CRM-SD | facturación no energética | `FUNCTIONAL_EVIDENCE_READY` |
| S/4 MM APIs | arquitectura Procurement API | `RESEARCH_VALIDATED / DESIGN_READY` |
| S/4 Migration | Migration Cockpit | `RESEARCH_VALIDATED` |
| ABAP Cloud | arquitectura Clean Core | `RESEARCH_VALIDATED / IMPLEMENTATION_PLANNED` |
| RAP | arquitectura del primer BO | `DESIGN_READY / IMPLEMENTATION_PLANNED` |

## Próximos hitos de ingeniería

1. implementar cliente TypeScript S/4 Procurement API con mocks/tests
2. implementar source del Contract Audit ECC read-only
3. construir lab técnico sintético IS-U/WM de estados/batch
4. crear primer source RAP cuando exista workflow/entorno ABAP Cloud adecuado
5. añadir runtime SAP únicamente mediante entorno autorizado
