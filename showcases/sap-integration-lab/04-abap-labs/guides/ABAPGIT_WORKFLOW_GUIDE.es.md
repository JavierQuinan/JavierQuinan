# Guía de Flujo de Trabajo con abapGit

[English version](./ABAPGIT_WORKFLOW_GUIDE.md)

## Estado

`TRAINING_DERIVED_GUIDE` — redactada de forma independiente a partir de conceptos cubiertos en formación de terceros documentada mediante una credencial de finalización. Este track todavía no afirma evidencia hands-on de abapGit.

## Alcance

Flujo práctico para colocar objetos de repositorio ABAP bajo control de versiones Git mediante abapGit. Es una guía de proceso, no un laboratorio runtime.

## Conceptos principales

- Un repositorio vincula contenido de un paquete ABAP con un repositorio Git.
- Los repositorios online se comunican con una URL Git remota; los offline permiten intercambio mediante ZIP sin remoto activo.
- Los objetos ABAP se serializan en archivos que pueden revisarse como cambios Git.
- Staging permite seleccionar qué objetos modificados entran antes de commit/push.
- abapGit complementa, pero no sustituye automáticamente, los procesos gobernados de transportes/cambios.

## Procedimiento

1. Preparar un paquete de desarrollo dedicado al repositorio.
2. Abrir abapGit y crear/vincular un repositorio online con la URL y branch correctos.
3. Hacer pull para instalar/sincronizar el contenido dentro del paquete ABAP.
4. Desarrollar y activar objetos ABAP en ADT.
5. Revisar los cambios en la vista de staging.
6. Seleccionar únicamente los cambios previstos, escribir un commit claro y hacer push al remoto.
7. Usar branches y pull requests Git para revisión colaborativa.
8. Antes de cambiar branch/remoto, verificar URL y branch para evitar publicar en un repositorio equivocado.

## Verificación

No ejecutado en este track histórico. Todavía no se publica evidencia propia de staging/push con abapGit.

## Fallos comunes

- URL remota o branch incorrectos.
- Vincular el repositorio a un paquete con objetos no relacionados.
- Tratar metadata serializada como si fuera código de aplicación para editar manualmente durante conflictos.
- Asumir que Git sustituye el gobierno de transportes SAP.

## Seguridad

Credenciales Git, tokens o material SSH deben quedar fuera del source control. Los permisos del repositorio deben seguir least privilege.

## Clean Core

abapGit es tooling de versionado. Clean Core depende de los objetos y APIs utilizados, no de que el código esté almacenado en Git.

## Procedencia

Concepto estudiado durante formación de terceros. La guía fue redactada de forma independiente para portfolio y no reproduce capturas, ejercicios ni prosa propietaria del curso.

## Estado de evidencia

`OWNER_CONFIRMED_HANDS_ON_EXECUTION` — ver las [Prácticas de Formación de Curso 3](../training-practices/README.es.md) para el source normalizado `_fq` y la procedencia exacta.

## Referencia

- Documentación abapGit: https://docs.abapgit.org/
