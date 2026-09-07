# Guía de ABAP Cloud Dictionary

[English version](./ABAP_CLOUD_DICTIONARY_GUIDE.md)

## Estado

`TRAINING_DERIVED_GUIDE` + `OWNER_CONFIRMED_HANDS_ON_EXECUTION` — redactada de forma independiente a partir de la formación completada de Curso 2. El propietario confirma que los ejercicios DDIC se realizaron hands-on en ADT; no se publica un artefacto de source guardado porque no se conservó uno.

## Alcance

Curso 2 cubrió dominios, elementos de datos, tablas de base de datos, estructuras, objetos de bloqueo, ajustes de persistencia, relaciones entre tablas y Dynamic Cache. Esta guía registra esos temas de formación completados sin fabricar objetos de repositorio ni archivos fuente.

## Conceptos principales

- **Dominio:** definición técnica de valores como tipo, longitud, decimales y valores fijos opcionales.
- **Elemento de datos:** información semántica reutilizable construida sobre un dominio o tipo built-in.
- **Tabla de base de datos:** objeto persistente con campos y clave.
- **Estructura:** tipo estructurado reutilizable sin persistencia.
- **Relación de clave foránea:** metadata de relación entre campos/tablas; sus efectos exactos dependen de la tecnología consumidora.
- **Objeto de bloqueo:** objeto de repositorio que define parámetros de bloqueo lógico para el mecanismo enqueue de SAP.
- **Ajuste de persistencia:** tratamiento controlado de cambios Dictionary que afectan estructuras persistidas.
- **Dynamic Cache:** tema de formación relacionado con comportamiento de caché/buffering y sus implicaciones técnicas.

## Bloqueo: ABAP clásico vs. ABAP Cloud

Al activar un lock object se generan módulos `ENQUEUE_*` / `DEQUEUE_*` en ABAP clásico. En developer extensibility con ABAP Cloud, el uso directo de esos módulos generados no está permitido; SAP documenta la API genérica basada en `CL_ABAP_LOCK_OBJECT_FACTORY` / `IF_ABAP_LOCK_OBJECT` para escenarios soportados.

Esta diferencia se conserva como guía técnica; no se presenta como evidencia de una implementación de lock object publicada por separado.

## Fallos comunes

- Cambiar un tipo persistido sin considerar datos existentes.
- Tratar buffering/cache como solución universal de performance.
- Asumir que una relación DDIC implementa automáticamente reglas de autorización de negocio.
- Mezclar patrones clásicos de enqueue con código presentado como ABAP Cloud.

## Límite Clean Core

La persistencia puede quedar privada dentro del paquete propietario mientras los consumidores utilizan superficies API/servicio liberadas. El acceso directo a tablas entre componentes no relacionados no se presenta aquí como frontera de integración Clean Core.

## Procedencia y estado de evidencia

El contexto formativo está respaldado por la credencial completada `SAP ABAP Cloud - Diccionario de datos`. La ejecución hands-on está confirmada por el propietario. No se republica ningún `.abap`, export DDIC ni material del instructor de Curso 2, y no se fabrica ningún objeto DDIC sintético para cubrir esa ausencia.

## Referencia oficial

- SAP Help — Lock Objects / developer extensibility: https://help.sap.com/docs/SAP_S4HANA_CLOUD/6aa39f1ac05441e5a23f484f31e477e7/06d03eda843643b7a64acfb67edf521b.html
