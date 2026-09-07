# Matriz de Evidencia — Prácticas de Formación Curso 2/3

[English version](./EVIDENCE_MATRIX.md)

> **Regla de alcance:** esta matriz describe solo el material en `training-practices/`, un conjunto de candidatos separado de los 10 laboratorios históricos en [`../labs/`](../labs/README.es.md). No cambia ningún estado en [`../EVIDENCE_MATRIX.es.md`](../EVIDENCE_MATRIX.es.md).

## Prácticas de Curso 3

| Práctica | Formación | Ejecución hands-on | Artefacto de fuente guardado | Normalizado para portfolio | Verificación de runtime actual | Estado |
|---|---|---|---|---|---|---|
| abapGit (`zcl_c3_01_projects_fq`) | SÍ | SÍ (confirmado por el propietario) | SÍ (normalizado) | SÍ | NO | `USER_AUTHORED_PRACTICE` / `NORMALIZED_NOT_EXECUTED` |
| ATC (`zcl_c3_02_atc_demo_fq`) | SÍ | SÍ (confirmado por el propietario) | SÍ (normalizado) | SÍ | NO | `USER_AUTHORED_PRACTICE` / `NORMALIZED_NOT_EXECUTED` |
| ABAP Cleaner (`zcl_c3_03_cleaner_demo_fq`) | SÍ | SÍ (confirmado por el propietario) | SÍ (normalizado) | SÍ | NO | `USER_AUTHORED_PRACTICE` / `NORMALIZED_NOT_EXECUTED` |
| Autorizaciones (`zcl_c3_04_dept_auth_fq`) | SÍ | SÍ (confirmado por el propietario) | SÍ (normalizado) | SÍ | NO | `USER_AUTHORED_PRACTICE` / `NORMALIZED_NOT_EXECUTED` |

"Ejecución hands-on: confirmado por el propietario" significa que el propietario confirmó explícitamente haber tecleado, creado, y ejecutado personalmente cada ejercicio original en su propio entorno trial de SAP. No sobrevivió ningún artefacto independiente (una captura propia, una exportación propia de herramienta) más allá de esa confirmación — ver la página propia de cada práctica en `docs/` para la redacción de procedencia precisa usada.

## Curso 2

| Área | Formación | Práctica hands-on | Artefacto de fuente guardado | Verificación de runtime actual | Estado |
|---|---|---|---|---|---|
| ABAP Dictionary (tablas, objetos de bloqueo, ajustes de persistencia, relaciones de tablas) | SÍ | SÍ | NO | NO | `TRAINING_ONLY` |

No se encontró ningún fuente ABAP, texto de objeto DDIC, ni documento con código para Curso 2 más allá del material de tutorial genérico propio del instructor. Esto se revela explícitamente en lugar de representarse con una fila vacía o inventada.

## Leyenda de estados

- `USER_AUTHORED_PRACTICE`: el propio acto hands-on del propietario de teclear/crear/ejecutar el ejercicio original, distinto de la propia plantilla de ejercicio de autoría del instructor.
- `NORMALIZED_NOT_EXECUTED`: el fuente normalizado para portfolio existe y aún no ha sido reactivado ni reejecutado.
- `NEEDS_ADT_VERIFICATION`: se requiere reejecución en un sistema ABAP Cloud real antes de cualquier afirmación de runtime actual.
- `TRAINING_ONLY`: estudiado y, según los propios registros de formación del propietario, practicado, pero no sobrevivió ningún artefacto de fuente de ningún tipo para normalizar o publicar.

## Relación con el track histórico principal

Este es un conjunto de candidatos separado, de un curso distinto. No cambia:

- Laboratorios históricos (Curso 1, publicados): **10**
- Evidencia de ejecución histórica: **10/10**
- Verificación de runtime actual (laboratorios históricos): **0/10**
- Verificación de runtime actual (estas 4 prácticas nuevas): **0/4**
