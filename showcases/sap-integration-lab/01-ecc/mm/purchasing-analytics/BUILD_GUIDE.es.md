# Guía de Construcción — `ZMM_PURCH_ANALYTICS`

[English version](./BUILD_GUIDE.md)

> **Objetivo:** reproducir el lab read-only de purchasing analytics en un SAP ECC DEV/sandbox autorizado.  
> **Estado runtime:** diferido hasta disponer de evidencia SAP real.

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
- `EKKO-BEDAT`, `EKKO-LIFNR`, `EKKO-EKORG`
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
        EKKO/EKPO
           ↓
          EKET
```

La ausencia de referencia a PO se considera una situación válida `PR_ONLY`. `REFERENCE_GAP` se utiliza únicamente cuando la PR contiene referencia downstream pero el lookup read-only no puede resolver correctamente cabecera/posición.

## ABAP Unit

Usar:

`source/zcl_mm_purch_analytics_service.clas.testclasses.abap`

Vectores preparados: **7**.

No afirmar `7/7 PASS` runtime hasta observarlo realmente en SAP.

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

## Gate de runtime

Validación futura autorizada:

```text
Excepción ............... PASS
Interfaz datasource ..... PASS
Datasource demo ......... PASS
Datasource ECC .......... PASS
Servicio analytics ...... PASS
ABAP Unit ............... x/7 PASS
Reporte SE38 ............ PASS
Transacción SE93 ........ PASS
SALV .................... PASS
```

Hasta entonces: `RUNTIME_DEFERRED`.
