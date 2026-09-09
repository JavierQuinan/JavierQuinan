# Matriz de Evidencia — Prácticas de Formación Curso 2/3

[English version](./EVIDENCE_MATRIX.md)

> **Regla de alcance:** esta matriz describe solo el material en `training-practices/`, un conjunto de candidatos separado de los 10 laboratorios históricos en [`../labs/`](../labs/README.es.md). No cambia ningún estado en [`../EVIDENCE_MATRIX.es.md`](../EVIDENCE_MATRIX.es.md).

## Prácticas de Curso 3

| Práctica | Formación | Ejecución hands-on | Artefacto de fuente guardado | Normalizado para portfolio | Claim de runtime actual | Estado |
|---|---|---|---|---|---|---|
| abapGit (`zcl_c3_01_projects_fq`) | SÍ | OWNER_CONFIRMED_HANDS_ON_EXECUTION | SÍ (normalizado) | SÍ | NO_CURRENT_RUNTIME_CLAIM | `USER_AUTHORED_PRACTICE` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` |
| ATC (`zcl_c3_02_atc_demo_fq`) | SÍ | OWNER_CONFIRMED_HANDS_ON_EXECUTION | SÍ (normalizado) | SÍ | NO_CURRENT_RUNTIME_CLAIM | `USER_AUTHORED_PRACTICE` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` |
| ABAP Cleaner (`zcl_c3_03_cleaner_demo_fq`) | SÍ | OWNER_CONFIRMED_HANDS_ON_EXECUTION | SÍ (normalizado) | SÍ | NO_CURRENT_RUNTIME_CLAIM | `USER_AUTHORED_PRACTICE` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` |
| Autorizaciones (`zcl_c3_04_dept_auth_fq`) | SÍ | OWNER_CONFIRMED_HANDS_ON_EXECUTION | SÍ (normalizado) | SÍ | NO_CURRENT_RUNTIME_CLAIM | `USER_AUTHORED_PRACTICE` / `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE` |

"Ejecución hands-on: OWNER_CONFIRMED_HANDS_ON_EXECUTION" significa que el propietario confirmó explícitamente haber tecleado, creado, y ejecutado personalmente cada ejercicio original en su propio entorno trial de SAP. No sobrevivió ningún artefacto independiente (una captura propia, una exportación propia de herramienta) más allá de esa confirmación — ver la página propia de cada práctica en `docs/` para la redacción de procedencia precisa usada. `NO_CURRENT_RUNTIME_CLAIM` aplica específicamente a la copia de portfolio renombrada: no ha sido reejecutada de forma independiente tras la normalización; la práctica de formación subyacente fue ejecutada previamente por el propietario.

## Curso 2

| Área | Formación | Práctica hands-on | Artefacto de fuente guardado | Claim de runtime actual | Estado |
|---|---|---|---|---|---|
| ABAP Dictionary (tablas, objetos de bloqueo, ajustes de persistencia, relaciones de tablas) | SÍ | OWNER_CONFIRMED_HANDS_ON_EXECUTION | NO | NO_CURRENT_RUNTIME_CLAIM | `TRAINING_ONLY` / `NO_SAVED_SOURCE_ARTIFACT` |

No se encontró ningún fuente ABAP, texto de objeto DDIC, ni documento con código para Curso 2 más allá del material de tutorial genérico propio del instructor. Esto se revela explícitamente en lugar de representarse con una fila vacía o inventada.

## Leyenda de estados

- `USER_AUTHORED_PRACTICE`: el propio acto hands-on del propietario de teclear/crear/ejecutar el ejercicio original, distinto de la propia plantilla de ejercicio de autoría del instructor.
- `OWNER_CONFIRMED_HANDS_ON_EXECUTION`: el propietario confirma directamente esta ejecución; no sobrevivió ningún artefacto independiente más allá de esa confirmación.
- `PORTFOLIO_NORMALIZED` / `PUBLIC_NORMALIZED_SOURCE`: el source de la práctica se publica bajo la propia nomenclatura `_fq` del portfolio. La copia normalizada y renombrada en sí no ha sido reejecutada de forma independiente tras el renombrado — la ejecución se refiere a la práctica de formación hands-on original confirmada por el propietario. Es una nota factual, no una tarea pendiente.
- `NO_CURRENT_RUNTIME_CLAIM`: no se afirma runtime actual para la copia normalizada.
- `TRAINING_ONLY` / `NO_SAVED_SOURCE_ARTIFACT`: la formación y la práctica hands-on ocurrieron según el propio registro de formación del propietario, pero no sobrevivió ningún artefacto de source de ningún tipo para normalizar o publicar.

## Relación con el track histórico principal

Este es un conjunto de candidatos separado, de un curso distinto. No cambia:

- Laboratorios históricos (Curso 1, publicados): **10**
- Evidencia de ejecución histórica: **10/10**
- Claim de runtime actual (laboratorios históricos): ninguno — `NO_CURRENT_RUNTIME_CLAIM`
- Claim de runtime actual (estas 4 prácticas nuevas): ninguno — `NO_CURRENT_RUNTIME_CLAIM`
