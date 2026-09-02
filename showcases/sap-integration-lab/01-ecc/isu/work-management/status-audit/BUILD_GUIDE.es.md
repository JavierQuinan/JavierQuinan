# Guía de Construcción — `ZWM_STATUS_AUDIT_LAB`

[English version](./BUILD_GUIDE.md)

> **Objetivo:** reproducir la auditoría read-only de estados de órdenes de trabajo en un SAP ECC DEV/sandbox autorizado.  
> **Estado runtime:** diferido hasta disponer de evidencia SAP real.

## Orden de objetos

1. `ZCX_WM_ORDER_NOT_FOUND` — `SE24`
2. `ZIF_WM_STATUS_SOURCE` — `SE24` / `SE80`
3. `ZCL_WM_STATUS_SOURCE_DEMO` — `SE24`
4. `ZCL_WM_STATUS_SOURCE_ECC` — `SE24`
5. `ZCL_WM_STATUS_AUDIT_SERVICE` — `SE24`
6. clases locales ABAP Unit
7. `ZWM_STATUS_AUDIT_REPORT` — `SE38`
8. `ZWM_STATUS_AUDIT_LAB` — `SE93` como Report Transaction

## Prerrequisitos DDIC estándar

Confirmar que la release objetivo resuelva:

- `AUFK-AUFNR`, `AUFK-OBJNR`
- `JSTO-STSMA`
- `JEST-STAT`, `JEST-INACT`, `JEST-CHGNR`
- `JCDS-UDATE`, `JCDS-UTIME`, `JCDS-CHGNR`
- `TJ02T-ISTAT`, `TJ02T-TXT04`, `TJ02T-TXT30`
- `TJ30T-STSMA`, `TJ30T-ESTAT`, `TJ30T-TXT04`, `TJ30T-TXT30`

## Comportamiento del datasource ECC

La fuente resuelve:

```text
AUFNR → AUFK-OBJNR
OBJNR → JSTO/JEST/JCDS
I.... → texto de estado de sistema en TJ02T
E.... → texto de estado de usuario en TJ30T usando JSTO-STSMA
```

`INACT` se preserva para diferenciar registros activos de históricos.

La lectura de historial expone únicamente conteo y última fecha/hora; usuario y TCode se excluyen deliberadamente del lab público.

## ABAP Unit

Usar:

`source/zcl_wm_status_audit_service.clas.testclasses.abap`

Vectores preparados: **6**.

No afirmar `6/6 PASS` runtime hasta observarlo realmente en SAP.

## Reporte ejecutable

Crear `ZWM_STATUS_AUDIT_REPORT` desde:

`source/zwm_status_audit_report.prog.abap`

Selección:

- número de orden de trabajo

El SALV muestra:

- clasificación system/user/other
- contexto de perfil de estados
- activo vs. histórico
- textos de estado
- número de cambio
- conteos resumen
- última fecha/hora de cambio
- resultado diagnóstico

## SE93

Crear:

```text
Transacción: ZWM_STATUS_AUDIT_LAB
Tipo:        Report Transaction / Programa y pantalla de selección
Programa:    ZWM_STATUS_AUDIT_REPORT
Texto corto: WM Status Audit Lab
```

## Gate de runtime

Una futura validación autorizada debería registrar únicamente resultados sanitizados:

```text
Excepción ............... PASS
Interfaz datasource ..... PASS
Datasource demo ......... PASS
Datasource ECC .......... PASS
Servicio de auditoría ... PASS
ABAP Unit ............... x/6 PASS
Reporte SE38 ............ PASS
Transacción SE93 ........ PASS
SALV .................... PASS
```

Hasta entonces: `RUNTIME_DEFERRED`.
