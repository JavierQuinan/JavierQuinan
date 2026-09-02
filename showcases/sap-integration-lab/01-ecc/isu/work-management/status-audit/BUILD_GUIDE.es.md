# Guía de Construcción — `ZWM_STATUS_AUDIT_LAB`

[English version](./BUILD_GUIDE.md)

> **Objetivo:** reproducir la auditoría read-only de estados de órdenes de trabajo en un SAP ECC de desarrollo/sandbox autorizado usando el source versionado en este repositorio.

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

La lectura de historial expone únicamente conteo y última fecha/hora; usuario y TCode se excluyen deliberadamente del laboratorio público.

## ABAP Unit

Usar:

`source/zcl_wm_status_audit_service.clas.testclasses.abap`

Revisión de source en repositorio:

```text
Escenarios revisados: 6
Consistentes:         6
Inconsistencias:      0
```

Al ejecutar ABAP Unit en SAP, registrar únicamente total/pass/fail observado. No inferir un `6/6 PASS` runtime desde la revisión de source.

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

## Registro de resultados

En una ejecución autorizada registrar únicamente valores observados y sanitizados:

```text
Excepción:
Interfaz datasource:
Datasource demo:
Datasource ECC:
Servicio de auditoría:
ABAP Unit total/pass/fail:
Reporte SE38:
Transacción SE93:
SALV observado:
```

Los campos no observados se dejan vacíos. No publicar OT reales, usuarios del historial, transacciones propietarias, SID/mandante, URLs internas ni transportes.

## Evidencia representada por esta guía

Esta guía está cerrada como **procedimiento reproducible de construcción y verificación** del source versionado. Los valores runtime se afirman únicamente si existe un registro separado proveniente de una ejecución SAP real y autorizada.
