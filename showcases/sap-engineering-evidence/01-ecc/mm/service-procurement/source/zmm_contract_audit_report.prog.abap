REPORT zmm_contract_audit_report.

PARAMETERS:
  p_ebeln TYPE ekko-ebeln OBLIGATORY,
  p_date  TYPE sy-datum,
  p_warn  TYPE i DEFAULT 30.

INITIALIZATION.
  p_date = sy-datum.

AT SELECTION-SCREEN.
  IF p_warn < 0.
    MESSAGE 'Warning days cannot be negative' TYPE 'E'.
  ENDIF.

START-OF-SELECTION.

  DATA lo_source TYPE REF TO zif_mm_contract_source.
  DATA lo_service TYPE REF TO zcl_mm_contract_audit_service.
  DATA ls_result TYPE zcl_mm_contract_audit_service=>ty_result.
  DATA lt_result TYPE STANDARD TABLE OF zcl_mm_contract_audit_service=>ty_result
                 WITH DEFAULT KEY.
  DATA lo_alv TYPE REF TO cl_salv_table.
  DATA lo_functions TYPE REF TO cl_salv_functions_list.
  DATA lx_not_found TYPE REF TO zcx_mm_contract_not_found.
  DATA lx_salv TYPE REF TO cx_salv_msg.
  DATA lv_message TYPE string.

  CREATE OBJECT lo_source TYPE zcl_mm_contract_source_ecc.
  CREATE OBJECT lo_service
    EXPORTING
      io_source = lo_source.

  TRY.
      CALL METHOD lo_service->evaluate
        EXPORTING
          iv_ebeln = p_ebeln
          iv_key_date = p_date
          iv_warning_days = p_warn
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

    CATCH zcx_mm_contract_not_found INTO lx_not_found.
      CONCATENATE
        'Purchasing contract not found:'
        lx_not_found->ebeln
        INTO lv_message
        SEPARATED BY space.
      MESSAGE lv_message TYPE 'S' DISPLAY LIKE 'E'.

    CATCH cx_salv_msg INTO lx_salv.
      lv_message = lx_salv->get_text( ).
      MESSAGE lv_message TYPE 'S' DISPLAY LIKE 'E'.
  ENDTRY.
