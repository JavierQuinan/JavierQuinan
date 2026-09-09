# SAP S/4HANA — Guía Técnica ABAP Cloud / Clean Core

[English version](./README.md)

> **Tipo de evidencia:** guía de arquitectura basada en documentación  
> **Claim runtime:** ninguno

Esta guía explica las reglas de ingeniería utilizadas en este portafolio para diferenciar ABAP clásico ECC de diseño S/4HANA Clean Core / ABAP Cloud.

## Principio central

**Los patrones clásicos ECC no se presentan como prueba automática de ingeniería Clean Core en S/4HANA.**

Las extensiones S/4HANA deben priorizar objetos SAP liberados, APIs liberadas y puntos de extensión documentados adecuados para la release objetivo.

## Contratos de liberación

La guía registra la distinción práctica entre contratos de liberación utilizados en escenarios ABAP Cloud:

- **C0 — Extend**: escenarios orientados a extensibilidad.
- **C1 — Use System-Internally**: objetos liberados para consumo interno estable entre componentes.
- **C2 — Use as Remote API**: interfaces remotas liberadas para integración/side-by-side.

La regla de ingeniería es identificar el objeto/API liberado y su límite de consumo en lugar de realizar un claim genérico de “compatible con S/4”.

## Checklist de revisión Clean Core

Para una extensión ABAP Cloud/S/4HANA revisar:

1. lenguaje/entorno ABAP objetivo;
2. objetos SAP liberados consumidos;
3. release contract cuando corresponda;
4. límite y ownership de la extensión;
5. si se modifica o evita persistencia estándar;
6. modelo de autorización;
7. estrategia de pruebas;
8. controles ATC/calidad estática;
9. límite de exposición API/servicio;
10. evidencia realmente disponible para el artefacto.

## Registro de decisión ECC vs. Clean Core

| Pregunta | Ejemplo ECC clásico | Dirección Clean Core / S/4HANA |
|---|---|---|
| Acceso a datos | Open SQL sobre tablas estándar cuando corresponde | priorizar CDS/API/objeto liberado |
| Integración remota | pueden existir RFC/custom/table-oriented | APIs remotas/OData liberadas cuando estén disponibles |
| Upgrade safety | el código cliente requiere revisión frente a upgrades | contratos liberados y extension points soportados reducen acoplamiento |
| Extensión de BO | exits/BAdIs/tablas custom según release | extensibilidad liberada + RAP/ABAP Cloud cuando aplique |
| Calidad | syntax, ATC/checks custom, ABAP Unit | released-object checks, ATC, tests, servicio/autorización |

## Secuencia de arquitectura documentada

```text
Selección de datos/API liberados
        ↓
Read model / límite CDS
        ↓
Behavior del business object cuando aplica
        ↓
Projection + service definition
        ↓
OData V4 / superficie de integración liberada
        ↓
Autorización + tests + revisión orientada a ATC
```

## Evidencia existente conectada con esta guía

- [S/4HANA MM Procurement API Client](../mm/procurement-api-lab/README.es.md) — cliente TypeScript read-only ejecutable con **6/6 tests CI**.
- [Guía de Arquitectura RAP](../rap/README.es.md) — arquitectura CDS/behavior/projection/service documentada.
- [Guía Técnica Migration Cockpit](../migration-cockpit/README.es.md) — ciclo y controles de migración documentados.
- Packs ABAP ECC bajo [`../../01-ecc/mm`](../../01-ecc/mm/README.es.md) — expresamente rotulados como ECC clásico, no como Clean Core.

## Qué demuestra esta guía

- gobierno de objetos liberados;
- separación consciente entre patrones ECC y extensiones S/4HANA;
- razonamiento por release contracts;
- revisión de arquitectura Clean Core;
- consideración de ATC/tests/autorización;
- comprensión de límites de integración.

## Límite de evidencia

Este documento es una guía técnica de arquitectura. No afirma runtime ABAP Cloud, ejecución ATC ni activación RAP en un tenant SAP.
