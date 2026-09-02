# SAP ECC IS-U / Work Management — Línea de Evidencia

> **Alcance:** SAP ECC IS-U / Work Management  
> **Madurez actual:** existe evidencia funcional; los artefactos técnicos públicos están planificados

Esta línea está separada de S/4HANA. Documentará evidencia profesional sanitizada derivada de experiencia operativa real en procesos utilities y Work Management.

## Áreas de evidencia

- conceptos de ciclo de vida de instalaciones y contratos
- device management
- ciclo de vida de órdenes de trabajo
- workflow, estados y manejo de eventos
- interacción operativa CRM ↔ IS-U
- patrones de integración Work Management ↔ GIS/sistemas externos
- guías de troubleshooting y resolución de incidencias

## Política de evidencia funcional

Las guías profesionales de MM/WM elaboradas por el usuario podrán incorporarse como evidencia funcional primaria cuando lleguemos a cada tema. Antes de publicarlas se sanitizarán nombres de empresa/cliente, documentos reales, usuarios, endpoints y configuración confidencial.

El artefacto publicado indicará claramente si corresponde a:

- guía profesional sanitizada derivada de experiencia operativa
- ejercicio técnico sintético
- implementación ABAP
- artefacto SAP validado en runtime

## Límite técnico

No se publicarán instalaciones, cuentas contrato, contratos, interlocutores comerciales, dispositivos/medidores, órdenes de trabajo ni identificadores reales de clientes.

Todo artefacto ABAP de esta línea seguirá el mismo gate de validación runtime definido en `EVIDENCE_GOVERNANCE.md`.
