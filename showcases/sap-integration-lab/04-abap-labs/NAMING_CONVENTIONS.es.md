# Convención Personal de Nomenclatura ABAP

[English version](./NAMING_CONVENTIONS.md)

> Este documento registra el patrón observado en las 10 unidades históricas de laboratorio basadas en clases. No afirma que el mismo esquema de prefijos ya se haya utilizado para CDS, RAP, DDIC o objetos de test.

## Patrón de clase observado

```text
zcl_lab_<NN>_<tema>_fq[a]
```

| Segmento | Significado | Observado |
|---|---|---|
| `zcl_` | Prefijo de clase en namespace de cliente | las 10 clases |
| `lab_` | Marcador de laboratorio personal | las 10 clases |
| `<NN>` | Secuencia personal de dos dígitos | `01`–`08` |
| `<tema>` | Descriptor corto en inglés | `var`, `arithmetic`, `datatypes`, `message`, `invoice`, `condition`, `tables`, `fieldsymbols` |
| `_fq` | Sufijo personal de Francisco Quinteros | todas las clases base |
| `a` opcional | Continuación del mismo tema numerado | `05a`, `07a` |

## Mapeo confirmado

| Unidad | Unidad del curso | Tema | Clase |
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

## Límite de evidencia

Este conjunto histórico contiene únicamente labs basados en clases. No contiene una interfaz custom propia, vista CDS, behavior definition, service definition/binding, objeto DDIC de persistencia ni clase ABAP Unit propia.

## Regla para evidencia futura

Para nuevos objetos originales del portfolio:

1. mantener el sufijo `_fq` cuando el tipo de objeto SAP y sus límites de nombre lo permitan técnicamente;
2. usar la convención recomendada por SAP/equipo para ese tipo de objeto en lugar de inventar un prefijo únicamente para imitar esta serie;
3. documentar la decisión de nomenclatura dentro del futuro lab;
4. no usar `_fqa` salvo que sea realmente una continuación del mismo tema numerado.

La única convención demostrada hoy es el patrón de clases anterior. La nomenclatura futura para CDS/RAP/DDIC/tests se definirá cuando esos objetos se construyan realmente.
