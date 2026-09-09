# Estudio de Arquitectura de APIs Externas — Relacionado con SAP, No-Live

[English version](./README.md)

> **Alcance:** conceptos de diseño de APIs/interfaces basados en documentación más un único ejemplo ejecutable S/4HANA local/no-live. Este documento no constituye evidencia de experiencia productiva en interfaces SAP, middleware, CPI/Integration Suite ni conectividad live.

Este estudio relaciona conceptos generales de ingeniería de APIs full-stack con el S/4HANA Procurement API Client explícitamente no-live publicado en este repositorio. Separa source revisable y estudio arquitectónico de cualquier claim profesional de runtime SAP.

## Conceptos client-side OData / REST

El S/4HANA Procurement API Client público demuestra únicamente el comportamiento presente en su source y tests:

- configuración externa;
- consumo API read-only;
- construcción de queries;
- validación de respuestas OData;
- abstracción de transporte;
- mapeo de errores HTTP;
- captura de correlation/request IDs;
- manejo de timeout;
- obligación de HTTPS;
- tests automatizados deterministas;
- validación en GitHub Actions.

Ver: [`../02-s4hana/mm/procurement-api-lab`](../02-s4hana/mm/procurement-api-lab/README.es.md).

El cliente **no** demuestra conexión a un tenant S/4HANA real, implementación OData productiva, configuración de middleware SAP, destinos ni comportamiento runtime corporativo.

## Contexto SOAP / XML fuera de SAP

El portfolio contiene por separado evidencia real de ingeniería de software con SOAP/XML/XSD en el case study sanitizado de KOVI. Esa evidencia pertenece al track de producto software y no debe reinterpretarse como experiencia en interfaces SAP.

## Conceptos de resiliencia basados en documentación

Los siguientes patrones se conservan como estudio de arquitectura porque son útiles de forma general para clientes API y sistemas distribuidos. No se presentan como evidencia de implementación productiva SAP.

### Idempotencia

```text
Request/evento externo
        ↓
Business/idempotency key estable
        ↓
Verificar estado previo
        ↓
Procesar una sola vez
        ↓
Persistir resultado / correlation ID
        ↓
Responder/reproducir resultado determinista
```

### Clasificación de errores

Un diseño client/interface puede distinguir:

- autenticación/autorización;
- transporte/conectividad;
- timeout;
- validación/schema;
- rechazo de regla de negocio;
- fallo técnico remoto;
- fallo transitorio reintentable;
- fallo permanente/no reintentable.

### Correlación y trazabilidad

Una traza genérica de sistema distribuido puede preservar un identificador de correlación a lo largo de:

`caller → client/service layer → remote API → worker/job → response`

El cliente TypeScript público conserva correlation/request IDs devueltos por el remoto cuando están disponibles.

### Observabilidad

Un registro técnico seguro puede incluir:

- nombre de operación;
- referencia de negocio segura;
- correlation ID;
- timestamps inicio/fin;
- categoría de resultado;
- cantidad de retries;
- status/code remoto;
- detalle de error sanitizado.

### Separación de secretos/configuración

Los ejemplos públicos no deben contener:

- credenciales SAP;
- destinos RFC;
- client secrets;
- certificados privados;
- hostnames internos;
- payloads productivos.

La configuración se externaliza y los ejemplos utilizan placeholders o valores sintéticos.

## Clasificación de evidencia

| Artefacto | Clasificación | Qué respalda |
|---|---|---|
| S/4HANA Procurement API Client | `EXECUTABLE_NON_LIVE_EXAMPLE` | Comportamiento del cliente TypeScript, parsing/validación OData, guard HTTPS, correlación y tests CI observados |
| Este documento | `DOCUMENTATION_GROUNDED` | Solo estudio de arquitectura |
| Case study público KOVI | Evidencia separada de producto software | SOAP/XML/XSD y procesamiento asíncrono fuera de SAP |
| Guías de diagnóstico/operación ECC | `ENTERPRISE_VERIFIED` cuando está expresamente clasificado | Contexto SAP de troubleshooting/procesos, no implementación de interfaces |

## Límite de claims

Este estudio no afirma implementación productiva de interfaces SAP, trabajo con SAP Integration Suite/CPI, conectividad live a APIs S/4HANA, runtime IDoc/RFC/BAPI, configuración de middleware ni endpoints SAP de cliente.
