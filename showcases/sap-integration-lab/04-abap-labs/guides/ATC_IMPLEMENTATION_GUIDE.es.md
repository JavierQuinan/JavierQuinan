# Guía de Implementación ATC

[English version](./ATC_IMPLEMENTATION_GUIDE.md)

## Estado

`TRAINING_DERIVED_GUIDE` — redactada de forma independiente a partir de formación de terceros completada. Todavía no se afirma ningún resultado ATC en este track.

## Alcance

Cómo utilizar ABAP Test Cockpit (ATC) como gate de análisis estático y gobierno. Los checks exactos dependen de la versión ABAP, el modelo de extensibilidad y la variante elegida.

## Conceptos principales

- **Check variant:** colección seleccionada de checks.
- **Finding:** hallazgo producido sobre un objeto de repositorio.
- **Exemption:** aceptación revisada de un hallazgo específico cuando el proceso lo permite.
- **Scope:** objeto, paquete, alcance relacionado con transporte o análisis central, según el landscape.
- **Checks de APIs liberadas:** ATC/Code Inspector puede detectar uso de APIs u objetos no liberados para el contexto de lenguaje/extensibilidad elegido.

## Procedimiento

1. Identificar entorno objetivo y propósito: sintaxis/calidad, seguridad, performance, cloud readiness, uso de APIs liberadas, etc.
2. Elegir una variante adecuada; no asumir que una sola variante aplica a todo modelo de extensibilidad.
3. Ejecutar ATC sobre el objeto/paquete previsto.
4. Revisar cada finding en ADT y corregir el source cuando corresponda.
5. Usar exemptions únicamente con justificación y gobierno.
6. Reejecutar ATC y registrar el resultado real antes de afirmar un gate limpio.

## Verificación

Todavía no ejecutado sobre estos 10 labs. No se publica conteo de findings ni captura.

## Clean Core

ATC es uno de los mecanismos estándar de SAP para comprobar reglas como uso de APIs liberadas. La conclusión Clean Core depende de los checks y del modelo de extensibilidad; un simple "ATC green" no basta sin indicar variante/contexto.

## Fallos comunes

- Ejecutar una variante irrelevante o demasiado débil y tratar el resultado limpio como cumplimiento general.
- Publicar un resultado obsoleto después de cambios.
- Tratar todos los findings como eximibles.
- Confundir findings de estilo con findings de APIs liberadas/upgrade readiness.

## Procedencia

Concepto estudiado durante formación de terceros. La guía fue redactada de forma independiente para portfolio.

## Estado de evidencia

`TRAINING_ONLY_IN_THIS_TRACK`. Consulta el [Roadmap de Laboratorios Futuros](../docs/FUTURE_LAB_ROADMAP.es.md).

## Referencia oficial

- SAP Help — Released APIs y checks ATC: https://help.sap.com/docs/SAP_NETWEAVER_AS_ABAP_751_IP/c238d694b825421f940829321ffa326a/c479660d07374c15a1a5fe83fdbb1337.html
