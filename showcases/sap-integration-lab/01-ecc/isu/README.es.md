# SAP ECC IS-U / Work Management — Línea de Evidencia

[English version](./README.md)

> **Alcance:** SAP ECC IS-U / Work Management / integración CRM  
> **Evidencia representada:** guías operativas sanitizadas · source ABAP original read-only · revisión determinista de source · guías técnicas reproducibles

Esta línea está separada de S/4HANA. Convierte experiencia operativa utilities en evidencia revisable eliminando configuración e identificadores reales de empresa/cliente.

## Mapa de evidencia publicada

### Operación Work Management

[Work Management Operations](./functional-evidence/work-management-operations/README.es.md)

Cubre:

- análisis de OT y layouts con `IW38`;
- interpretación del ciclo de vida de OT;
- conceptos de procesamiento individual y masivo controlado;
- asignación/liberación/cierre técnico con `IW32`;
- conceptos de planificación automática;
- monitoreo de jobs con `SM37`;
- dependencias de proceso CRM ↔ WM.

### Auditoría de Estados de OT — funcional + source ABAP

[Auditoría de Estados de OT](./work-management/status-audit/README.es.md)

Evidencia disponible:

- baseline funcional `IW33`;
- `AUFK → OBJNR`;
- `JEST` activo/histórico;
- `JSTO → STSMA`;
- `TJ02T` / `TJ30T`;
- contexto de cambios con `JCDS`;
- abstracción original de datasource;
- datasource ECC y sintético;
- servicio ABAP Objects;
- source de reporte SALV;
- seis escenarios ABAP Unit revisados consistentemente a nivel de source;
- guía reproducible de construcción/verificación `SE24 / SE38 / SE93`.

Clasificación de evidencia: `REVIEWABLE_SOURCE / STATIC_SCENARIO_VALIDATION / REPRODUCIBLE_BUILD_GUIDE`.

### Gobierno de cierre masivo

[Batch Work-Order Governance](./work-management/batch-order-governance/README.es.md)

Documenta gates de elegibilidad, input acotado, control de duplicados/rango, SAP GUI scripting, resultado por registro y validación posterior obligatoria. No se publica el Excel/script empresarial.

### Habilitación de materiales de sellos — MM ↔ WM

[Seal Material Enablement](./work-management/seals-material-enablement/README.es.md)

Documenta la diferencia entre un material disponible en MM y un material habilitado/configurado para Seal Management / OT.

### Consistencia de equipamiento — IS-U ↔ CRM

[Equipment Consistency](./device-management/pec-equipment-consistency/README.es.md)

Establece que la asignación técnica y la representación comercial/producto deben permanecer coherentes y que los cambios de negocio deben seguir el flujo CRM en lugar de atajos técnicos.

### Alta de servicio fotovoltaico

[Photovoltaic Service Onboarding](./master-data/photovoltaic-service-onboarding/README.es.md)

Cadena sanitizada:

`contexto externo/GIS → objeto de conexión → punto de suministro → instalación → contexto cliente/comercial CRM → contrato de servicio especializado`

### Recuperación CRM ↔ IS-U de fin de contrato/DCDE

[Contract-End / DCDE Recovery](./crm-isu-integration/dcde-recovery/README.es.md)

Documenta recuperación cuando un fin contractual CRM incompleto no produce la OT downstream esperada.

### Servicio ocasional con medición

[Occasional Metered Service](./crm-isu-integration/occasional-metered-service/README.es.md)

Evidencia end-to-end CRM → WM → CRM: cliente/acuerdo/contrato, ejecución técnica de OT, datos relacionados con medidor, estado final, cierre técnico y secuencia de finalización contractual.

## Referencias técnicas estándar

El índice público de referencias SAP incluye documentación oficial para campos de órdenes/estados y tooling de desarrollo relacionado:

- [`OFFICIAL_SAP_REFERENCES.es.md`](../../OFFICIAL_SAP_REFERENCES.es.md)

Para el modelo de estados, la documentación SAP expone campos estándar como `AUFK-AUFNR`, `JEST-STAT`, `JEST-INACT`, `JEST-CHGNR`, `JEST-OBJNR` y `JSTO-STSMA`.

## Qué demuestra esta línea

- troubleshooting operativo SAP IS-U / Work Management;
- ciclo de vida y estados de OT;
- separación de system status y user status;
- análisis activo vs. histórico;
- integración CRM ↔ IS-U / WM;
- razonamiento de consistencia de configuración MM ↔ WM;
- gobierno de background jobs y procesos batch controlados;
- diseño original de diagnóstico ABAP clásico read-only;
- documentación técnica/operativa bilingüe.

## Límite técnico y de confidencialidad

La evidencia pública documenta objetos estándar read-only y source original del portafolio. No publica atajos de manipulación directa, implementaciones `Z*` propietarias de empresa/cliente, credenciales, OT/instalaciones/contratos/medidores/usuarios reales, endpoints internos ni capturas empresariales no sanitizadas.

El source ABAP de auditoría de estados se presenta como evidencia source/static con guía reproducible de verificación. No se atribuye un resultado runtime corporativo cuando no existe un registro real de ejecución.
