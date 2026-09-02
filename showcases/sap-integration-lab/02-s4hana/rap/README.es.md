# SAP S/4HANA — Roadmap de Evidencia RAP

[English version](./README.md)

> **Estado:** `DESIGN_READY / IMPLEMENTATION_PLANNED`  
> **Claim runtime:** ninguno

Esta línea generará la primera evidencia pública de desarrollo de aplicaciones S/4HANA usando ABAP RESTful Application Programming Model (RAP).

## Arquitectura objetivo

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

SAP documenta la service definition como descripción independiente del protocolo de qué entidades CDS se exponen, mientras la service binding conecta esa definición con un protocolo como OData. Para servicios transaccionales, OData V4 será el objetivo preferido cuando aplique.

## Primer Business Object del portafolio

Dominio previsto:

**MM Replenishment Review / Caso de Revisión de Reposición**

No modificará maestro de materiales ni persistencia MRP estándar SAP.

Modelará un business object custom para registrar decisiones/revisiones alrededor de un análisis de reposición.

Campos posibles:

- UUID de revisión
- referencia de material (sintética en evidencia pública)
- referencia de centro
- fecha de revisión
- nivel de riesgo
- acción propuesta
- nota del revisor
- estado workflow
- timestamps de creación/modificación

## Por qué este objeto

Crea un puente limpio entre el diagnóstico ECC clásico y una extensión moderna S/4HANA sin presentar el reporte ECC como solución Clean Core.

```text
Evidencia ECC
Diagnóstico MARC/MARD read-only
             │
             │ continuidad conceptual de negocio
             ▼
Evidencia S/4HANA RAP
BO custom de revisión + fuentes/APIs liberadas
```

## Behavior previsto

Operaciones:

- crear revisión
- modificar mientras está abierta
- enviar a revisión/aprobación
- aprobar/rechazar
- cerrar

Validaciones:

- material/centro requeridos
- acción propuesta requerida antes de submit
- registros cerrados no modificables
- aprobación únicamente desde estado submitted

## Estrategia de pruebas

La evidencia futura incluirá:

- pruebas de validaciones de behavior
- pruebas de acciones/transiciones
- autorizaciones
- casos negativos
- pruebas con EML cuando sea viable
- metadata/runtime del servicio

## Autorización

Autorización explícita y separada de visibilidad UI.

Roles/scopes previstos para el lab sintético:

- viewer
- reviewer
- approver

La implementación exacta dependerá del ambiente ABAP Cloud y se documentará cuando exista el source.

## Gate de evidencia

```text
DESIGN_READY
    ↓
CDS_SOURCE_READY
    ↓
BEHAVIOR_SOURCE_READY
    ↓
SERVICE_SOURCE_READY
    ↓
STATIC_VALIDATED
    ↓
RUNTIME_VALIDATED
    ↓
TEST_VALIDATED
```

Posición actual: `DESIGN_READY`.

## Referencias oficiales

- RAP: https://help.sap.com/docs/abap-cloud/abap-rap/learn
- Service Definition: https://help.sap.com/docs/abap-cloud/abap-rap/service-definition
- Service Binding: https://help.sap.com/docs/abap-cloud/abap-rap/service-binding
- RAP Business Object Contract: https://help.sap.com/docs/abap-cloud/abap-rap/rap-business-object-contract
