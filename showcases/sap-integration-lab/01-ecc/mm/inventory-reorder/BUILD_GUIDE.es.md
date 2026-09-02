# SAP ECC MM — Guía profesional para construir y publicar una transacción Z

[English version](./BUILD_GUIDE.md)

> **Objetivo:** reconstruir desde cero, en un ambiente SAP ECC DEV/sandbox autorizado, una transacción Z propia y reproducible para el paquete `Inventory & Stock Risk`.  
> **Estado runtime actual:** `RUNTIME_VALIDATION_PENDING`.

## 1. Principio de ingeniería

Este laboratorio **no replica desarrollos internos de terceros**. Implementa una solución original y de solo lectura usando objetos DDIC estándar ECC, ABAP Objects clásico, ABAP Unit, SALV y una Report Transaction creada con `SE93`.

Objetos:

- `ZCX_MM_STOCK_NOT_FOUND`
- `ZIF_MM_STOCK_SOURCE`
- `ZCL_MM_STOCK_SOURCE_DEMO`
- `ZCL_MM_STOCK_SOURCE_ECC`
- `ZCL_MM_STOCK_RISK_SERVICE`
- clases locales ABAP Unit
- `ZMM_STOCK_RISK_REPORT`
- `ZMM_STOCK_RISK` — Report Transaction en SE93

Antes de implementar, revisar [`COMPATIBILITY.es.md`](./COMPATIBILITY.es.md).

## 2. Límite funcional

La aplicación es un **diagnóstico temprano basado únicamente en stock**, no SAP MRP.

La versión endurecida distingue:

- stock libre del almacén seleccionado
- stock libre bruto total de planta calculado desde `MARD-LABST`
- tipo MRP desde `MARC-DISMM`
- punto de pedido desde `MARC-MINBE`
- stock de seguridad desde `MARC-EISBE`

El estado se calcula con el stock total de planta, no con un solo almacén.

El laboratorio no calcula entradas firmes, necesidades, alcance de áreas MRP, exclusiones de almacenes respecto a MRP, lotificación, tiempos de aprovisionamiento ni forecast.

## 3. Postura de compatibilidad

El código runtime prioriza construcciones clásicas:

- `CREATE OBJECT`
- `CALL METHOD`
- declaraciones `DATA` explícitas
- Open SQL clásico sin host variables `@`
- clases e interfaces globales
- excepciones basadas en clases
- `CL_SALV_TABLE`

Se evita sintaxis moderna cuando no aporta valor probatorio. La compatibilidad exacta con una release/EHP ECC sigue pendiente de validación runtime.

## 4. Paquete y transporte

Usar `$TMP` únicamente para una prueba local autorizada y no transportable. Para evidencia transportable, usar un paquete Z autorizado y CTS.

Nunca publicar:

- SID/mandante
- usuarios
- números de transportes
- nombres de empresa/cliente
- identificadores reales de materiales o negocio

## 5. Crear `ZCX_MM_STOCK_NOT_FOUND`

Herramienta: `SE24` o `SE80`.

1. Crear la clase global `ZCX_MM_STOCK_NOT_FOUND`.
2. Definir `CX_STATIC_CHECK` como superclase.
3. Asignar paquete/transporte.
4. Implementar `source/zcx_mm_stock_not_found.clas.abap`.
5. Ejecutar Syntax Check.
6. Activar.

Al ser una excepción de tipo static-check, los consumidores deben capturarla o declararla en su interfaz.

## 6. Crear `ZIF_MM_STOCK_SOURCE`

Crear una interfaz global e incorporar `source/zif_mm_stock_source.intf.abap`.

Confirmar en la release objetivo estas referencias DDIC:

- `MARA-MATNR`
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

El datasource ECC es de solo lectura. Realiza:

1. lectura de `MARC-DISMM`, `MARC-MINBE`, `MARC-EISBE` por material/centro
2. lectura de `MARD-LABST` del almacén seleccionado
3. lectura de todos los `MARD-LABST` del material/centro
4. suma en ABAP para obtener `plant_unrestricted`

No se utiliza `INSERT`, `UPDATE`, `MODIFY`, `DELETE` ni `COMMIT WORK`.

## 8. Crear `ZCL_MM_STOCK_RISK_SERVICE`

Crear la clase global e inyectar `ZIF_MM_STOCK_SOURCE` mediante constructor.

El servicio produce:

- `NOT_CONFIGURED` — punto de pedido y stock de seguridad están iniciales
- `CRITICAL` — stock libre de planta por debajo del stock de seguridad configurado
- `REORDER` — stock libre de planta igual o inferior al punto de pedido configurado, sin estar debajo del safety stock
- `OK` — ninguna condición anterior aplica

`shortage_qty` solo se calcula si existe un punto de pedido positivo y el stock de planta es inferior.

Ejecutar Syntax Check y activar.

## 9. Añadir ABAP Unit

Abrir `ZCL_MM_STOCK_RISK_SERVICE` e incorporar las clases locales desde:

`source/zcl_mm_stock_risk_service.clas.testclasses.abap`

Según release, usar el editor de clases locales de prueba o la vista equivalente de definiciones/implementaciones locales.

Los métodos de prueba declaran explícitamente `RAISING ZCX_MM_STOCK_NOT_FOUND`, ya que el servicio propaga una excepción `CX_STATIC_CHECK`.

Casos preparados:

1. stock de planta sobre punto de pedido → `OK`
2. stock de planta exactamente en punto de pedido → `REORDER`
3. stock de planta debajo del stock de seguridad → `CRITICAL`
4. cálculo de cantidad faltante al punto de pedido
5. sin umbrales configurados → `NOT_CONFIGURED`
6. stock bajo en almacén seleccionado pero suficiente en planta → el estado sigue siendo de planta

Después de una validación real exitosa, la evidencia esperada será:

```text
Tests executed: 6
Passed: 6
Failed: 0
```

No registrar esto como aprobado hasta observarlo realmente en SAP.

## 10. Crear el programa ejecutable

Herramienta: `SE38` o `SE80`.

Programa: `ZMM_STOCK_RISK_REPORT`

1. Crear como **Executable Program**.
2. Asignar el mismo paquete/CTS.
3. Incorporar `source/zmm_stock_risk_report.prog.abap`.
4. Syntax Check.
5. Activar.
6. Ejecutar primero directamente desde `SE38`.

Parámetros:

- Material
- Centro
- Almacén

Campos SALV esperados:

- material
- centro
- almacén seleccionado
- tipo MRP
- stock libre del almacén
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
5. Seleccionar la opción de Report Transaction.
6. Programa: `ZMM_STOCK_RISK_REPORT`.
7. Mantener la pantalla estándar de selección.
8. Guardar y asignar paquete/transporte.
9. Ejecutar desde SAP Easy Access.

SAP aplica el control estándar de inicio `S_TCODE` también a transacciones Z. Una implantación productiva real requeriría además un diseño de autorizaciones sobre datos de negocio con el equipo de seguridad; este laboratorio no inventa objetos de autorización específicos de un cliente.

## 12. Datos de prueba runtime

Usar únicamente un material no sensible que:

- exista
- esté extendido al centro objetivo
- tenga registro en el almacén seleccionado
- tenga un tipo MRP comprendido
- disponga de valores útiles para punto de pedido/stock de seguridad en el escenario elegido

No publicar números reales de material. La evidencia pública puede usar placeholders.

## 13. Registro de evidencia

Después de validar realmente, registrar en `EVIDENCE.md` solo resultados no confidenciales:

```text
Object creation: PASS
Syntax checks: PASS
Activation: PASS
ABAP Unit: 6/6 PASS
Transaction ZMM_STOCK_RISK: PASS
SALV runtime: PASS
ECC release/EHP: <descripción no confidencial>
```

Las capturas son opcionales. La evidencia textual exacta y reproducible es suficiente.

## 14. Gate de promoción

Solo promover a `RUNTIME_VALIDATED / TEST_VALIDATED` cuando:

- [ ] todos los objetos existan y activen en ECC DEV/sandbox
- [ ] los seis tests ABAP Unit pasen
- [ ] el reporte ejecute directamente
- [ ] `SE93` abra `ZMM_STOCK_RISK`
- [ ] SALV muestre los campos endurecidos
- [ ] no exista lógica de escritura
- [ ] no se publique información confidencial
- [ ] `EVIDENCE.md` quede actualizado

## 15. Base documental SAP

El procedimiento se apoya en documentación SAP para:

- Class Builder / clases e interfaces globales
- excepciones basadas en clases y `CX_STATIC_CHECK`
- programas ejecutables
- ABAP Unit
- `CL_SALV_TABLE`
- Report Transactions / `SE93`
- autorización de inicio mediante `S_TCODE`
- comportamiento funcional de reorder-point planning
- paquetes / CTS
