# SAP ECC MM — Evidencia funcional

[English version](./README.md)

> **Tipo de evidencia:** evidencia funcional/operativa sanitizada  
> **Base documental:** guías operativas privadas elaboradas por el usuario y manuales internos históricos  
> **Límite de publicación:** no se publican nombres de empresa/cliente, materiales reales, centros, proveedores, usuarios, capturas ni credenciales

Esta sección documenta escenarios reales de soporte SAP ECC MM sin exponer detalles confidenciales de implementación.

## Evidencia representada actualmente

### 1. Extensión de material a contexto de centro/almacén
Existe un procedimiento real de soporte para extender mediante `MM01` un material ya creado, después de verificar que el material existe y que todavía no se encuentra extendido al nivel organizativo requerido.

La evidencia pública demuestra capacidad para:

- diferenciar creación de material y extensión organizativa
- seleccionar las vistas MM requeridas
- mantener niveles organizativos
- completar los datos obligatorios de la extensión
- validar que el material quede habilitado para el centro/almacén requerido

El número real de material, centro y valores internos permanecen privados.

### 2. Uso y consumo de materiales en órdenes de trabajo
Las guías operativas de WM/PM muestran que los materiales utilizados en campo se seleccionan dentro del contexto permitido por el puesto de trabajo, se registra la cantidad utilizada y se valida posteriormente el movimiento de mercancía dentro del flujo de estados de la orden.

La evidencia pública conserva únicamente la relación funcional:

```text
Orden de trabajo
   ↓
Puesto de trabajo / contexto autorizado de materiales
   ↓
Registro de material + cantidad
   ↓
Cambio de estado de la orden
   ↓
Evidencia de movimiento/consumo de material
```

No se reproducen tipos de orden específicos del cliente, catálogos ni capturas propietarias.

### 3. Diagnóstico de asignación material/proveedor
Una guía de incidente real documenta una validación personalizada en la que no era posible asignar un material dentro de una orden debido a que la relación de clasificación entre proveedor y puesto de trabajo estaba incompleta.

El patrón de troubleshooting sanitizado es:

1. identificar el puesto de trabajo y contexto organizativo afectado
2. verificar la clasificación de asignación de proveedor
3. corregir la asignación faltante mediante la ruta de configuración autorizada
4. regresar a la orden y validar nuevamente la asignación del material

Los nombres de clases Z, cuentas de proveedor, centros y números de orden se omiten deliberadamente.

## Qué demuestra esta evidencia

- experiencia práctica de soporte SAP MM sobre maestro de materiales
- comprensión de extensión organizativa frente a creación de material
- relación entre materiales MM y ejecución de órdenes PM/WM
- troubleshooting de dependencias organizativas y de clasificación para el uso de materiales
- validación funcional posterior a cambios de soporte/configuración

## Qué no demuestra

- propiedad sobre configuración específica de un cliente
- derechos irrestrictos de customizing en producción
- implementación Clean Core en S/4HANA
- ejecución runtime de código ABAP

La evidencia técnica ABAP se mantiene separada dentro de los paquetes ejecutables.

## Regla de confidencialidad

Las guías originales permanecen como evidencia privada. Los artefactos públicos se redactan a partir del conocimiento del proceso y nunca publican identificadores reales ni capturas propietarias.
