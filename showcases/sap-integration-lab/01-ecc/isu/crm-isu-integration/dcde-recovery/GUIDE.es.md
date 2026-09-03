**Procedimiento para solucionar la generación incompleta de órdenes OT DCDE desde CRM**

Restablecimiento del contrato para ejecutar nuevamente la baja y generar la DCDE

# 1. Objetivo

Establecer el procedimiento para corregir los casos en los que la orden de trabajo de desconexión definitiva (DCDE) presenta un error durante su generación o el proceso no se completa desde CRM. La solución consiste en cancelar el fin de contrato previamente registrado, dejar nuevamente activo el contrato y repetir la baja desde CRM.

# 2. Caso de referencia

| Dato | Valor |
|---|---|
| Orden DCDE | 26490** |
| Acuerdo comercial | 2000300***** |
| CUEN | 130035*** |

*Figura 1. Orden DCDE utilizada como referencia para el diagnóstico.*

# 3. Procedimiento

**Paso 1. Identificar el CUEN en la transacción ES32**

Ingresar el acuerdo comercial en la transacción ES32 y verificar el CUEN asociado. Para el caso de referencia, el acuerdo comercial 200030060632 corresponde al CUEN 1300353940.

*Figura 2. Identificación del CUEN asociado al acuerdo comercial.*

**Paso 2. Enlazar el CUEN en CRM**

Con el CUEN identificado, ingresar a CRM y ejecutar el enlace correspondiente para acceder a la información contractual del punto de suministro.

**Paso 3. Acceder a Modificar contrato**

En CRM, ingresar a Gestión de contratos, seleccionar el contrato correspondiente y hacer clic en Modificar contratos.

**Paso 4. Cancelar el fin de contrato**

En la pantalla Posiciones a tratar, seleccionar el proceso Cancelar fin de contrato (CONTEND_CANCEL) y hacer clic en Iniciar proceso.

*Figura 4. Selección del proceso Cancelar fin de contrato.*

**Paso 5. Finalizar el proceso**

Verificar que el proceso seleccionado sea Cancelar fin de contrato y hacer clic en Finalizar proceso. Confirmar la operación mediante OK cuando el sistema lo solicite.

*Figura 5. Finalización del proceso de cancelación del fin de contrato.*

**Paso 6. Ejecutar nuevamente la baja**

Confirmar que el contrato quede activo. Una vez restablecido, ejecutar nuevamente la baja de contrato desde CRM para que la orden DCDE se genere y complete correctamente.

# 4. Validación del resultado

- El contrato figura nuevamente en estado activo.
- La baja de contrato puede iniciarse desde CRM sin bloqueos derivados del proceso anterior.
- La orden OT DCDE se genera y completa correctamente.

# 5. Casos adicionales

| N.º | Orden DCDE | Acuerdo comercial | CUEN / observación |
|---|---|---|---|
| 1 | 2642899 | 2000302***** | 130039**** |
| 2 | — | 2000315***** | 1300393*** — contrato activo; puede ejecutarse la DCDE. |
