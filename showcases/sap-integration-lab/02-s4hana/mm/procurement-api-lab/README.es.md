# SAP S/4HANA MM — Laboratorio de Evidencia con APIs de Procurement

[English version](./README.md)

> **Tipo de evidencia:** diseño de integración Clean Core basado en interfaces SAP liberadas  
> **Estado:** `RESEARCH_VALIDATED / DESIGN_READY / RUNTIME_NOT_CLAIMED`  
> **Alcance:** Solicitudes de Pedido + Pedidos de Compra

Este laboratorio documenta cómo evoluciona la evidencia MM desde acceso clásico ECC de solo lectura hacia un enfoque moderno S/4HANA basado en superficies CDS/API liberadas.

## Contraste arquitectónico

```text
Evidencia ECC clásica
---------------------
Reporte/servicio ABAP
      │
      ▼
EKKO / EKPO
Open SQL clásico

          ≠

Evidencia S/4HANA Clean Core
----------------------------
Extensión/app externa
      │
      ▼
OData / CDS API liberada
      │
      ├── Purchase Requisition API
      └── Purchase Order API
```

El patrón ECC conserva valor en su propia línea, pero no se reutiliza como prueba de Clean Core.

## Interfaces seleccionadas

### Pedidos de compra

- CDS: `I_PurchaseOrderAPI01`
- OData V4: `API_PURCHASEORDER_2`

### Solicitudes de pedido

- OData V4: `API_PURCHASEREQUISITION_2`

Disponibilidad, campos y operaciones se verificarán siempre contra la release S/4HANA objetivo.

## Escenario de portafolio

**Procurement Visibility Client**

Aplicación TypeScript externa prevista:

```text
Configuración / secret provider
            │
            ▼
SAP Procurement API Client
            │
     ┌──────┴──────┐
     ▼             ▼
Solicitudes      Pedidos
     │             │
     └──────┬──────┘
            ▼
Modelo de dominio normalizado
            │
            ▼
Validación / mapping de estados
            │
            ▼
CLI o facade REST
            │
            ▼
Contract tests + mock SAP adapter
```

## Primera frontera de implementación

La Fase 1 será **solo lectura**.

Capacidades previstas:

- recuperar datos por API liberada configurada
- normalizar respuestas SAP a un dominio local pequeño
- filtrar/resumir estados y referencias de PR/PO
- correlation IDs para diagnóstico
- paginación cuando aplique
- error mapping estable
- secretos fuera de Git
- tests deterministas con mocks

No se habilitarán escrituras hasta validar primero el cliente read-only y su modelo de seguridad.

## Seguridad

Nunca versionar:

- URLs confidenciales de tenant
- usuarios/passwords
- OAuth client secrets
- certificados/llaves privadas
- bearer tokens
- cookies
- payloads productivos

Contrato de configuración documental:

```text
SAP_BASE_URL=<configuración externa>
SAP_AUTH_MODE=<configurado fuera del source>
SAP_CLIENT_ID=<secret provider>
SAP_CLIENT_SECRET=<secret provider>
```

Son placeholders, no credenciales.

## Controles de integración

El cliente futuro debe implementar:

- timeout
- retry solo para condiciones seguras/transitorias
- no reintentar ciegamente escrituras no idempotentes
- correlation/request ID
- logs sanitizados
- protección de paginación
- validación de esquema
- documentación de versión/release API

## Plan de contract tests

Fixtures sintéticos:

1. lectura exitosa de solicitud
2. lectura exitosa de pedido
3. resultado vacío
4. paginación
5. unauthorized
6. forbidden
7. throttling/error transitorio
8. respuesta inesperada
9. timeout
10. propagación de correlation ID

## Decisión Clean Core

Para una integración externa, el lab prioriza API remota liberada en lugar de acoplar la aplicación a tablas internas SAP.

```text
Necesidad: integración externa de compras

No acoplar app externa
      directamente a EKKO/EKPO
              │
              ▼
Consumir interfaz remota liberada
cuando esté disponible en la release objetivo
```

## Milestones

### P1 — Cliente TypeScript source-ready

- paquete aislado
- adapter tipado
- validación runtime de configuración
- mock SAP adapter
- unit/contract tests

### P2 — CI

- install
- lint
- typecheck
- tests
- secret scan

### P3 — Integración autorizada

Solo si existe sandbox S/4HANA legítimo:

- connectivity
- metadata API
- request read-only sanitizado
- evidencia runtime

Hasta P3 no se afirma runtime S/4.

## Madurez

`RESEARCH_VALIDATED -> DESIGN_READY -> SOURCE_READY -> STATIC_VALIDATED -> RUNTIME_VALIDATED`

Posición actual: **`DESIGN_READY`**.

## Referencias oficiales

- Purchase Order CDS `I_PurchaseOrderAPI01` — SAP Help Portal
- Purchase Order OData V4 `API_PURCHASEORDER_2` — SAP Business Accelerator Hub / SAP Help
- Purchase Requisition OData V4 `API_PURCHASEREQUISITION_2` — SAP Business Accelerator Hub / SAP Help
- Released APIs: https://help.sap.com/docs/abap-cloud/abap-cloud/public-released-apis
