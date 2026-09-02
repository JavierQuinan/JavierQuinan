# SAP ECC MM — Paquete de Evidencia de Inventario y Riesgo de Stock

[English version](./README.md)

> **Línea:** SAP ECC / Materials Management  
> **Evidencia:** source ABAP original · escenarios deterministas revisados · guía reproducible de construcción

Este pack implementa un diagnóstico temprano de stock, clásico ECC y read-only, para material / centro / almacén. Consulta campos estándar de datos maestros/stock, separa el stock del almacén seleccionado del stock libre bruto de planta, aplica reglas transparentes y expone el resultado mediante SALV.

## Índice de evidencia

- [Guía de construcción — Español](./BUILD_GUIDE.es.md)
- [Build Guide — English](./BUILD_GUIDE.md)
- [Perfil de compatibilidad y hardening](./COMPATIBILITY.es.md)
- [Compatibility & Hardening Profile](./COMPATIBILITY.md)
- [Registro de validación estática](./STATIC_VALIDATION.md)
- [Registro de evidencia](./EVIDENCE.md)
- [`source/`](./source/) — source ABAP original

La guía de construcción documenta `SE24`, `SE38`, `SE93`, consideraciones de paquete/transporte, ubicación de ABAP Unit y pasos de ejecución SALV.

## Límite funcional

Esta aplicación **no es SAP MRP** ni reproduce la planificación por punto de pedido.

Es deliberadamente más acotada: un diagnóstico transparente sobre valores de stock/datos maestros pensado para demostrar ECC MM + ingeniería ABAP sin atribuirse el comportamiento del motor de planificación SAP.

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

Excepción de soporte:

- `ZCX_MM_STOCK_NOT_FOUND`

## Datos estándar ECC utilizados

El datasource ECC consulta:

- `MARC-DISMM` — tipo MRP;
- `MARC-MINBE` — punto de pedido;
- `MARC-EISBE` — stock de seguridad;
- `MARD-LABST` — stock libre del almacén seleccionado;
- registros relevantes `MARD-LABST` del material/centro para derivar stock libre bruto de planta;
- `MARA-MEINS` — contexto de unidad base.

Este artefacto no contiene operaciones de escritura sobre materiales ni compras.

## Regla diagnóstica

- `NOT_CONFIGURED` — punto de pedido y stock de seguridad iniciales;
- `CRITICAL` — stock libre de planta inferior al stock de seguridad;
- `REORDER` — stock libre de planta igual/inferior al punto de pedido sin estar debajo del safety stock;
- `OK` — ninguna condición anterior aplica.

`shortage_qty` informa la cantidad necesaria para alcanzar el punto de pedido cuando el stock libre de planta es menor.

El stock del almacén seleccionado se muestra como contexto de detalle; no gobierna el resultado a nivel planta.

## Revisión de escenarios deterministas

El repositorio contiene source ABAP Unit para seis escenarios, trazados consistentemente contra la lógica actual del servicio:

1. stock de planta superior al punto de pedido → `OK`;
2. stock exactamente en punto de pedido → `REORDER`;
3. stock de planta inferior al stock de seguridad → `CRITICAL`;
4. stock 55 vs. punto de pedido 80 → faltante `25`;
5. ausencia de umbrales → `NOT_CONFIGURED`;
6. stock bajo en almacén seleccionado con stock de planta suficiente → prevalece el resultado de planta.

**Escenarios revisados a nivel de source: 6/6 consistentes; inconsistencias: 0.**

Esta afirmación corresponde a revisión source/estática, no a ejecución de ABAP Unit dentro de un sistema SAP corporativo.

## Postura de compatibilidad ECC

El source favorece construcciones clásicas:

- `CREATE OBJECT`;
- `CALL METHOD`;
- declaraciones `DATA` explícitas;
- Open SQL clásico sin host variables `@`;
- clases/interfaces globales;
- clases locales ABAP Unit;
- `CL_SALV_TABLE`.

Esto reduce dependencias innecesarias de sintaxis reciente y facilita la revisión en paisajes ECC clásicos.

## Qué demuestra esta evidencia

- razonamiento SAP ECC MM sobre stock/datos maestros;
- diseño ABAP Objects clásico;
- inversión de dependencias mediante interfaz;
- separación datasource ECC / sintético;
- diseño determinista de pruebas;
- Open SQL read-only sobre objetos MM estándar;
- semántica planta vs. almacén;
- manejo explícito de excepciones;
- reporting SALV;
- diseño de Report Transaction mediante `SE93`;
- documentación reproducible objeto por objeto;
- documentación técnica bilingüe.

## Límite de evidencia

El repositorio contiene source, revisión estática de escenarios e instrucciones reproducibles de construcción/ejecución. **No** presenta screenshots ni resultados atribuyendo que estos objetos custom fueron activados o ejecutados dentro de un sistema SAP corporativo específico.
