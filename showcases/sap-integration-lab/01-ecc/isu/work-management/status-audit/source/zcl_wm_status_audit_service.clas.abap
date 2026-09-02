CLASS zcl_wm_status_audit_service DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CONSTANTS:
      c_result_ok                   TYPE char24 VALUE 'OK',
      c_result_no_active_status     TYPE char24 VALUE 'NO_ACTIVE_STATUS',
      c_result_user_profile_missing TYPE char24 VALUE 'USER_PROFILE_MISSING',
      c_result_text_resolution_gap  TYPE char24 VALUE 'TEXT_RESOLUTION_GAP'.

    TYPES:
      BEGIN OF ty_result,
        aufnr                 TYPE aufk-aufnr,
        objnr                 TYPE aufk-objnr,
        stsma                 TYPE jsto-stsma,
        active_system_count   TYPE i,
        active_user_count     TYPE i,
        historical_count      TYPE i,
        unresolved_text_count TYPE i,
        change_count          TYPE i,
        latest_change_date    TYPE sy-datum,
        latest_change_time    TYPE sy-uzeit,
        diagnostic_result     TYPE char24,
      END OF ty_result.

    METHODS constructor
      IMPORTING
        io_source TYPE REF TO zif_wm_status_source.

    METHODS evaluate
      IMPORTING
        iv_aufnr TYPE aufk-aufnr
      RETURNING
        VALUE(rs_result) TYPE ty_result
      RAISING
        zcx_wm_order_not_found.

    METHODS evaluate_snapshot
      IMPORTING
        is_snapshot TYPE zif_wm_status_source=>ty_status_snapshot
      RETURNING
        VALUE(rs_result) TYPE ty_result.

  PRIVATE SECTION.
    DATA mo_source TYPE REF TO zif_wm_status_source.
ENDCLASS.

CLASS zcl_wm_status_audit_service IMPLEMENTATION.
  METHOD constructor.
    mo_source = io_source.
  ENDMETHOD.

  METHOD evaluate.
    DATA ls_snapshot TYPE zif_wm_status_source=>ty_status_snapshot.

    CALL METHOD mo_source->get_status_snapshot
      EXPORTING
        iv_aufnr = iv_aufnr
      RECEIVING
        rs_snapshot = ls_snapshot.

    CALL METHOD me->evaluate_snapshot
      EXPORTING
        is_snapshot = ls_snapshot
      RECEIVING
        rs_result = rs_result.
  ENDMETHOD.

  METHOD evaluate_snapshot.
    DATA ls_status TYPE zif_wm_status_source=>ty_status_entry.
    DATA lv_active_count TYPE i.
    DATA lv_active_user_without_profile TYPE abap_bool.

    rs_result-aufnr = is_snapshot-aufnr.
    rs_result-objnr = is_snapshot-objnr.
    rs_result-stsma = is_snapshot-stsma.
    rs_result-change_count = is_snapshot-change_count.
    rs_result-latest_change_date = is_snapshot-latest_change_date.
    rs_result-latest_change_time = is_snapshot-latest_change_time.

    CLEAR: rs_result-active_system_count,
           rs_result-active_user_count,
           rs_result-historical_count,
           rs_result-unresolved_text_count,
           lv_active_count,
           lv_active_user_without_profile.

    LOOP AT is_snapshot-statuses INTO ls_status.
      IF ls_status-inact IS INITIAL.
        ADD 1 TO lv_active_count.

        IF ls_status-status_kind = 'SYSTEM'.
          ADD 1 TO rs_result-active_system_count.
        ELSEIF ls_status-status_kind = 'USER'.
          ADD 1 TO rs_result-active_user_count.
          IF is_snapshot-stsma IS INITIAL.
            lv_active_user_without_profile = abap_true.
          ENDIF.
        ENDIF.

        IF ls_status-txt04 IS INITIAL
           AND ls_status-txt30 IS INITIAL.
          ADD 1 TO rs_result-unresolved_text_count.
        ENDIF.
      ELSE.
        ADD 1 TO rs_result-historical_count.
      ENDIF.
    ENDLOOP.

    IF lv_active_count = 0.
      rs_result-diagnostic_result = c_result_no_active_status.
    ELSEIF lv_active_user_without_profile = abap_true.
      rs_result-diagnostic_result = c_result_user_profile_missing.
    ELSEIF rs_result-unresolved_text_count > 0.
      rs_result-diagnostic_result = c_result_text_resolution_gap.
    ELSE.
      rs_result-diagnostic_result = c_result_ok.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
