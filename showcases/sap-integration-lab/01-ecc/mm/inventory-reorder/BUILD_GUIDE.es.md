# SAP ECC MM — Guía profesional para construir y publicar una transacción Z

[English version](./BUILD_GUIDE.md)

> **Objetivo:** reconstruir desde cero, en un ambiente SAP ECC DEV/sandbox autorizado, una transacción Z propia y reproducible para el paquete de evidencia `Inventory & Stock Risk`.
>
> **Estado actual del runtime:** `RUNTIME_VALIDATION_PENDING`.

## 1. Principio de diseño

Esta guía **no replica desarrollos internos de terceros**. El laboratorio implementa una solución propia basada en objetos estándar SAP ECC y en documentación pública de SAP.

La primera transacción será:

- **Transaction code:** `ZMM_STOCK_RISK`
- **Executable report:** `ZMM_STOCK_RISK_REPORT`
- **Domain service:** `ZCL_MM_STOCK_RISK_SERVICE`
- **ECC datasource:** `ZCL_MM_STOCK_SOURCE_ECC`
- **Demo datasource:** `ZCL_MM_STOCK_SOURCE_DEMO`
- **Datasource contract:** `ZIF_MM_STOCK_SOURCE`
- **Domain exception:** `ZCX_MM_STOCK_NOT_FOUND`

La transacción es **read-only**. Consulta datos estándar de MM y no actualiza stock, materiales ni customizing.

## 2. Arquitectura

```text
ZMM_STOCK_RISK
      |
      v
ZMM_STOCK_RISK_REPORT
      |
      v
ZCL_MM_STOCK_RISK_SERVICE
      |
      v
ZIF_MM_STOCK_SOURCE
  |                 |
  v                 v
ECC datasource   Demo datasource
  |                 |
  v                 v
MARC / MARD      synthetic data
```

## 3. Preparar paquete y transporte

### Opción A — evidencia local controlada

Usar `$TMP` solo si la política del sistema permite objetos locales no transportables.

### Opción B — evidencia transportable

Usar un paquete Z autorizado del landscape de desarrollo. El paquete determina cómo los objetos se integran al Change and Transport System (CTS).

Registrar para la evidencia pública únicamente:

- release/EHP de ECC
- tipo de ambiente: DEV o sandbox
- paquete anonimizado si corresponde
- resultado de activación

No publicar SID, mandante, usuarios, órdenes de transporte ni nombres de empresa.

## 4. Crear la excepción global

### Herramienta

`SE24` — Class Builder, o alternativamente `SE80`.

### Objeto

`ZCX_MM_STOCK_NOT_FOUND`

### Procedimiento

1. Abrir `SE24`.
2. Introducir `ZCX_MM_STOCK_NOT_FOUND`.
3. Elegir **Create**.
4. Descripción sugerida: `MM stock snapshot not found`.
5. Crearla como clase global pública.
6. Definir `CX_STATIC_CHECK` como superclase.
7. Asignar paquete/orden de transporte según política del ambiente.
8. Cambiar a vista source-code-based si está disponible.
9. Implementar el código versionado en `source/zcx_mm_stock_not_found.clas.abap`.
10. Ejecutar **Syntax Check**.
11. Activar.

### Gate

No continuar si la clase no activa.

## 5. Crear la interfaz de datasource

### Objeto

`ZIF_MM_STOCK_SOURCE`

### Procedimiento

1. Abrir `SE24` o `SE80`.
2. Crear una **Interface** global con nombre `ZIF_MM_STOCK_SOURCE`.
3. Asignar el mismo paquete del evidence pack.
4. Incorporar la definición de `source/zif_mm_stock_source.intf.abap`.
5. Verificar que los tipos DDIC estándar existan en el sistema:
   - `MARA-MATNR`
   - `MARC-WERKS`
   - `MARD-LGORT`
   - `MARD-LABST`
   - `MARC-MINBE`
   - `MARC-EISBE`
6. Syntax Check.
7. Activar.

## 6. Crear los datasources

Crear en este orden:

1. `ZCL_MM_STOCK_SOURCE_DEMO`
2. `ZCL_MM_STOCK_SOURCE_ECC`

Para cada clase:

1. Crear clase global en `SE24`/`SE80`.
2. Implementar `ZIF_MM_STOCK_SOURCE`.
3. Copiar la implementación versionada correspondiente.
4. Syntax Check.
5. Activar.

### Regla del datasource ECC

`ZCL_MM_STOCK_SOURCE_ECC` ejecuta únicamente lecturas sobre datos estándar:

- `MARC-MINBE` — punto de pedido
- `MARC-EISBE` — stock de seguridad
- `MARD-LABST` — stock de libre utilización

No se permiten `UPDATE`, `INSERT`, `MODIFY` ni edición directa de tablas.

## 7. Crear el servicio de dominio

### Objeto

`ZCL_MM_STOCK_RISK_SERVICE`

### Procedimiento

1. Crear clase global.
2. Añadir la dependencia `ZIF_MM_STOCK_SOURCE` mediante constructor.
3. Incorporar la implementación de `source/zcl_mm_stock_risk_service.clas.abap`.
4. Syntax Check.
5. Activar.

### Regla funcional

El servicio clasifica riesgo de stock; **no intenta reproducir el algoritmo MRP de SAP**.

Estados de diagnóstico:

- `OK`
- `REORDER`
- `CRITICAL`

## 8. Añadir ABAP Unit

SAP recomienda que los tests de una clase residan como clases locales asociadas al objeto probado.

En `SE24`:

1. Abrir `ZCL_MM_STOCK_RISK_SERVICE`.
2. Ir a `Goto -> Local Definitions/Implementations -> Local Test Classes`, o usar la opción equivalente de la release.
3. Incorporar `source/zcl_mm_stock_risk_service.clas.testclasses.abap`.
4. Syntax Check.
5. Activar.
6. Ejecutar ABAP Unit.

Casos esperados:

1. stock suficiente -> `OK`
2. stock en/bajo punto de pedido -> `REORDER`
3. stock bajo safety stock -> `CRITICAL`
4. cálculo correcto de shortage quantity

No marcar `TEST_VALIDATED` hasta observar una ejecución exitosa en SAP.

## 9. Crear el programa ejecutable

### Herramienta

`SE38` o `SE80`.

### Objeto

`ZMM_STOCK_RISK_REPORT`

### Procedimiento

1. Abrir `SE38`.
2. Introducir `ZMM_STOCK_RISK_REPORT`.
3. Elegir **Create**.
4. Tipo: **Executable Program**.
5. Asignar el mismo paquete/CTS.
6. Incorporar `source/zmm_stock_risk_report.prog.abap`.
7. Syntax Check.
8. Activar.
9. Ejecutar directamente desde `SE38` antes de crear la transacción.

## 10. Crear la transacción Z en SE93

### Objeto

`ZMM_STOCK_RISK`

### Tipo correcto

**Report Transaction** / transacción de reporte.

### Procedimiento

1. Abrir `SE93`.
2. Introducir `ZMM_STOCK_RISK`.
3. Elegir **Create**.
4. Short text: `MM Stock Risk Diagnostic`.
5. Elegir **Program and selection screen (report transaction)** o la denominación equivalente de la release.
6. Informar el programa `ZMM_STOCK_RISK_REPORT`.
7. Mantener la pantalla de selección inicial visible.
8. Guardar.
9. Asignar el mismo paquete y transporte.
10. Ejecutar `ZMM_STOCK_RISK` desde SAP Easy Access.

### Resultado esperado

La transacción debe abrir los parámetros:

- Material
- Centro
- Almacén

Al ejecutar, debe mostrar una salida SALV con datos de stock y clasificación de riesgo.

## 11. Evidencia que debemos capturar

No hacen falta capturas con datos sensibles. Para el portfolio basta con registrar:

```text
Object creation: PASS
Syntax check: PASS
Activation: PASS
ABAP Unit: 4/4 PASS
Transaction ZMM_STOCK_RISK: PASS
SALV runtime: PASS
Data source: sanitized/non-sensitive material
```

Una captura sanitizada de ABAP Unit y otra del SALV son opcionales, no obligatorias.

## 12. Checklist de promoción

El paquete solo cambia a `RUNTIME_VALIDATED / TEST_VALIDATED` cuando:

- [ ] todos los objetos existen en ECC DEV/sandbox
- [ ] todos activan
- [ ] ABAP Unit ejecuta correctamente
- [ ] `SE93` abre la transacción Z
- [ ] el reporte procesa un material no sensible
- [ ] no existe modificación de tablas
- [ ] `EVIDENCE.md` está actualizado

## 13. Fuentes SAP oficiales usadas para el procedimiento

- Class Builder / SE24: https://help.sap.com/docs/SAP_ERP_SPV/142f8559883b4c11966ebfb99dd61164/cac035baa6c611d1b4790000e8a52bed.html
- Creating a Standard Class: https://help.sap.com/docs/SAP_NETWEAVER_AS_ABAP_752/bd833c8355f34e96a6e83096b38bf192/c088885f720911d1b44d0000e8a52bed.html
- Creating a Program / SE38: https://help.sap.com/saphelp_aii710/helpdata/en/d1/801a47454211d189710000e8322d00/content.htm
- Maintaining Transactions / SE93: https://help.sap.com/docs/SAP_NETWEAVER_AS_ABAP_752/bd833c8355f34e96a6e83096b38bf192/432c43b427bf601fe10000000a422035.html
- Report Transactions: https://help.sap.com/saphelp_snc70/helpdata/en/43/0f4c879f2d6f41e10000000a422035/content.htm
- ABAP Unit: https://help.sap.com/docs/ABAP_PLATFORM_NEW/c238d694b825421f940829321ffa326a/4ec18be06e391014adc9fffe4e204223.html
- ABAP Unit local test classes: https://help.sap.com/docs/ABAP_PLATFORM_NEW/ba879a6e2ea04d9bb94c7ccd7cdac446/556bac6cf8464655ab726c8a49aa6adc.html
- Transport Layer / CTS: https://help.sap.com/docs/ABAP_PLATFORM_NEW/c238d694b825421f940829321ffa326a/4ec218e26e391014adc9fffe4e204223.html
