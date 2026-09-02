# SAP ECC Materials Management (MM) — Línea de Evidencia

[English version](./README.md)

> **Alcance:** SAP ECC / MM clásico

Esta línea documenta conocimiento funcional MM clásico e ingeniería ABAP original orientada a ECC. Se mantiene separada de S/4HANA para no presentar patrones de acceso directo ECC como evidencia Clean Core.

## Evidencia técnica disponible actualmente

### 1. Inventario y Riesgo de Stock

[Evidence Pack](./inventory-reorder/README.es.md)

Evidencia:

- source original ABAP Objects;
- datasource read-only `MARA / MARC / MARD`;
- separación stock de planta vs. almacén;
- visibilidad de contexto MRP;
- source de reporte SALV;
- 6 escenarios ABAP Unit deterministas revisados a nivel de source;
- guía reproducible `SE24 / SE38 / SE93`;
- revisión de compatibilidad con sintaxis ECC clásica.

**Límite:** se documenta validación source/estática; no se afirma activación SAP corporativa ni ejecución de ABAP Unit en sistema empresarial.

### 2. Contratación de Servicios y `ZMM_CONTRACT_AUDIT`

[Contratación de Servicios y Contratos Marco](./service-procurement/README.es.md)

Evidencia:

- guía operativa sanitizada de contrato marco/servicios;
- source ABAP original read-only sobre `EKKO / EKPO`;
- diagnóstico de vigencia contractual;
- contexto proveedor/organización de compras;
- target value e indicadores quantity/value;
- source SALV;
- 8 escenarios ABAP Unit deterministas revisados a nivel de source;
- documentación bilingüe de construcción/evidencia.

**Límite:** se documenta validación source/estática; no se afirma runtime SAP.

### 3. Purchasing Analytics — PR → PO → líneas de reparto

[Purchasing Analytics](./purchasing-analytics/README.es.md)

Evidencia:

```text
EBAN
  ↓ referencia opcional EBELN/EBELP
EKKO / EKPO   [EKKO-BSTYP = 'F']
  ↓
EKET
```

- visibilidad de posición PR;
- resolución opcional del PO downstream;
- guard de categoría Purchase Order;
- contexto organización de compras/proveedor;
- conteo de líneas de reparto y fechas de entrega;
- indicadores de borrado;
- `PR_ONLY / REFERENCE_GAP`;
- `PO_WITHOUT_SCHEDULE / PO_WITH_SCHEDULE`;
- `PR_DELETED / PO_ITEM_DELETED`;
- source SALV;
- 7 escenarios ABAP Unit deterministas revisados a nivel de source;
- guía bilingüe `SE24 / SE38 / SE93`.

Una PR sin PO se interpreta deliberadamente como un estado válido `PR_ONLY`, no como error automático.

**Límite:** se documenta validación source/estática; no se afirma runtime SAP.

## Evidencia funcional MM

[Evidencia funcional sanitizada](./functional-evidence/)

Las guías operativas cubren:

- extensión de material mediante `MM01`;
- verificación de extensión organizativa;
- consumo de materiales en OT y validación de movimientos;
- troubleshooting material/proveedor/puesto de trabajo;
- contratos marco y contratación de servicios.

### Evidencia visual — MM01

[Capturas MM01 sanitizadas](../../visual-evidence/mm01-material-extension/README.es.md)

El set visual muestra:

1. pantalla de acceso para extensión;
2. selección de vistas;
3. niveles organizativos;
4. verificación en índice de materiales.

Se sanitizan material, centro/almacén, descripción y usuario. Las capturas provienen de una guía suministrada para este portafolio y se publican únicamente en versión redactada.

## Qué demuestra esta línea

- comprensión operativa SAP MM clásico;
- razonamiento de material y niveles organizativos;
- conceptos de purchasing y service procurement;
- análisis de relación PR→PO→schedule lines;
- ABAP Objects y abstracción de datasource;
- Open SQL read-only para diagnóstico;
- reporting SALV;
- diseño determinista de pruebas;
- documentación técnica bilingüe.

## Límite ECC

Se utilizan objetos clásicos/Open SQL únicamente cuando corresponden a ECC y se rotulan expresamente como **ECC/clásico**.

No se publica código del empleador/cliente, documentos de compras reales, proveedores, materiales, precios, códigos organizativos ni screenshots no sanitizados.

## Límite S/4HANA

La evidencia moderna S/4HANA vive separada en [`../../02-s4hana`](../../02-s4hana/README.es.md) y prioriza APIs/CDS/OData liberados.
