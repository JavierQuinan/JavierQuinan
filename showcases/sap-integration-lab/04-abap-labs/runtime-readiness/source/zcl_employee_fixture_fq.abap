"! Runtime-ready fixture — original portfolio object, not a transcription of any
"! historical lab. Provides synthetic in-memory employee-like demo data so that
"! zcl_lab_05_invoice_rt_fq, zcl_lab_06_condition_rt_fq, and
"! zcl_lab_08_fieldsymbols_rt_fq can run without the course-specific ZEMP_LOGALI
"! table. See ../ZEMP_LOGALI_ANALYSIS.md for the full design rationale.
"!
"! Data note: structure shape and literal values reuse the same synthetic pattern
"! (id/email/ape1/ape2/name/fechan/fechaa, example.invalid addresses) already
"! present in the independently-authored zcl_lab_07_tables_fq (historical, own
"! code, no ZEMP_LOGALI dependency). No Logali Group content of any kind.
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
