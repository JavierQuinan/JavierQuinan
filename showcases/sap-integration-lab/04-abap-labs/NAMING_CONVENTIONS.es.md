# Convención Personal de Nomenclatura ABAP

[English version](./NAMING_CONVENTIONS.md)

Este documento registra patrones de nomenclatura que ya están presentes en la evidencia pública ABAP.

## Patrón histórico de clases

```text
zcl_lab_<NN>_<tema>_fq[a]
```

| Segmento | Significado | Observado |
|---|---|---|
| `zcl_` | Prefijo de clase en namespace de cliente | las 10 clases históricas |
| `lab_` | Marcador de laboratorio personal | las 10 clases históricas |
| `<NN>` | Secuencia personal de dos dígitos | `01`–`08` |
| `<tema>` | Descriptor corto en inglés | `var`, `arithmetic`, `datatypes`, `message`, `invoice`, `condition`, `tables`, `fieldsymbols` |
| `_fq` | Sufijo personal de Francisco Quinteros | todas las clases base |
| `a` opcional | Continuación del mismo tema numerado | `05a`, `07a` |

## Mapeo histórico confirmado

| Lab | Unidad del curso | Tema | Clase |
|---|---|---|---|
| 01 | UNIDAD_2 | Variables / conceptos básicos | `zcl_lab_01_var_fq` |
| 02 | UNIDAD_3 | Aritmética | `zcl_lab_02_arithmetic_fq` |
| 03 | UNIDAD_4 | Conversiones de tipos | `zcl_lab_03_datatypes_fq` |
| 04 | UNIDAD_5 | Procesamiento de texto | `zcl_lab_04_message_fq` |
| 05 | UNIDAD_6 | Operaciones con cadenas I | `zcl_lab_05_invoice_fq` |
| 05a | UNIDAD_7 | Operaciones con cadenas II | `zcl_lab_05_invoice_fqa` |
| 06 | UNIDAD_8 | Estructuras de control | `zcl_lab_06_condition_fq` |
| 07 | UNIDAD_10 | Tablas internas I | `zcl_lab_07_tables_fq` |
| 07a | UNIDAD_11 | Tablas internas II | `zcl_lab_07_tables_fqa` |
| 08 | UNIDAD_13 | Field symbols | `zcl_lab_08_fieldsymbols_fq` |

## Patrón normalizado de Curso 3

Las cuatro prácticas publicadas de Curso 3 usan el mismo sufijo personal y mantienen explícita la secuencia de curso/práctica:

- `zcl_c3_01_projects_fq`
- `zcl_c3_02_atc_demo_fq`
- `zcl_c3_03_cleaner_demo_fq`
- `zcl_c3_04_dept_auth_fq`

La práctica de autorizaciones también documenta los nombres DDIC abreviados técnicamente válidos `zde_dept_fq`, `ZAFDEPTFQ` y `ZAODEPTFQ` cuando aplican límites de longitud de objetos SAP.

## Regla de nomenclatura actual

- Usar `_fq` para objetos propios/normalizados del portfolio cuando el tipo de objeto SAP y el límite técnico lo permitan.
- Usar un sufijo abreviado `FQ` cuando un límite estricto del objeto SAP haga inválido `_fq` literal.
- Usar `_fqa` únicamente para una continuación real del mismo tema numerado del laboratorio histórico.
- Conservar sin cambios los nombres de sources históricos; la normalización se representa mediante copias de portfolio separadas cuando aplica.

## Límite de evidencia

El conjunto histórico de Curso 1 está basado en clases. Curso 2 no tiene artefacto de source guardado. Curso 3 aporta las cuatro clases normalizadas y la nomenclatura documentada de objetos de autorización indicada arriba. No se afirma una convención para tipos de objeto que no estén representados por evidencia pública actual.
