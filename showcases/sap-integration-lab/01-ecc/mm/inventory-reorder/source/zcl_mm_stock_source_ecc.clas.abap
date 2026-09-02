CLASS zcl_mm_stock_source_ecc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_mm_stock_source.
ENDCLASS.

CLASS zcl_mm_stock_source_ecc IMPLEMENTATION.
  METHOD zif_mm_stock_source~get_stock_snapshot.
    CLEAR rs_snapshot.

    SELECT SINGLE minbe eisbe
      FROM marc
      INTO (rs_snapshot-reorder_point, rs_snapshot-safety_stock)
      WHERE matnr = iv_matnr
        AND werks = iv_werks.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_mm_stock_not_found
        EXPORTING
          iv_matnr = iv_matnr
          iv_werks = iv_werks
          iv_lgort = iv_lgort.
    ENDIF.

    SELECT SINGLE labst
      FROM mard
      INTO rs_snapshot-unrestricted
      WHERE matnr = iv_matnr
        AND werks = iv_werks
        AND lgort = iv_lgort.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_mm_stock_not_found
        EXPORTING
          iv_matnr = iv_matnr
          iv_werks = iv_werks
          iv_lgort = iv_lgort.
    ENDIF.

    rs_snapshot-matnr = iv_matnr.
    rs_snapshot-werks = iv_werks.
    rs_snapshot-lgort = iv_lgort.
  ENDMETHOD.
ENDCLASS.
