# SAP S/4HANA — Laboratorio de Evidencia Migration Cockpit

[English version](./README.md)

> **Tipo de evidencia:** estudio/diseño basado en documentación oficial  
> **Estado:** `RESEARCH_VALIDATED / RUNTIME_NOT_CLAIMED`  
> **Límite:** no se presenta como experiencia hands-on en una migración productiva

Este laboratorio documenta el flujo del SAP S/4HANA Migration Cockpit utilizando SAP Help Portal actual como fuente de verdad.

Se mantiene deliberadamente separado de la evidencia ECC.

## Enfoques de migración

SAP documenta dos enfoques principales:

1. **Migrar mediante tablas de staging**
2. **Migrar directamente desde un sistema SAP origen**

La alternativa aplicable depende del escenario fuente y de los objetos de migración disponibles.

## Ciclo de un proyecto

```text
Crear proyecto de migración
        │
        ▼
Seleccionar escenario
        │
        ▼
Seleccionar migration objects
        │
        ▼
Preparar datos fuente/staging
        │
        ▼
Transferir / preparar datos
        │
        ▼
Resolver mapping tasks
        │
        ▼
Simular migración
        │
        ├── errores/mappings → corregir y repetir
        │
        ▼
Migrar
        │
        ▼
Monitorear actividades/resultados
        │
        ▼
Reconciliación funcional
```

## Objetos de migración

El cockpit usa **migration objects** para definir el business data que se transfiere.

Por objeto pueden existir:

- documentación
- vista/scope activo o personalizado
- estructura de tablas para escenarios staging
- mapping tasks
- instancias del objeto
- actividades de preparación/simulación/migración

Un ejercicio futuro de portafolio elegirá un objeto acotado en lugar de afirmar una migración completa de sistema.

## Enfoque con staging tables

SAP crea una o varias tablas staging para cada objeto relevante.

Los datos fuente pueden cargarse mediante:

- plantillas proporcionadas, o
- herramientas/procesos externos apropiados, como SAP Data Services cuando aplique.

Según producto/versión/escenario, las staging tables pueden residir en un esquema SAP HANA local o remoto configurado para el proyecto.

```text
Datos fuente
   │
   ▼
Plantilla / ETL
   │
   ▼
Staging tables
   │
   ▼
Preparar / transferir desde staging
   │
   ▼
Mapping
   │
   ▼
Simulación
   │
   ▼
Migración
```

## Gate de simulación

La simulación es un control crítico.

SAP documenta que la simulación no escribe los datos de negocio en el sistema destino, pero permite revisar mensajes/errores. Pueden aparecer nuevas tareas de mapping y deben resolverse antes de repetir la simulación y continuar.

Por tanto, una evidencia profesional nunca debe saltar de “datos preparados” directamente a “migrado”.

## Monitoreo

El proyecto/cockpit permite monitorear las actividades de migración.

La evidencia futura debería registrar:

- objeto de migración
- enfoque de origen
- alcance de instancias
- resultado de preparación
- tareas de mapping
- resultado de simulación
- resultado de migración
- registros rechazados/error
- reconciliación

## Diseño de laboratorio

Primer ejercicio hands-on futuro:

**Synthetic Business Data Migration Runbook**

Entregables:

```text
MIGRATION_SCENARIO.md
DATA_DICTIONARY.md
SOURCE_TO_TARGET_MAPPING.md
SYNTHETIC_DATA.csv
PRE_VALIDATION.md
SIMULATION_RESULTS.md
ERROR_CATALOG.md
RECONCILIATION.md
POST_MIGRATION_CHECKLIST.md
```

Nunca se publicará un dataset empresarial real.

## Gates de calidad

Antes de simular:

- claves obligatorias completas
- atributos requeridos presentes
- fechas válidas
- mappings de códigos definidos
- dependencias organizativas resueltas
- duplicados identificados
- dependencias referenciales comprendidas

Después de migrar:

- conteo migrado reconciliado
- rechazados explicados
- totales de negocio reconciliados cuando aplique
- muestra de registros validada funcionalmente
- cero datos sensibles versionados

## Migration Object Modeler

`LTMOM` / modelado de objetos es un tema avanzado separado. No se afirmará experiencia custom hasta producir un artefacto real de diseño/modelado.

## Madurez

```text
RESEARCH_VALIDATED
        ↓
LAB_DESIGNED
        ↓
SYNTHETIC_DATA_READY
        ↓
RUNTIME_VALIDATION_PENDING
        ↓
RUNTIME_VALIDATED
```

Posición actual: `RESEARCH_VALIDATED`.

## Fuentes oficiales

- Data Migration: https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/6e7648c7d6a844e69ee9d24d00cfc464.html
- Migrate Your Data — Migration Cockpit: https://help.sap.com/docs/PRODUCT_ID/29193bf0ebdd4583930b2176cb993268/2f0dbe4111214bcf9b2d57eca26f0525.html
- Migrate Data Using Staging Tables: https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/87ffdbfebd504116b497c02d51ce5b58.html
- Simulating the Migration: https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/0ee46d72aa734da6ba5d9285da4d7148.html
