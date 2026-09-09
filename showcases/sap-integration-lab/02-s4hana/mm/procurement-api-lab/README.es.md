# SAP S/4HANA MM — Ejemplo de Cliente API de Procurement

[English version](./README.md)

> **Tipo de evidencia:** ejemplo ejecutable client-side no-live basado en interfaces SAP liberadas documentadas  
> **Estado:** `SOURCE_READY / LOCAL_TEST_VALIDATED / CI_VALIDATED / S4_RUNTIME_NOT_CLAIMED`  
> **Alcance:** Solicitudes de Pedido + Pedidos de Compra

Este ejemplo contrasta source de compras ECC clásico con un enfoque client-side mediante APIs S/4HANA. Demuestra únicamente comportamiento del cliente TypeScript y patrones testeables de consumo de API; no se presenta como implementación productiva de interfaces SAP ni como experiencia S/4HANA en vivo.

## Contraste arquitectónico

```text
Evidencia ECC clásica                Ejemplo client-side S/4HANA
---------------------                --------------------------
Reporte/servicio ABAP                Cliente TypeScript externo
       │                                      │
       ▼                                      ▼
EKKO / EKPO                         API liberada documentada
Open SQL clásico                             │
                                     ┌───────┴────────┐
                                     ▼                ▼
                              Solicitud de pedido   Pedido
```

## Dirección documentada de interfaces liberadas

Pedidos de compra:

- CDS: `I_PurchaseOrderAPI01`
- familia API OData V4: `API_PURCHASEORDER_2`

Solicitudes de pedido:

- familia API OData V4: `API_PURCHASEREQUISITION_2`

Los paths exactos, campos, autenticación y disponibilidad deben verificarse contra la release S/4HANA objetivo antes de realizar cualquier claim de conectividad real.

## Implementación source

Existe un cliente TypeScript sin dependencias externas en [`client/`](./client/README.es.md).

Evidencia implementada:

- consultas read-only de pedidos
- consultas read-only de solicitudes
- transporte HTTP inyectable
- validación OData `value`
- construcción de `$top`, `$skip` y `$filter`
- mapeo estable de errores de API remota
- captura de correlation/request ID
- HTTPS obligatorio fuera de localhost
- Fetch transport con timeout
- tests deterministas sintéticos
- GitHub Actions con permiso `contents: read`

## Evidencia de tests

Los seis tests deterministas pasaron localmente y en GitHub Actions con Node 22:

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

No se versiona URL SAP real, usuario, contraseña, OAuth client secret, token estilo bearer, cookie, certificado/llave privada ni payload productivo.

La implementación sigue siendo deliberadamente read-only. Cualquier autenticación real futura tendría que suministrarse externamente y evidenciarse por separado.

## Qué demuestra actualmente

- implementación de cliente API en TypeScript
- manejo de respuestas OData presente en el source publicado
- abstracción de transporte y contract testing determinista
- manejo de errores/correlation IDs
- validación segura de endpoints
- CI reproducible
- comprensión de límites documentados de interfaces liberadas
- documentación técnica bilingüe

## Qué no se afirma

- implementación productiva de interfaces SAP
- experiencia con SAP Integration Suite / CPI
- conexión con tenant S/4HANA real
- metadata validada para una release concreta
- adquisición OAuth/token contra SAP
- autorización SAP real
- runtime end-to-end S/4HANA
- operaciones create/change

## Posible validación futura

Solo si existiera un entorno S/4HANA legítimo, una evidencia separada podría documentar:

- conectividad
- verificación de metadata API
- lectura sanitizada read-only
- resultado runtime observado

Hasta que exista esa evidencia, no se afirma runtime S/4HANA ni implementación productiva de interfaces.

## Madurez de evidencia

`RESEARCH_VALIDATED -> DESIGN_READY -> SOURCE_READY -> LOCAL_TEST_VALIDATED -> CI_VALIDATED -> RUNTIME_VALIDATED`

Posición actual: **`SOURCE_READY / LOCAL_TEST_VALIDATED / CI_VALIDATED`**.
