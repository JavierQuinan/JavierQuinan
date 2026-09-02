CLASS zcl_mm_stock_risk_service DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CONSTANTS:
      c_status_ok       TYPE char10 VALUE 'OK',
      c_status_reorder  TYPE char10 VALUE 'REORDER',
      c_status_critical TYPE char10 VALUE 'CRITICAL'.

    TYPES:
      BEGIN OF ty_result,
        matnr         TYPE mara-matnr,
        werks         TYPE marc-werks,
        lgort         TYPE mard-lgort,
        unrestricted  TYPE mard-labst,
        reorder_point TYPE marc-minbe,
        safety_stock  TYPE marc-eisbe,
        status        TYPE char10,
        shortage_qty  TYPE mard-labst,
      END OF ty_result.

    METHODS constructor
      IMPORTING
        io_source TYPE REF TO zif_mm_stock_source.

    METHODS evaluate
      IMPORTING
        iv_matnr TYPE mara-matnr
        iv_werks TYPE marc-werks
        iv_lgort TYPE mard-lgort
      RETURNING
        VALUE(rs_result) TYPE ty_result
      RAISING
        zcx_mm_stock_not_found.

  PRIVATE SECTION.
    DATA mo_source TYPE REF TO zif_mm_stock_source.
ENDCLASS.

CLASS zcl_mm_stock_risk_service IMPLEMENTATION.
  METHOD constructor.
    mo_source = io_source.
  ENDMETHOD.

  METHOD evaluate.
    DATA ls_snapshot TYPE zif_mm_stock_source=>ty_stock_snapshot.

    ls_snapshot = mo_source->get_stock_snapshot(
      iv_matnr = iv_matnr
      iv_werks = iv_werks
      iv_lgort = iv_lgort ).

    rs_result-matnr = ls_snapshot-matnr.
    rs_result-werks = ls_snapshot-werks.
    rs_result-lgort = ls_snapshot-lgort.
    rs_result-unrestricted = ls_snapshot-unrestricted.
    rs_result-reorder_point = ls_snapshot-reorder_point.
    rs_result-safety_stock = ls_snapshot-safety_stock.

    rs_result-shortage_qty = ls_snapshot-reorder_point - ls_snapshot-unrestricted.
    IF rs_result-shortage_qty < 0.
      CLEAR rs_result-shortage_qty.
    ENDIF.

    IF ls_snapshot-unrestricted < ls_snapshot-safety_stock.
      rs_result-status = c_status_critical.
    ELSEIF ls_snapshot-unrestricted <= ls_snapshot-reorder_point.
      rs_result-status = c_status_reorder.
    ELSE.
      rs_result-status = c_status_ok.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
