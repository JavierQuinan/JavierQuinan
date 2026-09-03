# SAP ECC IS-U / GIS — Monitoreo y Reproceso de CUEN

[English version](./README.md)

> **Tipo de evidencia:** soporte operativo sanitizado de integración GIS → SAP  
> **Objetos observados:** monitor de CUEN · tabla técnica de interfaz · reproceso de novedades

Esta evidencia documenta el control diario de CUEN pendientes, bloqueados o respondidos por GIS con error, y el reproceso controlado de los casos que cumplen condiciones de tratamiento.

La versión pública mantiene el razonamiento operativo y la secuencia de diagnóstico, pero no publica sociedades, divisiones, CUEN, órdenes, ID de novedad, direcciones, nombres, teléfonos, códigos internos ni datos de empresas eléctricas.

## Flujo demostrado

```text
monitor de creación de CUEN
        │
        ▼
clasificar resultado / mensaje
        │
        ├── error funcional o de datos → corregir origen antes de reprocesar
        │
        └── caso reprocesable
                 │
                 ▼
consulta técnica por CUEN
                 │
                 ▼
obtener ID de novedad
                 │
                 ▼
interfaz GIS → SAP
                 │
                 ▼
procesar registros
                 │
                 ▼
validar estado final + mensaje
```

## Clasificación previa

El procedimiento distingue entre:

- registros con error funcional o de datos, que no deben reprocesarse ciegamente;
- registros sin mensaje que requieren reproceso;
- registros bloqueados por usuario, que solo deben continuar una vez liberado el bloqueo.

Este gate evita convertir el reproceso en una acción automática indiscriminada.

## Consulta técnica

La fuente operativa utiliza una tabla técnica de interfaz para localizar el identificador de novedad correspondiente a cada CUEN. La evidencia pública conserva la relación conceptual:

```text
CUEN → registro técnico de interfaz → ID de novedad
```

Los nombres `Z*` se mantienen únicamente cuando forman parte de la evidencia entregada y sirven para explicar el troubleshooting; no se publica código ABAP propietario ni estructura completa de tablas corporativas.

## Reproceso GIS → SAP

Con los identificadores obtenidos, la interfaz permite recuperar los registros correspondientes y ejecutar el reproceso de manera acotada.

Controles:

1. cargar únicamente IDs previamente validados;
2. evitar restricciones temporales que oculten el registro cuando el procedimiento exige consultar por identificador;
3. revisar los registros recuperados antes de procesar;
4. esperar la finalización completa;
5. validar estado y mensaje por registro.

## Criterio de cierre

Un CUEN se considera correctamente tratado cuando el estado de proceso queda completado y el mensaje confirma ejecución satisfactoria.

Si persiste un error, se conserva de forma controlada:

- identificador sanitizado del caso;
- ID de novedad sanitizado;
- mensaje técnico/funcional sanitizado;
- evidencia necesaria para escalamiento.

## Qué demuestra

- soporte de integración GIS ↔ SAP IS-U;
- clasificación de errores antes de reproceso;
- consulta técnica read-only;
- trazabilidad CUEN → novedad;
- ejecución masiva acotada;
- validación posterior por registro;
- disciplina de escalamiento de interfaces.

## Límite de confidencialidad

No se publican datos de clientes, CUEN, órdenes, sociedades, divisiones, direcciones, identificadores de novedad, usuarios, mandantes ni resultados productivos completos.