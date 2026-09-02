# SAP ECC MM — Paquete de ejecución para validación runtime

> **Estado público actual:** `SOURCE_READY / RUNTIME_VALIDATION_PENDING`  
> **Objetivo:** crear, activar, probar y ejecutar el evidence pack en un ambiente SAP ECC DEV/sandbox autorizado sin exponer información de empresa, usuarios, SID, mandante, transportes ni datos productivos.

## Regla de trabajo

Validar **un objeto por vez**. No continuar con el siguiente objeto si el anterior no supera `Syntax Check` y activación.

Para comunicar resultados fuera de SAP basta con texto sanitizado:

```text
Objeto: ZCX_MM_STOCK_NOT_FOUND
Syntax: PASS
Activation: PASS
Release/EHP: <solo versión técnica no sensible>
Notas: ninguna
```

Si falla:

```text
Objeto: ZCX_MM_STOCK_NOT_FOUND
Syntax: FAIL
Línea/aproximación: <línea>
Mensaje SAP: <texto sin datos sensibles>
```

No enviar usuario, contraseña, SID, mandante, números de transporte, nombres de empresa o datos de materiales reales.

---

## 2.1.1 — Excepción global

### Objeto

`ZCX_MM_STOCK_NOT_FOUND`

### Herramienta

`SE24` (Class Builder) o `SE80`.

### Propósito

Excepción estática y explícita cuando no se puede resolver la combinación material/centro/almacén solicitada por el datasource.

### Creación

1. Abrir `SE24`.
2. Introducir `ZCX_MM_STOCK_NOT_FOUND`.
3. Seleccionar **Crear**.
4. Descripción sugerida: `MM stock snapshot not found`.
5. Crear como clase global pública.
6. Superclase: `CX_STATIC_CHECK`.
7. Asignar paquete Z autorizado o `$TMP` únicamente para una prueba local autorizada.
8. Si la release permite edición source-based, utilizar el archivo:
   `source/zcx_mm_stock_not_found.clas.abap`.
9. Si se utiliza mantenimiento clásico, crear los atributos públicos read-only y el constructor equivalentes a la fuente versionada.
10. Ejecutar `Syntax Check`.
11. Activar.

### Gate

```text
ZCX_MM_STOCK_NOT_FOUND
Syntax ........ PASS
Activation .... PASS
```

No continuar hasta lograr ambos.

---

## 2.1.2 — Contrato del datasource

### Objeto

`ZIF_MM_STOCK_SOURCE`

### Herramienta

`SE24` / `SE80` — interfaz global.

### Validaciones DDIC previas

La release debe resolver los tipos estándar utilizados por la interfaz:

- `MARA-MATNR`
- `MARA-MEINS`
- `MARC-WERKS`
- `MARC-DISMM`
- `MARC-MINBE`
- `MARC-EISBE`
- `MARD-LGORT`
- `MARD-LABST`

### Creación

1. Crear interfaz global `ZIF_MM_STOCK_SOURCE`.
2. Asignar el mismo paquete del lab.
3. Implementar la estructura `TY_STOCK_SNAPSHOT` y el método `GET_STOCK_SNAPSHOT` según:
   `source/zif_mm_stock_source.intf.abap`.
4. `Syntax Check`.
5. Activar.

### Gate

```text
ZIF_MM_STOCK_SOURCE
Syntax ........ PASS
Activation .... PASS
```

---

## 2.1.3 — Datasource demo

### Objeto

`ZCL_MM_STOCK_SOURCE_DEMO`

### Propósito

Permite ejecutar ABAP Unit con datos sintéticos sin depender de datos de negocio.

### Creación

1. Crear clase global.
2. Implementar `ZIF_MM_STOCK_SOURCE`.
3. Crear constructor con `IS_SNAPSHOT`.
4. Incorporar `source/zcl_mm_stock_source_demo.clas.abap`.
5. `Syntax Check`.
6. Activar.

### Gate

```text
ZCL_MM_STOCK_SOURCE_DEMO
Syntax ........ PASS
Activation .... PASS
```

---

## 2.1.4 — Datasource ECC

### Objeto

`ZCL_MM_STOCK_SOURCE_ECC`

### Propósito

Fuente read-only que consulta datos estándar del material en ECC.

### Lecturas previstas

- `MARA-MEINS` — unidad base
- `MARC-DISMM` — tipo MRP
- `MARC-MINBE` — punto de pedido
- `MARC-EISBE` — stock de seguridad
- `MARD-LABST` — stock libre del almacén seleccionado
- suma de `MARD-LABST` por material/centro — stock libre bruto de planta para el diagnóstico

### Regla de seguridad

Este lab **no contiene** `UPDATE`, `INSERT`, `MODIFY`, `DELETE`, debug para edición de tablas ni cambio de customizing.

### Creación

1. Crear clase global.
2. Implementar `ZIF_MM_STOCK_SOURCE`.
3. Incorporar `source/zcl_mm_stock_source_ecc.clas.abap`.
4. `Syntax Check`.
5. Activar.

### Gate

```text
ZCL_MM_STOCK_SOURCE_ECC
Syntax ........ PASS
Activation .... PASS
```

---

## 2.1.5 — Servicio de dominio

### Objeto

`ZCL_MM_STOCK_RISK_SERVICE`

### Propósito

Separar la lógica de diagnóstico de la capa de datos y de la UI/reporting.

### Estados

- `NOT_CONFIGURED`
- `CRITICAL`
- `REORDER`
- `OK`

### Límite funcional

El servicio **no es SAP MRP**. Es un early-warning stock diagnostic transparente y reducido. No considera requerimientos, reservas, recepciones firmes, áreas MRP, lot sizing, lead time, forecast ni otras dimensiones del motor MRP.

### Creación

1. Crear clase global.
2. Constructor con dependencia `IO_SOURCE TYPE REF TO ZIF_MM_STOCK_SOURCE`.
3. Incorporar `source/zcl_mm_stock_risk_service.clas.abap`.
4. `Syntax Check`.
5. Activar.

### Gate

```text
ZCL_MM_STOCK_RISK_SERVICE
Syntax ........ PASS
Activation .... PASS
```

---

## 2.1.6 — ABAP Unit

### Ubicación

Clases locales de prueba asociadas a `ZCL_MM_STOCK_RISK_SERVICE`.

### Fuente

`source/zcl_mm_stock_risk_service.clas.testclasses.abap`

### Casos preparados

1. stock de planta superior al punto de pedido → `OK`
2. stock de planta exactamente en el punto de pedido → `REORDER`
3. stock de planta debajo del stock de seguridad → `CRITICAL`
4. cálculo de shortage hasta el punto de pedido
5. punto de pedido y safety stock iniciales → `NOT_CONFIGURED`
6. almacén con poco stock pero planta suficiente → estado basado en planta

### Validación

1. Insertar las clases locales de prueba.
2. `Syntax Check`.
3. Activar.
4. Ejecutar ABAP Unit.
5. Registrar número total/pass/fail.

### Gate esperado

```text
ABAP Unit
Executed ...... 6
Passed ........ 6
Failed ........ 0
```

No declarar este resultado públicamente hasta observarlo realmente en SAP.

---

## 2.1.7 — Reporte ejecutable

### Objeto

`ZMM_STOCK_RISK_REPORT`

### Herramienta

`SE38` o `SE80`.

### Creación

1. Crear programa `ZMM_STOCK_RISK_REPORT`.
2. Tipo: **Executable Program**.
3. Asignar el mismo paquete/CTS.
4. Incorporar `source/zmm_stock_risk_report.prog.abap`.
5. `Syntax Check`.
6. Activar.
7. Ejecutar desde `SE38` antes de crear la transacción.

### Selection screen

- Material
- Centro
- Almacén

### Resultado

Una fila SALV con contexto de material, unidad base, tipo MRP, stock del almacén, stock bruto de planta, umbrales y estado diagnóstico.

### Gate

```text
ZMM_STOCK_RISK_REPORT
Syntax ........ PASS
Activation .... PASS
SE38 runtime .. PASS
SALV .......... PASS
```

---

## 2.1.8 — Transaction code

### Objeto

`ZMM_STOCK_RISK`

### Herramienta

`SE93`.

### Tipo

**Report Transaction / Program and selection screen**.

### Configuración

- Program: `ZMM_STOCK_RISK_REPORT`
- Selection screen inicial: conservar visible
- Short text: `MM Stock Risk Diagnostic`

Guardar bajo el mismo paquete/solicitud autorizada y ejecutar desde SAP Easy Access.

### Gate

```text
ZMM_STOCK_RISK
Creation ...... PASS
Launch ........ PASS
SALV runtime .. PASS
```

---

## Selección del material para runtime

Usar solo un material de prueba/no sensible que:

1. exista
2. esté extendido al centro
3. tenga registro en el almacén seleccionado
4. permita interpretar `DISMM`, `MINBE` y `EISBE`
5. no requiera publicar ningún identificador real

Para el registro público basta describirlo como `synthetic/non-sensitive validation material`.

---

## Resultado final de la Tarea 2.1

Solo cuando todos los gates hayan sido observados:

```text
SAP ECC MM — Runtime Validation

ZCX_MM_STOCK_NOT_FOUND .... PASS
ZIF_MM_STOCK_SOURCE ....... PASS
ZCL_MM_STOCK_SOURCE_DEMO .. PASS
ZCL_MM_STOCK_SOURCE_ECC ... PASS
ZCL_MM_STOCK_RISK_SERVICE . PASS
ABAP Unit ................. 6/6 PASS
ZMM_STOCK_RISK_REPORT ..... PASS
ZMM_STOCK_RISK (SE93) ..... PASS
SALV runtime .............. PASS

Evidence maturity:
RUNTIME_VALIDATED
TEST_VALIDATED
```

Hasta entonces conservar `RUNTIME_VALIDATION_PENDING`.
