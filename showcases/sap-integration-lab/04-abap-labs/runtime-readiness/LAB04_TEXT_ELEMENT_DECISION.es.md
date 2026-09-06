# Lab 04 — Decisión sobre TEXT-001

[English version](./LAB04_TEXT_ELEMENT_DECISION.md)

## A. ¿Debe mantenerse TEXT-001 como elemento de texto?

**Sí — se mantiene, no se crea variante de código.**

## B. ¿Sería mejor sustituirlo en una variante runtime-ready?

**No.** `zcl_lab_04_message_fq` **no necesita ninguna variante de código runtime-ready.** A diferencia de `ZEMP_LOGALI`, `TEXT-001` no es un objeto faltante del que dependa el código — es un atributo estándar de clase ABAP (la pestaña "Text Elements" en ADT/SE24) que existe en toda clase y simplemente necesita que su símbolo `001` se mantenga con cualquier cadena corta. Es una acción de configuración de ADT de una sola vez, idéntica en cualquier sistema destino, no una brecha de reproducibilidad del código en sí.

## C. ¿Qué demuestra realmente el ejercicio?

El propósito declarado del Lab 04 (según su propio comentario de cabecera y la sección `[1]`) es específicamente demostrar **los símbolos de text-pool de ABAP** como característica del lenguaje, antes de pasar a funciones de descripción de strings (`STRLEN`, `NUMOFCHAR`, `COUNT`, `FIND`), funciones de conversión de mayúsculas/minúsculas, y validación con regex. `out->write( |{ TEXT-001 }| )` es la sección `[1]` de la clase — es el tema deliberado que se está enseñando, no un andamiaje incidental.

## ¿Por qué no reemplazarlo por un literal?

Reemplazar `{ TEXT-001 }` por una cadena literal fija (p. ej. `'Algún texto'`) haría que la clase compilara sin ningún paso de configuración en ADT, pero **eliminaría la única evidencia en todo el conjunto de 10 laboratorios de que alguna vez se usaron símbolos de text-pool** — destruyendo exactamente el punto técnico que el laboratorio existe para demostrar. Según la instrucción rectora ("no cambies código solo para que compile si destruye el objetivo técnico"), esto no se hace. `TEXT-001` permanece tanto en el fuente histórico como en cualquier ejecución futura de este — no existe un archivo runtime-ready separado para lab-04.

## Si se mantiene: pasos exactos para crear TEXT-001 en ADT

1. Abrir `zcl_lab_04_message_fq` en ADT (crear/importar primero la clase si aún no existe en el sistema destino — ver `ADT_EXECUTION_GUIDE.es.md`).
2. En el editor de la clase, abrir la pestaña **"Text Elements"** (en la franja de pestañas inferior, junto a "Source Code", cerca de donde aparecerían las clases de test locales).
3. En la sub-pestaña **"Text Symbols"**, añadir una fila nueva:
   - **Symbol:** `001`
   - **Text:** cualquier etiqueta corta es suficiente para el propósito del ejercicio — p. ej. `Símbolos de texto` (coincidiendo con el encabezado de sección ya impreso justo antes) o `Text symbol demo`. El texto exacto no es técnicamente significativo; lo que importa es que el símbolo exista y esté activado.
   - **Length:** dejar el valor por defecto que calcula ADT para el texto introducido.
4. Guardar y activar el sub-objeto Text Elements (esto se activa de forma independiente a — pero es requisito previo para — que la activación de la clase en sí tenga éxito, ya que el fuente de la clase referencia `TEXT-001` directamente).
5. Activar la propia clase (`Ctrl+F3` o el botón Activate de la barra de herramientas en ADT).
6. Si la activación sigue reportando un error del tipo "símbolo de texto no encontrado", volver a comprobar que el paso 3 se guardó bajo el símbolo `001` específicamente (no `1` ni `TEXT001`) y que el sub-objeto Text Elements aparece activado (verde) en el Project Explorer.

No se requiere ningún otro cambio de código en `zcl_lab_04_message_fq` para que se ejecute una vez exista `TEXT-001`.

## Estado

- `zcl_lab_04_message_fq`: sin cambios, no existe ni está planificada ninguna variante de código.
- Factor bloqueante: `TEXT-001` faltante (un paso de configuración de ADT, no un defecto de código) — ver `RUNTIME_DEPENDENCY_MATRIX.es.md`.
- Acción recomendada antes de reejecutar este laboratorio: realizar los pasos 1–5 anteriores en el sistema ABAP Cloud destino, y luego seguir `RUNTIME_EXECUTION_PLAN.es.md` / `ADT_EXECUTION_GUIDE.es.md` para el resto de la ejecución.
