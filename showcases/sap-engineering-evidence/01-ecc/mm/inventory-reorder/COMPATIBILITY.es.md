# Perfil de Compatibilidad y Hardening ECC

[English version](./COMPATIBILITY.md)

> **Tipo de evidencia:** revisión de compatibilidad y hardening a nivel de source  
> **Límite runtime:** este documento no atribuye activación sobre una release ECC específica

Este documento registra las decisiones utilizadas para hacer `ZMM_STOCK_RISK` más portable y defendible en un entorno SAP ECC / AS ABAP clásico.

## Estrategia de compatibilidad

La fuente favorece construcciones ABAP clásicas y evita sintaxis innecesaria que puede variar entre generaciones NetWeaver / ECC.

Se prioriza:

- `CREATE OBJECT`
- `CALL METHOD`
- declaraciones `DATA` explícitas
- Open SQL clásico sin host variables `@`
- clases e interfaces globales
- excepciones basadas en clases
- `CL_SALV_TABLE`
- clases locales ABAP Unit

Se evita intencionalmente en el camino principal:

- `NEW #( )`
- `VALUE #( )`
- expresiones de tabla
- `DATA( )` inline
- string templates
- expresiones constructoras
- sintaxis CDS/RAP/ABAP Cloud

Esta postura mejora la portabilidad en ECC clásico. La disponibilidad exacta de sintaxis depende de la release ECC / NetWeaver donde se importe el source; el repositorio no afirma una release mínima no observada.

## Hardening funcional realizado

### 1. Stock de planta vs. stock de almacén

Los parámetros de planificación de `MARC` son de nivel planta. El borrador inicial comparaba esos parámetros directamente contra `MARD-LABST` de un único almacén, una simplificación insuficiente para una evidencia profesional.

El snapshot endurecido separa:

- `storage_unrestricted` — stock de libre utilización del almacén seleccionado
- `plant_unrestricted` — suma de `MARD-LABST` representada para el material y centro seleccionados

El estado diagnóstico utiliza `plant_unrestricted`; el valor del almacén permanece como detalle.

### 2. Tipo MRP visible

El datasource lee `MARC-DISMM`, por lo que el reporte expone el tipo MRP y evita mostrar umbrales sin contexto de planificación.

### 3. Unidad base visible

El snapshot incluye `MARA-MEINS`, evitando mostrar cantidades sin contexto de unidad base.

### 4. Umbrales no configurados

Cuando punto de pedido y stock de seguridad están iniciales, el resultado es `NOT_CONFIGURED` y no una señal de reposición engañosa.

### 5. Disciplina de excepciones estáticas

`ZCX_MM_STOCK_NOT_FOUND` hereda de `CX_STATIC_CHECK`. Los métodos ABAP Unit que llaman APIs que propagan esa excepción declaran explícitamente `RAISING ZCX_MM_STOCK_NOT_FOUND`.

### 6. Camino read-only

El datasource ECC contiene únicamente `SELECT`. No existen `INSERT`, `UPDATE`, `MODIFY` de base, `DELETE`, mantenimiento directo de tablas, escrituras mediante debug ni lógica de commit.

## Límite respecto a MRP

La aplicación es un **diagnóstico temprano basado únicamente en stock**. No es SAP MRP ni reproduce el reorder-point planning.

El source público no calcula:

- entradas firmes
- pedidos / solicitudes de pedido
- reservas o necesidades dependientes
- alcance por área MRP
- exclusiones de almacenes respecto a MRP
- lotificación
- tiempos de aprovisionamiento
- forecast
- comportamiento del planning file

La salida se presenta como un diagnóstico transparente de ingeniería sobre campos MM seleccionados.

## Elección de SALV

Se utiliza `CL_SALV_TABLE` para salida estructurada read-only. No se implementa ALV editable.

## Límite de autorizaciones

`ZMM_STOCK_RISK` se documenta como Report Transaction creada en `SE93`. SAP aplica el control estándar de inicio (`S_TCODE`).

La autorización sobre datos de negocio depende de cada organización. Este laboratorio público no inventa objetos de autorización ni roles específicos de cliente.

## Procedimiento de verificación

Existe una secuencia reusable para un ambiente ECC de desarrollo/sandbox autorizado:

1. verificar referencias DDIC
2. ejecutar syntax check sobre clases/interfaces/programa
3. activar objetos
4. ejecutar los seis casos ABAP Unit
5. ejecutar `ZMM_STOCK_RISK_REPORT` en `SE38`
6. configurar/ejecutar `ZMM_STOCK_RISK` en `SE93`
7. revisar campos SALV y resultado con datos no sensibles
8. registrar diferencias de release sin revelar identificadores empresariales

Es un procedimiento de réplica, no un claim de resultados runtime observados para este artefacto público.

## Referencias SAP

Consulte [`OFFICIAL_SAP_REFERENCES.es.md`](../../../OFFICIAL_SAP_REFERENCES.es.md) para referencias Help SAP sobre Class Builder/SE24, Report Transactions/SE93, ABAP Unit y conceptos de desarrollo relacionados.
