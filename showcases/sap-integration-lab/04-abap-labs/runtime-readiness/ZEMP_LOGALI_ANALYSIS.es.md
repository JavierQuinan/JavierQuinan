# ZEMP_LOGALI — Análisis de Uso y Diseño de Reemplazo Sintético

[English version](./ZEMP_LOGALI_ANALYSIS.md)

> `ZEMP_LOGALI` no está distribuida en ningún lugar de este paquete de evidencia y su estructura no está documentada en el material de formación que tenemos — todo lo que sigue sobre su **forma** se infiere estrictamente de cómo las tres clases consumidoras la referencian, nunca se asume más allá de eso.

## 1. Qué laboratorios la usan, y cómo

| Lab | Método | Operación | ¿Lee o escribe en BD? | ¿Dependencia DDIC en tiempo de compilación? |
|---|---|---|---|---|
| 05 (`zcl_lab_05_invoice_fq`) | `demo_2_concat_lines_tab` | `SELECT * FROM zemp_logali INTO TABLE @DATA(lt_employees)` (tabla declarada inline, procesamiento genérico posterior vía RTTI) | Solo lectura, sin escritura en BD | **No** — el tipo de fila de la tabla se infiere en runtime a partir del `SELECT *`, nunca se nombra como `TYPE zemp_logali` en ningún lugar. Solo ese método falla si la tabla está ausente. |
| 06 (`zcl_lab_06_condition_fq`) | `DATA` a nivel de clase, `perform_loop_endloop` | `DATA mt_employees TYPE TABLE OF zemp_logali` y `DATA ms_employee TYPE zemp_logali` a nivel de clase; `SELECT * FROM zemp_logali INTO TABLE @me->mt_employees`; `LOOP AT ... ir_out->write( ms_employee-email )` | Solo lectura, sin escritura en BD; el resultado se mantiene solo en memoria | **Sí** — `zemp_logali` se usa como TYPE DDIC explícito a nivel de definición de clase. Toda la clase falla al activarse sin ella, no solo este método. |
| 08 (`zcl_lab_08_fieldsymbols_fq`) | `FIELD-SYMBOLS` local, `if_oo_adt_classrun~main` | `FIELD-SYMBOLS <ls_employee> TYPE zemp_logali`; `SELECT * FROM zemp_logali INTO TABLE @DATA(lt_employees)`; asigna/lee `<ls_employee>-email` y `<ls_employee>-name`, modifica solo filas en memoria (`APPEND`/`INSERT`/`READ TABLE ... ASSIGNING`) | El `SELECT` fuente es solo lectura; toda mutación posterior es **solo en memoria** sobre la tabla interna local — no hay ningún `UPDATE`/`MODIFY zemp_logali` en ningún lugar | **Sí** — misma severidad bloqueante de activación que lab-06 |

## 2. Campos que el código consumidor realmente requiere

Al leer cada acceso a campo en las tres clases, la **forma mínima requerida** es:

| Campo | Usado en | Cómo |
|---|---|---|
| `email` | lab-06 (`ms_employee-email`, impreso), lab-08 (`<ls_employee>-email`, leído y reescrito) | campo tipo string, leído y reasignado |
| `name` | lab-08 (`<ls_employee>-name`, leído y reescrito, impreso) | campo tipo string |
| (cualquier otro campo) | `demo_2_concat_lines_tab` de lab-05 | accedido **solo de forma genérica** mediante `cl_abap_structdescr`/`ASSIGN COMPONENT ... OF STRUCTURE` — itera los componentes que existan y concatena sus valores; no nombra ningún campo específico |

Ningún campo numérico/de fecha/clave se referencia por nombre en el código consumidor. Nada en las tres clases requiere que `ZEMP_LOGALI` tenga más que un campo `email` y uno `name` — cualquier campo adicional es una decisión de modelado de negocio propia del entorno de formación, no algo de lo que dependa el código de este portafolio.

## 3. ¿Puede sustituirse de forma sintética?

**Sí, completamente.** Ninguno de los tres consumidores:
- escribe en base de datos,
- requiere una clave/ajustes técnicos específicos (tabla transparente, buffering, etc.),
- requiere más de un par de campos tipo string,
- requiere una cantidad específica de filas (el loop de lab-06 y el de lab-08 iteran las filas que existan).

Una tabla interna en memoria poblada por un método factory/fixture satisface todo el uso real. **No se necesita una tabla Z de base de datos nueva** — crear una sería una sobrecarga de objeto DDIC innecesaria para lo que, en cada uno de estos tres laboratorios, es pura manipulación de tabla interna/field symbol en memoria.

## 4. Diseño: `zcl_employee_fixture_fq`

Una única clase local que expone un TYPE de fila público, un TYPE de tabla público, y un método factory estático que devuelve datos sintéticos — reutilizada de forma idéntica por las variantes runtime-ready de los laboratorios 05, 06 y 08 (ver `RUNTIME_VARIANT_MAPPING.es.md`).

```abap
CLASS zcl_employee_fixture_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_employee_fixture_fq,
             id     TYPE i,
             email  TYPE string,
             ape1   TYPE string,
             ape2   TYPE string,
             name   TYPE string,
             fechan TYPE d,
             fechaa TYPE d,
           END OF ty_employee_fixture_fq.
    TYPES tt_employee_fixture_fq TYPE STANDARD TABLE OF ty_employee_fixture_fq WITH EMPTY KEY.

    CLASS-METHODS get_employees
      RETURNING VALUE(rt_employees) TYPE tt_employee_fixture_fq.

ENDCLASS.

CLASS zcl_employee_fixture_fq IMPLEMENTATION.

  METHOD get_employees.
    rt_employees = VALUE #(
      ( id = 1 email = 'employee1@example.invalid' ape1 = 'perez'     ape2 = 'gomez'    name = 'juan'    fechan = '19900101' fechaa = '20220101' )
      ( id = 2 email = 'employee2@example.invalid' ape1 = 'lopez'     ape2 = 'martinez' name = 'ana'     fechan = '19920202' fechaa = '20220202' )
      ( id = 3 email = 'employee3@example.invalid' ape1 = 'torres'    ape2 = 'ruiz'     name = 'carlos'  fechan = '19850303' fechaa = '20220303' )
      ( id = 4 email = 'employee4@example.invalid' ape1 = 'hernandez' ape2 = 'jimenez'  name = 'laura'   fechan = '19960606' fechaa = '20220606' )
    ).
  ENDMETHOD.

ENDCLASS.
```

### Por qué esta forma exacta

- **La estructura y los valores literales no se inventan de la nada** — son el mismo esquema de campos y los mismos valores sintéticos (`id`/`email`/`ape1`/`ape2`/`name`/`fechan`/`fechaa`, `employee1@example.invalid` … `perez`/`gomez`/`juan`, etc.) ya presentes en la propia clase `zcl_lab_07_tables_fq` (Parte I del laboratorio de tablas internas), de autoría independiente del estudiante, que comenta explícitamente "synthetic demo data, not real employees" y que nunca toca `ZEMP_LOGALI`. Reutilizar este patrón ya propio y ya publicado evita inventar un nuevo dataset ficticio y mantiene una identidad sintética consistente en todo el portafolio.
- Usa únicamente `example.invalid` (un dominio no enrutable reservado por IANA, la misma convención ya usada en el código fuente histórico de los labs 05a/07/08), nunca un dominio real o asociado a Logali.
- No contiene lógica de negocio, nomenclatura de campos ni estructura propietaria de Logali Group — los campos `email`/`name` son los únicos que cualquier consumidor realmente necesita; `id`/`ape1`/`ape2`/`fechan`/`fechaa` se incluyen solo por consistencia con el precedente de lab-07, no porque ninguno de los tres consumidores de `ZEMP_LOGALI` los requiera.
- Una simple tabla interna + método factory, según la instrucción de preferir `TYPES`/`VALUE`/métodos factory sobre crear una tabla Z innecesaria.
- Nombrada `zcl_employee_fixture_fq`, siguiendo la convención de firma personal `_fq` (`NAMING_CONVENTIONS.md`) para objetos nuevos originales del portafolio.

## 5. Qué NO hace esto

- No modifica, reemplaza ni elimina `zcl_lab_05_invoice_fq`, `zcl_lab_06_condition_fq`, ni `zcl_lab_08_fieldsymbols_fq` — estas permanecen byte a byte tal como se publicaron, siguen referenciando `zemp_logali`, siguen en `HISTORICAL_EXECUTION_EVIDENCE = YES` / `CURRENT_RUNTIME_VERIFICATION = PENDING`.
- No intenta reconstruir la tabla real `ZEMP_LOGALI`, su lista de campos real, ni ningún contenido de autoría de Logali.
- No toca ninguna tabla de base de datos, real ni sintética — todo ocurre en una tabla interna de ABAP en memoria.
