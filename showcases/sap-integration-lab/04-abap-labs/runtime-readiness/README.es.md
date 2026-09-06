# Preparación de Runtime — Laboratorios Históricos ABAP Cloud

[English version](./README.md)

> **Propósito:** preparar los 10 laboratorios históricos ABAP en [`../labs/`](../labs/README.es.md) para una ejecución actual y reproducible — sin alterar ningún fuente histórico y sin afirmar una reejecución que no ha ocurrido.

## Estado actual

- **Ejecución histórica:** 10/10 (documentada de forma privada, según la [Matriz de Evidencia](../EVIDENCE_MATRIX.es.md) principal).
- **Verificación de runtime actual:** 0/10 — sin cambios por este workspace.

## Qué contiene esta carpeta

| Documento | Cubre |
|---|---|
| [Matriz de Dependencias de Runtime](./RUNTIME_DEPENDENCY_MATRIX.es.md) | Cada dependencia de clase/tabla/tipo/símbolo de texto encontrada en los 10 fuentes históricos, por lectura estática |
| [Análisis de ZEMP_LOGALI](./ZEMP_LOGALI_ANALYSIS.es.md) | Análisis de uso de la tabla `ZEMP_LOGALI` específica del curso y el diseño del reemplazo sintético |
| [Mapeo de Variantes de Runtime](./RUNTIME_VARIANT_MAPPING.es.md) | Mapea cada laboratorio histórico con su variante runtime-ready (solo donde existe una), con el razonamiento de longitud de nomenclatura |
| [Decisión sobre TEXT-001 del Lab 04](./LAB04_TEXT_ELEMENT_DECISION.es.md) | Por qué se mantiene `TEXT-001`, y los pasos exactos en ADT para crearlo |
| [Comprobación de Dependencias DMO](./DMO_DEPENDENCY_CHECK.es.md) | Cada objeto `/DMO/*` referenciado, disponibilidad `UNKNOWN` hasta comprobarse en vivo |
| [Compatibilidad con ABAP Cloud](./ABAP_CLOUD_COMPATIBILITY.es.md) | Clasificación de compatibilidad por fuente, sin afirmaciones no ganadas |
| [Plan de Ejecución de Runtime](./RUNTIME_EXECUTION_PLAN.es.md) | Plan de ejecución paso a paso para los 10 laboratorios, en el orden recomendado |
| [Guía de Ejecución con ADT](./ADT_EXECUTION_GUIDE.es.md) | Instrucciones prácticas de ADT/Eclipse — paquete, activación, errores de sintaxis, captura de evidencia |
| [Checklist de Evidencia de Runtime](./RUNTIME_EVIDENCE_CHECKLIST.es.md) | Qué evidencia nueva capturar por laboratorio, y el checklist de sanitización a aplicar antes de publicarla |

## Variantes runtime-ready

Solo 3 de los 10 laboratorios históricos necesitaron una variante de código para eliminar un bloqueo de reproducibilidad (todos los demás ya están libres de dependencia o solo bloqueados por un paso de configuración que no es código — ver la Matriz de Dependencias):

| Histórica | Runtime-ready | Estado |
|---|---|---|
| `zcl_lab_05_invoice_fq` | [`source/zcl_lab_05_invoice_rt_fq.abap`](./source/zcl_lab_05_invoice_rt_fq.abap) | `RUNTIME_READY_DRAFT` / `NEEDS_ADT_VERIFICATION` |
| `zcl_lab_06_condition_fq` | [`source/zcl_lab_06_condition_rt_fq.abap`](./source/zcl_lab_06_condition_rt_fq.abap) | `RUNTIME_READY_DRAFT` / `NEEDS_ADT_VERIFICATION` |
| `zcl_lab_08_fieldsymbols_fq` | [`source/zcl_lab_08_fieldsymbols_rt_fq.abap`](./source/zcl_lab_08_fieldsymbols_rt_fq.abap) | `RUNTIME_READY_DRAFT` / `NEEDS_ADT_VERIFICATION` |

Ninguna de estas tres ha sido activada ni ejecutada en ningún sistema ABAP todavía. **Son borradores pendientes de verificación en ADT, no código verificado.**

## Soporte sintético

[`source/zcl_employee_fixture_fq.abap`](./source/zcl_employee_fixture_fq.abap) — una clase propia y original que provee datos sintéticos de tipo empleado en memoria, reemplazando la tabla `ZEMP_LOGALI` específica del curso para las tres variantes runtime-ready anteriores. Usa únicamente sus propios `TYPES`, literales `VALUE #( )`, y direcciones reservadas `example.invalid`. Ver [Análisis de ZEMP_LOGALI](./ZEMP_LOGALI_ANALYSIS.es.md) para el razonamiento completo del diseño — no se reproduce ningún contenido, estructura ni nomenclatura de Logali Group.

## Fuente histórico vs. fuente runtime-ready

**No son lo mismo.** Los 10 archivos en [`../labs/source/`](../labs/README.es.md) son los envíos históricos, sin cambios byte a byte, con su propia evidencia de ejecución de 2025. Los 4 archivos en [`source/`](./source/) aquí son borradores nuevos, originales, no ejecutados, escritos específicamente para eliminar el bloqueo de reproducibilidad de `ZEMP_LOGALI`. Nada en `../labs/source/` fue modificado para producir esta carpeta.

## Comprobaciones externas pendientes

- Disponibilidad de `/DMO/*` en el sistema destino — `AVAILABILITY = UNKNOWN` para todos los objetos (ver [Comprobación de Dependencias DMO](./DMO_DEPENDENCY_CHECK.es.md)).
- Decisión y creación de `TEXT-001` en ADT — documentada pero no ejecutada (ver [Decisión sobre TEXT-001 del Lab 04](./LAB04_TEXT_ELEMENT_DECISION.es.md)).
- Activación y ejecución en ADT de los 10 laboratorios históricos más las 3 variantes runtime-ready — aún no realizada (ver [Plan de Ejecución de Runtime](./RUNTIME_EXECUTION_PLAN.es.md)).

No se afirma nada más allá de lo anterior en ningún lugar de esta carpeta.
