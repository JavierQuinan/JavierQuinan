# SAP ECC IS-U / Work Management — Línea de Evidencia

> **Alcance:** SAP ECC IS-U / Work Management  
> **Madurez actual:** evidencia funcional sanitizada publicada; artefactos técnicos ABAP planificados

Esta línea está separada de S/4HANA. Documenta evidencia profesional sanitizada derivada de experiencia operativa real en procesos utilities y Work Management.

## Evidencia funcional publicada

- [Operación de Work Management — versión sanitizada](./functional-evidence/work-management-operations/README.es.md)

La evidencia publicada cubre uso de IW38, ciclo de vida de órdenes, creación individual/masiva, asignación/liberación/cierre mediante IW32, procesos masivos controlados, planificación automática de liberaciones, monitoreo SM37, integración CRM ↔ WM y consistencia de equipamiento técnico/comercial.

## Áreas de evidencia

- conceptos de ciclo de vida de instalaciones y contratos
- device management
- ciclo de vida de órdenes de trabajo
- workflow, estados y manejo de eventos
- interacción operativa CRM ↔ IS-U
- patrones de integración Work Management ↔ GIS/sistemas externos
- guías de troubleshooting y resolución de incidencias

## Política de evidencia funcional

Las guías profesionales de MM/WM se incorporan como evidencia funcional primaria después de sanitización. La versión pública excluye nombres de empresa/cliente, personas, IDs, documentos reales, capturas, códigos organizativos, endpoints y configuración confidencial. Los nombres de desarrollos Z específicos también se abstraen cuando revelarían diseño interno.

El artefacto publicado indica claramente si corresponde a:

- guía profesional sanitizada derivada de experiencia operativa
- ejercicio técnico sintético
- implementación ABAP
- artefacto SAP validado en runtime

## Límite técnico

No se publicarán instalaciones, cuentas contrato, contratos, interlocutores comerciales, dispositivos/medidores, órdenes de trabajo ni identificadores reales de clientes.

Todo artefacto ABAP de esta línea seguirá el mismo gate de validación runtime definido en `EVIDENCE_GOVERNANCE.md`.
