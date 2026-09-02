# SAP S/4HANA — Guía Técnica Migration Cockpit

[English version](./README.md)

> **Tipo de evidencia:** guía técnica basada en documentación  
> **Límite:** no se afirma runtime de migración productiva en S/4HANA

Esta guía documenta el flujo de SAP S/4HANA Migration Cockpit, sus puntos de control y un runbook reproducible con datos sintéticos. Se mantiene separado de la evidencia ECC.

## Enfoques de migración

La guía diferencia dos enfoques principales:

1. **Staging tables** — los datos fuente se preparan fuera de los objetos de negocio destino y se cargan en estructuras staging.
2. **Direct transfer desde un sistema SAP origen** — los objetos soportados transfieren datos directamente desde el escenario fuente configurado.

La alternativa aplicable depende del objeto de migración, sistema origen y producto/release objetivo.

## Ciclo end-to-end

```text
Crear proyecto de migración
        ↓
Seleccionar escenario
        ↓
Seleccionar migration objects
        ↓
Preparar datos fuente/staging
        ↓
Transferir / preparar datos
        ↓
Resolver mapping tasks
        ↓
Simular migración
        ↓
Revisar errores y correcciones
        ↓
Ejecutar migración
        ↓
Monitorear resultados
        ↓
Reconciliar datos de negocio
```

## Migration objects

Un migration object define estructura y comportamiento para un dominio de datos acotado. Una revisión profesional registra:

- objeto y escenario;
- enfoque de origen;
- documentación de campos;
- atributos obligatorios/opcionales;
- mapping tasks;
- alcance de instancias;
- dependencias;
- resultado de simulación;
- resultado de migración;
- resultado de reconciliación.

## Flujo con staging tables

```text
Datos fuente
   ↓
Plantilla / preparación ETL
   ↓
Staging tables
   ↓
Preparar / transferir desde staging
   ↓
Mapping
   ↓
Simulación
   ↓
Migración
   ↓
Reconciliación
```

La simulación se trata como gate de control, no como paso decorativo. Su objetivo es descubrir problemas de mapping/calidad antes de la escritura de negocio en destino.

## Runbook sintético reproducible

### 1. Definir alcance

Documentar:

- migration object;
- enfoque (`staging` o `direct transfer`);
- alcance organizativo;
- cantidad esperada de registros;
- dependencias con objetos migrados previamente.

### 2. Crear diccionario de datos

| Campo | Requerido | Significado origen | Significado destino | Validación |
|---|---|---|---|---|
| Key | sí | identificador sintético | clave del migration object | único/no vacío |
| Date | según escenario | fecha de negocio | fecha SAP destino | formato/rango válido |
| Org value | según escenario | organización origen | organización SAP destino | mapping existente |
| Code/value | según escenario | código origen | código SAP destino | mapping resuelto |

### 3. Preparar datos sintéticos

Reglas:

- no usar IDs reales de clientes/proveedores/materiales/BP;
- no usar direcciones ni valores financieros productivos;
- incluir registros válidos, inválidos, duplicados y no mapeados;
- mantener identificadores estables para reconciliación repetible.

### 4. Prevalidación

Comprobar:

- claves requeridas completas;
- atributos obligatorios presentes;
- fechas válidas;
- duplicados identificados;
- mappings definidos;
- dependencias organizativas resueltas;
- dependencias referenciales comprendidas;
- encoding/delimitadores validados cuando corresponda.

### 5. Revisión de mapping

| Valor origen | Valor destino | Regla | Estado |
|---|---|---|---|
| `SRC_A` | `TGT_A` | mapping directo | resuelto |
| `SRC_B` | — | sin equivalente | incidencia |

### 6. Revisión de simulación

Registrar:

- objeto/alcance;
- cantidad procesada;
- errores/warnings;
- mapping tasks nuevos;
- registros rechazados;
- acción correctiva.

### 7. Revisión del resultado de migración

Registrar:

- cantidad migrada;
- cantidad rechazada;
- warnings;
- post-procesamiento específico del objeto;
- mensajes técnicos relevantes.

### 8. Reconciliación

Validar:

- esperados vs. migrados;
- rechazados con motivo;
- totales de negocio cuando corresponda;
- muestra representativa;
- consistencia de objetos dependientes;
- ausencia de datos sensibles en Git.

## Catálogo de errores

| Categoría | Ejemplo | Causa | Corrección |
|---|---|---|---|
| Campo requerido | valor obligatorio vacío | fuente incompleta | completar dato |
| Mapping | código sin valor destino | mapping ausente | crear/aprobar mapping |
| Duplicado | key repetida | problema de calidad | deduplicar por regla |
| Dependencia | objeto referenciado inexistente | secuencia incorrecta | migrar dependencia primero |
| Formato | fecha/número inválido | representación fuente | normalizar dato |

## Checklist de monitoreo

Registrar siempre:

- proyecto/escenario;
- migration object;
- enfoque fuente;
- alcance de instancias;
- estado de preparación;
- estado de mapping;
- estado de simulación;
- estado de migración;
- registros rechazados/error;
- reconciliación.

## Límite Migration Object Modeler

`LTMOM` no se presenta aquí como experiencia hands-on de modelado custom. La guía cubre únicamente el flujo estándar de Migration Cockpit y el gobierno necesario para evaluar una migración.

## Qué demuestra esta guía

- razonamiento staging vs. direct transfer;
- definición de alcance por migration object;
- disciplina source-to-target mapping;
- simulación como control;
- manejo de errores/rechazos;
- reconciliación;
- diseño de evidencia sintética respetando privacidad.

## Límite de evidencia

El repositorio contiene esta guía y el runbook sintético. No afirma ejecución productiva S/4HANA, implementación custom LTMOM ni resultados runtime en sistema destino.
