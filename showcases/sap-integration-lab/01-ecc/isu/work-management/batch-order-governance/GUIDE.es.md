# GUÍA OPERATIVA

## Cierre y anulación de órdenes de trabajo mediante script

Procedimiento para órdenes abiertas o pendientes sin asignación a puesto de trabajo

**Finalidad:** Impedir la ejecución en campo de órdenes de trabajo que permanecen abiertas y no tienen asignado un puesto de trabajo.

**Restricción funcional:** El script no permite registrar observaciones en la orden durante el cierre o la anulación.

# 1. Alcance y condiciones de uso

El procedimiento aplica exclusivamente a órdenes de trabajo que cumplan simultáneamente las siguientes condiciones:

| Condición | Criterio |
|---|---|
| Estado del sistema | ABIE (abierta o pendiente). |
| Asignación operativa | Sin asignación a ningún puesto de trabajo. |
| Dato requerido | Número de la orden de trabajo. |
| Objetivo | Cerrar o anular la orden para impedir su posterior ejecución en campo. |

# 2. Verificaciones previas

Antes de preparar la plantilla, confirme en SAP que todas las órdenes seleccionadas se encuentran en estado ABIE y no tienen un puesto de trabajo asignado. No incluya órdenes que no cumplan estas condiciones.

*Figura 1. Órdenes de ejemplo 9079987, 9079988, 9079989 y 9079990 con estado del sistema ABIE.*

**Importante:** La ejecución se realiza en fondo y no puede interrumpirse. Ejecute el script sin otras operaciones activas en la sesión y, preferentemente, fuera del horario de oficina. Esto reduce el riesgo de bloqueos sobre instalaciones que puedan encontrarse en procesos de facturación.

# 3. Estructura de la plantilla

La plantilla solicita el rango de filas que se procesará, la selección de cada registro y los números de las órdenes. El resultado se registra automáticamente durante la ejecución.

| Ubicación | Campo | Uso |
|---|---|---|
| C2 | Fila de inicio | Primera fila que procesará el script. |
| C3 | Fila de fin | Última fila que procesará el script. |
| Columna A, desde fila 11 | Estado de migración | Ingrese Y únicamente en las órdenes que desea procesar. |
| Columna B, desde fila 11 | Código de orden | Ingrese el número de cada orden de trabajo. |
| Columna D, desde fila 11 | Resultados | Muestra el resultado devuelto durante la ejecución. |

# 4. Procedimiento de ejecución

## Paso 1. Iniciar sesión en SAP

Ingrese al ambiente correspondiente con un usuario autorizado y mantenga la sesión activa. Para este ejemplo se utiliza el ambiente de calidad.

*Figura 2. Ingreso al ambiente de calidad en SAP.*

## Paso 2. Abrir la plantilla

Abra el archivo de Excel que contiene el script de cancelación de órdenes. Si Excel muestra advertencias de seguridad, habilite el contenido únicamente si el archivo proviene de la fuente interna autorizada.

*Figura 3. Archivo que contiene el script.*

## Paso 3. Configurar el rango y cargar las órdenes

En C2 registre la fila inicial y en C3 la fila final. Desde la fila 11, escriba Y en la columna A para cada orden que se procesará e ingrese su número en la columna B. Verifique que el rango incluya exactamente los registros cargados.

*Figura 4. Configuración del rango 11–14 y carga de las órdenes de ejemplo.*

**Control antes de ejecutar:** Revise que no existan filas vacías dentro del rango, números duplicados, órdenes fuera del rango seleccionado ni registros marcados con Y que no deban procesarse.

## Paso 4. Ejecutar el script

Con SAP abierto y la plantilla verificada, seleccione el botón EJECUTAR. Excel iniciará la automatización mediante SAP GUI Scripting.

## Paso 5. Autorizar el acceso a SAP GUI

SAP mostrará un cuadro de diálogo indicando que un script intenta acceder a SAP GUI. Seleccione OK para permitir la ejecución. A partir de este momento, no cierre SAP ni Excel y no realice otras operaciones hasta que finalice el proceso.

*Figura 5. Confirmación de acceso del script a SAP GUI.*

## Paso 6. Esperar la finalización

El tiempo de procesamiento dependerá del volumen de órdenes. Mantenga la sesión activa y espere el mensaje final de conclusión. No intente detener el proceso mientras se ejecuta.

# 5. Interpretación de resultados

Al finalizar, la plantilla actualizará el estado de migración y mostrará el resultado correspondiente a cada orden:

| Valor | Interpretación |
|---|---|
| M | Registro procesado por el script. |
| OK! | Ejecución satisfactoria para la orden indicada. |
| Mensaje distinto de OK! | La orden no se procesó satisfactoriamente; revise el detalle presentado y valide el estado de la orden en SAP antes de reintentar. |

*Figura 6. Ejecución concluida: estado M y resultado OK! para las órdenes procesadas.*

# 6. Validación posterior

Una vez finalizado el script, valide en SAP el estado de las órdenes procesadas. No considere completada la actividad únicamente con el resultado mostrado en Excel; confirme que el cambio se reflejó correctamente en el sistema.

**Si existe un error:** Conserve el número de orden y el mensaje devuelto, verifique nuevamente el estado ABIE y la ausencia de puesto de trabajo, y escale el caso conforme al procedimiento interno. Evite reejecutar masivamente registros sin determinar primero la causa.

# 7. Resumen operativo

| N.º | Acción | Control |
|---|---|---|
| 1 | Validar | Orden en estado ABIE y sin puesto de trabajo. |
| 2 | Preparar | Definir filas C2–C3, marcar Y e ingresar números de orden. |
| 3 | Ejecutar | Abrir SAP, seleccionar EJECUTAR y aceptar el acceso a SAP GUI. |
| 4 | Esperar | No interrumpir el proceso ni realizar operaciones concurrentes. |
| 5 | Comprobar | Revisar M/OK! en Excel y confirmar el estado final en SAP. |

**Nota final:** El script no permite incorporar observaciones en las órdenes cerradas o anuladas. Si se requiere dejar trazabilidad adicional, regístrela mediante el mecanismo institucional autorizado, fuera de esta automatización.
