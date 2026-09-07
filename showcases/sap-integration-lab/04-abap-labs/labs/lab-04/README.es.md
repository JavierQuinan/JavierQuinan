# Lab 04 — Procesamiento de Campos de Texto

[English version](./README.md)

## Estado

`HISTORICAL_EXECUTION_VERIFIED`

## Procedencia

Curso 1 (Logali Group), Unidad 5 — "Procesamiento Campos de Texto." Entrega personal en Word (`Procesamiento Campos de Texto.docx`), autoría confirmada vía `docProps/core.xml`. La captura embebida es la propia captura de Eclipse ADT del propietario.

## Objeto

[`ZCL_LAB_04_MESSAGE_FQ`](../source/zcl_lab_04_message_fq.abap)

## Qué demuestra esto

Un símbolo de text-pool de ABAP (`TEXT-001`), funciones de descripción de strings (`STRLEN`/`NUMOFCHAR`/`COUNT`/`FIND`), funciones de conversión de mayúsculas/minúsculas, y validación con regex (`contains( regex = )`), ejecutado como una clase de consola ABAP Cloud. Reproducir esta clase requiere recrear `TEXT-001` en la pestaña Text Elements de la clase — ver la [referencia opcional de runtime-readiness](../../runtime-readiness/LAB04_TEXT_ELEMENT_DECISION.es.md) para los pasos exactos.

## Evidencia

![Salida de consola de Eclipse ADT para zcl_lab_04_message_fq](./assets/01-eclipse-adt-project-explorer-and-console.png)

Source y salida de consola de Eclipse ADT. Las líneas de validación regex imprimen "inválido" para las cadenas placeholder literales ya presentes en el fuente histórico (`'Agregar cualquier teléfono'` / `'Agregar cualquier correo'`) — es el propio contenido literal del fuente, no un teléfono o email real.

## Sanitización

Una redacción aplicada: el nodo raíz de conexión del Project Explorer (identificador privado de cuenta trial de BTP). El resto del contenido, incluyendo la salida de consola, no fue modificado.
