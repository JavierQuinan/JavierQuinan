# SAP S/4HANA — Guía de Arquitectura RAP

[English version](./README.md)

> **Tipo de evidencia:** guía de arquitectura basada en documentación  
> **Claim runtime:** ninguno

Esta guía explica ABAP RESTful Application Programming Model (RAP) mediante un escenario acotado de revisión de reposición MM. Se presenta como evidencia de arquitectura, no como aplicación RAP activada.

## Arquitectura RAP

```text
Persistencia / fuente liberada
          │
          ▼
CDS root view entity
          │
          ▼
Behavior Definition
          │
          ▼
Behavior Implementation
          │
          ▼
Projection View
          │
          ▼
Projection Behavior
          │
          ▼
Service Definition
          │
          ▼
Service Binding — OData V4
          │
          ▼
Fiori / consumidor API
```

La guía diferencia la service definition independiente del protocolo de la service binding que expone el modelo mediante un protocolo como OData.

## Caso de arquitectura: MM Replenishment Review

El caso representa un **business object custom de revisión/workflow** alrededor de una evaluación de reposición. Evita deliberadamente modificar maestro de materiales o persistencia MRP estándar SAP.

Campos custom de ejemplo:

- UUID de revisión
- referencia de material
- referencia de centro
- fecha de revisión
- nivel de riesgo
- acción propuesta
- nota del revisor
- estado workflow
- timestamps de creación/modificación

Los ejemplos públicos utilizan identificadores sintéticos.

## Límite del business object

```text
Evidencia diagnóstica ECC clásica
MARC/MARD read-only
             │
             │ solo continuidad conceptual de negocio
             ▼
Guía de arquitectura RAP
BO custom de revisión + límites S/4HANA liberados
```

La arquitectura mantiene el diagnóstico separado de la persistencia estándar SAP. El BO custom es dueño únicamente de las decisiones de revisión y del estado del workflow.

## Modelo de behavior

Operaciones documentadas:

- crear revisión
- modificar una revisión abierta
- enviar revisión
- aprobar o rechazar una revisión enviada
- cerrar revisión

Validaciones documentadas:

- material/centro requeridos;
- acción propuesta requerida antes del submit;
- registros cerrados inmutables;
- aprobación/rechazo únicamente desde estado submitted.

## Modelo de autorización

La guía separa autorización de visibilidad UI.

Scopes ilustrativos del escenario sintético:

- **viewer** — lectura de casos;
- **reviewer** — crear/modificar/enviar;
- **approver** — aprobar/rechazar casos enviados.

Este artefacto no afirma implementación de autorizaciones SAP.

## Guía de diseño de pruebas

Una implementación RAP basada en esta arquitectura debe revisarse contra:

- validaciones de campos/behavior;
- transiciones de estado;
- casos negativos de autorización;
- inmutabilidad de estados cerrados;
- pruebas EML cuando corresponda;
- metadata del servicio y límites de autorización.

Son criterios de aceptación documentados, no resultados runtime inventados.

## Qué demuestra esta guía

- separación de capas RAP;
- ownership de un business object custom;
- diseño de behavior/state machine;
- diseño de validaciones;
- razonamiento projection/service;
- conocimiento de service binding OData V4;
- límites de autorización/pruebas;
- separación Clean Core frente a lógica ECC clásica.

## Límite de evidencia

El repositorio contiene esta guía de arquitectura RAP y el razonamiento Clean Core relacionado. No afirma activación CDS, runtime de behavior, publicación OData ni tests RAP ejecutados en un tenant SAP.
