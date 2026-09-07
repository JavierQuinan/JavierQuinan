# Mapa de Normalización

[English version](./NORMALIZATION_MAP.md)

Los nombres de ejercicio originales no se reproducen aquí en su totalidad (llevan un placeholder de instancia de curso y están documentados internamente para el rastro de auditoría propio del propietario) — esta tabla registra la decisión de nomenclatura y qué cambió, no un diff byte a byte contra material del instructor.

| Práctica | Objeto de portfolio | Propiedad | Cambios | Estado de runtime |
|---|---|---|---|---|
| abapGit | `zcl_c3_01_projects_fq` | `USER_AUTHORED_PRACTICE` | Renombrado a la convención `_fq`, se eliminó una sección de clase vacía sin uso; el estilo de paso de parámetros y los literales no cambian | `NORMALIZED_NOT_EXECUTED` |
| ATC | `zcl_c3_02_atc_demo_fq` | `USER_AUTHORED_PRACTICE` | Renombrado a la convención `_fq`, se eliminó una sección de clase vacía sin uso; la consulta sin filtro y la corrección del pragma `##NO_TEXT` se mantienen deliberadamente sin cambios — son el propio contenido pedagógico del ejercicio sobre finding/corrección/exención de ATC | `NORMALIZED_NOT_EXECUTED` |
| ABAP Cleaner | `zcl_c3_03_cleaner_demo_fq` | `USER_AUTHORED_PRACTICE` | Renombrado a la convención `_fq`, se eliminó una sección de clase vacía sin uso; la lógica sin cambios por lo demás — sin versión "después de la limpieza" fabricada | `NORMALIZED_NOT_EXECUTED` |
| Autorizaciones | `zcl_c3_04_dept_auth_fq` | `USER_AUTHORED_PRACTICE` | Renombrado a la convención `_fq`, se eliminó una sección de clase vacía sin uso; lógica de `AUTHORITY-CHECK`/consulta sin cambios | `NORMALIZED_NOT_EXECUTED` |
| Autorizaciones — elemento de datos | `zde_dept_fq` | `USER_AUTHORED_PRACTICE` | Renombrado según la convención ya documentada `zde_<tema>_fq` (ver [`../NAMING_CONVENTIONS.es.md`](../NAMING_CONVENTIONS.es.md)) | `NORMALIZED_NOT_EXECUTED` (objeto DDIC — creado vía asistente de ADT, sin archivo `.abap`) |
| Autorizaciones — campo de autorización | `ZAFDEPTFQ` | `USER_AUTHORED_PRACTICE` | Nombre nuevo corto, tipo sin guiones bajos (9 caracteres) — el límite de 10 caracteres de nombre de campo de autorización de SAP no admite un patrón `_fq` con sufijo de guión bajo | `NORMALIZED_NOT_EXECUTED` (objeto DDIC — sin archivo `.abap`) |
| Autorizaciones — objeto de autorización | `ZAODEPTFQ` | `USER_AUTHORED_PRACTICE` | Nombre nuevo corto, tipo sin guiones bajos (9 caracteres) — misma restricción de 10 caracteres | `NORMALIZED_NOT_EXECUTED` (objeto DDIC — sin archivo `.abap`) |

## Comprobación de longitud de nomenclatura

| Nombre | Longitud | Tipo de objeto | Límite SAP | ¿Cabe? |
|---|---|---|---|---|
| `zcl_c3_01_projects_fq` | 21 | Clase | 30 | Sí |
| `zcl_c3_02_atc_demo_fq` | 21 | Clase | 30 | Sí |
| `zcl_c3_03_cleaner_demo_fq` | 25 | Clase | 30 | Sí |
| `zcl_c3_04_dept_auth_fq` | 22 | Clase | 30 | Sí |
| `zde_dept_fq` | 11 | Elemento de datos | 30 | Sí |
| `ZAFDEPTFQ` | 9 | Campo de autorización | 10 | Sí |
| `ZAODEPTFQ` | 9 | Objeto de autorización | 10 | Sí |

No existen colisiones de nomenclatura contra los nombres de objeto de los laboratorios históricos (`zcl_lab_*`) ni contra los nombres de fixture/variante del track de runtime-readiness (`zcl_employee_fixture_fq`, `zcl_lab_*_rt_fq`). Estos límites son guía estándar de nomenclatura de objeto de repositorio ABAP y aún deberían confirmarse directamente en ADT antes de la creación.

## Curso 2

No existe mapeo — no se encontró ningún artefacto de código que normalizar. Ver `EVIDENCE_MATRIX.es.md`.
