# SAP ECC MM — Paquete de Evidencia de Inventario y Riesgo de Stock

[English version](./README.md)

> **Línea:** SAP ECC / Materials Management  
> **Estado del artefacto:** `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`  
> **Claim de ejecución:** lógica fuente y vectores deterministas revisados; activación/ejecución SAP no se atribuye hasta contar con un DEV/sandbox autorizado

Este es el primer artefacto técnico ejecutable del SAP Integration Lab.

Implementa un diagnóstico temprano de stock, clásico ECC y de solo lectura, para material / centro / almacén. La aplicación consulta campos estándar MM desde `MARC` y `MARD`, separa el stock del almacén seleccionado del stock libre bruto total de planta, aplica reglas transparentes y presenta el resultado mediante SALV.

## Ruta de construcción reproducible

- [Guía de construcción — Español](./BUILD_GUIDE.es.md)
- [Build Guide — English](./BUILD_GUIDE.md)
- [Perfil de compatibilidad y hardening](./COMPATIBILITY.es.md)
- [Compatibility & Hardening Profile](./COMPATIBILITY.md)
- [Registro de validación estática](./STATIC_VALIDATION.md)
- [Paquete de ejecución runtime — Español](./RUNTIME_EXECUTION.es.md)
- [Runtime Execution Packet — English](./RUNTIME_EXECUTION.md)
- [Guía de ejecución](./RUNBOOK.es.md)
- [Runtime Runbook](./RUNBOOK.md)
- [Plantilla de resultados de validación](./VALIDATION_RESULTS_TEMPLATE.md)
- [Registro de evidencia](./EVIDENCE.md)

La ruta utiliza herramientas y conceptos clásicos SAP: `SE24`, `SE38`, `SE93`, paquetes/CTS, ABAP Unit y SALV.

## Límite funcional importante

Esta aplicación **no es SAP MRP** ni reproduce la planificación por punto de pedido.

SAP puede considerar stock de planta, entradas firmes y lógica adicional de planificación. Este laboratorio es deliberadamente más acotado: un diagnóstico transparente de stock y datos maestros diseñado para demostrar ECC MM + ingeniería ABAP sin atribuirse el comportamiento del motor de planificación SAP.

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

- `ZCX_MM_STOCK_NOT_FOUND` — excepción estática explícita cuando no se encuentran datos para material/centro/almacén.

## Datos estándar ECC utilizados

El datasource ECC consulta:

- `MARC-DISMM` — tipo MRP
- `MARC-MINBE` — punto de pedido
- `MARC-EISBE` — stock de seguridad
- `MARD-LABST` — stock de libre utilización del almacén seleccionado
- todos los registros `MARD-LABST` del material/centro para calcular un total bruto de stock libre de planta

No existen sentencias de actualización, inserción, modificación o borrado en el camino runtime.

## Regla diagnóstica endurecida

- `NOT_CONFIGURED` — punto de pedido y stock de seguridad están iniciales
- `CRITICAL` — stock libre de planta por debajo del stock de seguridad configurado
- `REORDER` — stock libre de planta igual o inferior al punto de pedido configurado, sin estar por debajo del stock de seguridad
- `OK` — ninguna de las condiciones anteriores aplica

`shortage_qty` informa la cantidad necesaria para alcanzar el punto de pedido configurado cuando el total de stock libre de planta es menor.

El stock del almacén seleccionado se presenta como detalle; no determina el estado a nivel planta.

## Validación estática + diseño ABAP Unit

Los seis vectores deterministas versionados fueron trazados contra la implementación actual:

1. stock de planta superior al punto de pedido → `OK` — static PASS
2. stock de planta exactamente en punto de pedido → `REORDER` — static PASS
3. stock de planta por debajo del stock de seguridad → `CRITICAL` — static PASS
4. faltante desde 55 hasta punto de pedido 80 → `25` — static PASS
5. ausencia de umbrales → `NOT_CONFIGURED` — static PASS
6. stock bajo en almacén seleccionado con planta suficiente → estado basado en planta — static PASS

**Vectores revisados: 6/6; inconsistencias lógicas encontradas: 0.**

Esto es validación de fuente/lógica, no un claim de que ABAP Unit haya sido ejecutado dentro de SAP. El objetivo futuro de runtime permanece en 6/6 PASS cuando exista ambiente autorizado.

## Postura de compatibilidad ECC

El runtime principal favorece construcciones clásicas:

- `CREATE OBJECT`
- `CALL METHOD`
- `DATA` explícito
- Open SQL clásico sin host variables `@`
- clases e interfaces globales
- clases locales ABAP Unit
- `CL_SALV_TABLE`

Se evita sintaxis moderna cuando no aporta valor. Esto mejora portabilidad, pero la release/EHP ECC exacta todavía debe validarse en runtime.

## Qué demuestra actualmente la evidencia

- diseño ABAP OO clásico
- inversión de dependencias mediante interfaz
- datasource determinista para pruebas
- seis vectores deterministas consistentes con la lógica actual
- diseño Open SQL de solo lectura sobre tablas estándar ECC MM
- separación stock planta vs. almacén
- visibilidad del contexto MRP mediante `MARC-DISMM`
- manejo de excepciones basado en clases
- estructura de reporte SALV
- cobertura fuente ABAP Unit
- diseño de Report Transaction propia mediante `SE93`
- procedimiento reproducible objeto por objeto para construcción y ejecución
- documentación técnica bilingüe
- límites funcionales y de evidencia explícitos

## Límite runtime

La ejecución runtime queda diferida porque este ejercicio de portafolio no utiliza permisos empresariales de desarrollo/CTS. Es una restricción de entorno/gobierno y no se presenta como PASS de ejecución.

Continúan bloqueados los siguientes claims hasta obtener evidencia runtime en SAP:

- syntax check superado en una release ECC específica
- activación correcta de todos los objetos en SAP
- los seis tests ABAP Unit ejecutados con éxito en SAP
- `ZMM_STOCK_RISK` iniciada correctamente mediante `SE93`
- SALV ejecutado correctamente contra un sistema SAP

Consulte [`STATIC_VALIDATION.md`](./STATIC_VALIDATION.md) y [`EVIDENCE.md`](./EVIDENCE.md).
