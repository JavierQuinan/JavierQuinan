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

[Evidencia MM01 suministrada](../../visual-evidence/mm01-material-extension/README.es.md)

El set conserva la guía evidencial entregada para el caso de extensión de material y una captura real de verificación final en formato WebP. Los cuatro archivos de imagen generados anteriormente durante la preparación del portafolio fueron eliminados para evitar referencias rotas o evidencia visual que no proviniera directamente del material suministrado.

Las nuevas capturas SAP se incorporarán únicamente a medida que sean suministradas para el portafolio.

## Referencias oficiales SAP

Las guías MM se contrastan con documentación pública SAP. Consulte el [Índice de Referencias Oficiales SAP](../../OFFICIAL_SAP_REFERENCES.es.md), que incluye Help SAP sobre extensión del maestro de materiales, datos por almacén, Class Builder, SE93 y ABAP Unit.

## Qué demuestra esta línea

- comprensión operativa SAP MM clásico;
- razonamiento de material y niveles organizativos;
- conceptos de purchasing y service procurement;
- análisis de relación PR→PO→schedule lines;
- ABAP Objects y abstracción de datasource;
- Open SQL read-only para diagnóstico;
- reporting SALV;
- diseño determinista de pruebas;
- documentación técnica bilingüe;
- evidencia respaldada por material operativo suministrado y referencias oficiales SAP.

## Límite ECC

Se utilizan objetos clásicos/Open SQL únicamente cuando corresponden a ECC y se rotulan expresamente como **ECC/clásico**.

No se publica código del empleador/cliente, documentos de compras reales, proveedores, precios, credenciales ni screenshots adicionales fuera del material suministrado para el portafolio.

## Límite S/4HANA

La evidencia moderna S/4HANA vive separada en [`../../02-s4hana`](../../02-s4hana/README.es.md) y prioriza APIs/CDS/OData liberados.
