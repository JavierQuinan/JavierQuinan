# SAP ECC MM — Purchasing Analytics

[English version](./README.md)

> **Tipo de evidencia:** source original ECC read-only de compras  
> **Estado:** `SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`  
> **Alcance:** Solicitud de Pedido → Pedido de Compra → visibilidad de líneas de reparto

`ZMM_PURCH_ANALYTICS` es un laboratorio ECC clásico que sigue una posición de solicitud de pedido hacia sus referencias downstream cuando existen, sin crear ni modificar documentos de compras.

## Modelo estándar utilizado

```text
EBAN — posición de Solicitud de Pedido
   │
   ├── BANFN / BNFPO
   ├── EBELN / EBELP cuando existe referencia a PO
   │
   ▼
EKKO / EKPO — cabecera/posición de Pedido de Compra
   │
   ▼
EKET — contexto de líneas de reparto/entrega
```

La documentación SAP expone `BANFN`, `BNFPO`, `EBELN` y `EBELP` en datos de solicitudes y utiliza `EKET-EINDT` como contexto de fecha de entrega de la línea de reparto. Este artefacto permanece explícitamente rotulado como **ECC/clásico** y no se utiliza como prueba Clean Core de S/4HANA.

## Arquitectura de source

```text
ZMM_PURCH_ANALYTICS
        │
        ▼
ZMM_PURCH_ANALYTICS_REPORT
        │
        ▼
ZCL_MM_PURCH_ANALYTICS_SERVICE
        │
        ▼
ZIF_MM_PURCH_SOURCE
   ┌──────────┴──────────┐
   ▼                     ▼
Datasource ECC       Datasource demo
EBAN/EKKO/EKPO/EKET  registros sintéticos
```

Source revisable: [`source/`](./source/)

## Salida read-only

La primera versión expone:

- número/posición de Solicitud de Pedido
- fechas de PR y entrega solicitada
- material / centro / grupo de compras
- Pedido de Compra/posición cuando existe referencia
- fecha de documento PO
- proveedor y organización de compras
- cantidad/unidad del PO
- cantidad de líneas de reparto
- primera/última fecha de entrega de schedule lines
- resultado diagnóstico transparente

## Resultados diagnósticos

Estas etiquetas son diagnósticos del portfolio, **no estados estándar SAP**:

- `PR_ONLY` — existe PR sin referencia a PO
- `REFERENCE_GAP` — la PR tiene referencia a PO pero cabecera/posición no puede resolverse con el lookup read-only
- `PO_WITHOUT_SCHEDULE` — la posición PO existe pero no se encuentran líneas de reparto
- `PO_WITH_SCHEDULE` — PO/posición y contexto de líneas de reparto se resuelven
- `PR_DELETED` — indicador de borrado de PR activo
- `PO_ITEM_DELETED` — indicador de borrado de posición PO activo

Una PR sin PO no se trata como error. El artefacto evita asumir que toda solicitud necesariamente debe tener ya un pedido downstream.

## Validación estática

Se prepararon siete vectores deterministas ABAP Unit y fueron trazados consistentemente a nivel de source:

```text
Vectores revisados: 7
Consistentes:       7
Inconsistencias:    0
```

Ver [Validación Estática](./STATIC_VALIDATION.md).

No se presenta como evidencia runtime ABAP Unit en SAP.

## Reproducción

- [Build Guide — English](./BUILD_GUIDE.md)
- [Guía de Construcción — Español](./BUILD_GUIDE.es.md)
- [Límite de Evidencia](./EVIDENCE.md)
- [Diseño](./DESIGN.md)

La reproducción documentada utiliza `SE24`, `SE38` y `SE93`.

## No objetivos

La primera versión no:

- crea/modifica PRs o POs
- libera documentos de compras
- simula MRP
- calcula compromisos
- considera `PR_ONLY` como error de negocio
- recorre relaciones de paquetes/entradas de servicio
- calcula finalización de goods receipt
- implementa comportamiento de APIs liberadas S/4HANA

## Seguridad / confidencialidad

La evidencia visual pública debe usar solo identificadores sintéticos. Nunca publicar solicitudes, POs, proveedores, materiales, códigos organizativos, precios, screenshots o metadata interna reales.

El source no contiene rutas de escritura/commit sobre documentos de compras.

## Límite de evidencia

`SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY` significa que el código y comportamiento determinista son revisables y están documentados. `RUNTIME_DEFERRED` significa que activación SAP y ejecución ABAP Unit no se afirman hasta disponer de un DEV/sandbox autorizado.
