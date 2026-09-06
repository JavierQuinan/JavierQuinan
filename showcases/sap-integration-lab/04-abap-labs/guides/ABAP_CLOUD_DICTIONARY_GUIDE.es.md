# Guía de ABAP Cloud Dictionary

[English version](./ABAP_CLOUD_DICTIONARY_GUIDE.md)

## Estado

`TRAINING_DERIVED_GUIDE` — redactada de forma independiente a partir de formación de terceros completada. En este conjunto histórico no se afirma haber creado o activado objetos DDIC propios.

## Alcance

Resumen conceptual de dominios, elementos de datos, tablas de base de datos, estructuras, objetos de bloqueo y relaciones entre tablas, indicando explícitamente las diferencias relevantes de ABAP Cloud.

## Conceptos principales

- **Dominio:** definición técnica de valores como tipo, longitud, decimales y valores fijos opcionales.
- **Elemento de datos:** información semántica reutilizable construida sobre un dominio o tipo built-in.
- **Tabla de base de datos:** objeto persistente con campos y clave.
- **Estructura:** tipo estructurado reutilizable sin persistencia.
- **Relación de clave foránea:** metadata de relación entre campos/tablas; sus efectos exactos dependen de la tecnología consumidora.
- **Objeto de bloqueo:** objeto de repositorio que define parámetros de bloqueo lógico para el mecanismo enqueue de SAP.

## Bloqueo: ABAP clásico vs. ABAP Cloud

Al activar un lock object se generan módulos `ENQUEUE_*` / `DEQUEUE_*` en ABAP clásico. En developer extensibility con ABAP Cloud, el uso directo de esos módulos generados no está permitido; SAP documenta la API genérica basada en `CL_ABAP_LOCK_OBJECT_FACTORY` / `IF_ABAP_LOCK_OBJECT` para los escenarios soportados.

Esta diferencia es importante: una guía etiquetada como "ABAP Cloud" no debe indicar llamadas directas a los módulos enqueue/dequeue generados.

## Diseño ilustrativo — no construido

| Objeto | Nombre de ejemplo | Propósito |
|---|---|---|
| Dominio | `ZDO_ORDER_STATUS_FQ` | Estado de orden de dos caracteres |
| Elemento de datos | `ZDE_ORDER_STATUS_FQ` | Tipo semántico de estado |
| Tabla | `ZTORDER_FQ` | Persistencia sintética de orden de servicio |
| Lock object | `EZTORDER_FQ` | Definición de bloqueo lógico por clave de orden |

Son ejemplos de diseño únicamente. No se afirma que estos objetos hayan sido creados o activados.

## Procedimiento para un lab futuro

1. Crear los objetos de tipo/dominio necesarios.
2. Crear una tabla de persistencia sintética pequeña con datos seguros.
3. Activar y verificar la definición.
4. Añadir un lock object solo si el escenario requiere protección de concurrencia.
5. En una implementación compatible con ABAP Cloud, utilizar la API genérica soportada y no llamadas directas a módulos generados.
6. Añadir evidencia runtime actual y, cuando tenga sentido, ABAP Unit sobre la lógica de servicio.

## Fallos comunes

- Cambiar un tipo persistido sin considerar datos existentes.
- Tratar buffering/cache como solución universal de performance.
- Asumir que una relación DDIC implementa por sí sola reglas de autorización.
- Mezclar patrones clásicos de enqueue con código presentado como ABAP Cloud.

## Clean Core

La persistencia puede quedar privada dentro del paquete propietario mientras los consumidores utilizan superficies API/servicio liberadas. El acceso directo a tablas entre componentes no relacionados no debe presentarse como frontera Clean Core.

## Procedencia

Los conceptos fueron estudiados durante formación de terceros. La redacción, estructura y diseño ilustrativo se crearon de forma independiente para este portfolio.

## Estado de evidencia

`TRAINING_ONLY_IN_THIS_TRACK`. Consulta el [Análisis de Gaps](../docs/GAP_ANALYSIS.es.md).

## Referencia oficial

- SAP Help — Lock Objects / developer extensibility: https://help.sap.com/docs/SAP_S4HANA_CLOUD/6aa39f1ac05441e5a23f484f31e477e7/06d03eda843643b7a64acfb67edf521b.html
