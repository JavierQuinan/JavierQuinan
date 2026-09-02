# SAP Integration — Guía de Ingeniería

[English version](./README.md)

> **Alcance:** patrones de integración entre SAP y sistemas externos

Esta guía conecta la evidencia SAP con el portfolio general de ingeniería full-stack. Documenta controles de integración utilizados en la evidencia pública y enlaza al S/4HANA Procurement API Client como ejemplo source ejecutable.

## Patrones documentados

### OData / REST

El S/4HANA Procurement API Client demuestra:

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

### SOAP / XML

El portfolio documenta integración empresarial intensiva en SOAP/XML mediante el case study sanitizado de KOVI. La evidencia pública se centra en arquitectura, validación XML/XSD, procesamiento asíncrono y límites de falla sin exponer payloads fiscales ni datos de clientes.

### Idempotencia

Para integraciones con reintentos, la regla de ingeniería es:

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

Un retry no debe crear efectos de negocio duplicados de forma silenciosa.

### Clasificación de errores

Los errores se separan en categorías como:

- autenticación/autorización;
- transporte/conectividad;
- timeout;
- validación/schema;
- rechazo de regla de negocio;
- fallo técnico remoto;
- fallo transitorio reintentable;
- fallo permanente/no reintentable.

Esto mejora soporte y observabilidad frente a un mensaje genérico de “error SAP”.

### Correlación y trazabilidad

Los logs de integración deben preservar un identificador de correlación a lo largo de:

`caller → integration layer → SAP/API → worker/job → response`.

El cliente TypeScript público conserva correlation/request IDs devueltos por el remoto cuando están disponibles.

### Observabilidad

Un registro útil de integración vincula evento técnico con contexto de negocio sin guardar payloads confidenciales:

- nombre de operación;
- referencia de negocio segura;
- correlation ID;
- timestamps inicio/fin;
- categoría de resultado;
- cantidad de retries;
- status/code remoto;
- detalle de error sanitizado.

### Separación de secretos/configuración

El código público no contiene:

- credenciales SAP;
- destinos RFC;
- client secrets;
- certificados privados;
- hostnames internos;
- payloads productivos.

La configuración se externaliza y los ejemplos utilizan placeholders o valores sintéticos.

## Evidencia disponible en este repositorio

| Evidencia | Qué demuestra |
|---|---|
| S/4HANA Procurement API Client | cliente TypeScript OData, validación, correlation IDs, HTTPS y **6/6 tests CI** |
| Case study público KOVI | SOAP/XML/XSD, workers asíncronos, arquitectura de certificados y límites de falla |
| Guías de diagnóstico ECC | trazabilidad transacción/objeto y metodología de troubleshooting técnico |
| Guías operativas SAP | contexto de negocio necesario para interpretar correctamente fallos de integración |

## Límite de evidencia

No se publican endpoints internos, destinos RFC, hostnames, credenciales, certificados, payloads reales de clientes ni source propietario de adaptadores.
