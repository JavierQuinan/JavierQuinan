# SAP S/4HANA — Línea de Evidencia de Ingeniería

[English version](./README.md)

> **Alcance:** S/4HANA MM, Migration Cockpit, APIs liberadas, ABAP Cloud y RAP  
> **Madurez actual:** investigación validada; varios diseños listos; runtime no afirmado

Esta línea está separada deliberadamente de ECC. Se enfoca en extensibilidad, integración y migración modernas sin renombrar patrones clásicos ECC como evidencia S/4HANA.

## Evidencia publicada

### 1. Procurement API Lab — S/4HANA MM

[Procurement API Evidence Lab](./mm/procurement-api-lab/README.es.md)

Estado: `RESEARCH_VALIDATED / DESIGN_READY / RUNTIME_NOT_CLAIMED`

Interfaces seleccionadas:

- `I_PurchaseOrderAPI01`
- `API_PURCHASEORDER_2` — Purchase Order OData V4
- `API_PURCHASEREQUISITION_2` — Purchase Requisition OData V4

El lab define un futuro cliente TypeScript read-only con adapters tipados, paginación, error mapping, correlation IDs, secretos fuera de Git y contract tests deterministas.

### 2. Migration Cockpit

[Migration Cockpit Evidence Lab](./migration-cockpit/README.es.md)

Estado: `RESEARCH_VALIDATED / RUNTIME_NOT_CLAIMED`

Documenta el ciclo oficial:

- proyecto/escenario de migración
- migration objects
- staging tables vs. direct transfer
- mapping tasks
- simulación
- migración
- monitoreo
- reconciliación

Es evidencia de investigación/estudio, no un claim de migración productiva ejecutada.

### 3. ABAP Cloud / Clean Core

[ABAP Cloud / Clean Core](./abap-cloud/README.es.md)

Estado: `RESEARCH_VALIDATED / IMPLEMENTATION_PLANNED`

Documenta:

- consumo de objetos/APIs liberados
- release contracts (`C0`, `C1`, `C2` cuando aplique)
- límites Clean Core
- gates ATC/tests/runtime
- futuros packs CDS/API/RAP

### 4. RAP

[RAP Evidence Roadmap](./rap/README.es.md)

Estado: `DESIGN_READY / IMPLEMENTATION_PLANNED`

Primer BO previsto: **MM Replenishment Review**, un objeto custom de revisión/workflow que conecta conceptualmente con el lab ECC de riesgo de stock sin modificar persistencia estándar de material/MRP.

Arquitectura objetivo:

`CDS root -> Behavior -> Projection -> Service Definition -> OData V4 Service Binding -> Consumer`.

## Regla de evidencia

Un reporte ECC con tablas directas no constituye por sí solo evidencia S/4HANA. Los artefactos S/4 priorizan interfaces liberadas, puntos de extensión upgrade-safe y decisiones Clean Core explícitas.

## Próxima secuencia de implementación

1. cliente TypeScript source-ready para Procurement API con mocks/contract tests
2. evidencia CDS analítica/read-model sobre fuentes liberadas verificadas
3. source del business object RAP
4. evidencia ATC/objetos liberados cuando exista ambiente apropiado
5. runtime en sandbox autorizado solo cuando exista acceso legítimo

## Gate runtime

No se afirma ejecución S/4HANA sin evidencia real de activación/API. Investigación, diseño, source, validación estática y runtime se mantienen como niveles diferentes.
