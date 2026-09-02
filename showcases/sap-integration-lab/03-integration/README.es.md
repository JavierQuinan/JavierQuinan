# SAP Integration — Línea de Evidencia de Ingeniería

> **Alcance:** patrones de integración entre SAP y sistemas externos  
> **Madurez actual:** planificado / arquitectura definida

Esta línea conecta la evidencia SAP con el portfolio general de ingeniería full-stack.

## Patrones previstos

- consumo OData
- integración REST
- procesamiento SOAP/XML
- transformación de mensajes
- idempotencia
- correlation IDs
- clasificación de errores y reintentos
- auditoría y observabilidad
- separación segura de secretos/configuración

## Límite de evidencia

No se publican endpoints internos, destinos RFC, hostnames, credenciales, certificados ni payloads reales de clientes.

Los ejemplos utilizarán payloads sintéticos y configuración explícita por entorno.

## Artefactos previstos

1. Consumer OData con mapping tipado y manejo de errores.
2. Ejemplo SOAP/XML con fixtures deterministas.
3. Handler idempotente con correlation/audit IDs.
4. Clasificación de errores y reintentos.
5. Observabilidad conectando fallos técnicos con contexto de proceso de negocio.
