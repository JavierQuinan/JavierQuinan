# SAP ECC MM Inventario y Riesgo de Stock — Guía de Verificación

[English version](./RUNBOOK.md)

> Utilizar únicamente en un ambiente SAP de desarrollo/sandbox autorizado.

## Objetivo

Crear, activar, probar y ejecutar el paquete endurecido sin utilizar código de cliente ni información confidencial.

## Orden de objetos

1. `ZCX_MM_STOCK_NOT_FOUND`
2. `ZIF_MM_STOCK_SOURCE`
3. `ZCL_MM_STOCK_SOURCE_DEMO`
4. `ZCL_MM_STOCK_SOURCE_ECC`
5. `ZCL_MM_STOCK_RISK_SERVICE`
6. clases locales ABAP Unit
7. `ZMM_STOCK_RISK_REPORT`
8. `ZMM_STOCK_RISK` en `SE93`

Los archivos en `source/` son la fuente de verdad.

## Secuencia de verificación

Para cada objeto de desarrollo:

1. ejecutar Syntax Check;
2. activar;
3. registrar únicamente ajustes de compatibilidad específicos de la release que puedan publicarse de forma segura.

Después de activar las clases:

1. ejecutar ABAP Unit sobre `ZCL_MM_STOCK_RISK_SERVICE`;
2. registrar los valores observados total/pass/fail;
3. comparar el resultado observado con los seis escenarios revisados a nivel de source.

## Escenarios revisados en source

1. stock de planta superior al punto de pedido → `OK`
2. stock de planta exactamente en punto de pedido → `REORDER`
3. stock de planta por debajo del stock de seguridad → `CRITICAL`
4. cálculo de cantidad faltante hasta punto de pedido
5. sin umbrales → `NOT_CONFIGURED`
6. stock bajo en almacén seleccionado con stock suficiente en planta → el estado de planta permanece `OK`

Revisión estática en repositorio: **6 escenarios / 6 consistentes / 0 inconsistencias**.

## Ejecución del reporte

Ejecutar primero `ZMM_STOCK_RISK_REPORT` desde `SE38` y después mediante `ZMM_STOCK_RISK` tras crear la Report Transaction en `SE93`.

Usar un material no sensible que:

- exista en SAP;
- esté extendido al centro seleccionado;
- tenga registro válido en el almacén;
- tenga un tipo MRP comprendido;
- disponga de valores útiles de punto de pedido/stock de seguridad para el diagnóstico.

Contexto SALV esperado:

- material;
- centro;
- almacén seleccionado;
- tipo MRP;
- stock libre del almacén seleccionado;
- stock libre bruto de planta;
- punto de pedido;
- stock de seguridad;
- estado diagnóstico;
- cantidad faltante.

## Límite de interpretación

El reporte es un diagnóstico temprano basado únicamente en stock. No calcula disponibilidad MRP de SAP ni incorpora entradas firmes, necesidades, alcance de áreas MRP, exclusiones de almacenes, lotificación, tiempos de aprovisionamiento o forecast.

## Límite de seguridad

El camino runtime realiza únicamente lecturas sobre `MARC` y `MARD`. No añadir mantenimiento directo de tablas, escrituras mediante debug, sentencias de actualización ni lógica de commit a este artefacto público.

Usar identificadores sintéticos o sanitizados en cualquier evidencia pública.

## Límite de autorizaciones

`ZMM_STOCK_RISK` es una Report Transaction. SAP aplica el control estándar de inicio (`S_TCODE`). Las autorizaciones productivas sobre datos de negocio deben diseñarse para la organización objetivo; este laboratorio público no inventa roles específicos de cliente.

## Registro de resultados

Usar [`VALIDATION_RESULTS_TEMPLATE.md`](./VALIDATION_RESULTS_TEMPLATE.md) para registrar únicamente valores observados. Los campos no observados se dejan vacíos en lugar de marcarlos como pendientes.
