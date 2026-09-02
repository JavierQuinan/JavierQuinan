# SAP S/4HANA — Línea de Evidencia de Ingeniería

> **Alcance:** S/4HANA MM, CDS, APIs liberadas, ABAP Cloud y RAP  
> **Madurez actual:** planificado / arquitectura de evidencia definida

Esta línea está separada deliberadamente de ECC. Se enfoca en prácticas actuales de extensibilidad e integración SAP, sin renombrar patrones clásicos ECC como si fueran evidencia S/4HANA.

## Áreas objetivo

- CDS View Entities orientadas a MM
- APIs liberadas
- servicios OData
- restricciones de lenguaje/versión ABAP Cloud
- diseño compatible con Clean Core
- business objects RAP
- behavior definitions e implementations
- service definitions / bindings
- conceptos de autorización
- ABAP Unit y test doubles cuando corresponda

## Regla de evidencia

Un reporte ECC con acceso directo a tablas no constituye por sí solo evidencia S/4HANA. Los artefactos S/4HANA deberán priorizar interfaces liberadas y puntos de extensión upgrade-safe.

## Paquetes previstos

1. **MM Purchasing API Evidence** — acceso a solicitudes/pedidos mediante interfaces liberadas.
2. **CDS Analytical Evidence** — CDS View Entity orientada a MM con modelo semántico documentado.
3. **ABAP Cloud Evidence** — código restringido a APIs liberadas y language version cloud-ready.
4. **RAP Evidence** — business object completo desde CDS hasta behavior y exposición del servicio.

## Gate runtime

Ningún artefacto será presentado como funcional en S/4HANA hasta documentar activación/ejecución en `EVIDENCE.md`.
