# SAP ECC IS-U / WM — Gobierno de Cierre Masivo de Órdenes de Trabajo

[English version](./README.md)

> **Tipo de evidencia:** guía sanitizada de automatización/gobierno operativo  
> **Estado:** `FUNCTIONAL_EVIDENCE_READY`  
> **Alcance:** cierre/anulación controlada por lotes de OT elegibles

Esta evidencia documenta los controles alrededor de un proceso batch utilizado para impedir la ejecución en campo de órdenes que permanecen abiertas pero no tienen asignación operativa.

La versión pública **no** publica la hoja/script original, números de OT, ambiente ni código de automatización corporativo. El objetivo es mostrar gobierno: elegibilidad, prevalidación, ejecución controlada, resultado por registro y validación posterior en SAP.

## Gate de elegibilidad

Una OT entra al lote solo si cumple simultáneamente los criterios requeridos:

- permanece en el estado abierto/pendiente configurado;
- no tiene puesto de trabajo operativo asignado;
- el identificador de la orden fue validado;
- el objetivo autorizado es cerrar/anularla para impedir ejecución posterior.

Si una orden no cumple todo, debe excluirse.

## Flujo controlado

```text
OT candidatas
     │
     ▼
validar elegibilidad en SAP
     │
     ▼
preparar conjunto de entrada acotado
     │
     ▼
revisar duplicados / vacíos / rango
     │
     ▼
autorizar SAP GUI Scripting
     │
     ▼
ejecutar sin operaciones concurrentes
     │
     ▼
registrar resultado por OT
     │
     ▼
validar estado final en SAP
```

## Evidencia de plantilla entregada

La guía fuente documenta una plantilla controlada donde:

- `C2` define la fila inicial;
- `C3` define la fila final;
- columna A marca los registros seleccionados;
- columna B contiene el identificador de OT;
- columna D registra el resultado devuelto por la ejecución.

Los identificadores reales no se reproducen en la versión pública.

Antes de ejecutar se valida que el rango contenga exactamente las filas previstas y que no existan filas vacías, duplicados ni registros marcados por error.

## Disciplina de ejecución

La automatización se inicia con SAP abierto y una plantilla autorizada. SAP GUI solicita confirmación cuando un script intenta acceder a la sesión.

Controles públicos reproducibles:

1. mantener la sesión SAP activa;
2. autorizar explícitamente SAP GUI Scripting cuando el sistema lo solicite;
3. no interrumpir el batch a mitad de ejecución;
4. evitar operaciones concurrentes en la misma sesión;
5. capturar resultado por registro, no únicamente un mensaje global.

## Interpretación del resultado

La evidencia fuente muestra un estado de procesamiento por fila y un resultado de ejecución satisfactorio por orden. En la versión pública se conserva la semántica, no los números reales:

```text
registro seleccionado
    │
    ▼
procesado por automatización
    │
    ▼
resultado satisfactorio / mensaje de error
    │
    ▼
validación independiente en SAP
```

Que la automatización termine no demuestra por sí sola que todas las órdenes hayan alcanzado el estado deseado.

## Validación posterior

Si una orden falla:

1. conservar el mensaje sanitizado;
2. volver a revisar elegibilidad;
3. confirmar estado/asignación actual;
4. diagnosticar antes de reintentar;
5. evitar reejecuciones masivas a ciegas.

## Limitación documentada

La guía fuente indica que la automatización no puede registrar una observación explicativa durante el cierre/anulación. La trazabilidad adicional debe conservarse mediante el mecanismo institucional autorizado.

## Límite de confidencialidad

No se publica:

- Excel/VBA original;
- números reales de OT;
- nombres de sistema/mandante;
- usuarios o empresas;
- rutas internas de automatización;
- capturas productivas sin sanitizar.

## Qué demuestra

- gobierno de procesamiento masivo;
- diseño de reglas de elegibilidad;
- validación preflight;
- conocimiento operativo de SAP GUI Scripting;
- control de errores por registro;
- validación post-ejecución;
- reducción de riesgo operativo;
- trazabilidad y disciplina de reintento.