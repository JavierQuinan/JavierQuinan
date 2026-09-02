# SAP ECC Materials Management (MM) — Línea de Evidencia

[English version](./README.md)

> **Alcance:** SAP ECC / MM clásico  
> **Madurez actual:** evidencia funcional + dos packs ABAP source-ready/validados estáticamente

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

La capa funcional documenta contratos marco/servicios a partir de material operativo sanitizado. La capa técnica ya incluye el desarrollo original read-only `ZMM_CONTRACT_AUDIT`:

```text
ZMM_CONTRACT_AUDIT_REPORT
        ↓
ZCL_MM_CONTRACT_AUDIT_SERVICE
        ↓
ZIF_MM_CONTRACT_SOURCE
   ├── ECC → EKKO / EKPO
   └── Demo → datos sintéticos
```

Evidencia:

- auditoría de vigencia
- contexto proveedor/organización de compras
- valor objetivo e indicadores target por posición
- conteo de posiciones activas
- `ACTIVE / EXPIRING_SOON / EXPIRED`
- `NOT_YET_VALID / INVALID_VALIDITY / VALIDITY_INCOMPLETE / NO_ITEMS`
- source de reporte SALV
- 8 vectores ABAP Unit trazados consistentemente
- documentación bilingüe de construcción/evidencia

La primera versión no recorre jerarquías de paquetes de servicios.

## Evidencia funcional MM

[Evidencia funcional sanitizada](./functional-evidence/)

Derivada de material operativo sobre:

- extensión de materiales
- consumo de materiales en OT y movimientos
- troubleshooting material/proveedor/puesto de trabajo
- contratos marco y contratación de servicios

## Próxima progresión técnica

1. Purchasing Analytics — visibilidad de solicitudes y pedidos
2. relaciones de paquetes de servicios solo después de verificación por release/escenario
3. runtime futuro cuando exista DEV/sandbox SAP autorizado

## Límite ECC

Se permiten objetos clásicos/Open SQL cuando corresponden a ECC y quedan rotulados como **ECC/clásico**.

No se publica código del empleador/cliente, documentos de compras reales, proveedores, materiales, precios, códigos organizativos ni capturas.

## Límite S/4HANA

La evidencia moderna S/4HANA está separada en [`../../02-s4hana`](../../02-s4hana/README.es.md) y prioriza CDS/OData/APIs liberadas.
