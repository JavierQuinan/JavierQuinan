"! Lab 03 — Type conversions, truncation/rounding, inline declarations, forced conversion,
"! date/time arithmetic, UTC timestamps.
"! Portfolio evidence class. See PROVENANCE.md for authorship/derivation details.
CLASS zcl_lab_03_datatypes_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.

CLASS zcl_lab_03_datatypes_fq IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "----------------------------------------------------------------------
    " [1] Type conversions
    "----------------------------------------------------------------------
    DATA: mv_char  TYPE c LENGTH 10 VALUE '12345',
          mv_num   TYPE i,
          mv_float TYPE f.
    mv_num   = mv_char.
    mv_float = mv_num.
    out->write( |--- [1] Conversiones de Tipo ---| ).
    out->write( |MV_CHAR = { mv_char }| ).
    out->write( |MV_NUM  = { mv_num }| ).
    out->write( |MV_FLOAT= { mv_float }| ).

    "----------------------------------------------------------------------
    " [2] Truncation and rounding
    "----------------------------------------------------------------------
    DATA: mv_trunc TYPE i,
          mv_round TYPE i.
    mv_float = '123.45'.
    mv_trunc = mv_float.
    DATA(lv_half) = CONV decfloat16( '0.5' ).
    mv_round = mv_float + lv_half.
    out->write( |\n--- [2] Truncamiento y Redondeo ---| ).
    out->write( |MV_FLOAT = { mv_float }| ).
    out->write( |MV_TRUNC = { mv_trunc }| ).
    out->write( |MV_ROUND = { mv_round }| ).

    "----------------------------------------------------------------------
    " [3] Inline declarations
    "----------------------------------------------------------------------
    DATA(lv_inline_abap) = 'ABAP'.
    out->write( |\n--- [3] Declaraciones en línea ---| ).
    out->write( |LV_INLINE_ABAP = { lv_inline_abap }| ).

    "----------------------------------------------------------------------
    " [4] Forced conversion
    "----------------------------------------------------------------------
    mv_char = '6789'.
    mv_num  = CONV i( mv_char ).
    out->write( |\n--- [4] Conversiones forzadas ---| ).
    out->write( |MV_CHAR = { mv_char }| ).
    out->write( |MV_NUM  = { mv_num }| ).

    "----------------------------------------------------------------------
    " [5] Date and time arithmetic
    "----------------------------------------------------------------------
    DATA: mv_date_1 TYPE d VALUE '20250101',
          mv_date_2 TYPE d VALUE '20250130',
          mv_days   TYPE i,
          mv_time   TYPE t.
    mv_days = mv_date_2 - mv_date_1.
    mv_time = cl_abap_context_info=>get_system_time( ).
    DATA(lv_ddmmaaaa) = |{ mv_date_1+6(2) }{ mv_date_1+4(2) }{ mv_date_1(4) }|.
    out->write( |\n--- [5] Cálculo de Fecha y Hora ---| ).
    out->write( |MV_DATE_1 = { mv_date_1 } (DDMMAAAA={ lv_ddmmaaaa })| ).
    out->write( |MV_DATE_2 = { mv_date_2 }| ).
    out->write( |MV_DAYS   = { mv_days }| ).
    out->write( |MV_TIME   = { mv_time }| ).

    "----------------------------------------------------------------------
    " [6] Timestamp fields
    "----------------------------------------------------------------------
    DATA mv_timestamp TYPE utclong.
    mv_timestamp = utclong_current( ).
    out->write( |\n--- [6] Campos Timestamp ---| ).
    out->write( |MV_TIMESTAMP (now UTC) = { mv_timestamp }| ).
    mv_date_2 = cl_abap_context_info=>get_system_date( ).
    mv_time   = cl_abap_context_info=>get_system_time( ).
    out->write( |Fecha sistema = { mv_date_2 }| ).
    out->write( |Hora sistema  = { mv_time }| ).
    mv_timestamp = utclong_add( val = mv_timestamp days = -2 ).
    out->write( |MV_TIMESTAMP (-2 días) = { mv_timestamp }| ).

  ENDMETHOD.

ENDCLASS.
