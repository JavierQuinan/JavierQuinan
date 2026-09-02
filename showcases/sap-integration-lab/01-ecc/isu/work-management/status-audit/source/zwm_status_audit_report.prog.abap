REPORT zwm_status_audit_report.

PARAMETERS p_aufnr TYPE aufk-aufnr OBLIGATORY.

START-OF-SELECTION.

  TYPES:
    BEGIN OF ty_output,
      aufnr             TYPE aufk-aufnr,
      objnr             TYPE aufk-objnr,
      stsma             TYPE jsto-stsma,
      stat              TYPE jest-stat,
      status_kind       TYPE char10,
      active            TYPE char1,
      txt04             TYPE char4,
      txt30             TYPE char30,
      chgnr             TYPE jest-chgnr,
      diagnostic_result TYPE char24,
    END OF ty_output.

  DATA lo_source TYPE REF TO zif_wm_status_source.
  DATA lo_service TYPE REF TO zcl_wm_status_audit_service.
  DATA ls_snapshot TYPE zif_wm_status_source=>ty_status_snapshot.
  DATA ls_result TYPE zcl_wm_status_audit_service=>ty_result.
  DATA ls_status TYPE zif_wm_status_source=>ty_status_entry.
  DATA ls_output TYPE ty_output.
  DATA lt_output TYPE STANDARD TABLE OF ty_output WITH DEFAULT KEY.
  DATA lo_alv TYPE REF TO cl_salv_table.
  DATA lo_functions TYPE REF TO cl_salv_functions_list.
  DATA lx_not_found TYPE REF TO zcx_wm_order_not_found.
  DATA lx_salv TYPE REF TO cx_salv_msg.
  DATA lv_message TYPE string.

  CREATE OBJECT lo_source TYPE zcl_wm_status_source_ecc.
  CREATE OBJECT lo_service
    EXPORTING
      io_source = lo_source.

  TRY.
      CALL METHOD lo_source->get_status_snapshot
        EXPORTING
          iv_aufnr = p_aufnr
        RECEIVING
          rs_snapshot = ls_snapshot.

      CALL METHOD lo_service->evaluate_snapshot
        EXPORTING
          is_snapshot = ls_snapshot
        RECEIVING
          rs_result = ls_result.

      LOOP AT ls_snapshot-statuses INTO ls_status.
        CLEAR ls_output.
        ls_output-aufnr = ls_snapshot-aufnr.
        ls_output-objnr = ls_snapshot-objnr.
        ls_output-stsma = ls_snapshot-stsma.
        ls_output-stat = ls_status-stat.
        ls_output-status_kind = ls_status-status_kind.
        ls_output-txt04 = ls_status-txt04.
        ls_output-txt30 = ls_status-txt30.
        ls_output-chgnr = ls_status-chgnr.
        ls_output-diagnostic_result = ls_result-diagnostic_result.

        IF ls_status-inact IS INITIAL.
          ls_output-active = 'X'.
        ELSE.
          CLEAR ls_output-active.
        ENDIF.

        APPEND ls_output TO lt_output.
      ENDLOOP.

      IF lt_output IS INITIAL.
        CLEAR ls_output.
        ls_output-aufnr = ls_snapshot-aufnr.
        ls_output-objnr = ls_snapshot-objnr.
        ls_output-stsma = ls_snapshot-stsma.
        ls_output-diagnostic_result = ls_result-diagnostic_result.
        APPEND ls_output TO lt_output.
      ENDIF.

      CALL METHOD cl_salv_table=>factory
        IMPORTING
          r_salv_table = lo_alv
        CHANGING
          t_table = lt_output.

      lo_functions = lo_alv->get_functions( ).
      lo_functions->set_all( abap_true ).
      lo_alv->display( ).

    CATCH zcx_wm_order_not_found INTO lx_not_found.
      CONCATENATE
        'Work order not found:'
        lx_not_found->aufnr
        INTO lv_message
        SEPARATED BY space.
      MESSAGE lv_message TYPE 'S' DISPLAY LIKE 'E'.

    CATCH cx_salv_msg INTO lx_salv.
      lv_message = lx_salv->get_text( ).
      MESSAGE lv_message TYPE 'S' DISPLAY LIKE 'E'.
  ENDTRY.
