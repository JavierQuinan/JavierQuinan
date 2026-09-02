# SAP ECC MM — Guía Reproducible de Ejecución y Verificación

[English version](./RUNTIME_EXECUTION.md)

> **Evidencia representada aquí:** source revisable, hardening de fuente completado, seis escenarios deterministas revisados de forma consistente y un procedimiento completo de construcción/verificación SAP.

Este documento es una guía técnica reutilizable para crear y verificar el evidence pack en un ambiente SAP ECC de desarrollo o sandbox autorizado. No presenta como realizada ninguna activación SAP ni ejecución ABAP Unit que no esté observada en el repositorio.

## Evidencia verificada en el repositorio

- revisión/hardening de source: **completado**
- escenarios deterministas revisados: **6**
- resultados esperados consistentes: **6**
- inconsistencias estáticas: **0**
- datasource: **solo lectura**
- guía de creación de objetos: **disponible**
- procedimiento SE24 / SE38 / SE93: **disponible**

Ver [`STATIC_VALIDATION.md`](./STATIC_VALIDATION.md).

## Secuencia de objetos

| Paso | Objeto | Herramienta SAP | Punto de verificación |
|---|---|---|---|
| 1 | `ZCX_MM_STOCK_NOT_FOUND` | SE24 / SE80 | syntax + activación |
| 2 | `ZIF_MM_STOCK_SOURCE` | SE24 / SE80 | syntax + activación |
| 3 | `ZCL_MM_STOCK_SOURCE_DEMO` | SE24 / SE80 | syntax + activación |
| 4 | `ZCL_MM_STOCK_SOURCE_ECC` | SE24 / SE80 | syntax + activación |
| 5 | `ZCL_MM_STOCK_RISK_SERVICE` | SE24 / SE80 | syntax + activación |
| 6 | clases locales ABAP Unit | SE24 / ABAP Unit | seis casos deterministas |
| 7 | `ZMM_STOCK_RISK_REPORT` | SE38 / SE80 | syntax + activación + SALV |
| 8 | `ZMM_STOCK_RISK` | SE93 | Report Transaction + ejecución |

Los archivos versionados en `source/` son la fuente de verdad.

## Límite del datasource

La fuente ECC es deliberadamente read-only y utiliza campos MM estándar:

- `MARA-MEINS`
- `MARC-DISMM`
- `MARC-MINBE`
- `MARC-EISBE`
- `MARD-LABST`

El diagnóstico separa el stock libre del almacén seleccionado del stock libre bruto de planta. El resultado es un diagnóstico transparente de stock y no debe presentarse como SAP MRP.

## Escenarios deterministas

1. stock de planta superior al punto de pedido → `OK`
2. stock de planta exactamente en punto de pedido → `REORDER`
3. stock de planta debajo del stock de seguridad → `CRITICAL`
4. cálculo de cantidad faltante hasta el punto de pedido
5. sin umbrales de reposición/seguridad → `NOT_CONFIGURED`
6. almacén seleccionado con poco stock pero planta suficiente → prevalece el resultado de planta

Resultado revisado en repositorio:

```text
Escenarios revisados: 6
Consistentes:         6
Inconsistencias:      0
```

## Procedimiento de ejecución

Para cada clase/interfaz/programa global:

1. crear el objeto con el nombre documentado;
2. asignar paquete de desarrollo autorizado o paquete local según la política del ambiente;
3. copiar el source correspondiente versionado;
4. ejecutar Syntax Check;
5. activar;
6. registrar únicamente ajustes de compatibilidad sanitizados si la release ECC objetivo lo requiere.

Para ABAP Unit:

1. asociar las clases locales de prueba a `ZCL_MM_STOCK_RISK_SERVICE`;
2. ejecutar Syntax Check y activar;
3. ejecutar la clase de pruebas;
4. registrar total/pass/fail observado sin identificadores del sistema o empresa.

Para el ejecutable:

1. crear `ZMM_STOCK_RISK_REPORT` en `SE38`/`SE80`;
2. ejecutarlo primero como reporte;
3. verificar columnas SALV y resultado diagnóstico usando datos no sensibles;
4. crear `ZMM_STOCK_RISK` en `SE93` como Report Transaction apuntando al reporte;
5. ejecutar la transacción y comprobar la misma salida read-only.

## Regla para datos de validación

Usar únicamente un material no sensible que exista, esté extendido al centro, tenga registro de almacén y permita interpretar los campos MRP/reposición. La evidencia pública debe eliminar material, centro, almacén, SID, mandante, usuarios y números de transporte.

## Formato para registrar resultados

Usar [`VALIDATION_RESULTS_TEMPLATE.md`](./VALIDATION_RESULTS_TEMPLATE.md) como formulario neutral. Un campo vacío significa **no registrado en este repositorio**, no “fallido” ni “pendiente”.

## Límites de seguridad e interpretación

El evidence pack no contiene BAPIs de creación/cambio de documentos, ni `INSERT`, `UPDATE`, `MODIFY`, `DELETE`, mantenimiento directo de tablas ni lógica de commit. Tampoco calcula necesidades, entradas firmes, alcance de áreas MRP, lotificación, lead time, forecast ni un diseño productivo de autorizaciones.

## Claim público respaldado

> Evidence pack SAP ECC MM / ABAP Objects con source MARA/MARC/MARD read-only revisable, reporting SALV, seis escenarios deterministas revisados consistentemente y guías reproducibles de construcción/verificación SE24/SE38/SE93.
