# SAP ECC MM — Purchasing Analytics

[English version](./README.md)

> **Estado:** `DESIGN_READY / SOURCE_NOT_YET_IMPLEMENTED`

Siguiente hito de ingeniería ECC MM: un lab read-only para visibilidad de solicitudes/pedidos, manteniendo la evidencia clásica ECC separada de las APIs Clean Core de S/4HANA.

Modelo estándar previsto:

```text
EBAN — Solicitud de pedido
   ↓
EKKO / EKPO — Cabecera/posiciones de pedido
   ↓
EKET — Líneas de reparto / contexto de entrega
```

Artefacto previsto:

`ZMM_PURCH_ANALYTICS`

La primera versión se enfocará en visibilidad transparente y read-only: referencias PR/PO, fechas de documento, contexto de compras, conteos de posiciones y contexto de líneas de reparto. No creará/modificará documentos, estrategias de liberación ni datos de entrada de servicios.

El diseño detallado de source comienza después de fusionar la auditoría de estados WM.
