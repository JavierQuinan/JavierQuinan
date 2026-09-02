# SAP ECC IS-U / Work Management — Auditoría de Estados de Órdenes de Trabajo

[English version](./README.md)

> **Tipo de evidencia:** troubleshooting operativo sanitizado + source ABAP read-only original  
> **Estado:** `FUNCTIONAL_TECHNICAL_EVIDENCE_READY / SOURCE_READY / STATIC_VALIDATED / RUNTIME_DEFERRED`  
> **Claim runtime:** no se afirma activación SAP ni ejecución real de ABAP Unit

Este evidence pack combina un método de troubleshooting sanitizado derivado de guías operativas reales con un laboratorio ABAP original que audita el modelo estándar de estados de órdenes sin modificar datos.

## Flujo funcional de diagnóstico

```text
Problema reportado de estado de OT
              │
              ▼
IW33 — establecer baseline funcional
              │
              ▼
AUFK — resolver AUFNR → OBJNR
              │
              ▼
JEST — estados activos + históricos
              │
        ┌─────┴─────┐
        ▼           ▼
Estado sistema   Estado usuario
   I....            E....
        │           │
        ▼           ▼
     TJ02T      JSTO → STSMA → TJ30T
        │           │
        └─────┬─────┘
              ▼
JCDS — contexto de historial de cambios
```

Reglas críticas:

- `INACT` vacío → registro activo
- `INACT = X` → registro inactivo/histórico
- `I....` → familia de estados de sistema
- `E....` → familia de estados de usuario
- un estado de usuario debe interpretarse dentro del perfil `STSMA` correspondiente

## Artefacto técnico ABAP original

Transacción objetivo:

`ZWM_STATUS_AUDIT_LAB`

Reporte ejecutable:

`ZWM_STATUS_AUDIT_REPORT`

Arquitectura:

```text
ZWM_STATUS_AUDIT_LAB
        │
        ▼
ZWM_STATUS_AUDIT_REPORT
        │
        ▼
ZCL_WM_STATUS_AUDIT_SERVICE
        │
        ▼
ZIF_WM_STATUS_SOURCE
   ┌─────────┴─────────┐
   ▼                   ▼
Datasource ECC      Datasource demo
   │
   ├── AUFK
   ├── JSTO
   ├── JEST
   ├── TJ02T
   ├── TJ30T
   └── JCDS
```

El source revisable está en [`source/`](./source/).

## Qué lee el datasource ECC

| Objeto | Uso |
|---|---|
| `AUFK` | resolver número de orden a `OBJNR` |
| `JSTO` | obtener perfil de estados `STSMA` |
| `JEST` | registros activos e históricos |
| `TJ02T` | resolver texto de estado de sistema |
| `TJ30T` | resolver texto de usuario dentro del perfil |
| `JCDS` | conteo de cambios y última fecha/hora |

El lab público excluye deliberadamente usuario/TCode histórico y toda operación de escritura.

## Resultados diagnósticos

El servicio reporta únicamente condiciones estructurales:

- `OK`
- `NO_ACTIVE_STATUS`
- `USER_PROFILE_MISSING`
- `TEXT_RESOLUTION_GAP`

`OK` **no** significa que la orden esté funcionalmente correcta. Solo significa que el snapshot de estados inspeccionado es estructuralmente resoluble por la lógica del auditor.

## Validación estática

Se prepararon seis vectores deterministas ABAP Unit y fueron trazados consistentemente a nivel de source:

1. estado sistema activo resuelto → `OK`
2. solo registros históricos → `NO_ACTIVE_STATUS`
3. estado usuario activo sin `STSMA` → `USER_PROFILE_MISSING`
4. estado activo sin texto → `TEXT_RESOLUTION_GAP`
5. separación correcta entre activos e históricos
6. preservación del resumen de cambios

Resultado:

```text
Vectores revisados: 6
Consistentes:       6
Inconsistencias:    0
```

Esto es **validación estática/source**, no ejecución ABAP Unit dentro de SAP.

## Salida SALV

El reporte ejecutable está diseñado para mostrar:

- orden / objeto de estados
- perfil `STSMA`
- código y clasificación sistema/usuario
- activo vs. histórico
- textos
- número de cambio
- conteos resumen
- última fecha/hora de cambio
- resultado diagnóstico

## Reproducción

- [Build Guide — English](./BUILD_GUIDE.md)
- [Guía de Construcción — Español](./BUILD_GUIDE.es.md)
- [Registro de Evidencia](./EVIDENCE.md)
- [Validación Estática](./STATIC_VALIDATION.md)

El procedimiento documentado utiliza `SE24`, `SE38` y `SE93`, manteniendo `RUNTIME_DEFERRED` hasta disponer de un SAP DEV/sandbox autorizado.

## Seguridad / límite público

Nunca publicar:

- números reales de OT
- instalaciones o cuentas contrato
- identificadores de cliente/empresa
- usuarios, SID/mandante, URLs o transportes
- nombres/source de transacciones custom propietarias
- procedimientos de edición directa de tablas
- screenshots con datos empresariales o material de terceros sin derecho de publicación

El artefacto es read-only y no contiene `UPDATE`, `INSERT`, `MODIFY`, `DELETE` ni commit.

## Qué demuestra

- troubleshooting del modelo de estados de OT SAP
- separación estado sistema vs. usuario
- interpretación activo vs. histórico
- resolución consciente de `STSMA`
- análisis de historial de cambios
- diseño ABAP OO clásico
- abstracción de datasource y pruebas sintéticas
- reporting SALV
- límites de evidencia pública orientados a seguridad
