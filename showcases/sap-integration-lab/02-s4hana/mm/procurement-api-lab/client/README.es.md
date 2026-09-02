# Procurement API Client — Evidencia de Source

[English version](./README.md)

> **Frontera runtime:** ejecución local/mock únicamente; no se afirma conexión con un tenant SAP S/4HANA.

Este paquete es una implementación TypeScript sin dependencias externas del cliente diseñado para el laboratorio S/4HANA Procurement API.

## Implementado

- consulta read-only de pedidos de compra
- consulta read-only de solicitudes de pedido
- transporte HTTP inyectable
- HTTPS obligatorio para endpoints no locales
- validación de respuesta OData `value`
- construcción de `$top`, `$skip` y `$filter`
- `SapApiError` con HTTP status y correlation/request ID
- Fetch transport con timeout
- seis tests deterministas con respuestas sintéticas

## Ejecución

Requiere Node `>=22.6.0`.

```bash
npm test
```

El comando usa:

```bash
node --experimental-strip-types --test src/*.test.ts
```

## Vectores de prueba

1. normalización de página OData de Purchase Order
2. normalización de página OData de Purchase Requisition
3. página OData vacía
4. HTTP 401 transformado a `SapApiError` con correlation ID
5. rechazo de respuesta inesperada/no OData
6. rechazo de URL SAP HTTP insegura fuera de localhost

Resultado local registrado: **6/6 PASS**.

## Frontera de configuración

No existe URL SAP ni credencial real dentro del paquete. Una integración real deberá recibir externamente:

```text
baseUrl
purchaseOrderServicePath
purchaseRequisitionServicePath
auth provider / token provider
```

La opción `authHeader` actual representa únicamente una frontera mínima del laboratorio. Una implementación productiva no debería persistir credenciales de larga duración en configuración de aplicación.

## No implementado todavía

- adquisición OAuth/token
- descubrimiento metadata SAP real
- retry/backoff
- recorrido multi-página
- schemas específicos por release S/4HANA
- escrituras
- conexión a sandbox SAP

Esos puntos conservan milestones separados y no se presentan como implementados.
