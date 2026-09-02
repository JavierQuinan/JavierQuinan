CLASS zcl_mm_stock_risk_service DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CONSTANTS:
      c_status_ok             TYPE char15 VALUE 'OK',
      c_status_reorder        TYPE char15 VALUE 'REORDER',
      c_status_critical       TYPE char15 VALUE 'CRITICAL',
      c_status_not_configured TYPE char15 VALUE 'NOT_CONFIGURED'.

    TYPES:
      BEGIN OF ty_result,
        matnr                TYPE mara-matnr,
        werks                TYPE marc-werks,
        lgort                TYPE mard-lgort,
        mrp_type             TYPE marc-dismm,
        storage_unrestricted TYPE mard-labst,
        plant_unrestricted   TYPE mard-labst,
        reorder_point        TYPE marc-minbe,
        safety_stock         TYPE marc-eisbe,
        status               TYPE char15,
        shortage_qty         TYPE mard-labst,
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

    CALL METHOD mo_source->get_stock_snapshot
      EXPORTING
        iv_matnr = iv_matnr
        iv_werks = iv_werks
        iv_lgort = iv_lgort
      RECEIVING
        rs_snapshot = ls_snapshot.

    rs_result-matnr = ls_snapshot-matnr.
    rs_result-werks = ls_snapshot-werks.
    rs_result-lgort = ls_snapshot-lgort.
    rs_result-mrp_type = ls_snapshot-mrp_type.
    rs_result-storage_unrestricted = ls_snapshot-storage_unrestricted.
    rs_result-plant_unrestricted = ls_snapshot-plant_unrestricted.
    rs_result-reorder_point = ls_snapshot-reorder_point.
    rs_result-safety_stock = ls_snapshot-safety_stock.

    CLEAR rs_result-shortage_qty.
    IF ls_snapshot-reorder_point > 0
       AND ls_snapshot-plant_unrestricted < ls_snapshot-reorder_point.
      rs_result-shortage_qty =
        ls_snapshot-reorder_point - ls_snapshot-plant_unrestricted.
    ENDIF.

    IF ls_snapshot-reorder_point IS INITIAL
       AND ls_snapshot-safety_stock IS INITIAL.
      rs_result-status = c_status_not_configured.
    ELSEIF ls_snapshot-safety_stock > 0
       AND ls_snapshot-plant_unrestricted < ls_snapshot-safety_stock.
      rs_result-status = c_status_critical.
    ELSEIF ls_snapshot-reorder_point > 0
       AND ls_snapshot-plant_unrestricted <= ls_snapshot-reorder_point.
      rs_result-status = c_status_reorder.
    ELSE.
      rs_result-status = c_status_ok.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
