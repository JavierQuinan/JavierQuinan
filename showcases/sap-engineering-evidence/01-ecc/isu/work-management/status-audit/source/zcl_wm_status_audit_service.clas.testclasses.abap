CLASS ltcl_wm_status_audit DEFINITION
  FINAL
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      returns_ok_for_resolved_active_status FOR TESTING
        RAISING zcx_wm_order_not_found,
      returns_no_active_status FOR TESTING
        RAISING zcx_wm_order_not_found,
      detects_missing_user_profile FOR TESTING
        RAISING zcx_wm_order_not_found,
      detects_text_resolution_gap FOR TESTING
        RAISING zcx_wm_order_not_found,
      separates_historical_statuses FOR TESTING
        RAISING zcx_wm_order_not_found,
      preserves_change_metadata FOR TESTING
        RAISING zcx_wm_order_not_found.
ENDCLASS.

CLASS ltcl_wm_status_audit IMPLEMENTATION.
  METHOD returns_ok_for_resolved_active_status.
    DATA ls_snapshot TYPE zif_wm_status_source=>ty_status_snapshot.
    DATA ls_status TYPE zif_wm_status_source=>ty_status_entry.
    DATA lo_source TYPE REF TO zcl_wm_status_source_demo.
    DATA lo_service TYPE REF TO zcl_wm_status_audit_service.
    DATA ls_result TYPE zcl_wm_status_audit_service=>ty_result.

    ls_snapshot-aufnr = '100000000001'.
    ls_snapshot-objnr = 'OR100000000001'.
    ls_status-stat = 'I0001'.
    ls_status-status_kind = 'SYSTEM'.
    ls_status-txt04 = 'CRTD'.
    ls_status-txt30 = 'Created'.
    APPEND ls_status TO ls_snapshot-statuses.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING iv_aufnr = ls_snapshot-aufnr
      RECEIVING rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_wm_status_audit_service=>c_result_ok
      act = ls_result-diagnostic_result ).
    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = ls_result-active_system_count ).
  ENDMETHOD.

  METHOD returns_no_active_status.
    DATA ls_snapshot TYPE zif_wm_status_source=>ty_status_snapshot.
    DATA ls_status TYPE zif_wm_status_source=>ty_status_entry.
    DATA lo_source TYPE REF TO zcl_wm_status_source_demo.
    DATA lo_service TYPE REF TO zcl_wm_status_audit_service.
    DATA ls_result TYPE zcl_wm_status_audit_service=>ty_result.

    ls_snapshot-aufnr = '100000000002'.
    ls_snapshot-objnr = 'OR100000000002'.
    ls_status-stat = 'I0001'.
    ls_status-inact = 'X'.
    ls_status-status_kind = 'SYSTEM'.
    ls_status-txt04 = 'CRTD'.
    APPEND ls_status TO ls_snapshot-statuses.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING iv_aufnr = ls_snapshot-aufnr
      RECEIVING rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_wm_status_audit_service=>c_result_no_active_status
      act = ls_result-diagnostic_result ).
    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = ls_result-historical_count ).
  ENDMETHOD.

  METHOD detects_missing_user_profile.
    DATA ls_snapshot TYPE zif_wm_status_source=>ty_status_snapshot.
    DATA ls_status TYPE zif_wm_status_source=>ty_status_entry.
    DATA lo_source TYPE REF TO zcl_wm_status_source_demo.
    DATA lo_service TYPE REF TO zcl_wm_status_audit_service.
    DATA ls_result TYPE zcl_wm_status_audit_service=>ty_result.

    ls_snapshot-aufnr = '100000000003'.
    ls_snapshot-objnr = 'OR100000000003'.
    CLEAR ls_snapshot-stsma.
    ls_status-stat = 'E0001'.
    ls_status-status_kind = 'USER'.
    ls_status-txt04 = 'OPEN'.
    APPEND ls_status TO ls_snapshot-statuses.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING iv_aufnr = ls_snapshot-aufnr
      RECEIVING rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_wm_status_audit_service=>c_result_user_profile_missing
      act = ls_result-diagnostic_result ).
    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = ls_result-active_user_count ).
  ENDMETHOD.

  METHOD detects_text_resolution_gap.
    DATA ls_snapshot TYPE zif_wm_status_source=>ty_status_snapshot.
    DATA ls_status TYPE zif_wm_status_source=>ty_status_entry.
    DATA lo_source TYPE REF TO zcl_wm_status_source_demo.
    DATA lo_service TYPE REF TO zcl_wm_status_audit_service.
    DATA ls_result TYPE zcl_wm_status_audit_service=>ty_result.

    ls_snapshot-aufnr = '100000000004'.
    ls_snapshot-objnr = 'OR100000000004'.
    ls_status-stat = 'I9999'.
    ls_status-status_kind = 'SYSTEM'.
    CLEAR: ls_status-txt04, ls_status-txt30.
    APPEND ls_status TO ls_snapshot-statuses.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING iv_aufnr = ls_snapshot-aufnr
      RECEIVING rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_wm_status_audit_service=>c_result_text_resolution_gap
      act = ls_result-diagnostic_result ).
    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = ls_result-unresolved_text_count ).
  ENDMETHOD.

  METHOD separates_historical_statuses.
    DATA ls_snapshot TYPE zif_wm_status_source=>ty_status_snapshot.
    DATA ls_active TYPE zif_wm_status_source=>ty_status_entry.
    DATA ls_history TYPE zif_wm_status_source=>ty_status_entry.
    DATA lo_source TYPE REF TO zcl_wm_status_source_demo.
    DATA lo_service TYPE REF TO zcl_wm_status_audit_service.
    DATA ls_result TYPE zcl_wm_status_audit_service=>ty_result.

    ls_snapshot-aufnr = '100000000005'.
    ls_snapshot-objnr = 'OR100000000005'.

    ls_active-stat = 'I0002'.
    ls_active-status_kind = 'SYSTEM'.
    ls_active-txt04 = 'REL'.
    APPEND ls_active TO ls_snapshot-statuses.

    ls_history-stat = 'I0001'.
    ls_history-inact = 'X'.
    ls_history-status_kind = 'SYSTEM'.
    ls_history-txt04 = 'CRTD'.
    APPEND ls_history TO ls_snapshot-statuses.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING iv_aufnr = ls_snapshot-aufnr
      RECEIVING rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = ls_result-active_system_count ).
    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = ls_result-historical_count ).
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_wm_status_audit_service=>c_result_ok
      act = ls_result-diagnostic_result ).
  ENDMETHOD.

  METHOD preserves_change_metadata.
    DATA ls_snapshot TYPE zif_wm_status_source=>ty_status_snapshot.
    DATA ls_status TYPE zif_wm_status_source=>ty_status_entry.
    DATA lo_source TYPE REF TO zcl_wm_status_source_demo.
    DATA lo_service TYPE REF TO zcl_wm_status_audit_service.
    DATA ls_result TYPE zcl_wm_status_audit_service=>ty_result.

    ls_snapshot-aufnr = '100000000006'.
    ls_snapshot-objnr = 'OR100000000006'.
    ls_snapshot-change_count = 7.
    ls_snapshot-latest_change_date = '20260901'.
    ls_snapshot-latest_change_time = '143000'.

    ls_status-stat = 'I0002'.
    ls_status-status_kind = 'SYSTEM'.
    ls_status-txt04 = 'REL'.
    APPEND ls_status TO ls_snapshot-statuses.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING iv_aufnr = ls_snapshot-aufnr
      RECEIVING rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = 7
      act = ls_result-change_count ).
    cl_abap_unit_assert=>assert_equals(
      exp = ls_snapshot-latest_change_date
      act = ls_result-latest_change_date ).
  ENDMETHOD.
ENDCLASS.
