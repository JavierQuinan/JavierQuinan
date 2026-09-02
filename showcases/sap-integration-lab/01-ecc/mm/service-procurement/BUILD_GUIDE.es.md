# Guía de Construcción — `ZMM_CONTRACT_AUDIT`

[English version](./BUILD_GUIDE.md)

> **Objetivo:** reproducir el auditor read-only de contratos en un SAP ECC de desarrollo/sandbox autorizado usando el source versionado en este repositorio.

## Orden de objetos

Crear y activar uno por uno:

1. `ZCX_MM_CONTRACT_NOT_FOUND` — `SE24`
2. `ZIF_MM_CONTRACT_SOURCE` — `SE24` / `SE80`
3. `ZCL_MM_CONTRACT_SOURCE_DEMO` — `SE24`
4. `ZCL_MM_CONTRACT_SOURCE_ECC` — `SE24`
5. `ZCL_MM_CONTRACT_AUDIT_SERVICE` — `SE24`
6. clases locales ABAP Unit
7. `ZMM_CONTRACT_AUDIT_REPORT` — `SE38` / `SE80`
8. `ZMM_CONTRACT_AUDIT` — Report Transaction mediante `SE93`

Usar únicamente paquete/CTS autorizado o `$TMP` para un experimento local permitido.

## Prerrequisitos DDIC estándar

Confirmar que la release ECC resuelva:

- `EKKO-EBELN`
- `EKKO-LIFNR`
- `EKKO-EKORG`
- `EKKO-BSART`
- `EKKO-BSTYP`
- `EKKO-KDATB`
- `EKKO-KDATE`
- `EKKO-WAERS`
- `EKKO-KTWRT`
- `EKPO-KTMNG`
- `EKPO-ZWERT`
- `EKPO-LOEKZ`

## 1 — Excepción

Crear `ZCX_MM_CONTRACT_NOT_FOUND` heredando de `CX_STATIC_CHECK` usando:

`source/zcx_mm_contract_not_found.clas.abap`

Punto de verificación: Syntax Check + activación.

## 2 — Interfaz de datasource

Crear `ZIF_MM_CONTRACT_SOURCE` desde:

`source/zif_mm_contract_source.intf.abap`

La interfaz devuelve un snapshot transparente de un contrato de compras.

## 3 — Datasource sintético

Crear `ZCL_MM_CONTRACT_SOURCE_DEMO`.

Permite verificar reglas de dominio de forma determinista sin usar información empresarial.

## 4 — Datasource ECC

Crear `ZCL_MM_CONTRACT_SOURCE_ECC`.

Alcance read-only:

```text
EKKO
 └── cabecera / vigencia / proveedor / contexto de compras

EKPO
 └── posiciones activas e indicadores target
```

Solo se aceptan contratos con `EKKO-BSTYP = 'K'`. Las posiciones borradas se excluyen del conteo activo.

La jerarquía de paquetes de servicios está fuera del alcance declarado de este artefacto; no se presenta como una promesa pendiente.

## 5 — Servicio de auditoría

Crear `ZCL_MM_CONTRACT_AUDIT_SERVICE`.

Estados transparentes:

- `ACTIVE`
- `EXPIRING_SOON`
- `EXPIRED`
- `NOT_YET_VALID`
- `INVALID_VALIDITY`
- `VALIDITY_INCOMPLETE`
- `NO_ITEMS`

## 6 — ABAP Unit

Añadir:

`source/zcl_mm_contract_audit_service.clas.testclasses.abap`

Revisión de source en repositorio:

```text
Escenarios revisados: 8
Consistentes:         8
Inconsistencias:      0
```

Al ejecutar ABAP Unit en SAP, registrar únicamente el resultado observado. No inferir un `8/8 PASS` runtime desde la revisión de source.

## 7 — Reporte ejecutable

Crear `ZMM_CONTRACT_AUDIT_REPORT` desde:

`source/zmm_contract_audit_report.prog.abap`

Parámetros:

- contrato / documento de compras
- fecha clave
- días de advertencia

Salida esperada: una fila SALV con el resultado de auditoría. Ejecutar primero mediante `SE38` antes de crear el código de transacción.

## 8 — Código de transacción

En `SE93`, crear:

```text
Transacción: ZMM_CONTRACT_AUDIT
Tipo:        Report Transaction / Program and selection screen
Programa:    ZMM_CONTRACT_AUDIT_REPORT
Texto:       MM Contract Audit
```

## Registro de resultados

En una ejecución autorizada registrar únicamente valores observados y sanitizados:

```text
Clase de excepción:
Interfaz datasource:
Datasource demo:
Datasource ECC:
Servicio de dominio:
ABAP Unit total/pass/fail:
Reporte SE38:
Transacción SE93:
SALV observado:
```

Los campos no observados se dejan vacíos. No publicar proveedor, contrato, organización, centro, importes, SID/mandante, usuario ni transportes.

## Evidencia representada por esta guía

Esta guía está cerrada como **procedimiento reproducible de construcción y verificación** del source versionado. Los resultados runtime se afirman únicamente si existe un registro separado proveniente de una ejecución SAP real y autorizada.
