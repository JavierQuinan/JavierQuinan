"! Lab 02 — Arithmetic operators and statements (ADD/SUBTRACT/MULTIPLY/DIVIDE/DIV/MOD/**/SQRT).
"! Portfolio evidence class. See PROVENANCE.md for authorship/derivation details.
CLASS zcl_lab_02_arithmetic_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.

CLASS zcl_lab_02_arithmetic_fq IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "-----------------------------
    " 1) Addition / ADD statement
    "-----------------------------
    DATA: lv_base_rate            TYPE i VALUE 20,
          lv_corp_area_rate       TYPE i VALUE 10,
          lv_medical_service_rate TYPE i VALUE 15,
          lv_total_rate           TYPE i.
    lv_total_rate = lv_base_rate + lv_corp_area_rate + lv_medical_service_rate.
    ADD 5 TO lv_total_rate.
    out->write( |1) TOTAL_RATE = { lv_total_rate }| ).

    "-----------------------------
    " 2) Subtraction / SUBTRACT statement
    "-----------------------------
    DATA: lv_maintenance_rate TYPE i VALUE 30,
          lv_margin_rate      TYPE i VALUE 10.
    CLEAR lv_base_rate.
    lv_base_rate = lv_maintenance_rate - lv_margin_rate.
    SUBTRACT 4 FROM lv_base_rate.
    out->write( |2) BASE_RATE (post-resta) = { lv_base_rate }| ).

    "-----------------------------
    " 3) Multiplication / MULTIPLY statement
    "-----------------------------
    DATA: lv_package_weight TYPE i VALUE 2,
          lv_cost_per_kg    TYPE i VALUE 3,
          lv_multi_rate     TYPE i.
    lv_multi_rate = lv_package_weight * lv_cost_per_kg.
    MULTIPLY lv_multi_rate BY 2.
    out->write( |3) MULTI_RATE = { lv_multi_rate }| ).

    "-----------------------------
    " 4) Division / DIVIDE statement
    "-----------------------------
    DATA: lv_total_weight TYPE i VALUE 38,
          lv_num_packages TYPE i VALUE 4,
          lv_applied_rate TYPE p LENGTH 8 DECIMALS 2.
    lv_applied_rate = lv_total_weight / lv_num_packages. " 38 / 4 = 9.50
    DIVIDE lv_applied_rate BY 3.                          " 9.50 / 3 = 3.17
    out->write( |4) APPLIED_RATE = { lv_applied_rate }| ).

    "-----------------------------
    " 5) Integer division / DIV
    "-----------------------------
    DATA: lv_total_cost         TYPE i VALUE 17,
          lv_discount_threshold TYPE i VALUE 4,
          lv_result             TYPE p LENGTH 4 DECIMALS 2.
    lv_result = lv_total_cost DIV lv_discount_threshold.  " 17 DIV 4 = 4
    out->write( |5) RESULT (DIV) = { lv_result }| ).

    "-----------------------------
    " 6) Remainder / MOD
    "-----------------------------
    lv_total_cost         = 19.
    lv_discount_threshold = 4.
    DATA lv_remainder TYPE p LENGTH 4 DECIMALS 2.
    lv_remainder = lv_total_cost MOD lv_discount_threshold. " 19 MOD 4 = 3
    out->write( |6) REMAINDER (MOD) = { lv_remainder }| ).

    "-----------------------------
    " 7) Exponentiation
    "-----------------------------
    DATA: lv_weight TYPE i VALUE 5,
          lv_expo   TYPE i.
    lv_expo = lv_weight ** 2. " 5^2 = 25
    out->write( |7) EXPO (5^2) = { lv_expo }| ).

    "-----------------------------
    " 8) Square root (SQRT)
    "-----------------------------
    DATA lv_square_root TYPE i.
    lv_square_root = sqrt( lv_expo ). " sqrt(25) = 5
    out->write( |8) SQUARE_ROOT = { lv_square_root }| ).

  ENDMETHOD.

ENDCLASS.
