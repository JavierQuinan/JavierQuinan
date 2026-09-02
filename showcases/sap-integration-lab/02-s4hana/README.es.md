# SAP S/4HANA — Línea de Evidencia de Ingeniería

[English version](./README.md)

> **Alcance:** integración S/4HANA MM, Migration Cockpit, APIs liberadas, ABAP Cloud y arquitectura RAP  
> **Regla de evidencia:** esta página enumera únicamente material que ya existe en el repositorio

Esta línea está separada deliberadamente de ECC. Documenta integración y extensibilidad S/4HANA sin presentar acceso clásico a tablas ECC como evidencia Clean Core.

## Evidencia disponible actualmente

### 1. MM Procurement API Client

[Procurement API Lab](./mm/procurement-api-lab/README.es.md)

Existe un cliente TypeScript read-only real, sin dependencias externas, versionado en este repositorio.

Evidencia implementada:

- lectura de Purchase Orders
- lectura de Purchase Requisitions
- validación de respuestas OData
- abstracción de transporte
- construcción de queries
- correlation/request IDs
- obligación de HTTPS
- manejo determinista de errores
- tests automatizados
- quality gate de GitHub Actions

Resultado CI observado: **6 tests / 6 pass / 0 fail** con Node 22.

Dirección de interfaces liberadas documentada por el lab:

- `I_PurchaseOrderAPI01`
- `API_PURCHASEORDER_2`
- `API_PURCHASEREQUISITION_2`

La evidencia valida el source del cliente y su comportamiento en CI; no afirma conexión con un tenant S/4HANA real.

### 2. Guía Técnica Migration Cockpit

[Guía Migration Cockpit](./migration-cockpit/README.es.md)

Guía basada en documentación que cubre:

- proyectos y objetos de migración
- enfoques staging tables y direct transfer
- mapping tasks
- simulación
- monitoreo de migración
- manejo de errores y reconciliación

Es una guía técnica de estudio/operación, no un claim de migración productiva ejecutada.

### 3. Guía Técnica ABAP Cloud / Clean Core

[ABAP Cloud / Clean Core](./abap-cloud/README.es.md)

Guía basada en documentación sobre:

- consumo de objetos/APIs liberados
- release contracts (`C0`, `C1`, `C2` cuando aplique)
- límites Clean Core
- gobierno orientado a ATC
- separación entre objetos liberados internos y APIs remotas
- reglas de arquitectura para extensiones upgrade-safe

### 4. Guía de Arquitectura RAP

[Guía de Arquitectura RAP](./rap/README.es.md)

La guía documenta un escenario de revisión de reposición MM mediante:

`CDS root → Behavior Definition → Behavior Implementation → Projection → Service Definition → OData V4 Service Binding → Consumer`

Explica límites del business object, ownership de behavior, exposición del servicio y consideraciones Clean Core sin atribuir runtime RAP inexistente.

## Límite ECC vs. S/4HANA

La evidencia ECC puede utilizar Open SQL clásico y tablas estándar cuando corresponda al escenario ECC. La evidencia S/4HANA prioriza APIs liberadas, puntos de extensión documentados y razonamiento Clean Core explícito.

## Integridad de evidencia

El repositorio diferencia claramente:

1. **Source ejecutable con tests/CI observados** — TypeScript Procurement API Client.
2. **Guías técnicas basadas en documentación SAP** — Migration Cockpit, ABAP Cloud/Clean Core y RAP.
3. **Runtime no afirmado** — no se declara ejecución sobre tenant S/4HANA real sin evidencia.
