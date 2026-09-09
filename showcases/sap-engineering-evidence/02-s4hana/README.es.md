# SAP S/4HANA — Línea de Formación y Evidencia de Ingeniería

[English version](./README.md)

> **Alcance:** formación funcional S/4HANA multidominio completada, cliente MM Procurement API explícitamente no-live, conceptos de Migration Cockpit, APIs liberadas, ABAP Cloud/Clean Core y arquitectura RAP  
> **Regla de evidencia:** credenciales de formación, ejemplos ejecutables no-live y estudio basado en documentación son clases de evidencia separadas; ninguna se presenta como experiencia productiva de implementación/runtime S/4HANA

Esta línea está separada deliberadamente de ECC. Registra la formación S/4HANA realmente completada por el propietario y el material de ingeniería SAP moderno que existe en el repositorio, sin presentar acceso clásico a tablas ECC como evidencia Clean Core ni ejemplos client-side como integración SAP real.

## Evidencia disponible actualmente

### 1. Formación funcional S/4HANA multidominio — `TRAINING_CREDENTIAL`

[Formación y Credenciales](../00-profile/TRAINING_AND_CREDENTIALS.es.md)

Completada la **Especialización Internacional en SAP S/4 HANA desde cero — 240 horas académicas**.

Registro académico:

- SAP S/4 HANA MM — **20/20**
- SAP S/4 HANA PP — **16/20**
- SAP S/4 HANA SD — **18/20**
- SAP S/4 HANA FI — **18/20**
- SAP S/4 HANA PM — **18/20**
- **Promedio final — 18/20**

Esta credencial demuestra formación funcional completada en esos módulos. No se presenta como certificación oficial SAP ni como experiencia productiva de implementación, conversión u operación S/4HANA.

### 2. MM Procurement API Client — `EXECUTABLE_NON_LIVE_EXAMPLE`

[Procurement API Lab](./mm/procurement-api-lab/README.es.md)

Existe un cliente TypeScript read-only sin dependencias externas versionado en este repositorio.

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

La evidencia valida el source del cliente y su comportamiento en CI; no afirma conexión con un tenant S/4HANA real ni implementación productiva SAP OData.

### 3. Guía Técnica Migration Cockpit — `DOCUMENTATION_GROUNDED`

[Guía Migration Cockpit](./migration-cockpit/README.es.md)

Guía basada en documentación que cubre:

- proyectos y objetos de migración
- enfoques staging tables y direct transfer
- mapping tasks
- simulación
- monitoreo de migración
- manejo de errores y reconciliación

Es una guía técnica de estudio/operación, no un claim de migración productiva ejecutada.

### 4. Guía Técnica ABAP Cloud / Clean Core — `DOCUMENTATION_GROUNDED` + contexto de formación ABAP Cloud completada

[ABAP Cloud / Clean Core](./abap-cloud/README.es.md)

Guía basada en documentación sobre:

- consumo de objetos/APIs liberados
- release contracts (`C0`, `C1`, `C2` cuando aplique)
- límites Clean Core
- gobierno orientado a ATC
- separación entre objetos liberados internos y APIs remotas
- reglas de arquitectura para extensiones upgrade-safe

La línea separada de formación ABAP Cloud documenta 200 horas de formación/práctica hands-on completada. Esta guía no añade un claim de runtime Clean Core ni de extensión S/4 productiva.

### 5. Guía de Arquitectura RAP — `DOCUMENTATION_GROUNDED`

[Guía de Arquitectura RAP](./rap/README.es.md)

La guía documenta un escenario de revisión de reposición MM mediante:

`CDS root → Behavior Definition → Behavior Implementation → Projection → Service Definition → OData V4 Service Binding → Consumer`

Explica límites del business object, ownership de behavior, exposición del servicio y consideraciones Clean Core sin atribuir runtime RAP inexistente.

## Límite ECC vs. S/4HANA

La evidencia ECC puede utilizar Open SQL clásico y tablas estándar cuando corresponda al escenario ECC. El material S/4HANA de esta línea prioriza APIs liberadas, puntos de extensión documentados y razonamiento Clean Core explícito, mientras la especialización de 240 horas permanece claramente clasificada como formación.

## Integridad de evidencia

El repositorio diferencia claramente:

1. **Credencial de formación S/4HANA completada** — 240 horas en MM, PP, SD, FI y PM, promedio final 18/20.
2. **Source ejecutable con tests/CI observados** — TypeScript Procurement API Client, explícitamente no-live.
3. **Guías técnicas basadas en documentación SAP** — Migration Cockpit, ABAP Cloud/Clean Core y RAP.
4. **Runtime no afirmado** — no se declara implementación productiva S/4HANA, conectividad live a tenant, OData/SOAP productivo ni runtime RAP/service-binding sin evidencia.
