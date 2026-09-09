# SAP ECC IS-U / Work Management — Evidencia funcional sanitizada

> **Tipo:** evidencia funcional derivada de experiencia operativa real  
> **Publicación:** sanitizada  
> **No incluye:** empresas, personas, IDs, órdenes, cuentas contrato, instalaciones, centros, sociedades, puestos, capturas ni configuración interna.

## Capacidades documentadas

### 1. Gestión de bandeja de órdenes con IW38
Uso de IW38 para construir y guardar layouts, seleccionar columnas, filtrar por estado/clase de orden/puesto de trabajo/fechas/emplazamiento, ordenar resultados, aplicar filtros dentro de la bandeja y exportar resultados cuando corresponde.

### 2. Ciclo de vida de órdenes de trabajo
Interpretación operativa de estados de usuario y de sistema durante el flujo de una orden, incluyendo estados equivalentes a sin asignación, asignada, en tratamiento, finalizada y cierre técnico. La evidencia diferencia claramente el estado previo a cierre técnico del estado técnicamente cerrado.

### 3. Creación individual y masiva de órdenes
Uso de una herramienta desarrollada a medida para crear órdenes de forma individual o por archivo de carga. El procedimiento incluye selección de contexto técnico/contractual, clase de orden, actividad PM, grupo de planificación y control del resultado de creación. Los nombres internos de transacciones y códigos de customizing se omiten en la versión pública.

### 4. Asignación, liberación y cierre con IW32
Uso de IW32 para abrir una orden, registrar información de ejecución, asignar responsables, liberar la orden, completar datos técnicos/IS-U, finalizar el estado de usuario y ejecutar cierre técnico cuando el proceso funcional lo permite.

### 5. Cierre masivo controlado
Evidencia de un proceso de cierre masivo mediante archivo estructurado y ejecución en background. La guía original establece una restricción importante: el cierre masivo solo debe utilizarse en órdenes cuyo proceso no requiera consumo de materiales. La versión pública conserva esa regla de control y omite nombres de desarrollos internos.

### 6. Planificación automática de liberación
Uso funcional de un planificador personalizado para liberar órdenes automáticamente a puestos de trabajo según parámetros organizativos y operativos. Incluye frecuencia diaria/semanal/mensual o intervalos definidos, horario de ejecución, días permitidos, festivos y exclusiones por criterios operativos. El job se inicia/detiene desde la herramienta y se monitorea posteriormente.

### 7. Monitoreo de jobs con SM37
Uso de SM37 para revisar ejecuciones en background por usuario, rango temporal y estado; análisis del resumen del job, log y resultados de procesamiento. Esta capacidad se aplica tanto a liberaciones automáticas como a procesos masivos.

### 8. Flujo CRM ↔ WM
Comprensión del traspaso entre Front Office/CRM y Work Management: creación o activación del proceso comercial, generación de la orden, liberación/asignación, ejecución en campo, finalización y cierre técnico. La evidencia pública conserva el modelo de proceso, pero no publica objetos, clientes ni parametrizaciones internas.

### 9. Servicios ocasionales con medición
Evidencia de un flujo integrado que inicia en CRM, crea datos temporales/contractuales y una orden de trabajo, continúa en IS-U/WM con registro técnico, finalización y cierre, y regresa a CRM para completar el proceso contractual. Se publica únicamente el patrón funcional de integración.

### 10. Gestión de equipamiento asociado al punto de consumo
Uso de ES62/ES32 para consultar y mantener asignaciones técnicas dentro de un proceso controlado, con una regla clave: la información técnica debe mantenerse consistente con la información contractual/comercial; cuando el cambio afecta el producto contratado, la corrección debe realizarse mediante el proceso comercial correspondiente y no mediante una modificación aislada.

## Principios de operación demostrados

- priorizar procesos funcionales estándar/autorizados sobre edición directa de datos;
- mantener trazabilidad entre CRM, IS-U y WM;
- distinguir estados activos, finalización y cierre técnico;
- validar restricciones antes de ejecutar procesos masivos;
- monitorear jobs y resultados en background;
- mantener consistencia entre información comercial y técnica;
- usar datos reales únicamente en ambientes y accesos autorizados.

## Límite de la evidencia pública

Esta documentación demuestra experiencia funcional y operativa. No representa código ABAP, configuración productiva ni una guía para replicar desarrollos personalizados de una organización concreta. Los nombres de transacciones Z, clases/códigos internos y datos organizativos se mantienen fuera del repositorio público.
