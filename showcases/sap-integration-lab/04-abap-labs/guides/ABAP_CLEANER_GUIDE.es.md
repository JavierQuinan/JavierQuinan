# Guía de ABAP Cleaner

[English version](./ABAP_CLEANER_GUIDE.md)

## Estado

`TRAINING_DERIVED_GUIDE` — redactada de forma independiente a partir de formación de terceros completada. Este track no afirma todavía una ejecución real de ABAP Cleaner.

## Alcance

Cómo utilizar ABAP Cleaner como apoyo de limpieza/refactor de código manteniendo separada la verificación de comportamiento.

## Flujo

1. Elegir o definir un perfil de reglas.
2. Ejecutar la herramienta sobre un alcance pequeño y revisable.
3. Revisar el diff generado en lugar de aceptar una reescritura masiva.
4. Aplicar únicamente las transformaciones previstas.
5. Activar los objetos ABAP afectados.
6. Volver a ejecutar tests y checks ATC relevantes.

## Ilustración

Ejemplo manual simple de transformación de estilo:

```abap
" Antes
DATA mv_purchase_date TYPE d.
mv_purchase_date = cl_abap_context_info=>get_system_date( ).

" Después
DATA(mv_purchase_date) = cl_abap_context_info=>get_system_date( ).
```

Este ejemplo **no** fue producido ejecutando ABAP Cleaner; solo ilustra el tipo de limpieza que una regla configurada puede realizar.

## Verificación

No existe evidencia de ejecución real de ABAP Cleaner en este track.

## Fallos comunes

- Aplicar un perfil grande a todo el código antes de probarlo en un alcance pequeño.
- Mezclar cambios de formato con cambios funcionales en la misma revisión.
- Asumir que código más limpio implica automáticamente cumplimiento Clean Core.

## Seguridad y Clean Core

ABAP Cleaner modifica principalmente la forma/estilo del source. Seguridad y cumplimiento de APIs liberadas siguen requiriendo revisión, tests y checks ATC adecuados.

## Procedencia

Concepto estudiado durante formación de terceros. La guía y la ilustración se redactaron de forma independiente usando ejemplos propios de este portfolio; no se reproduce material del curso.

## Estado de evidencia

`TRAINING_ONLY_IN_THIS_TRACK`. Consulta el [Roadmap de Laboratorios Futuros](../docs/FUTURE_LAB_ROADMAP.es.md).
