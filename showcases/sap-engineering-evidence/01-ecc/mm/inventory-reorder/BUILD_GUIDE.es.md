# SAP ECC MM — Guía Profesional para Construir una Transacción Z

[English version](./BUILD_GUIDE.md)

> **Objetivo:** reconstruir, en un ambiente SAP ECC de desarrollo/sandbox autorizado, el evidence pack original y read-only `Inventory & Stock Risk` a partir del source versionado en este repositorio.

## 1. Principio de ingeniería

Este laboratorio **no replica desarrollos internos de terceros**. Implementa una solución original de solo lectura usando objetos DDIC estándar ECC, ABAP Objects clásico, ABAP Unit, SALV y una Report Transaction creada con `SE93`.

Objetos:

- `ZCX_MM_STOCK_NOT_FOUND`
- `ZIF_MM_STOCK_SOURCE`
- `ZCL_MM_STOCK_SOURCE_DEMO`
- `ZCL_MM_STOCK_SOURCE_ECC`
- `ZCL_MM_STOCK_RISK_SERVICE`
- clases locales ABAP Unit
- `ZMM_STOCK_RISK_REPORT`
- `ZMM_STOCK_RISK` — Report Transaction en SE93

Revisar [`COMPATIBILITY.es.md`](./COMPATIBILITY.es.md) antes de implementar.

## 2. Límite funcional

La aplicación es un **diagnóstico temprano basado únicamente en stock**, no SAP MRP.

La implementación endurecida distingue:

- stock libre del almacén seleccionado;
- stock libre bruto de planta calculado desde `MARD-LABST`;
- tipo MRP desde `MARC-DISMM`;
- punto de pedido desde `MARC-MINBE`;
- stock de seguridad desde `MARC-EISBE`.

El estado se calcula con el stock total de planta, no con un único almacén.

El laboratorio no calcula entradas firmes, necesidades, alcance de áreas MRP, exclusiones de almacenes respecto a MRP, lotificación, tiempos de aprovisionamiento ni forecast.

## 3. Postura de compatibilidad

El source prioriza construcciones clásicas:

- `CREATE OBJECT`
- `CALL METHOD`
- declaraciones `DATA` explícitas
- Open SQL clásico sin host variables `@`
- clases e interfaces globales
- excepciones basadas en clases
- `CL_SALV_TABLE`

Se evita sintaxis moderna cuando no aporta valor probatorio. La disponibilidad exacta depende de la release ECC / NetWeaver donde se importe el source; el repositorio no afirma una release mínima no observada.

## 4. Paquete y transporte

Usar `$TMP` únicamente para una prueba local autorizada y no transportable. Para trabajo transportable, usar paquete Z y CTS autorizados.

Nunca publicar SID/mandante, usuarios, números de transporte, nombres de empresa/cliente ni identificadores reales de materiales o negocio.

## 5. Crear `ZCX_MM_STOCK_NOT_FOUND`

Herramienta: `SE24` o `SE80`.

1. Crear la clase global `ZCX_MM_STOCK_NOT_FOUND`.
2. Definir `CX_STATIC_CHECK` como superclase.
3. Asignar paquete/transporte según la política del ambiente.
4. Implementar `source/zcx_mm_stock_not_found.clas.abap`.
5. Ejecutar Syntax Check.
6. Activar.

Al ser una excepción static-check, los consumidores deben capturarla o declararla en su interfaz.

## 6. Crear `ZIF_MM_STOCK_SOURCE`

Crear una interfaz global e incorporar `source/zif_mm_stock_source.intf.abap`.

Confirmar en la release objetivo:

- `MARA-MATNR`
- `MARA-MEINS`
- `MARC-WERKS`
- `MARC-DISMM`
- `MARC-MINBE`
- `MARC-EISBE`
- `MARD-LGORT`
- `MARD-LABST`

El snapshot expone stock tanto de almacén como de planta.

Ejecutar Syntax Check y activar antes de continuar.

## 7. Crear datasources

Crear en este orden:

1. `ZCL_MM_STOCK_SOURCE_DEMO`
2. `ZCL_MM_STOCK_SOURCE_ECC`

El datasource demo recibe valores sintéticos deterministas y se utiliza en ABAP Unit.

El datasource ECC es read-only. Realiza:

1. lectura de `MARA-MEINS`;
2. lectura de `MARC-DISMM`, `MARC-MINBE`, `MARC-EISBE` por material/centro;
3. lectura de `MARD-LABST` del almacén seleccionado;
4. lectura de todos los `MARD-LABST` del material/centro;
5. suma en ABAP para obtener `plant_unrestricted`.

No utiliza `INSERT`, `UPDATE`, `MODIFY` de base, `DELETE` ni `COMMIT WORK`.

## 8. Crear `ZCL_MM_STOCK_RISK_SERVICE`

Crear la clase global e inyectar `ZIF_MM_STOCK_SOURCE` mediante constructor.

El servicio produce:

- `NOT_CONFIGURED` — punto de pedido y stock de seguridad iniciales;
- `CRITICAL` — stock libre de planta por debajo del stock de seguridad;
- `REORDER` — stock libre de planta igual o inferior al punto de pedido sin estar bajo safety stock;
- `OK` — ninguna condición anterior.

`shortage_qty` solo se calcula cuando existe un punto de pedido positivo y el stock de planta es inferior.

Ejecutar Syntax Check y activar.

## 9. Añadir ABAP Unit

Abrir `ZCL_MM_STOCK_RISK_SERVICE` e incorporar las clases locales desde:

`source/zcl_mm_stock_risk_service.clas.testclasses.abap`

Escenarios preparados:

1. stock de planta sobre punto de pedido → `OK`
2. stock de planta exactamente en punto de pedido → `REORDER`
3. stock de planta debajo del stock de seguridad → `CRITICAL`
4. cálculo de cantidad faltante hasta el punto de pedido
5. sin umbrales configurados → `NOT_CONFIGURED`
6. stock bajo en almacén seleccionado pero suficiente en planta → prevalece el estado de planta

Resultado de revisión en repositorio:

```text
Escenarios revisados: 6
Consistentes:         6
Inconsistencias:      0
```

Al ejecutar ABAP Unit en SAP, registrar únicamente total/pass/fail observado. No inferir un resultado runtime desde la revisión estática.

## 10. Crear el programa ejecutable

Herramienta: `SE38` o `SE80`.

Programa: `ZMM_STOCK_RISK_REPORT`

1. Crear como **Executable Program**.
2. Asignar el mismo paquete/CTS.
3. Incorporar `source/zmm_stock_risk_report.prog.abap`.
4. Syntax Check.
5. Activar.
6. Ejecutar directamente desde `SE38`.

Parámetros:

- Material
- Centro
- Almacén

Contexto SALV esperado:

- material
- centro
- almacén seleccionado
- unidad base
- tipo MRP
- stock libre del almacén seleccionado
- stock libre bruto de planta
- punto de pedido
- stock de seguridad
- estado diagnóstico
- cantidad faltante

## 11. Crear `ZMM_STOCK_RISK` en SE93

Tipo correcto: **Report Transaction / Program and selection screen**.

1. Abrir `SE93`.
2. Ingresar `ZMM_STOCK_RISK`.
3. Elegir **Create**.
4. Short text: `MM Stock Risk Diagnostic`.
5. Seleccionar Report Transaction.
6. Programa: `ZMM_STOCK_RISK_REPORT`.
7. Mantener la pantalla estándar de selección.
8. Guardar y asignar paquete/transporte.
9. Ejecutar desde SAP Easy Access.

SAP aplica el control estándar de inicio `S_TCODE`. La autorización de datos de negocio depende de cada organización; este laboratorio público no inventa roles específicos de cliente.

## 12. Datos de validación

Usar únicamente un material no sensible que exista, esté extendido al centro objetivo, tenga registro en el almacén seleccionado y permita interpretar valores MRP/reposición.

No publicar números reales de material, centro/almacén, SID/mandante, usuarios o transportes.

## 13. Registrar resultados observados

Usar [`VALIDATION_RESULTS_TEMPLATE.md`](./VALIDATION_RESULTS_TEMPLATE.md). Registrar `PASS` o `FAIL` solo para acciones realmente observadas; los campos no observados se dejan vacíos.

## 14. Base documental SAP

El procedimiento se apoya en documentación SAP para Class Builder, clases/interfaces globales, excepciones basadas en clases, programas ejecutables, ABAP Unit, Report Transactions/`SE93`, `S_TCODE` y conceptos relacionados. Consulte [`OFFICIAL_SAP_REFERENCES.es.md`](../../../OFFICIAL_SAP_REFERENCES.es.md).

## Evidencia representada por esta guía

Esta guía está cerrada como **procedimiento reproducible de construcción y verificación**. No presenta un resultado runtime corporativo salvo que exista un registro separado proveniente de una ejecución real y autorizada.
