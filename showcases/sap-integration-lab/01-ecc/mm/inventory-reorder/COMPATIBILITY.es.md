# Perfil de Compatibilidad y Hardening ECC

[English version](./COMPATIBILITY.md)

> **Estado:** fuente revisada; validación runtime en SAP todavía pendiente.

Este documento registra las decisiones usadas para hacer `ZMM_STOCK_RISK` más portable y defendible en un entorno SAP ECC / AS ABAP clásico.

## Estrategia de compatibilidad

La fuente favorece construcciones ABAP clásicas y evita sintaxis moderna innecesaria que puede variar entre releases NetWeaver / ECC.

Se prioriza:

- `CREATE OBJECT`
- `CALL METHOD`
- declaraciones `DATA` explícitas
- Open SQL clásico sin host variables `@`
- clases e interfaces globales
- excepciones basadas en clases
- `CL_SALV_TABLE`
- clases locales ABAP Unit

Se evita intencionalmente en el camino runtime principal:

- `NEW #( )`
- `VALUE #( )`
- expresiones de tabla
- `DATA( )` inline
- string templates
- expresiones constructoras
- sintaxis CDS/RAP/ABAP Cloud

Esto **no** fija todavía una release mínima garantizada de ECC. La release/EHP exacta sigue formando parte de la validación runtime.

## Hardening funcional realizado

### 1. Stock de planta vs. stock de almacén

Los parámetros de planificación de `MARC` son de nivel planta. La primera versión comparaba esos parámetros directamente contra `MARD-LABST` de un único almacén, lo que era demasiado simplificado para una evidencia profesional.

El snapshot endurecido separa:

- `storage_unrestricted` — stock de libre utilización del almacén seleccionado
- `plant_unrestricted` — suma del stock de libre utilización representado por registros `MARD-LABST` para el material y planta seleccionados

El estado diagnóstico se calcula con `plant_unrestricted`; el almacén seleccionado se conserva como dato de detalle.

### 2. Tipo MRP visible

El datasource ahora lee `MARC-DISMM`, de forma que el reporte expone el tipo MRP del material y evita mostrar los umbrales sin contexto de planificación.

### 3. Umbrales no configurados

Cuando punto de pedido y stock de seguridad están iniciales, el resultado es `NOT_CONFIGURED` en lugar de producir una señal de reposición engañosa.

### 4. Disciplina de excepciones estáticas

`ZCX_MM_STOCK_NOT_FOUND` hereda de `CX_STATIC_CHECK`. Los métodos ABAP Unit que llaman APIs que pueden propagar esa excepción declaran explícitamente `RAISING ZCX_MM_STOCK_NOT_FOUND`.

### 5. Camino runtime de solo lectura

El datasource ECC contiene únicamente operaciones `SELECT`. No existen `INSERT`, `UPDATE`, `MODIFY`, `DELETE`, mantenimiento directo de tablas, escrituras mediante debug ni lógica de commit.

## Límite importante respecto a MRP

Esta aplicación es un **diagnóstico temprano basado únicamente en stock**. No es SAP MRP y no debe describirse como una reproducción del reorder-point planning.

La planificación por punto de pedido de SAP puede considerar stock de planta, entradas firmes y otras reglas de planificación. Este laboratorio no calcula:

- entradas firmes
- pedidos / solicitudes de pedido
- reservas o necesidades dependientes
- alcance por área MRP
- exclusiones de almacenes respecto a MRP
- lotificación
- planificación por tiempos de aprovisionamiento
- forecast
- comportamiento del planning file

Por ello, la salida debe presentarse como un diagnóstico transparente de ingeniería sobre campos seleccionados de stock y maestro de materiales MM.

## Elección de SALV

Se utiliza `CL_SALV_TABLE` para salida estructurada de solo lectura. No se implementa ALV editable.

## Límite de autorizaciones de la transacción

`ZMM_STOCK_RISK` está diseñada como Report Transaction creada en `SE93`. SAP ejecuta el control estándar de inicio de transacción (`S_TCODE`) también para transacciones propias.

En una implantación productiva real, la autorización sobre datos de negocio debe diseñarse con el equipo de seguridad/autorizaciones del cliente. Este laboratorio público no inventa objetos de autorización ni roles específicos de un cliente.

## Checklist de validación runtime

Antes de promover el artefacto más allá de `RUNTIME_VALIDATION_PENDING`:

1. verificar que todas las referencias DDIC existan en la release ECC objetivo
2. ejecutar syntax check de cada clase/interfaz/programa
3. activar cada objeto
4. ejecutar todos los tests ABAP Unit
5. crear y ejecutar `ZMM_STOCK_RISK` mediante `SE93`
6. ejecutar con una combinación material/centro/almacén no sensible
7. validar campos SALV y lógica de estados
8. registrar en `EVIDENCE.md` cualquier ajuste de compatibilidad requerido por la release

## Referencias SAP utilizadas durante el hardening

- SAP ABAP Keyword Documentation — categorías de excepciones basadas en clases
- SAP ABAP Unit — `FOR TESTING`, `RISK LEVEL`, `DURATION`
- documentación SAP — Report Transactions / `SE93`
- documentación SAP de autorizaciones — `S_TCODE`
- documentación SAP ALV — uso cliente de `CL_SALV_TABLE`
- documentación SAP — comportamiento funcional del reorder-point planning
