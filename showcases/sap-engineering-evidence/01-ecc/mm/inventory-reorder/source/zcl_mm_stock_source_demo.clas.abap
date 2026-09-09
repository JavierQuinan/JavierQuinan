CLASS zcl_mm_stock_source_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_mm_stock_source.

    METHODS constructor
      IMPORTING
        is_snapshot TYPE zif_mm_stock_source=>ty_stock_snapshot.

  PRIVATE SECTION.
    DATA ms_snapshot TYPE zif_mm_stock_source=>ty_stock_snapshot.
ENDCLASS.

CLASS zcl_mm_stock_source_demo IMPLEMENTATION.
  METHOD constructor.
    ms_snapshot = is_snapshot.
  ENDMETHOD.

  METHOD zif_mm_stock_source~get_stock_snapshot.
    IF iv_matnr <> ms_snapshot-matnr
       OR iv_werks <> ms_snapshot-werks
       OR iv_lgort <> ms_snapshot-lgort.
      RAISE EXCEPTION TYPE zcx_mm_stock_not_found
        EXPORTING
          iv_matnr = iv_matnr
          iv_werks = iv_werks
          iv_lgort = iv_lgort.
    ENDIF.

    rs_snapshot = ms_snapshot.
  ENDMETHOD.
ENDCLASS.
