# SAP S/4HANA — Línea de Evidencia ABAP Cloud / Clean Core

[English version](./README.md)

> **Tipo de evidencia:** arquitectura/investigación  
> **Estado:** `RESEARCH_VALIDATED / IMPLEMENTATION_PLANNED`  
> **Claim runtime:** ninguno

Esta línea define las reglas que deberá cumplir la evidencia técnica S/4HANA futura. Se mantiene completamente separada de ABAP clásico ECC.

## Principio central

**Un patrón clásico ECC no constituye automáticamente evidencia de ingeniería Clean Core en S/4HANA.**

La evidencia ABAP Cloud priorizará puntos de extensión y APIs liberadas.

## Contratos de liberación

SAP documenta, entre otros:

- **C0 — Extend**: escenarios de extensibilidad
- **C1 — Use System-Internally**: consumo estable de objetos liberados dentro del sistema y entre componentes
- **C2 — Use as Remote API**: consumo remoto para integración/extensión side-by-side

Cada artefacto deberá identificar qué API/contrato utiliza en lugar de limitarse a decir “compatible con S/4”.

## Reglas de evidencia

Un artefacto ABAP Cloud debe documentar:

1. versión/lenguaje ABAP objetivo
2. objetos SAP liberados consumidos
3. release contract cuando aplique
4. por qué el diseño se alinea con Clean Core
5. checks ATC/estáticos esperados
6. modelo de autorización
7. límite de extensión
8. estrategia de pruebas
9. estado de evidencia runtime

## Progresión objetivo

```text
Fundamentos ABAP
      │
      ▼
Modern ABAP
      │
      ▼
CDS view entities
      │
      ▼
Released APIs / consumo C1
      │
      ▼
RAP business object
      │
      ▼
Service definition
      │
      ▼
OData V4 service binding
      │
      ▼
Autorización + tests + ATC
      │
      ▼
Side-by-side / integración (C2)
```

## Evidence packs previstos

### 1. Lab CDS analítico MM read-only

Objetivo: demostrar un read model limpio construido solo sobre fuentes liberadas apropiadas para la release S/4HANA objetivo.

Estado: `PLANNED`.

### 2. RAP managed business object

Objetivo: crear un business object custom autocontenido con CDS, behavior definition, projection, service definition/binding y pruebas, sin modificar persistencia estándar SAP.

Estado: `PLANNED`.

### 3. Cliente API Sourcing & Procurement

Objetivo: consumir una API OData oficial desde un cliente externo, con secretos fuera de Git y mocks/contract tests deterministas.

Estado: `DESIGN_READY`.

### 4. ADR Clean Core

Objetivo: comparar un patrón clásico ECC de acceso directo con el enfoque S/4HANA basado en objetos/APIs liberadas y explicar por qué no son equivalentes.

Estado: `PLANNED`.

## Gate ATC/calidad

Cuando exista entorno, la evidencia incluirá donde sea aplicable:

- syntax/activation
- resultado ATC
- verificación de objetos liberados
- ABAP Unit
- pruebas de behavior
- metadata/runtime del servicio
- prueba de autorización

No se inventarán resultados PASS sin entorno.

## Referencias oficiales

Public Released APIs: https://help.sap.com/docs/abap-cloud/abap-cloud/public-released-apis

RAP overview: https://help.sap.com/docs/abap-cloud/abap-rap/learn
