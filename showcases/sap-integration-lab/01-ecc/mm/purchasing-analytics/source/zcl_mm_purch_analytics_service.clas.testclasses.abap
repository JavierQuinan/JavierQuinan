CLASS ltc_mm_purch_analytics DEFINITION
  FINAL
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS pr_only FOR TESTING.
    METHODS reference_gap FOR TESTING.
    METHODS po_without_schedule FOR TESTING.
    METHODS po_with_schedule FOR TESTING.
    METHODS pr_deleted FOR TESTING.
    METHODS po_item_deleted FOR TESTING.
    METHODS demo_source_roundtrip FOR TESTING
      RAISING zcx_mm_purch_not_found.
ENDCLASS.

CLASS ltc_mm_purch_analytics IMPLEMENTATION.
  METHOD pr_only.
    DATA ls_snapshot TYPE zif_mm_purch_source=>ty_snapshot.
    DATA ls_result TYPE zcl_mm_purch_analytics_service=>ty_result.
    DATA lo_service TYPE REF TO zcl_mm_purch_analytics_service.

    ls_snapshot-banfn = '10000001'.
    ls_snapshot-bnfpo = '00010'.

    CREATE OBJECT lo_service
      EXPORTING
        io_source = VALUE #( ).

    CALL METHOD lo_service->evaluate_snapshot
      EXPORTING is_snapshot = ls_snapshot
      RECEIVING rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      act = ls_result-diagnostic_result
      exp = zcl_mm_purch_analytics_service=>c_result_pr_only ).
  ENDMETHOD.

  METHOD reference_gap.
    DATA ls_snapshot TYPE zif_mm_purch_source=>ty_snapshot.
    DATA ls_result TYPE zcl_mm_purch_analytics_service=>ty_result.
    DATA lo_service TYPE REF TO zcl_mm_purch_analytics_service.

    ls_snapshot-banfn = '10000001'.
    ls_snapshot-bnfpo = '00010'.
    ls_snapshot-po_number = '4500000001'.
    ls_snapshot-po_item = '00010'.

    CREATE OBJECT lo_service.

    CALL METHOD lo_service->evaluate_snapshot
      EXPORTING is_snapshot = ls_snapshot
      RECEIVING rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      act = ls_result-diagnostic_result
      exp = zcl_mm_purch_analytics_service=>c_result_reference_gap ).
  ENDMETHOD.

  METHOD po_without_schedule.
    DATA ls_snapshot TYPE zif_mm_purch_source=>ty_snapshot.
    DATA ls_result TYPE zcl_mm_purch_analytics_service=>ty_result.
    DATA lo_service TYPE REF TO zcl_mm_purch_analytics_service.

    ls_snapshot-banfn = '10000001'.
    ls_snapshot-bnfpo = '00010'.
    ls_snapshot-po_number = '4500000001'.
    ls_snapshot-po_item = '00010'.
    ls_snapshot-po_header_found = abap_true.
    ls_snapshot-po_item_found = abap_true.
    ls_snapshot-schedule_count = 0.

    CREATE OBJECT lo_service.

    CALL METHOD lo_service->evaluate_snapshot
      EXPORTING is_snapshot = ls_snapshot
      RECEIVING rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      act = ls_result-diagnostic_result
      exp = zcl_mm_purch_analytics_service=>c_result_po_without_schedule ).
  ENDMETHOD.

  METHOD po_with_schedule.
    DATA ls_snapshot TYPE zif_mm_purch_source=>ty_snapshot.
    DATA ls_result TYPE zcl_mm_purch_analytics_service=>ty_result.
    DATA lo_service TYPE REF TO zcl_mm_purch_analytics_service.

    ls_snapshot-banfn = '10000001'.
    ls_snapshot-bnfpo = '00010'.
    ls_snapshot-po_number = '4500000001'.
    ls_snapshot-po_item = '00010'.
    ls_snapshot-po_header_found = abap_true.
    ls_snapshot-po_item_found = abap_true.
    ls_snapshot-schedule_count = 2.
    ls_snapshot-earliest_delivery_date = '20260201'.
    ls_snapshot-latest_delivery_date = '20260215'.

    CREATE OBJECT lo_service.

    CALL METHOD lo_service->evaluate_snapshot
      EXPORTING is_snapshot = ls_snapshot
      RECEIVING rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      act = ls_result-diagnostic_result
      exp = zcl_mm_purch_analytics_service=>c_result_po_with_schedule ).
    cl_abap_unit_assert=>assert_equals(
      act = ls_result-schedule_count
      exp = 2 ).
  ENDMETHOD.

  METHOD pr_deleted.
    DATA ls_snapshot TYPE zif_mm_purch_source=>ty_snapshot.
    DATA ls_result TYPE zcl_mm_purch_analytics_service=>ty_result.
    DATA lo_service TYPE REF TO zcl_mm_purch_analytics_service.

    ls_snapshot-banfn = '10000001'.
    ls_snapshot-bnfpo = '00010'.
    ls_snapshot-pr_deleted = 'X'.

    CREATE OBJECT lo_service.

    CALL METHOD lo_service->evaluate_snapshot
      EXPORTING is_snapshot = ls_snapshot
      RECEIVING rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      act = ls_result-diagnostic_result
      exp = zcl_mm_purch_analytics_service=>c_result_pr_deleted ).
  ENDMETHOD.

  METHOD po_item_deleted.
    DATA ls_snapshot TYPE zif_mm_purch_source=>ty_snapshot.
    DATA ls_result TYPE zcl_mm_purch_analytics_service=>ty_result.
    DATA lo_service TYPE REF TO zcl_mm_purch_analytics_service.

    ls_snapshot-banfn = '10000001'.
    ls_snapshot-bnfpo = '00010'.
    ls_snapshot-po_number = '4500000001'.
    ls_snapshot-po_item = '00010'.
    ls_snapshot-po_header_found = abap_true.
    ls_snapshot-po_item_found = abap_true.
    ls_snapshot-po_item_deleted = 'X'.

    CREATE OBJECT lo_service.

    CALL METHOD lo_service->evaluate_snapshot
      EXPORTING is_snapshot = ls_snapshot
      RECEIVING rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      act = ls_result-diagnostic_result
      exp = zcl_mm_purch_analytics_service=>c_result_po_item_deleted ).
  ENDMETHOD.

  METHOD demo_source_roundtrip.
    DATA lo_source TYPE REF TO zif_mm_purch_source.
    DATA lo_service TYPE REF TO zcl_mm_purch_analytics_service.
    DATA ls_result TYPE zcl_mm_purch_analytics_service=>ty_result.

    CREATE OBJECT lo_source TYPE zcl_mm_purch_source_demo.
    CREATE OBJECT lo_service
      EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_banfn = '10000001'
        iv_bnfpo = '00010'
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      act = ls_result-diagnostic_result
      exp = zcl_mm_purch_analytics_service=>c_result_po_with_schedule ).
    cl_abap_unit_assert=>assert_equals(
      act = ls_result-schedule_count
      exp = 2 ).
  ENDMETHOD.
ENDCLASS.
