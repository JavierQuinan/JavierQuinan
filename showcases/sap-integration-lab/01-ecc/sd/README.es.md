# SAP ECC / CRM-SD — Línea de Evidencia

[English version](./README.md)

> **Alcance:** preparación cliente/comercial, área de ventas y facturación derivada de guías operativas reales  
> **Madurez actual:** primera evidencia funcional sanitizada publicada

Esta línea se mantiene separada de MM y de IS-U/WM aunque los procesos empresariales puedan cruzar módulos.

## Evidencia publicada

### Facturación de Servicios No Energéticos

[Non-Energy Service Billing Workflow](./non-energy-billing/README.es.md)

Estado: `FUNCTIONAL_EVIDENCE_READY`

El flujo derivado de la fuente cubre:

- identificación/creación de cliente o interlocutor
- validación de contacto y canal preferido
- acuerdo/contexto comercial
- extensión del cliente al área de ventas
- organización de ventas / canal / sector
- generación de facturación no energética mediante el proceso configurado
- revisión del output antes de finalizar
- finalización fiscal/output configurada

Se documenta expresamente como un proceso empresarial específico orientado a CRM/SD. **No** se transforma artificialmente en un tutorial universal de `VF01`.

## Progresión prevista

Se añadirá evidencia SD únicamente cuando exista una guía real, lab sintético o investigación oficial con su fuente claramente identificada.

Temas objetivo:

- order-to-cash
- maestro cliente/área de ventas
- troubleshooting billing/output
- pricing/output
- límites MM-SD / FI-SD
- modernización S/4HANA Sales en una línea separada

## Confidencialidad

No se publica empresa, cliente, BP, dirección, códigos de área de ventas, factura, importe, endpoint fiscal ni screenshot empresarial.
