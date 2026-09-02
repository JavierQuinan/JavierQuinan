# SAP ECC IS-U / Work Management — Auditoría de Estados de Órdenes de Trabajo

[English version](./README.md)

> **Tipo de evidencia:** guía técnica de troubleshooting sanitizada  
> **Estado:** `FUNCTIONAL_TECHNICAL_EVIDENCE_READY`  
> **Claim runtime:** no se afirma ejecución de un artefacto ABAP propio

Esta guía documenta un método reproducible y de solo lectura para determinar el estado real de una orden de trabajo, diferenciar estados activos de estados históricos y aislar si una discrepancia pertenece al objeto estándar SAP o a una capa personalizada de visualización/selección.

## Regla de seguridad

Este procedimiento es diagnóstico.

- No modificar directamente registros de estado desde visores de tablas.
- No eliminar estados históricos.
- No manipular manualmente `INACT` ni códigos de estado.
- Toda corrección debe realizarse por proceso funcional autorizado, lógica aprobada o cambio/transportación controlada.

## Flujo de diagnóstico

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
JCDS — reconstruir historial de cambios
              │
              ▼
Comparar objeto estándar con monitor/interfaz custom
              │
       ┌──────┴──────┐
       ▼             ▼
estándar incorrecto  capa custom incorrecta
       │             │
flujo funcional     SE93 → SE38/SE80 → ST05/SAT
```

## Objetos estándar

| Objeto | Relación | Uso diagnóstico |
|---|---|---|
| `AUFK` | `AUFNR -> OBJNR` | Cabecera de OT y punto de entrada al objeto de estados |
| `AFIH` | `AUFNR` | Contexto de cabecera PM/maintenance cuando sea necesario |
| `JEST` | `OBJNR + STAT` | Estados de sistema/usuario; `INACT` determina activo/inactivo |
| `JSTO` | `OBJNR` | Control del objeto de estado y perfil `STSMA` |
| `TJ02T` | estado sistema + idioma | Resolución de texto de estado de sistema |
| `TJ30T` | `STSMA + estado usuario + idioma` | Texto del estado de usuario dentro del perfil correcto |
| `JCDS` | `OBJNR + STAT + CHGNR` | Historial de activación/desactivación y contexto de cambio |

## Regla crítica de interpretación

Un código de estado por sí solo no basta.

- `INACT` vacío → estado activo en el registro inspeccionado.
- `INACT = X` → registro inactivo/histórico.
- `I....` → familia de estados de sistema.
- `E....` → familia de estados de usuario.
- Un estado de usuario debe interpretarse junto con el perfil `STSMA`; no se debe asumir que el mismo código interno significa lo mismo en todos los perfiles.

## Procedimiento paso a paso

### 1. Baseline funcional — `IW33`

Visualizar la OT y registrar el resumen de estados, contexto de cierre técnico, fechas, tipo de orden y datos de control relevantes.

### 2. Resolver el objeto de estados — `AUFK`

Consultar la cabecera por número de orden y obtener `OBJNR`. Cuando el objeto técnico ya existe en la cabecera, utilizarlo y no reconstruirlo manualmente.

### 3. Leer estados activos e históricos — `JEST`

Primero revisar registros activos (`INACT` vacío). Después contrastar con todo el historial incluyendo inactivos. Nunca interpretar como vigente una fila histórica.

### 4. Resolver textos

Para estados de sistema, resolver el texto con la fuente estándar correspondiente, como `TJ02T`, usando el idioma aplicable.

Para estados de usuario:

1. leer `JSTO` para el objeto de estado;
2. obtener `STSMA`;
3. resolver el código de usuario dentro de ese perfil mediante `TJ30T`.

### 5. Reconstruir secuencia — `JCDS`

Ordenar cronológicamente los cambios y revisar estado, activación/inactivación, fecha/hora y contexto disponible de transacción/usuario. El objetivo es identificar qué proceso, job, workflow o transacción provocó el cambio.

### 6. Comparar con la superficie reportada

Si el objeto estándar está correcto pero un monitor/interfaz custom muestra un estado distinto, investigar la selección custom en lugar de modificar la OT estándar.

### 7. Trazar la capa custom cuando sea necesario

```text
SE93
  ↓ identificar objeto ejecutable
SE38 / SE80
  ↓ inspeccionar lógica de selección/estado
ST05
  ↓ observar tablas/SQL para un caso reproducible
SAT
  ↓ seguir el flujo runtime cuando el SQL no sea suficiente
SU53
  ↓ revisar autorización si el resultado cambia según usuario
```

## Matriz típica de diagnóstico

| Hallazgo | Interpretación | Acción siguiente |
|---|---|---|
| Estado objetivo activo en `JEST` | El estado realmente está vigente | Revisar el proceso funcional que debía cambiarlo |
| Estado inactivo en `JEST`, pero la pantalla custom lo muestra | Probable lectura histórica o selección custom | Revisar `INACT`, antecedentes y lógica de selección |
| Estado no existe en `JEST` | La capa custom puede derivarlo de otra fuente | Trazar tablas custom, RFC/proxy/workflow o lógica calculada |
| Cierre técnico activo y tratamiento pendiente inactivo | Orden estándar consistente | Escalar solo la discrepancia de visualización/procesamiento |
| Resultado distinto por usuario | Variante, autorización, ámbito organizativo o buffer | Comparar variantes, `SU53`, parámetros y trace controlado |

## Orientación para desarrollo ABAP

Cuando se construya lógica de aplicación, priorizar APIs estándar de estado cuando correspondan en lugar de duplicar semántica mediante lecturas directas no controladas. Cualquier API candidata debe verificarse en la release ECC instalada antes de usarla en productivo.

Las lecturas de tablas de este documento son únicamente **evidencia diagnóstica/read-only**.

## Límite público

La guía fuente contenía números reales de OT y el nombre de una transacción personalizada. Se excluyen deliberadamente.

Nunca publicar:

- números reales de OT
- instalaciones o cuentas contrato
- nombres de transacciones custom internas cuando no aportan al aprendizaje
- usuarios
- configuración de empresa/cliente
- screenshots internos
- procedimientos de edición directa de tablas

## Qué demuestra

- troubleshooting del modelo de estados de OT SAP
- separación estado sistema vs. usuario
- análisis vigente vs. histórico
- interpretación consciente del perfil de estados
- reconstrucción por change documents
- trazabilidad transacción→código
- diagnóstico SQL/runtime
- disciplina de escalamiento y seguridad
