# SAP ECC MM Inventario y Riesgo de Stock — Guía de Ejecución

[English version](./RUNBOOK.md)

> Utilizar únicamente en un ambiente SAP de desarrollo/sandbox autorizado.

## Objetivo

Crear, activar, probar y ejecutar el paquete de evidencia sin utilizar código de cliente ni información confidencial.

## Orden recomendado de objetos

1. Crear la clase de excepción `ZCX_MM_STOCK_NOT_FOUND`.
2. Crear la interfaz `ZIF_MM_STOCK_SOURCE`.
3. Crear la clase `ZCL_MM_STOCK_SOURCE_DEMO`.
4. Crear la clase `ZCL_MM_STOCK_SOURCE_ECC`.
5. Crear la clase `ZCL_MM_STOCK_RISK_SERVICE`.
6. Incorporar las clases locales ABAP Unit en `ZCL_MM_STOCK_RISK_SERVICE`.
7. Crear el reporte ejecutable `ZMM_STOCK_RISK_REPORT`.

Los archivos ubicados en `source/` son la fuente de verdad del paquete.

## Secuencia de validación

Para cada objeto:

1. ejecutar syntax check
2. activar
3. registrar en `EVIDENCE.md` cualquier ajuste específico requerido por la release

Después de activar todas las clases:

1. ejecutar ABAP Unit sobre `ZCL_MM_STOCK_RISK_SERVICE`
2. confirmar la ejecución correcta de los cuatro casos preparados
3. registrar cantidad de pruebas aprobadas/fallidas en `EVIDENCE.md`

## Ejecución del reporte

Ejecute `ZMM_STOCK_RISK_REPORT` con un material no sensible que:

- exista en el sistema SAP
- esté extendido al centro seleccionado
- tenga un registro válido para el almacén
- tenga valores de punto de pedido/stock de seguridad útiles para el escenario de prueba

Ingrese:

- Material
- Centro
- Almacén

Resultado esperado: una fila SALV con material, centro, almacén, stock de libre utilización, punto de pedido, stock de seguridad, estado diagnóstico y cantidad faltante.

## Límite de seguridad

El reporte realiza únicamente lectura sobre `MARC` y `MARD`. No se debe incorporar edición directa de tablas, debug para modificación de datos ni comportamiento de actualización dentro de este artefacto público.

Utilice identificadores sintéticos o sanitizados en cualquier captura.

## Registro de evidencia

Después de validar runtime correctamente, actualice `EVIDENCE.md` con:

- release/EHP ECC sin identificar el sistema confidencial
- resultado de syntax check/activación
- resultado ABAP Unit
- ejecución sanitizada del reporte
- ajustes de compatibilidad realizados, si existieron

Solo entonces el estado público podrá avanzar más allá de `RUNTIME_VALIDATION_PENDING`.
