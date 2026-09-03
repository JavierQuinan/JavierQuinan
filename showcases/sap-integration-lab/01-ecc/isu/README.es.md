# SAP ECC IS-U / Work Management — Línea de Evidencia

[English version](./README.md)

> **Alcance:** SAP ECC IS-U / Work Management / integración CRM / GIS  
> **Evidencia representada:** guías operativas sanitizadas · source ABAP original read-only · revisión determinista de source · guías técnicas reproducibles

Esta línea está separada de S/4HANA. Convierte experiencia operativa utilities en evidencia revisable eliminando configuración e identificadores reales de empresa/cliente.

## Mapa de evidencia publicada

### Operación Work Management

[Work Management Operations](./functional-evidence/work-management-operations/README.es.md)

Cubre `IW38`, ciclo de vida de OT, procesamiento individual/masivo controlado, asignación/liberación/cierre técnico con `IW32`, planificación automática, monitoreo `SM37` y dependencias CRM ↔ WM.

### Auditoría de Estados de OT — funcional + source ABAP

[Auditoría de Estados de OT](./work-management/status-audit/README.es.md)

Evidencia disponible: `IW33`, `AUFK → OBJNR`, `JEST`, `JSTO → STSMA`, `TJ02T`, `TJ30T`, `JCDS`, datasource ECC/sintético, servicio ABAP Objects, SALV, seis escenarios ABAP Unit revisados a nivel de source y guía reproducible `SE24 / SE38 / SE93`.

Clasificación: `REVIEWABLE_SOURCE / STATIC_SCENARIO_VALIDATION / REPRODUCIBLE_BUILD_GUIDE`.

### Gobierno de cierre masivo

[Batch Work-Order Governance](./work-management/batch-order-governance/README.es.md)

Documenta gates de elegibilidad, plantilla acotada, control de duplicados/rango, SAP GUI Scripting, resultado por registro y validación posterior obligatoria. No se publica el Excel/VBA empresarial.

### Gobierno de rangos de numeración de órdenes

[Number Range Governance](./work-management/number-range-governance/README.es.md)

Evidencia de monitoreo preventivo `RSNUMHOT` y mantenimiento controlado `SNRO / SNUM` del objeto estándar `AUFTRAG`: utilización, riesgo de agotamiento, grupos, intervalos, no solapamiento y validación posterior.

### Habilitación de materiales de sellos — MM ↔ WM

[Seal Material Enablement](./work-management/seals-material-enablement/README.es.md)

Documenta la diferencia entre disponibilidad en MM y habilitación/configuración para Seal Management / OT.

### Regularización de estado técnico de medidor

[Device Status Regularization](./device-management/device-status-regularization/README.es.md)

Caso operativo sanitizado de Device Management con secuencia `IQ09 → EG35 → EG36 → EG50 → EG34 → IQ09`, validación de historial de lecturas, consistencia de fecha operacional y contingencia logística `MIGO` cuando aplica.

### Consistencia de equipamiento — IS-U ↔ CRM

[Equipment Consistency](./device-management/pec-equipment-consistency/README.es.md)

Establece que la asignación técnica y la representación comercial/producto deben permanecer coherentes y que los cambios de negocio deben seguir el flujo CRM.

### Alta de servicio fotovoltaico

[Photovoltaic Service Onboarding](./master-data/photovoltaic-service-onboarding/README.es.md)

Cadena sanitizada: `contexto externo/GIS → objeto de conexión → punto de suministro → instalación → contexto cliente/comercial CRM → contrato de servicio especializado`.

### Recuperación CRM ↔ IS-U de fin de contrato/DCDE

[Contract-End / DCDE Recovery](./crm-isu-integration/dcde-recovery/README.es.md)

Documenta recuperación cuando un fin contractual CRM incompleto no produce la OT downstream esperada.

### Monitoreo y reproceso CUEN — GIS ↔ SAP

[CUEN Monitoring & Reprocessing](./crm-isu-integration/gis-cuen-reprocessing/README.es.md)

Documenta clasificación previa de errores, consulta técnica read-only, resolución `CUEN → ID de novedad`, reproceso acotado de la interfaz GIS→SAP y validación por registro.

### Servicio ocasional con medición

[Occasional Metered Service](./crm-isu-integration/occasional-metered-service/README.es.md)

Evidencia end-to-end CRM → WM → CRM: cliente/acuerdo/contrato, ejecución técnica de OT, datos relacionados con medidor, estado final, cierre técnico y finalización contractual.

## Referencias técnicas estándar

- [`OFFICIAL_SAP_REFERENCES.es.md`](../../OFFICIAL_SAP_REFERENCES.es.md)

Para el modelo de estados, la documentación SAP expone campos estándar como `AUFK-AUFNR`, `JEST-STAT`, `JEST-INACT`, `JEST-CHGNR`, `JEST-OBJNR` y `JSTO-STSMA`.

## Qué demuestra esta línea

- troubleshooting operativo SAP IS-U / Work Management;
- ciclo de vida y estados de OT;
- administración preventiva de rangos `AUFTRAG`;
- SAP GUI Scripting bajo controles de batch;
- Device Management y regularización de estados;
- integración CRM ↔ IS-U / WM y GIS ↔ SAP;
- consistencia MM ↔ WM;
- background jobs y procesos masivos controlados;
- diseño original de diagnóstico ABAP clásico read-only;
- documentación técnica/operativa bilingüe.

## Límite técnico y de confidencialidad

La evidencia pública documenta objetos estándar read-only y source original del portafolio. No publica atajos de manipulación directa, implementaciones `Z*` propietarias, credenciales, OT/instalaciones/contratos/medidores/CUEN/usuarios reales, endpoints internos ni capturas empresariales sin sanitizar.

El source ABAP de auditoría de estados se presenta como evidencia source/static con guía reproducible de verificación. No se atribuye un resultado runtime corporativo cuando no existe un registro real de ejecución.