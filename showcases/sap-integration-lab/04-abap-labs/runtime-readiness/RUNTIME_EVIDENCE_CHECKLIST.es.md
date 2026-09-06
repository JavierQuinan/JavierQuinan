# Checklist de Evidencia de Runtime

[English version](./RUNTIME_EVIDENCE_CHECKLIST.md)

> Qué capturar, y qué redactar, para la evidencia de runtime **nueva** de cada laboratorio. Aquí solo se pide evidencia nueva — ninguna captura histórica de los documentos fuente originales de 2025 debe reutilizarse ni referenciarse como si fuera actual. El estándar es técnicamente defendible, no pulido.

## Evidencia mínima por laboratorio (6 ítems)

1. **Nombre del objeto** — el nombre exacto de la clase tal como aparece en el Project Explorer de ADT (p. ej. `ZCL_LAB_01_VAR_FQ` o, para los labs 05/06/08, el nombre runtime-ready `ZCL_LAB_0X_..._RT_FQ`), visible en la misma captura que el ítem 3, o indicado en la nota adjunta si se recorta por separado.
2. **Source visible** — al menos una captura del editor de fuente de ADT mostrando el código real que se ejecutó (confirma que la evidencia corresponde a una versión específica y verificable de la clase).
3. **Éxito de activación** — el Project Explorer o la vista Problems mostrando 0 errores / un estado de activación en verde.
4. **Ejecución** — la acción de ejecutarlo (el lanzamiento de "Console Application", o simplemente la vista Console resultante si el lanzamiento en sí no es capturable por separado).
5. **Output** — el texto real del output de la Consola, completo para los laboratorios cortos (01–06, 08) o cubriendo todas las secciones numeradas para los más largos (07, 07a — una captura de scroll/compuesta es válida).
6. **Fecha/hora, si es útil** — una marca de tiempo (metadatos de la captura, o un reloj/fecha visible en el chrome del sistema operativo) que establezca *cuándo* ocurrió esta ejecución, para distinguirla de la ejecución histórica de 2025. No obligatorio si los propios metadatos del archivo ya llevan una fecha de captura.

## Checklist de sanitización (aplicar antes de guardar o compartir cualquier captura)

Comprobar cada ítem siguiente en cada captura antes de que salga de la máquina local:

- [ ] No es visible ningún nombre de usuario SAP (usuario de diálogo, usuario técnico, o el valor de `cl_abap_context_info=>get_user_technical_name( )`) — **esto aplica específicamente a la tabla de output `A01` del lab 07a**, cuya columna `iduser` incrusta el nombre técnico real del usuario en ejecución; recortar o tachar esa columna antes de guardar (ver `RUNTIME_EXECUTION_PLAN.es.md`, Lab 07a).
- [ ] No es visible ningún ID de sistema (p. ej. un SID de 3 caracteres en una barra de título o etiqueta de conexión).
- [ ] No es visible ningún identificador de tenant ni ID de subaccount.
- [ ] No es visible ningún nombre/región de subaccount de BTP.
- [ ] No es visible ninguna URL/hostname que apunte a un endpoint privado o de sistema trial (barras de direcciones del navegador, diálogos de propiedades de conexión de ADT, etc.).
- [ ] No aparece ninguna dirección de email real en ningún lugar del output capturado — solo deben aparecer los propios literales sintéticos `@example.invalid` o `@example.com` de la fixture/fuente histórico (ya son sintéticos por diseño; no sustituir por uno real al probar).
- [ ] No es visible ningún ID de cuenta, clave de licencia, ni identificador de suscripción.
- [ ] No es visible ningún número de solicitud de transporte, o si uno es visible, confirmar que no filtra por sí mismo un identificador de sistema/mandante más allá de un número de solicitud genérico.
- [ ] No es visible ninguna credencial, token, ni cadena de conexión de ningún tipo (este trabajo de captura de evidencia no está relacionado con el hallazgo de service-key de BTP rastreado por separado, pero aplica la misma disciplina).
- [ ] No es visible ningún endpoint privado (dirección de balanceador de carga interno, hostname de gateway on-premise, etc.).

Si algún ítem del checklist no puede satisfacerse solo recortando (p. ej. un banner de sistema que no puede eliminarse sin perder la evidencia real), no publicar esa captura — repetirla con el elemento problemático fuera de encuadre, o aceptar que la evidencia de ese laboratorio permanezca interna/sin publicar hasta que exista una captura limpia.

## Qué explícitamente no se requiere

- No se requiere que las capturas sean estéticamente limpias/pulidas — una captura simple y legible de la vista Console es suficiente.
- No se requiere capturar cada panel posible de ADT — solo los 6 ítems anteriores, por laboratorio.
- No se requiere capturar nada para un laboratorio que no se haya ejecutado realmente — una captura vacía o fabricada nunca es aceptable; si un laboratorio no se ha ejecutado, su estado permanece `NOT_REEXECUTED` (ver `RUNTIME_EXECUTION_PLAN.es.md`).

## A dónde va la evidencia una vez capturada

Este checklist no define por sí mismo una ubicación de almacenamiento ni un mecanismo de promoción — según la Fase 10 de esta tarea, ningún estado de laboratorio cambia de `PENDING`/`NOT_REEXECUTED` a `CURRENT_RUNTIME_VERIFIED` aquí ni en ningún lugar de esta revisión local. Una vez que el propietario de la cuenta aporte evidencia sanitizada para un laboratorio dado, ese laboratorio puede proponerse individualmente para promoción en un pase futuro — nunca en bloque, nunca sin la evidencia en mano.
