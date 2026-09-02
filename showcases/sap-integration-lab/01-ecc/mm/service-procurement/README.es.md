# SAP ECC MM — Contratación de Servicios y Contratos Marco

[English version](./README.md)

> **Línea:** SAP ECC / Materials Management / Compras y Servicios  
> **Estado:** `FUNCTIONAL_EVIDENCE_READY / ABAP_SOURCE_READY / STATIC_VALIDATED / RUNTIME_DEFERRED`

Este paquete combina conocimiento profesional sanitizado de acuerdos de compra de largo plazo con un artefacto ABAP original, de solo lectura y revisable públicamente.

## Evidencia funcional

La guía operativa de origen demuestra trabajo con:

- verificación de contratos existentes para evitar duplicados
- contexto de proveedor y organización de compras
- inicio/fin de vigencia
- acuerdos orientados a cantidad o valor
- posiciones orientadas a servicios
- unidad, cantidad y contexto comercial
- catálogo de prestaciones/actividades
- compras posteriores que referencian el acuerdo vigente

La guía fuente utiliza `ME31` dentro de su contexto operativo y `ME33K` para revisar contratos existentes. La evidencia pública conserva ese dato sin presentarlo como regla universal; el procesamiento clásico de contratos SAP utiliza habitualmente la familia `ME31K / ME32K / ME33K`.

No se publica empresa, proveedor, contrato, organización de compras, importe, usuario ni captura real.

## Evidencia técnica — `ZMM_CONTRACT_AUDIT`

El auditor previsto ya está implementado como source revisable:

```text
ZMM_CONTRACT_AUDIT
        │
        ▼
ZMM_CONTRACT_AUDIT_REPORT
        │
        ▼
ZCL_MM_CONTRACT_AUDIT_SERVICE
        │
        ▼
ZIF_MM_CONTRACT_SOURCE
   ├── ZCL_MM_CONTRACT_SOURCE_ECC  → EKKO / EKPO
   └── ZCL_MM_CONTRACT_SOURCE_DEMO → datos sintéticos
```

Objeto de soporte:

`ZCX_MM_CONTRACT_NOT_FOUND`

## Modelo ECC read-only

La primera versión utiliza campos estándar de contratos de compras documentados de forma independiente:

- `EKKO-KDATB` / `EKKO-KDATE` — inicio/fin de vigencia
- `EKKO-LIFNR` — proveedor
- `EKKO-EKORG` — organización de compras
- `EKKO-KTWRT` — valor objetivo
- `EKPO-KTMNG` — cantidad objetivo a nivel de posición
- `EKPO-ZWERT` — valor objetivo de posición
- `EKPO-LOEKZ` — exclusión de posiciones eliminadas

El datasource ECC acepta únicamente documentos de compras con `BSTYP = 'K'`.

La primera versión **no recorre** jerarquías de paquetes de servicios; esa extensión se reserva para una validación específica por release/escenario.

## Estados diagnósticos

- `ACTIVE`
- `EXPIRING_SOON`
- `EXPIRED`
- `NOT_YET_VALID`
- `INVALID_VALIDITY`
- `VALIDITY_INCOMPLETE`
- `NO_ITEMS`

El reporte también muestra días hasta vencimiento, número de posiciones activas e indicadores de objetivos por cantidad/valor.

## Diseño de pruebas

Se versionaron ocho vectores ABAP Unit y fueron trazados a nivel de source:

```text
Vectores revisados: 8
Consistentes:       8
Diferencias:        0
```

Esto es **validación estática/source**, no ejecución de ABAP Unit dentro de SAP.

## Reproducibilidad

- [Technical Lab](./TECHNICAL_LAB.md)
- [Build Guide](./BUILD_GUIDE.md)
- [Guía de construcción](./BUILD_GUIDE.es.md)
- [Static Validation](./STATIC_VALIDATION.md)
- [Evidence Record](./EVIDENCE.md)
- [`source/`](./source/)

## Límite de evidencia

El desarrollo no crea ni modifica documentos de compras y no contiene sentencias de escritura ni `COMMIT`.

No pretende reemplazar:

- estrategia de liberación
- entrada de servicios
- pricing / técnica de condiciones
- determinación de fuentes
- consumo contractual
- imputación
- verificación de facturas
- procesamiento de paquetes de servicios

La activación SAP, ejecución ABAP Unit y transacción SE93 quedan diferidas hasta disponer de un DEV/sandbox autorizado.

## Terminología bilingüe

| English | Español |
|---|---|
| Outline agreement | Acuerdo marco / contrato marco |
| Purchase contract | Contrato de compras |
| Vendor | Proveedor |
| Validity period | Período de vigencia |
| Quantity contract | Contrato por cantidad |
| Value contract | Contrato por valor |
| Service item | Posición de servicio |
| Service catalog | Catálogo de prestaciones/servicios |
