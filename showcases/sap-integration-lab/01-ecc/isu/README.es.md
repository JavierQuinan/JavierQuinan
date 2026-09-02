# SAP ECC IS-U / Work Management — Línea de Evidencia

[English version](./README.md)

> **Alcance:** SAP ECC IS-U / Work Management / integración CRM  
> **Madurez actual:** múltiples packs funcionales/técnicos sanitizados publicados; labs ABAP planificados

Esta línea está separada de S/4HANA. Convierte experiencia operativa utilities en evidencia revisable eliminando configuración e identificadores reales de empresa/cliente.

## Mapa de evidencia publicada

### Operación Work Management

[Work Management Operations](./functional-evidence/work-management-operations/README.es.md)

Cubre `IW38`, ciclo de OT, conceptos de creación individual/masiva, asignación/liberación/cierre en `IW32`, planificación automática, monitoreo `SM37` y dependencias CRM↔WM.

### Auditoría de Estados de OT

[Auditoría de Estados de OT](./work-management/status-audit/README.es.md)

Troubleshooting avanzado read-only con:

- `IW33`
- `AUFK -> OBJNR`
- `JEST` activo/histórico
- `JSTO -> STSMA`
- `TJ02T` / `TJ30T`
- `JCDS`
- `SE93`, `SE38`, `SE80`, `ST05`, `SAT`, `SU53`

### Gobierno de cierre masivo

[Batch Work-Order Governance](./work-management/batch-order-governance/README.es.md)

Documenta gates de elegibilidad, input acotado, control de duplicados/rango, SAP GUI scripting, resultado por registro y validación posterior obligatoria. No se publica el Excel/script empresarial.

### Habilitación de materiales de sellos — MM ↔ WM

[Seal Material Enablement](./work-management/seals-material-enablement/README.es.md)

Demuestra la diferencia entre material disponible en MM y material habilitado/configurado para Seal Management / OT.

### Consistencia de equipamiento — IS-U ↔ CRM

[Equipment Consistency](./device-management/pec-equipment-consistency/README.es.md)

Establece que la asignación técnica y la representación comercial/producto deben permanecer coherentes y que los cambios de negocio deben seguir el flujo CRM en vez de atajos técnicos.

### Alta de servicio fotovoltaico

[Photovoltaic Service Onboarding](./master-data/photovoltaic-service-onboarding/README.es.md)

Cadena sanitizada:

`contexto externo/GIS -> objeto de conexión -> punto de suministro -> instalación -> contexto cliente/comercial CRM -> contrato de servicio especializado`.

### Recuperación CRM ↔ IS-U de fin de contrato/DCDE

[Contract-End / DCDE Recovery](./crm-isu-integration/dcde-recovery/README.es.md)

Muestra recuperación cuando un fin contractual CRM incompleto no produce la OT downstream esperada: restaurar un estado funcional válido y repetir el proceso oficial.

### Servicio ocasional con medición

[Occasional Metered Service](./crm-isu-integration/occasional-metered-service/README.es.md)

Evidencia end-to-end CRM→WM→CRM: cliente/acuerdo/contrato, ejecución técnica de OT, datos relacionados con medidor, estado final, cierre técnico y secuencia de finalización contractual.

## Límite técnico

La evidencia puede documentar objetos estándar de diagnóstico read-only, pero no publica atajos de manipulación directa de datos, implementación `Z*` propietaria, credenciales ni IDs de procesos propios del cliente.

Nunca se publican instalaciones, cuentas contrato, contratos, interlocutores, medidores, OT, CUEN/identificadores de servicio, direcciones ni empleados reales.

## Progresión ABAP/ingeniería prevista

1. reporte/servicio sintético de auditoría de estados
2. comparación APIs de status vs. lectura diagnóstica directa
3. lab de batch eligibility/idempotencia con OT sintéticas
4. checker MM↔Seal de consistencia de configuración
5. state machine de integración CRM↔IS-U con retry/compensación

Todo artefacto ABAP sigue Evidence Governance; source/static evidence se mantiene separado de claims runtime SAP.
