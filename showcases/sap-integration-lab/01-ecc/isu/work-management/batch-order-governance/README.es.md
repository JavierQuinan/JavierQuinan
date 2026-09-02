# SAP ECC IS-U / WM — Gobierno de Cierre Masivo de Órdenes de Trabajo

[English version](./README.md)

> **Tipo de evidencia:** guía sanitizada de automatización/gobierno operativo  
> **Estado:** `FUNCTIONAL_EVIDENCE_READY`  
> **Alcance:** cierre/anulación controlada por lotes de OT elegibles

Esta evidencia documenta los controles alrededor de un proceso batch utilizado para impedir la ejecución en campo de órdenes que permanecen abiertas pero no tienen asignación operativa.

La versión pública **no** publica la hoja/script original, números de OT, ambiente ni código de automatización corporativo. El objetivo es mostrar gobierno: elegibilidad, prevalidación, ejecución controlada, resultado por registro y validación posterior en SAP.

## Gate de elegibilidad

Una OT entra al lote solo si cumple simultáneamente todos los criterios requeridos.

Criterios derivados de la fuente:

- la orden permanece en el estado abierto/pendiente configurado
- no tiene puesto de trabajo operativo asignado
- el identificador de la orden fue validado
- el objetivo autorizado es cerrar/anularla para impedir ejecución posterior

Si una orden no cumple todo, debe excluirse.

## Flujo controlado

```text
OT candidatas
     │
     ▼
Validar elegibilidad en SAP
     │
     ▼
Preparar conjunto de entrada acotado
     │
     ▼
Revisar duplicados / vacíos / rango
     │
     ▼
Autorizar acceso de automatización
     │
     ▼
Ejecutar sin operaciones concurrentes
     │
     ▼
Registrar resultado por OT
     │
     ▼
Validar estado final en SAP
     │
   ┌─┴────┐
   ▼      ▼
Éxito   Error
   │      │
cerrar  conservar mensaje + diagnosticar antes de reintentar
```

## Controles previos

Antes de ejecutar:

1. validar que cada OT siga cumpliendo elegibilidad;
2. eliminar duplicados;
3. asegurar que el rango de procesamiento contenga solo filas intencionales;
4. excluir registros vacíos/ambiguos;
5. evitar trabajo concurrente no relacionado en la misma sesión SAP;
6. ejecutar solo desde una fuente de automatización autorizada;
7. preferir una ventana controlada cuando los bloqueos puedan afectar otros procesos.

## Disciplina de ejecución

La fuente utiliza automatización SAP GUI iniciada desde una plantilla controlada.

Lecciones públicas:

- mantener la sesión SAP activa;
- autorizar explícitamente SAP GUI Scripting cuando el sistema lo solicite;
- no interrumpir el batch a mitad de ejecución;
- capturar resultado por registro, no únicamente un mensaje global de fin.

## Modelo de resultado por registro

Un batch profesional debería exponer, al menos:

```text
orden de entrada
seleccionada sí/no
estado de procesamiento
código/mensaje de resultado
estado de validación
criterio de retry/escalamiento
```

Que el script termine no demuestra que todas las órdenes hayan alcanzado el estado deseado.

## Validación posterior

Después del batch, comprobar de forma independiente el estado final en SAP.

Si una orden falla:

1. conservar el mensaje sanitizado;
2. volver a revisar elegibilidad;
3. confirmar estado/asignación actual;
4. diagnosticar antes de reintentar;
5. evitar reejecuciones masivas a ciegas.

## Limitación de automatización

La guía fuente indica que la automatización no puede registrar una observación explicativa durante el cierre/anulación. La trazabilidad adicional debe registrarse mediante el mecanismo institucional autorizado.

## Laboratorio futuro

Podremos recrear públicamente este patrón con OT sintéticas:

```text
entrada CSV/JSON
     │
     ▼
validator
     │
     ▼
dry-run / matriz de elegibilidad
     │
     ▼
abstracción de command executor
     │
     ▼
log por registro
     │
     ▼
cola de retry idempotente
     │
     ▼
reporte de auditoría
```

Así demostramos batch safety, idempotencia, auditabilidad y aislamiento de errores sin tocar un SAP empresarial real.

## Límite de confidencialidad

No se publica:

- Excel/VBA original
- números de OT
- nombres de sistema/mandante
- usuarios
- empresas
- rutas internas de automatización
- screenshots productivos

## Qué demuestra

- gobierno de procesamiento masivo
- diseño de reglas de elegibilidad
- validación preflight
- conocimiento de SAP GUI automation
- manejo de errores por registro
- validación post-ejecución
- reducción de riesgo operativo
- trazabilidad/auditoría
