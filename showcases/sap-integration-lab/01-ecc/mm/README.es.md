# SAP ECC Materials Management (MM) — Línea de Evidencia

[English version](./README.md)

> **Alcance:** SAP ECC / MM clásico  
> **Madurez actual:** evidencia funcional publicada; primer pack ABAP validado estáticamente; lab técnico de servicios diseñado

Esta línea se mantiene separada de SAP S/4HANA. Documenta conocimiento funcional MM clásico e ingeniería ABAP orientada a ECC sin presentar patrones de acceso directo como evidencia Clean Core.

## Evidencia publicada

### 1. Inventario y Riesgo de Stock — ingeniería ABAP

[Inventory & Stock Risk Evidence Pack](./inventory-reorder/README.es.md)

Estado: `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

Evidencia:

- ABAP Objects clásico
- datasource read-only sobre `MARA` / `MARC` / `MARD`
- separación stock de planta vs. almacén
- contexto MRP
- excepciones explícitas
- diseño SALV
- seis vectores ABAP Unit deterministas trazados consistentemente a nivel de source
- procedimiento reproducible `SE24` / `SE38` / `SE93`

No se afirma activación ni ejecución real de ABAP Unit mientras el ejercicio de portafolio no disponga de DEV/CTS autorizado.

### 2. Evidencia funcional MM

[Evidencia funcional sanitizada](./functional-evidence/)

Derivada de material operativo sobre:

- extensión organizativa de materiales
- consumo de materiales en OT y validación de movimientos
- troubleshooting material/proveedor/puesto de trabajo

### 3. Contratación de Servicios y Contratos Marco

[Contratación de Servicios y Contratos Marco](./service-procurement/README.es.md)

Estado: `FUNCTIONAL_EVIDENCE_READY / TECHNICAL_LAB_PLANNED`

Cubre:

- acuerdos de largo plazo con proveedores
- control previo para evitar duplicados
- vigencia
- contexto por cantidad/valor
- posiciones de servicio
- catálogo/actividades contratadas
- condiciones comerciales
- referencia del acuerdo en adquisiciones posteriores

La guía operativa fuente utiliza `ME31` junto con `ME33K`; la versión pública conserva ese dato de la fuente y lo distingue de la familia estándar de contratos ECC normalmente representada por `ME31K` / `ME32K` / `ME33K`.

También está diseñado un [Contract Audit read-only](./service-procurement/TECHNICAL_LAB.md) sobre `EKKO` / `EKPO`, sin afirmar creación o modificación de documentos.

## Progresión técnica prevista

1. implementar `ZMM_CONTRACT_AUDIT` de solo lectura
2. añadir vectores ABAP Unit de vigencia contractual
3. construir Purchasing Analytics para solicitudes/pedidos
4. mantener relaciones de paquetes de servicio como release-specific hasta verificarlas formalmente

## Límite ECC

Se pueden utilizar objetos clásicos/Open SQL cuando correspondan a ECC y se rotulan expresamente como **ECC/clásico**.

Nunca se publica código del empleador/cliente, documentos de compra reales, proveedores, materiales, precios, códigos organizativos ni screenshots.

## Límite S/4HANA

La evidencia moderna de procurement S/4HANA vive separada en [`../../02-s4hana`](../../02-s4hana/README.es.md) y prioriza CDS/OData/APIs liberadas en lugar de exponer mecánicamente tablas ECC a consumidores externos.
