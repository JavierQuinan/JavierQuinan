REPORT zmm_purch_analytics_report.

PARAMETERS:
  p_banfn TYPE eban-banfn OBLIGATORY,
  p_bnfpo TYPE eban-bnfpo OBLIGATORY.

START-OF-SELECTION.

  DATA lo_source TYPE REF TO zif_mm_purch_source.
  DATA lo_service TYPE REF TO zcl_mm_purch_analytics_service.
  DATA ls_result TYPE zcl_mm_purch_analytics_service=>ty_result.
  DATA lt_result TYPE STANDARD TABLE OF zcl_mm_purch_analytics_service=>ty_result
                 WITH DEFAULT KEY.
  DATA lo_alv TYPE REF TO cl_salv_table.
  DATA lo_functions TYPE REF TO cl_salv_functions_list.
  DATA lx_not_found TYPE REF TO zcx_mm_purch_not_found.
  DATA lx_salv TYPE REF TO cx_salv_msg.
  DATA lv_message TYPE string.

  CREATE OBJECT lo_source TYPE zcl_mm_purch_source_ecc.
  CREATE OBJECT lo_service
    EXPORTING
      io_source = lo_source.

  TRY.
      CALL METHOD lo_service->evaluate
        EXPORTING
          iv_banfn = p_banfn
          iv_bnfpo = p_bnfpo
        RECEIVING
          rs_result = ls_result.

      APPEND ls_result TO lt_result.

      CALL METHOD cl_salv_table=>factory
        IMPORTING
          r_salv_table = lo_alv
        CHANGING
          t_table = lt_result.

      lo_functions = lo_alv->get_functions( ).
      lo_functions->set_all( abap_true ).
      lo_alv->display( ).

    CATCH zcx_mm_purch_not_found INTO lx_not_found.
      CONCATENATE
        'Purchase requisition item not found:'
        lx_not_found->banfn
        lx_not_found->bnfpo
        INTO lv_message
        SEPARATED BY space.
      MESSAGE lv_message TYPE 'S' DISPLAY LIKE 'E'.

    CATCH cx_salv_msg INTO lx_salv.
      lv_message = lx_salv->get_text( ).
      MESSAGE lv_message TYPE 'S' DISPLAY LIKE 'E'.
  ENDTRY.
