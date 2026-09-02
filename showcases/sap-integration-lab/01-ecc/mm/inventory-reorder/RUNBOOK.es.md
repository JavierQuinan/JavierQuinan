# SAP ECC MM Inventario y Riesgo de Stock — Guía de Ejecución

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

Los archivos ubicados en `source/` son la fuente de verdad.

## Secuencia de validación

Para cada objeto de desarrollo:

1. ejecutar Syntax Check
2. activar
3. registrar en `EVIDENCE.md` cualquier ajuste específico requerido por la release

Después de activar todas las clases:

1. ejecutar ABAP Unit sobre `ZCL_MM_STOCK_RISK_SERVICE`
2. confirmar la ejecución correcta de los seis casos preparados
3. registrar cantidad de pruebas aprobadas/fallidas

## Escenarios ABAP Unit esperados

1. stock de planta superior al punto de pedido → `OK`
2. stock de planta exactamente en punto de pedido → `REORDER`
3. stock de planta por debajo del stock de seguridad → `CRITICAL`
4. cálculo de cantidad faltante hasta punto de pedido
5. sin umbrales → `NOT_CONFIGURED`
6. stock bajo en almacén seleccionado con stock suficiente en planta → el estado de planta permanece `OK`

No afirmar `6/6 PASS` hasta observarlo realmente en SAP.

## Ejecución del reporte

Ejecutar primero `ZMM_STOCK_RISK_REPORT` desde `SE38` y luego mediante `ZMM_STOCK_RISK` después de crear la Report Transaction en `SE93`.

Utilizar un material no sensible que:

- exista en SAP
- esté extendido al centro seleccionado
- tenga registro válido en el almacén
- tenga un tipo MRP comprendido
- disponga de valores útiles de punto de pedido/stock de seguridad para la prueba

Ingresar:

- Material
- Centro
- Almacén

Fila SALV esperada:

- material
- centro
- almacén seleccionado
- tipo MRP
- stock libre del almacén seleccionado
- stock libre bruto de planta
- punto de pedido
- stock de seguridad
- estado diagnóstico
- cantidad faltante

## Límite de interpretación

El reporte es un diagnóstico temprano basado únicamente en stock. No calcula disponibilidad MRP de SAP y no incorpora entradas firmes, necesidades, alcance de áreas MRP, exclusiones de almacenes, lotificación, tiempos de aprovisionamiento ni forecast.

## Límite de seguridad

El camino runtime realiza únicamente lecturas sobre `MARC` y `MARD`. No añadir mantenimiento directo de tablas, escrituras mediante debug, sentencias de actualización ni lógica de commit a este artefacto público.

Usar identificadores sintéticos o sanitizados en cualquier evidencia pública.

## Límite de autorizaciones

`ZMM_STOCK_RISK` es una Report Transaction. SAP aplica el control estándar de inicio (`S_TCODE`). Las autorizaciones productivas sobre datos de negocio deben diseñarse para la organización objetivo; este laboratorio público no inventa roles específicos de un cliente.

## Registro de evidencia

Después de validar runtime correctamente, actualizar `EVIDENCE.md` con:

- release/EHP ECC sin identificar el sistema confidencial
- resultado de syntax check/activación
- resultado ABAP Unit
- creación/ejecución de la transacción SE93
- resultado SALV sanitizado
- ajustes de compatibilidad realizados, si existieron

Solo entonces el estado público podrá avanzar más allá de `RUNTIME_VALIDATION_PENDING`.
