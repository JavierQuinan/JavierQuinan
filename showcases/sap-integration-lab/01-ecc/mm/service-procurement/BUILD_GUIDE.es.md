# Guía de construcción — `ZMM_CONTRACT_AUDIT`

[English version](./BUILD_GUIDE.md)

> **Objetivo:** reproducir el auditor read-only de contratos en un SAP ECC DEV/sandbox autorizado.  
> **Estado runtime público:** diferido hasta obtener evidencia real de ejecución SAP.

## Orden de objetos

Crear y activar uno por uno:

1. `ZCX_MM_CONTRACT_NOT_FOUND` — `SE24`
2. `ZIF_MM_CONTRACT_SOURCE` — `SE24` / `SE80`
3. `ZCL_MM_CONTRACT_SOURCE_DEMO` — `SE24`
4. `ZCL_MM_CONTRACT_SOURCE_ECC` — `SE24`
5. `ZCL_MM_CONTRACT_AUDIT_SERVICE` — `SE24`
6. clases locales ABAP Unit del servicio
7. `ZMM_CONTRACT_AUDIT_REPORT` — `SE38` / `SE80`
8. `ZMM_CONTRACT_AUDIT` — Report Transaction mediante `SE93`

Usar únicamente paquete/CTS autorizado o `$TMP` para un experimento local permitido.

## Prerrequisitos DDIC

Verificar que la release ECC resuelva:

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

Gate:

```text
Syntax ........ PASS
Activation .... PASS
```

## 2 — Interfaz de datasource

Crear `ZIF_MM_CONTRACT_SOURCE` desde:

`source/zif_mm_contract_source.intf.abap`

Devuelve un snapshot transparente de un contrato de compras.

## 3 — Datasource sintético

Crear `ZCL_MM_CONTRACT_SOURCE_DEMO`.

Permite validar reglas de dominio sin usar información empresarial.

## 4 — Datasource ECC

Crear `ZCL_MM_CONTRACT_SOURCE_ECC`.

Alcance read-only:

```text
EKKO
 └── cabecera / vigencia / proveedor / contexto de compras

EKPO
 └── posiciones activas e indicadores target
```

La primera versión no recorre tablas de paquetes de servicios.

## 5 — Servicio de auditoría

Crear `ZCL_MM_CONTRACT_AUDIT_SERVICE`.

Estados:

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

Vectores preparados: **8**.

No declarar `8/8 PASS` runtime hasta observar realmente la ejecución en SAP.

## 7 — Reporte ejecutable

Crear:

`ZMM_CONTRACT_AUDIT_REPORT`

Source:

`source/zmm_contract_audit_report.prog.abap`

Parámetros:

- contrato / documento de compras
- fecha clave
- días de advertencia

Salida esperada: una fila SALV con el resultado de auditoría.

Primero ejecutar mediante `SE38`.

## 8 — Código de transacción

En `SE93` crear:

```text
Transacción: ZMM_CONTRACT_AUDIT
Tipo:        Report Transaction / Program and selection screen
Programa:    ZMM_CONTRACT_AUDIT_REPORT
Texto:       MM Contract Audit
```

## Gate futuro de evidencia runtime

Si posteriormente se ejecuta en un entorno autorizado, registrar únicamente evidencia sanitizada:

```text
Exception class ........ PASS
Datasource interface ... PASS
Demo datasource ........ PASS
ECC datasource ......... PASS
Domain service ......... PASS
ABAP Unit .............. x/8 PASS
Report SE38 ............ PASS
SE93 transaction ....... PASS
SALV ................... PASS
```

Hasta entonces permanece `RUNTIME_DEFERRED`.
