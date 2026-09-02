# SAP ECC MM — Contratación de Servicios y Contratos Marco

[English version](./README.md)

> **Línea:** SAP ECC / Materials Management / Compras y Servicios  
> **Evidencia:** guía operativa sanitizada · source ABAP original read-only · revisión determinista de source

Este paquete combina conocimiento profesional sanitizado de acuerdos de compra de largo plazo con un artefacto ABAP original, de solo lectura y revisable.

## Evidencia funcional

La guía operativa respalda trabajo con:

- verificación de acuerdos existentes para evitar duplicados;
- contexto de proveedor y organización de compras;
- inicio/fin de vigencia;
- acuerdos orientados a cantidad o valor;
- posiciones de servicio;
- unidades, cantidades y valores comerciales;
- catálogo de prestaciones/actividades;
- compras posteriores referenciando un acuerdo existente.

La guía fuente utiliza `ME31` dentro de su contexto operativo específico y `ME33K` para revisar contratos existentes. La versión pública conserva ese dato sin convertirlo en regla universal; el procesamiento clásico de contratos SAP utiliza habitualmente la familia `ME31K / ME32K / ME33K`.

## Evidencia técnica — `ZMM_CONTRACT_AUDIT`

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

Excepción de soporte:

`ZCX_MM_CONTRACT_NOT_FOUND`

## Modelo ECC read-only

El source utiliza:

- `EKKO-KDATB` / `EKKO-KDATE` — inicio/fin de vigencia;
- `EKKO-LIFNR` — proveedor;
- `EKKO-EKORG` — organización de compras;
- `EKKO-KTWRT` — valor objetivo;
- `EKPO-KTMNG` — cantidad objetivo;
- `EKPO-ZWERT` — valor objetivo de posición;
- `EKPO-LOEKZ` — exclusión de posiciones eliminadas.

El datasource ECC acepta únicamente documentos con `BSTYP = 'K'`.

El source no recorre jerarquías de paquetes de servicios porque esa relación depende de release/escenario y no es necesaria para demostrar la lógica de auditoría contractual implementada.

## Estados diagnósticos

- `ACTIVE`
- `EXPIRING_SOON`
- `EXPIRED`
- `NOT_YET_VALID`
- `INVALID_VALIDITY`
- `VALIDITY_INCOMPLETE`
- `NO_ITEMS`

El reporte muestra además días hasta vencimiento, cantidad de posiciones activas e indicadores target por cantidad/valor.

## Revisión de escenarios deterministas

Se versionaron ocho escenarios ABAP Unit y fueron trazados consistentemente contra el source actual:

```text
Escenarios revisados: 8
Consistentes:         8
Diferencias:          0
```

Esto corresponde a revisión source/estática, no a un claim de ejecución ABAP Unit dentro de un sistema SAP corporativo.

## Evidencia reproducible

- [Technical Lab](./TECHNICAL_LAB.md)
- [Build Guide](./BUILD_GUIDE.md)
- [Guía de construcción](./BUILD_GUIDE.es.md)
- [Static Validation](./STATIC_VALIDATION.md)
- [Evidence Record](./EVIDENCE.md)
- [`source/`](./source/)

## Qué demuestra esta evidencia

- razonamiento de service procurement y contratos marco;
- estructura clásica de documentos de compras ECC;
- ABAP Objects y abstracción de datasource;
- reglas explícitas de vigencia contractual;
- datos sintéticos deterministas para pruebas;
- reporting SALV;
- documentación funcional/técnica bilingüe;
- diseño read-only y disciplina de confidencialidad.

## Límite de evidencia

El artefacto no crea ni modifica documentos de compras y no contiene escrituras de base ni `COMMIT`.

No afirma reemplazar estrategia de liberación, entrada de servicios, pricing/técnica de condiciones, determinación de fuentes, consumo contractual, imputación, verificación de facturas ni procesamiento de paquetes de servicios.

El repositorio presenta source/revisión estática e instrucciones reproducibles de construcción; no afirma activación o ejecución de estos objetos custom dentro de un sistema SAP corporativo específico.

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
