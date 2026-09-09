# SAP ECC IS-U / Work Management — Auditoría de Estados de Órdenes de Trabajo

[English version](./README.md)

> **Evidencia:** troubleshooting operativo sanitizado · source ABAP original read-only · revisión determinista de source

Este paquete combina un método de troubleshooting sanitizado derivado de guías operativas con un laboratorio ABAP original que audita el modelo estándar de estados de órdenes sin modificar datos.

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

- `INACT` vacío → registro activo;
- `INACT = X` → registro inactivo/histórico;
- `I....` → familia de estados de sistema;
- `E....` → familia de estados de usuario;
- un estado de usuario se interpreta con el perfil `STSMA` correspondiente.

## Artefacto ABAP original

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

Source revisable: [`source/`](./source/)

## Alcance del datasource ECC

| Objeto | Uso |
|---|---|
| `AUFK` | resolver número de orden a `OBJNR` |
| `JSTO` | obtener perfil de estados `STSMA` |
| `JEST` | registros activos e históricos |
| `TJ02T` | resolver texto de estado de sistema |
| `TJ30T` | resolver texto de usuario dentro del perfil |
| `JCDS` | conteo de cambios y última fecha/hora |

El lab público excluye usuario/TCode histórico y toda operación de escritura.

## Resultados diagnósticos

El servicio reporta condiciones estructurales únicamente:

- `OK`
- `NO_ACTIVE_STATUS`
- `USER_PROFILE_MISSING`
- `TEXT_RESOLUTION_GAP`

`OK` **no** significa que la orden esté funcionalmente correcta. Significa que el snapshot de estados es estructuralmente resoluble por esta lógica de auditoría.

## Revisión de escenarios deterministas

Se versionaron seis escenarios ABAP Unit y fueron trazados consistentemente a nivel de source:

1. estado de sistema activo resuelto → `OK`;
2. solo registros históricos → `NO_ACTIVE_STATUS`;
3. estado de usuario activo sin `STSMA` → `USER_PROFILE_MISSING`;
4. estado activo sin texto → `TEXT_RESOLUTION_GAP`;
5. separación correcta entre activos e históricos;
6. preservación del resumen de cambios.

```text
Escenarios revisados: 6
Consistentes:         6
Inconsistencias:      0
```

Esto corresponde a revisión source/estática, no a un claim de ejecución ABAP Unit dentro de un sistema SAP corporativo.

## Salida SALV

El source del reporte expone:

- orden / objeto de estados;
- perfil `STSMA`;
- código y clasificación sistema/usuario;
- activo vs. histórico;
- textos;
- número de cambio;
- conteos resumen;
- última fecha/hora de cambio;
- resultado diagnóstico.

## Evidencia reproducible

- [Build Guide — English](./BUILD_GUIDE.md)
- [Guía de Construcción — Español](./BUILD_GUIDE.es.md)
- [Registro de Evidencia](./EVIDENCE.md)
- [Validación Estática](./STATIC_VALIDATION.md)

La guía de construcción documenta creación de objetos mediante `SE24`, reporte `SE38` y configuración de Report Transaction en `SE93`.

## Qué demuestra esta evidencia

- troubleshooting del modelo de estados de OT SAP;
- separación estado sistema vs. usuario;
- interpretación activo vs. histórico;
- resolución consciente de `STSMA`;
- análisis del historial de cambios;
- diseño ABAP Objects clásico;
- abstracción datasource ECC/sintético;
- diseño determinista de escenarios;
- reporting SALV;
- documentación pública orientada a seguridad.

## Seguridad / límite de evidencia

La evidencia pública excluye números reales de OT, instalaciones, cuentas contrato, identificadores de cliente/empresa, usuarios, SID/mandante, URLs internas, transportes, source de transacciones custom propietarias y procedimientos de edición directa de tablas.

El artefacto es read-only y no contiene `UPDATE`, `INSERT`, `MODIFY` de base, `DELETE` ni commit.

El repositorio presenta source/revisión estática e instrucciones reproducibles de construcción; no afirma activación o ejecución de estos objetos custom dentro de un sistema SAP corporativo específico.
