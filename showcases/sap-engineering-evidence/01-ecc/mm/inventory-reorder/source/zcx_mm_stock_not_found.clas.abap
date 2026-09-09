CLASS zcx_mm_stock_not_found DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA matnr TYPE mara-matnr READ-ONLY.
    DATA werks TYPE marc-werks READ-ONLY.
    DATA lgort TYPE mard-lgort READ-ONLY.

    METHODS constructor
      IMPORTING
        iv_matnr TYPE mara-matnr
        iv_werks TYPE marc-werks
        iv_lgort TYPE mard-lgort.
ENDCLASS.

CLASS zcx_mm_stock_not_found IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    matnr = iv_matnr.
    werks = iv_werks.
    lgort = iv_lgort.
  ENDMETHOD.
ENDCLASS.
