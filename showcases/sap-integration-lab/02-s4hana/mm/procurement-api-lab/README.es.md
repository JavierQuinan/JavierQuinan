# SAP S/4HANA MM — Laboratorio de Evidencia con APIs de Procurement

[English version](./README.md)

> **Tipo de evidencia:** integración Clean Core basada en interfaces SAP liberadas  
> **Estado:** `SOURCE_READY / LOCAL_TEST_VALIDATED / CI_VALIDATED / S4_RUNTIME_NOT_CLAIMED`  
> **Alcance:** Solicitudes de Pedido + Pedidos de Compra

Este laboratorio demuestra cómo evoluciona la evidencia de compras desde ECC clásico hacia un diseño moderno S/4HANA, sin presentar el acceso directo a tablas como patrón de integración Clean Core.

## Contraste arquitectónico

```text
ECC clásico                         S/4HANA Clean Core
-----------                         -----------------
Reporte/servicio ABAP               Extensión/aplicación externa
       │                                      │
       ▼                                      ▼
EKKO / EKPO                         OData / CDS API liberada
Open SQL clásico                             │
                                     ┌───────┴────────┐
                                     ▼                ▼
                              Solicitud de pedido   Pedido
```

## Dirección de interfaces liberadas

Pedidos de compra:

- CDS: `I_PurchaseOrderAPI01`
- familia API OData V4: `API_PURCHASEORDER_2`

Solicitudes de pedido:

- familia API OData V4: `API_PURCHASEREQUISITION_2`

Los paths exactos, campos, autenticación y disponibilidad deberán verificarse contra la release S/4HANA objetivo antes de conectarse a un tenant real.

## Implementación source

Ya existe un cliente TypeScript sin dependencias externas en [`client/`](./client/README.es.md).

Capacidades implementadas:

- consultas read-only de pedidos
- consultas read-only de solicitudes
- transporte HTTP inyectable
- validación OData `value`
- construcción de `$top`, `$skip` y `$filter`
- mapeo estable de errores SAP API
- captura de correlation/request ID
- HTTPS obligatorio fuera de localhost
- Fetch transport con timeout
- tests deterministas sintéticos
- GitHub Actions con permiso `contents: read`

## Evidencia de tests

Los seis tests deterministas pasaron tanto localmente como en GitHub Actions con Node 22:

1. normalización OData de pedido
2. normalización OData de solicitud
3. página OData vacía
4. HTTP 401 mapeado con correlation ID
5. rechazo de respuesta inesperada/no OData
6. rechazo de endpoint HTTP inseguro no local

Resultado CI registrado:

```text
Ejecutados: 6
Aprobados:  6
Fallidos:   0
```

Esto valida el **cliente/source**, no un runtime real de tenant SAP S/4HANA.

## Frontera de seguridad

No se versiona URL SAP real, usuario, contraseña, OAuth client secret, bearer token, cookie, certificado/llave privada ni payload productivo.

La implementación sigue siendo deliberadamente **solo lectura**. La autenticación real deberá provenir de un proveedor externo de credenciales/tokens.

## Qué demuestra actualmente

- comprensión de la frontera ECC → S/4HANA
- diseño orientado a APIs liberadas / Clean Core
- ingeniería TypeScript para integración
- abstracción de transporte y contract testing determinista
- manejo de errores/correlation IDs
- validación segura de endpoints
- CI reproducible
- documentación bilingüe

## Qué no se afirma

- conexión con tenant S/4HANA real
- metadata validada para una release concreta
- adquisición OAuth/token
- autorización SAP real
- runtime end-to-end S/4HANA
- operaciones create/change

## Próximos hitos

### P3 — Hardening de integración

- recorrido de paginación
- retry de errores transitorios solo en lecturas seguras
- schemas por release
- metadata/capabilities
- proveedor externo de autenticación

### P4 — Sandbox autorizado

Solo cuando exista un entorno S/4HANA legítimo:

- conectividad
- metadata API
- lectura sanitizada
- evidencia runtime documentada

Hasta entonces no se afirma runtime S/4.

## Madurez

`RESEARCH_VALIDATED -> DESIGN_READY -> SOURCE_READY -> LOCAL_TEST_VALIDATED -> CI_VALIDATED -> RUNTIME_VALIDATED`

Posición actual: **`SOURCE_READY / LOCAL_TEST_VALIDATED / CI_VALIDATED`**.
