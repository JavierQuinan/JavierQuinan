# Mapa de Normalización

[English version](./NORMALIZATION_MAP.md)

Los nombres originales de los ejercicios no se reproducen aquí en su totalidad porque contienen placeholders de instancia de curso. Esta tabla registra las decisiones de nomenclatura del portfolio y los cambios aplicados a las prácticas completadas por el propietario; no es una reproducción byte a byte del material del instructor.

| Práctica | Objeto de portfolio | Propiedad | Cambios | Límite de runtime |
|---|---|---|---|---|
| abapGit | `zcl_c3_01_projects_fq` | `USER_AUTHORED_PRACTICE` | Renombrado a la convención `_fq`; se eliminó una sección de clase vacía sin uso; se preservaron la estructura de paso de parámetros y los literales del ejercicio | El claim de ejecución corresponde a la práctica hands-on original confirmada por el propietario; la copia normalizada es evidencia pública de source |
| ATC | `zcl_c3_02_atc_demo_fq` | `USER_AUTHORED_PRACTICE` | Renombrado a `_fq`; se eliminó una sección vacía; se preservó el contenido pedagógico del finding/fix de ATC | El claim de ejecución corresponde a la práctica hands-on original confirmada por el propietario; la copia normalizada es evidencia pública de source |
| ABAP Cleaner | `zcl_c3_03_cleaner_demo_fq` | `USER_AUTHORED_PRACTICE` | Renombrado a `_fq`; se eliminó una sección vacía; no se fabricó una variante posterior “limpia” | El claim de ejecución corresponde a la práctica hands-on original confirmada por el propietario; la copia normalizada es evidencia pública de source |
| Autorizaciones | `zcl_c3_04_dept_auth_fq` | `USER_AUTHORED_PRACTICE` | Renombrado a `_fq`; se eliminó una sección vacía; se preservó la lógica `AUTHORITY-CHECK`/consulta | El claim de ejecución corresponde a la práctica hands-on original confirmada por el propietario; la copia normalizada es evidencia pública de source |
| Autorizaciones — elemento de datos | `zde_dept_fq` | `USER_AUTHORED_PRACTICE` | El nombre de portfolio sigue la convención documentada `zde_<tema>_fq` | Objeto DDIC documentado desde la práctica completada; no se fabricó archivo `.abap` |
| Autorizaciones — campo de autorización | `ZAFDEPTFQ` | `USER_AUTHORED_PRACTICE` | Nombre corto de portfolio compatible con el límite de 10 caracteres del campo de autorización | Objeto DDIC documentado desde la práctica completada; no se fabricó archivo `.abap` |
| Autorizaciones — objeto de autorización | `ZAODEPTFQ` | `USER_AUTHORED_PRACTICE` | Nombre corto de portfolio compatible con el límite de 10 caracteres del objeto de autorización | Objeto DDIC documentado desde la práctica completada; no se fabricó archivo `.abap` |

## Comprobación de longitud de nomenclatura

| Nombre | Longitud | Tipo de objeto | Límite SAP | ¿Cabe? |
|---|---:|---|---:|---|
| `zcl_c3_01_projects_fq` | 21 | Clase | 30 | Sí |
| `zcl_c3_02_atc_demo_fq` | 21 | Clase | 30 | Sí |
| `zcl_c3_03_cleaner_demo_fq` | 25 | Clase | 30 | Sí |
| `zcl_c3_04_dept_auth_fq` | 22 | Clase | 30 | Sí |
| `zde_dept_fq` | 11 | Elemento de datos | 30 | Sí |
| `ZAFDEPTFQ` | 9 | Campo de autorización | 10 | Sí |
| `ZAODEPTFQ` | 9 | Objeto de autorización | 10 | Sí |

Los cuatro nombres normalizados de clases de Curso 3 no colisionan con los objetos históricos `zcl_lab_*` de Curso 1. Las comprobaciones de longitud anteriores forman parte del registro de normalización completado.

## Curso 2

No existe mapeo porque no había un artefacto de código guardado para normalizar. Curso 2 se representa mediante su registro de formación hands-on DDIC completada, sin fabricar source; ver [Matriz de Evidencia](./EVIDENCE_MATRIX.es.md).
