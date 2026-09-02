# SAP ECC Materials Management (MM) — Línea de Evidencia

[English version](./README.md)

> **Alcance:** SAP ECC / MM clásico  
> **Madurez actual:** evidencia funcional + tres packs ABAP source-ready/validados estáticamente

Esta línea se mantiene separada de SAP S/4HANA. Documenta conocimiento funcional MM clásico e ingeniería ABAP orientada a ECC sin presentar patrones de acceso directo como evidencia Clean Core.

## Evidencia técnica publicada

### 1. Inventario y Riesgo de Stock

[Evidence Pack](./inventory-reorder/README.es.md)

`SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

- ABAP Objects
- `MARA` / `MARC` / `MARD`
- separación stock planta/almacén
- SALV
- 6 vectores ABAP Unit trazados a nivel de source
- procedimiento reproducible `SE24 / SE38 / SE93`

### 2. Contratación de Servicios y Contract Audit

[Contratación de Servicios y Contratos Marco](./service-procurement/README.es.md)

`FUNCTIONAL_EVIDENCE_READY / ABAP_SOURCE_READY / STATIC_VALIDATED / RUNTIME_DEFERRED`

Source original read-only `ZMM_CONTRACT_AUDIT` sobre `EKKO/EKPO`, diagnóstico de vigencia, SALV, 8 vectores deterministas y documentación bilingüe.

### 3. Purchasing Analytics — PR → PO → líneas de reparto

[Purchasing Analytics](./purchasing-analytics/README.es.md)

`SOURCE_READY / STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

Source original read-only `ZMM_PURCH_ANALYTICS`:

```text
EBAN
  ↓ referencia opcional EBELN/EBELP
EKKO / EKPO
  ↓
EKET
```

Evidencia:

- visibilidad de posición PR
- resolución opcional del PO downstream
- contexto organización de compras/proveedor
- conteo de líneas de reparto y fechas de entrega
- indicadores de borrado
- `PR_ONLY / REFERENCE_GAP`
- `PO_WITHOUT_SCHEDULE / PO_WITH_SCHEDULE`
- `PR_DELETED / PO_ITEM_DELETED`
- reporte SALV
- 7 vectores ABAP Unit trazados consistentemente
- guía bilingüe `SE24 / SE38 / SE93`

Una PR sin PO no se clasifica como error.

## Evidencia funcional MM

[Evidencia funcional sanitizada](./functional-evidence/)

Derivada de material operativo sobre:

- extensión de materiales
- consumo de materiales en OT y movimientos
- troubleshooting material/proveedor/puesto de trabajo
- contratos marco y contratación de servicios

## Próxima progresión técnica

1. relaciones de paquetes de servicios solo después de verificación por release/escenario
2. historial de compras/GR más profundo solo con un caso acotado y verificable
3. runtime futuro cuando exista DEV/sandbox SAP autorizado

## Límite ECC

Se permiten objetos clásicos/Open SQL cuando corresponden a ECC y quedan rotulados como **ECC/clásico**.

No se publica código del empleador/cliente, documentos de compras reales, proveedores, materiales, precios, códigos organizativos ni capturas.

## Límite S/4HANA

La evidencia moderna S/4HANA está separada en [`../../02-s4hana`](../../02-s4hana/README.es.md) y prioriza CDS/OData/APIs liberadas.
