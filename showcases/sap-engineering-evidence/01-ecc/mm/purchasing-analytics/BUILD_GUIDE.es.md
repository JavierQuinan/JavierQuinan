# Guía de Construcción — `ZMM_PURCH_ANALYTICS`

[English version](./BUILD_GUIDE.md)

> **Objetivo:** reproducir el source read-only de purchasing analytics en un SAP ECC de desarrollo/sandbox autorizado usando los archivos versionados en este repositorio.

## Orden de objetos

1. `ZCX_MM_PURCH_NOT_FOUND` — `SE24`
2. `ZIF_MM_PURCH_SOURCE` — `SE24` / `SE80`
3. `ZCL_MM_PURCH_SOURCE_DEMO` — `SE24`
4. `ZCL_MM_PURCH_SOURCE_ECC` — `SE24`
5. `ZCL_MM_PURCH_ANALYTICS_SERVICE` — `SE24`
6. clases locales ABAP Unit
7. `ZMM_PURCH_ANALYTICS_REPORT` — `SE38`
8. `ZMM_PURCH_ANALYTICS` — `SE93` como Report Transaction

## Prerrequisitos DDIC estándar

Confirmar que la release objetivo resuelva:

- `EBAN-BANFN`, `EBAN-BNFPO`
- `EBAN-BADAT`, `EBAN-LFDAT`, `EBAN-LOEKZ`
- `EBAN-MATNR`, `EBAN-WERKS`, `EBAN-EKGRP`
- `EBAN-EBELN`, `EBAN-EBELP`
- `EKKO-BSTYP`, `EKKO-BEDAT`, `EKKO-LIFNR`, `EKKO-EKORG`
- `EKPO-LOEKZ`, `EKPO-MENGE`, `EKPO-MEINS`
- `EKET-EINDT`

## Comportamiento del datasource ECC

```text
BANFN/BNFPO
   ↓
EBAN
   ├── metadata de PR
   └── referencia EBELN/EBELP cuando existe
           ↓
 EKKO donde BSTYP = 'F'
           ↓
          EKPO
           ↓
          EKET
```

`BSTYP = 'F'` es el control de categoría **Purchase Order**. Un purchasing document referenciado que no resuelva como categoría `F` no se presenta como PO.

La ausencia de referencia a PO se considera una situación válida `PR_ONLY`. `REFERENCE_GAP` se utiliza únicamente cuando la PR contiene una referencia downstream que no puede resolverse como la cabecera/posición PO esperada.

## ABAP Unit

Usar:

`source/zcl_mm_purch_analytics_service.clas.testclasses.abap`

Revisión de source en repositorio:

```text
Escenarios revisados: 7
Consistentes:         7
Inconsistencias:      0
```

Al ejecutar ABAP Unit en SAP, registrar únicamente total/pass/fail observado. No inferir un `7/7 PASS` runtime desde la revisión de source.

## Reporte ejecutable

Crear `ZMM_PURCH_ANALYTICS_REPORT` desde:

`source/zmm_purch_analytics_report.prog.abap`

Selección:

- Solicitud de pedido (`BANFN`)
- posición PR (`BNFPO`)

SALV:

- referencia PR/posición
- fechas PR/entrega
- material/centro/grupo de compras
- PO/posición vinculados cuando existan
- proveedor/organización de compras
- cantidad/unidad del PO
- conteo de líneas de reparto
- primera/última fecha de entrega de schedule lines
- resultado diagnóstico

## SE93

Crear:

```text
Transacción: ZMM_PURCH_ANALYTICS
Tipo:        Report Transaction / Programa y pantalla de selección
Programa:    ZMM_PURCH_ANALYTICS_REPORT
Texto corto: MM Purchasing Analytics
```

## Registro de resultados

En una ejecución autorizada registrar únicamente valores observados y sanitizados:

```text
Excepción:
Interfaz datasource:
Datasource demo:
Datasource ECC:
Servicio analytics:
ABAP Unit total/pass/fail:
Reporte SE38:
Transacción SE93:
SALV observado:
```

Los campos no observados se dejan vacíos. No publicar PR/PO/proveedor/material reales, datos organizativos, SID/mandante, usuario o transportes.

## Evidencia representada por esta guía

Esta guía está cerrada como **procedimiento reproducible de construcción y verificación** del source versionado. Los valores runtime se afirman únicamente si existe un registro separado proveniente de una ejecución SAP real y autorizada.
