# SAP ECC MM — Purchasing Analytics

[English version](./README.md)

> **Evidencia:** source original ECC read-only · revisión determinista de source · guía reproducible de construcción  
> **Alcance:** Solicitud de Pedido → Pedido de Compra → visibilidad de líneas de reparto

`ZMM_PURCH_ANALYTICS` sigue una posición de solicitud de pedido hacia sus referencias downstream cuando existen, sin crear ni modificar documentos de compras.

## Modelo estándar utilizado

```text
EBAN — posición de Solicitud de Pedido
   │
   ├── BANFN / BNFPO
   ├── EBELN / EBELP cuando existe referencia a PO
   │
   ▼
EKKO / EKPO — cabecera/posición de Pedido de Compra
   │  EKKO-BSTYP = 'F'
   ▼
EKET — contexto de líneas de reparto/entrega
```

El artefacto permanece expresamente rotulado como **ECC/clásico** y no se presenta como evidencia Clean Core S/4HANA.

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

- número/posición de Solicitud de Pedido;
- fechas de PR y entrega solicitada;
- material / centro / grupo de compras;
- Pedido de Compra/posición cuando existe referencia;
- fecha de documento PO;
- proveedor y organización de compras;
- cantidad/unidad del PO;
- cantidad de líneas de reparto;
- primera/última fecha de entrega de schedule lines;
- resultado diagnóstico transparente.

## Resultados diagnósticos

Estas etiquetas son diagnósticos del portfolio, **no estados estándar SAP**:

- `PR_ONLY` — existe PR sin referencia a PO;
- `REFERENCE_GAP` — la PR tiene referencia a PO pero cabecera/posición no puede resolverse con el lookup read-only;
- `PO_WITHOUT_SCHEDULE` — la posición PO existe pero no se encuentran líneas de reparto;
- `PO_WITH_SCHEDULE` — PO/posición y contexto de líneas de reparto se resuelven;
- `PR_DELETED` — indicador de borrado de PR activo;
- `PO_ITEM_DELETED` — indicador de borrado de posición PO activo.

Una PR sin PO se interpreta deliberadamente como un estado válido, no como error automático.

## Revisión de escenarios deterministas

Se versionaron siete escenarios ABAP Unit y fueron trazados consistentemente a nivel de source:

```text
Escenarios revisados: 7
Consistentes:         7
Inconsistencias:      0
```

Ver [Validación Estática](./STATIC_VALIDATION.md). Esto es revisión source/estática, no un claim de ejecución ABAP Unit dentro de SAP.

## Evidencia reproducible

- [Build Guide — English](./BUILD_GUIDE.md)
- [Guía de Construcción — Español](./BUILD_GUIDE.es.md)
- [Límite de Evidencia](./EVIDENCE.md)
- [Diseño](./DESIGN.md)
- [Revisión de Source](./SOURCE_REVIEW.md)

La guía de construcción documenta `SE24`, `SE38` y `SE93`.

## Qué demuestra esta evidencia

- razonamiento de relación PR→PO→schedule lines;
- uso de `EKKO-BSTYP = 'F'` como guard de categoría Purchase Order;
- ABAP Objects y abstracción de datasource;
- diseño determinista de pruebas con datos sintéticos;
- Open SQL ECC read-only;
- manejo de indicadores de borrado y reference gaps;
- reporting SALV;
- documentación técnica bilingüe.

## No objetivos / límite de evidencia

El artefacto no crea/modifica/libera PRs o POs, simula MRP, calcula compromisos, recorre paquetes de entrada de servicios, calcula finalización de goods receipt ni implementa comportamiento de APIs liberadas S/4HANA.

La evidencia pública no contiene solicitudes, POs, proveedores/materiales, códigos organizativos, precios ni metadata interna reales. El source no contiene ruta de escritura/commit sobre documentos de compras.

El repositorio presenta source/revisión estática e instrucciones de construcción; no afirma activación o ejecución de estos objetos custom dentro de un sistema SAP corporativo específico.
