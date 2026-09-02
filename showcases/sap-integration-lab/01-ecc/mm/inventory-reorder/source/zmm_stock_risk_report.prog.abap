REPORT zmm_stock_risk_report.

PARAMETERS:
  p_matnr TYPE mara-matnr OBLIGATORY,
  p_werks TYPE marc-werks OBLIGATORY,
  p_lgort TYPE mard-lgort OBLIGATORY.

START-OF-SELECTION.

  DATA lo_source TYPE REF TO zif_mm_stock_source.
  DATA lo_service TYPE REF TO zcl_mm_stock_risk_service.
  DATA ls_result TYPE zcl_mm_stock_risk_service=>ty_result.
  DATA lt_result TYPE STANDARD TABLE OF zcl_mm_stock_risk_service=>ty_result.
  DATA lo_alv TYPE REF TO cl_salv_table.
  DATA lo_functions TYPE REF TO cl_salv_functions_list.
  DATA lx_not_found TYPE REF TO zcx_mm_stock_not_found.
  DATA lx_salv TYPE REF TO cx_salv_msg.
  DATA lv_message TYPE string.

  CREATE OBJECT lo_source TYPE zcl_mm_stock_source_ecc.
  CREATE OBJECT lo_service
    EXPORTING
      io_source = lo_source.

  TRY.
      ls_result = lo_service->evaluate(
        iv_matnr = p_matnr
        iv_werks = p_werks
        iv_lgort = p_lgort ).

      APPEND ls_result TO lt_result.

      cl_salv_table=>factory(
        IMPORTING
          r_salv_table = lo_alv
        CHANGING
          t_table = lt_result ).

      lo_functions = lo_alv->get_functions( ).
      lo_functions->set_all( abap_true ).
      lo_alv->display( ).

    CATCH zcx_mm_stock_not_found INTO lx_not_found.
      WRITE: / 'No stock snapshot found for material/plant/storage location:',
             / lx_not_found->matnr,
               lx_not_found->werks,
               lx_not_found->lgort.

    CATCH cx_salv_msg INTO lx_salv.
      lv_message = lx_salv->get_text( ).
      MESSAGE lv_message TYPE 'E'.
  ENDTRY.
