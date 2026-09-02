CLASS ltcl_mm_contract_audit DEFINITION
  FINAL
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      returns_active FOR TESTING
        RAISING zcx_mm_contract_not_found,
      returns_expiring_soon FOR TESTING
        RAISING zcx_mm_contract_not_found,
      returns_expired FOR TESTING
        RAISING zcx_mm_contract_not_found,
      returns_not_yet_valid FOR TESTING
        RAISING zcx_mm_contract_not_found,
      returns_invalid_validity FOR TESTING
        RAISING zcx_mm_contract_not_found,
      returns_validity_incomplete FOR TESTING
        RAISING zcx_mm_contract_not_found,
      returns_no_items FOR TESTING
        RAISING zcx_mm_contract_not_found,
      preserves_target_indicators FOR TESTING
        RAISING zcx_mm_contract_not_found.
ENDCLASS.

CLASS ltcl_mm_contract_audit IMPLEMENTATION.
  METHOD returns_active.
    DATA ls_snapshot TYPE zif_mm_contract_source=>ty_contract_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_contract_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_contract_audit_service.
    DATA ls_result TYPE zcl_mm_contract_audit_service=>ty_result.

    ls_snapshot-ebeln = '4600000001'.
    ls_snapshot-valid_from = '20260101'.
    ls_snapshot-valid_to = '20261231'.
    ls_snapshot-item_count = 2.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_ebeln = ls_snapshot-ebeln
        iv_key_date = '20260901'
        iv_warning_days = 30
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_contract_audit_service=>c_status_active
      act = ls_result-status ).
  ENDMETHOD.

  METHOD returns_expiring_soon.
    DATA ls_snapshot TYPE zif_mm_contract_source=>ty_contract_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_contract_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_contract_audit_service.
    DATA ls_result TYPE zcl_mm_contract_audit_service=>ty_result.

    ls_snapshot-ebeln = '4600000002'.
    ls_snapshot-valid_from = '20260101'.
    ls_snapshot-valid_to = '20260920'.
    ls_snapshot-item_count = 1.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_ebeln = ls_snapshot-ebeln
        iv_key_date = '20260901'
        iv_warning_days = 30
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_contract_audit_service=>c_status_expiring_soon
      act = ls_result-status ).
    cl_abap_unit_assert=>assert_equals(
      exp = 19
      act = ls_result-days_to_expiry ).
  ENDMETHOD.

  METHOD returns_expired.
    DATA ls_snapshot TYPE zif_mm_contract_source=>ty_contract_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_contract_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_contract_audit_service.
    DATA ls_result TYPE zcl_mm_contract_audit_service=>ty_result.

    ls_snapshot-ebeln = '4600000003'.
    ls_snapshot-valid_from = '20260101'.
    ls_snapshot-valid_to = '20260831'.
    ls_snapshot-item_count = 1.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_ebeln = ls_snapshot-ebeln
        iv_key_date = '20260901'
        iv_warning_days = 30
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_contract_audit_service=>c_status_expired
      act = ls_result-status ).
  ENDMETHOD.

  METHOD returns_not_yet_valid.
    DATA ls_snapshot TYPE zif_mm_contract_source=>ty_contract_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_contract_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_contract_audit_service.
    DATA ls_result TYPE zcl_mm_contract_audit_service=>ty_result.

    ls_snapshot-ebeln = '4600000004'.
    ls_snapshot-valid_from = '20261001'.
    ls_snapshot-valid_to = '20261231'.
    ls_snapshot-item_count = 1.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_ebeln = ls_snapshot-ebeln
        iv_key_date = '20260901'
        iv_warning_days = 30
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_contract_audit_service=>c_status_not_yet_valid
      act = ls_result-status ).
  ENDMETHOD.

  METHOD returns_invalid_validity.
    DATA ls_snapshot TYPE zif_mm_contract_source=>ty_contract_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_contract_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_contract_audit_service.
    DATA ls_result TYPE zcl_mm_contract_audit_service=>ty_result.

    ls_snapshot-ebeln = '4600000005'.
    ls_snapshot-valid_from = '20261231'.
    ls_snapshot-valid_to = '20260101'.
    ls_snapshot-item_count = 1.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_ebeln = ls_snapshot-ebeln
        iv_key_date = '20260901'
        iv_warning_days = 30
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_contract_audit_service=>c_status_invalid_validity
      act = ls_result-status ).
  ENDMETHOD.

  METHOD returns_validity_incomplete.
    DATA ls_snapshot TYPE zif_mm_contract_source=>ty_contract_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_contract_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_contract_audit_service.
    DATA ls_result TYPE zcl_mm_contract_audit_service=>ty_result.

    ls_snapshot-ebeln = '4600000006'.
    ls_snapshot-valid_from = '20260101'.
    CLEAR ls_snapshot-valid_to.
    ls_snapshot-item_count = 1.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_ebeln = ls_snapshot-ebeln
        iv_key_date = '20260901'
        iv_warning_days = 30
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_contract_audit_service=>c_status_validity_incomplete
      act = ls_result-status ).
  ENDMETHOD.

  METHOD returns_no_items.
    DATA ls_snapshot TYPE zif_mm_contract_source=>ty_contract_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_contract_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_contract_audit_service.
    DATA ls_result TYPE zcl_mm_contract_audit_service=>ty_result.

    ls_snapshot-ebeln = '4600000007'.
    ls_snapshot-valid_from = '20260101'.
    ls_snapshot-valid_to = '20261231'.
    CLEAR ls_snapshot-item_count.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_ebeln = ls_snapshot-ebeln
        iv_key_date = '20260901'
        iv_warning_days = 30
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_contract_audit_service=>c_status_no_items
      act = ls_result-status ).
  ENDMETHOD.

  METHOD preserves_target_indicators.
    DATA ls_snapshot TYPE zif_mm_contract_source=>ty_contract_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_contract_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_contract_audit_service.
    DATA ls_result TYPE zcl_mm_contract_audit_service=>ty_result.

    ls_snapshot-ebeln = '4600000008'.
    ls_snapshot-lifnr = '0000001000'.
    ls_snapshot-ekorg = 'T001'.
    ls_snapshot-currency = 'USD'.
    ls_snapshot-target_value = 5000.
    ls_snapshot-valid_from = '20260101'.
    ls_snapshot-valid_to = '20261231'.
    ls_snapshot-item_count = 3.
    ls_snapshot-quantity_target_item_count = 2.
    ls_snapshot-value_target_item_count = 1.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_ebeln = ls_snapshot-ebeln
        iv_key_date = '20260901'
        iv_warning_days = 30
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = ls_snapshot-target_value
      act = ls_result-target_value ).
    cl_abap_unit_assert=>assert_equals(
      exp = 2
      act = ls_result-quantity_target_item_count ).
    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = ls_result-value_target_item_count ).
  ENDMETHOD.
ENDCLASS.
