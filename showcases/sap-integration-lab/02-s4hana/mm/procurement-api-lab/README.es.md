# SAP S/4HANA MM — Laboratorio de Evidencia con APIs de Procurement

[English version](./README.md)

> **Tipo de evidencia:** integración Clean Core basada en interfaces SAP liberadas  
> **Estado:** `SOURCE_READY / LOCAL_TEST_VALIDATED / CI_PENDING / S4_RUNTIME_NOT_CLAIMED`  
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
- validación de respuesta OData `value`
- construcción de `$top`, `$skip` y `$filter`
- mapeo estable de errores SAP API
- captura de correlation/request ID
- HTTPS obligatorio fuera de localhost
- transporte Fetch con timeout
- tests deterministas con respuestas sintéticas
- quality gate en GitHub Actions

Arquitectura:

```text
Configuración externa
        │
        ▼
ProcurementApiClient
        │
        ├── Pedidos de compra
        └── Solicitudes de pedido
        │
        ▼
Abstracción HttpTransport
        ├── FetchTransport
        └── transporte sintético de pruebas
        │
        ▼
ProcurementDocument[] normalizado
```

## Evidencia de tests

Se versionaron y ejecutaron localmente seis pruebas deterministas con Node 22:

1. normalización OData de pedido
2. normalización OData de solicitud
3. página OData vacía
4. HTTP 401 mapeado con correlation ID
5. rechazo de respuesta no compatible con OData
6. rechazo de endpoint HTTP inseguro no local

Resultado local registrado durante el desarrollo:

```text
Ejecutados: 6
Aprobados:  6
Fallidos:   0
```

La validación de GitHub Actions se registra por separado. No se declara `CI_VALIDATED` hasta observar el workflow verde.

## Frontera de seguridad

No se versiona URL real de SAP, usuario, contraseña, OAuth client secret, bearer token, cookie, certificado/llave privada ni payload productivo.

El source actual sigue siendo deliberadamente **solo lectura**. La autenticación real deberá provenir de un proveedor externo de credenciales/tokens.

## Qué demuestra actualmente

- comprensión de la frontera ECC → S/4HANA
- diseño orientado a APIs liberadas / Clean Core
- ingeniería TypeScript para integración
- abstracción de transporte y contract testing determinista
- manejo de errores/correlation IDs
- validación segura de endpoints
- documentación técnica bilingüe

## Qué no se afirma

- conexión con tenant S/4HANA real
- metadata validada en una release concreta
- adquisición OAuth/token
- autorización SAP real
- runtime end-to-end S/4HANA
- operaciones de creación/modificación

## Próximos hitos

### P2 — Validación CI

GitHub Actions ejecutará los seis tests deterministas con Node 22. Cuando el workflow quede verde podrá agregarse `CI_VALIDATED`.

### P3 — Hardening de integración

- recorrido de paginación
- retry de errores transitorios únicamente para lecturas seguras
- schemas por release
- comprobación metadata/capabilities
- abstracción de proveedor de autenticación

### P4 — Sandbox autorizado

Solo cuando exista un entorno S/4HANA legítimo:

- conectividad
- metadata API
- lectura sanitizada
- evidencia runtime documentada

Hasta entonces no se afirma runtime S/4.

## Madurez

`RESEARCH_VALIDATED -> DESIGN_READY -> SOURCE_READY -> LOCAL_TEST_VALIDATED -> CI_VALIDATED -> RUNTIME_VALIDATED`

Posición actual: **`SOURCE_READY / LOCAL_TEST_VALIDATED / CI_PENDING`**.
