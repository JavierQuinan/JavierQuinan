# SAP ECC MM — Paquete de Evidencia de Inventario y Riesgo de Stock

[English version](./README.md)

> **Línea:** SAP ECC / Materials Management  
> **Estado del artefacto:** `SOURCE_READY / RUNTIME_VALIDATION_PENDING`  
> **Claim de ejecución:** fuente preparada; activación/ejecución SAP aún no evidenciada

Este es el primer artefacto técnico ejecutable del SAP Integration Lab.

Implementa un diagnóstico clásico ECC para material/centro/almacén. La aplicación lee campos estándar MM desde `MARC` y `MARD`, evalúa el stock de libre utilización frente al punto de pedido y stock de seguridad, y presenta el resultado mediante un reporte ejecutable SALV.

## Ruta de construcción reproducible

El paquete incluye ahora un procedimiento profesional y respaldado por fuentes para crear el conjunto completo de objetos ABAP y exponer el reporte mediante la transacción Z original `ZMM_STOCK_RISK` usando `SE93`.

- [Guía de construcción — Español](./BUILD_GUIDE.es.md)
- [Build Guide — English](./BUILD_GUIDE.md)
- [Guía de ejecución](./RUNBOOK.es.md)
- [Runtime Runbook](./RUNBOOK.md)
- [Registro de evidencia](./EVIDENCE.md)

La guía de construcción se apoya en documentación oficial SAP para Class Builder (`SE24`), programas ejecutables (`SE38`), Transaction Maintenance (`SE93`), ABAP Unit y comportamiento de paquetes/CTS.

## Límite funcional importante

Esta aplicación **no implementa el motor MRP de SAP** ni pretende reproducir su lógica de planificación de aprovisionamiento. Es un ejercicio diagnóstico y de reporting orientado a demostrar SAP ECC MM + ingeniería ABAP clásica.

## Arquitectura

```text
ZMM_STOCK_RISK
        │
        ▼
ZMM_STOCK_RISK_REPORT
        │
        ▼
ZCL_MM_STOCK_RISK_SERVICE
        │
        ▼
ZIF_MM_STOCK_SOURCE
   ├── ZCL_MM_STOCK_SOURCE_ECC  → MARC / MARD
   └── ZCL_MM_STOCK_SOURCE_DEMO → datos sintéticos deterministas
```

Objeto de soporte:

- `ZCX_MM_STOCK_NOT_FOUND` — excepción explícita cuando no se encuentran datos para material/centro/almacén.

## Datos estándar ECC utilizados

El datasource ECC consulta:

- `MARC-MINBE` — punto de pedido
- `MARC-EISBE` — stock de seguridad
- `MARD-LABST` — stock de libre utilización para el almacén seleccionado

No existe ninguna sentencia de actualización, inserción o borrado. El datasource es únicamente de lectura.

## Regla diagnóstica

- `CRITICAL` — stock de libre utilización por debajo del stock de seguridad
- `REORDER` — stock igual o inferior al punto de pedido, pero no inferior al stock de seguridad
- `OK` — stock superior al punto de pedido

`shortage_qty` informa la cantidad necesaria para alcanzar el punto de pedido configurado cuando el stock actual es inferior.

## Estructura del código

```text
inventory-reorder/
├── README.md
├── README.es.md
├── BUILD_GUIDE.md
├── BUILD_GUIDE.es.md
├── RUNBOOK.md
├── RUNBOOK.es.md
├── EVIDENCE.md
└── source/
    ├── zcx_mm_stock_not_found.clas.abap
    ├── zif_mm_stock_source.intf.abap
    ├── zcl_mm_stock_source_ecc.clas.abap
    ├── zcl_mm_stock_source_demo.clas.abap
    ├── zcl_mm_stock_risk_service.clas.abap
    ├── zcl_mm_stock_risk_service.clas.testclasses.abap
    └── zmm_stock_risk_report.prog.abap
```

## Cobertura ABAP Unit preparada

Se versionaron cuatro casos deterministas:

1. stock superior al punto de pedido → `OK`
2. stock exactamente en el punto de pedido → `REORDER`
3. stock por debajo del stock de seguridad → `CRITICAL`
4. cálculo de cantidad faltante hasta alcanzar el punto de pedido

Las pruebas utilizan el datasource demo y no datos productivos SAP.

## Qué demuestra actualmente el código

- diseño ABAP OO clásico
- inversión de dependencias mediante interfaz
- datasource determinista para pruebas
- Open SQL de solo lectura sobre tablas estándar ECC MM
- manejo explícito de errores de dominio
- estructura de reporte ejecutable
- salida SALV
- fuente de pruebas ABAP Unit
- procedimiento documentado para crear una Report Transaction Z con `SE93`
- documentación técnica bilingüe

## Qué continúa bloqueado

No se realizan los siguientes claims hasta obtener evidencia runtime en SAP:

- syntax check superado en una release ECC determinada
- activación correcta de todos los objetos
- ABAP Unit ejecutado con éxito en SAP
- `ZMM_STOCK_RISK` ejecutada correctamente mediante `SE93`
- reporte SALV ejecutado correctamente contra un sistema SAP

Consulte [`EVIDENCE.md`](./EVIDENCE.md) para el protocolo de validación.
