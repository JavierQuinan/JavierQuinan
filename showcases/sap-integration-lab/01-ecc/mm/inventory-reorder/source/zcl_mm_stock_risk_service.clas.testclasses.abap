CLASS ltcl_mm_stock_risk_service DEFINITION
  FINAL
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      returns_ok_above_reorder FOR TESTING
        RAISING zcx_mm_stock_not_found,
      returns_reorder_at_point FOR TESTING
        RAISING zcx_mm_stock_not_found,
      returns_critical_below_safety FOR TESTING
        RAISING zcx_mm_stock_not_found,
      calculates_shortage_to_reorder FOR TESTING
        RAISING zcx_mm_stock_not_found,
      returns_not_configured FOR TESTING
        RAISING zcx_mm_stock_not_found,
      uses_plant_stock_for_status FOR TESTING
        RAISING zcx_mm_stock_not_found.
ENDCLASS.

CLASS ltcl_mm_stock_risk_service IMPLEMENTATION.
  METHOD returns_ok_above_reorder.
    DATA ls_snapshot TYPE zif_mm_stock_source=>ty_stock_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_stock_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_stock_risk_service.
    DATA ls_result TYPE zcl_mm_stock_risk_service=>ty_result.

    ls_snapshot-matnr = 'TEST_MAT_01'.
    ls_snapshot-werks = 'T001'.
    ls_snapshot-lgort = '0001'.
    ls_snapshot-mrp_type = 'VB'.
    ls_snapshot-storage_unrestricted = 120.
    ls_snapshot-plant_unrestricted = 120.
    ls_snapshot-reorder_point = 80.
    ls_snapshot-safety_stock = 20.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_matnr = ls_snapshot-matnr
        iv_werks = ls_snapshot-werks
        iv_lgort = ls_snapshot-lgort
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_stock_risk_service=>c_status_ok
      act = ls_result-status ).
  ENDMETHOD.

  METHOD returns_reorder_at_point.
    DATA ls_snapshot TYPE zif_mm_stock_source=>ty_stock_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_stock_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_stock_risk_service.
    DATA ls_result TYPE zcl_mm_stock_risk_service=>ty_result.

    ls_snapshot-matnr = 'TEST_MAT_02'.
    ls_snapshot-werks = 'T001'.
    ls_snapshot-lgort = '0001'.
    ls_snapshot-mrp_type = 'VB'.
    ls_snapshot-storage_unrestricted = 80.
    ls_snapshot-plant_unrestricted = 80.
    ls_snapshot-reorder_point = 80.
    ls_snapshot-safety_stock = 20.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_matnr = ls_snapshot-matnr
        iv_werks = ls_snapshot-werks
        iv_lgort = ls_snapshot-lgort
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_stock_risk_service=>c_status_reorder
      act = ls_result-status ).
  ENDMETHOD.

  METHOD returns_critical_below_safety.
    DATA ls_snapshot TYPE zif_mm_stock_source=>ty_stock_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_stock_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_stock_risk_service.
    DATA ls_result TYPE zcl_mm_stock_risk_service=>ty_result.

    ls_snapshot-matnr = 'TEST_MAT_03'.
    ls_snapshot-werks = 'T001'.
    ls_snapshot-lgort = '0001'.
    ls_snapshot-mrp_type = 'VB'.
    ls_snapshot-storage_unrestricted = 10.
    ls_snapshot-plant_unrestricted = 10.
    ls_snapshot-reorder_point = 80.
    ls_snapshot-safety_stock = 20.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_matnr = ls_snapshot-matnr
        iv_werks = ls_snapshot-werks
        iv_lgort = ls_snapshot-lgort
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_stock_risk_service=>c_status_critical
      act = ls_result-status ).
  ENDMETHOD.

  METHOD calculates_shortage_to_reorder.
    DATA ls_snapshot TYPE zif_mm_stock_source=>ty_stock_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_stock_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_stock_risk_service.
    DATA ls_result TYPE zcl_mm_stock_risk_service=>ty_result.

    ls_snapshot-matnr = 'TEST_MAT_04'.
    ls_snapshot-werks = 'T001'.
    ls_snapshot-lgort = '0001'.
    ls_snapshot-mrp_type = 'VB'.
    ls_snapshot-storage_unrestricted = 25.
    ls_snapshot-plant_unrestricted = 55.
    ls_snapshot-reorder_point = 80.
    ls_snapshot-safety_stock = 20.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_matnr = ls_snapshot-matnr
        iv_werks = ls_snapshot-werks
        iv_lgort = ls_snapshot-lgort
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = 25
      act = ls_result-shortage_qty ).
  ENDMETHOD.

  METHOD returns_not_configured.
    DATA ls_snapshot TYPE zif_mm_stock_source=>ty_stock_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_stock_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_stock_risk_service.
    DATA ls_result TYPE zcl_mm_stock_risk_service=>ty_result.

    ls_snapshot-matnr = 'TEST_MAT_05'.
    ls_snapshot-werks = 'T001'.
    ls_snapshot-lgort = '0001'.
    ls_snapshot-mrp_type = 'PD'.
    ls_snapshot-storage_unrestricted = 40.
    ls_snapshot-plant_unrestricted = 100.
    CLEAR ls_snapshot-reorder_point.
    CLEAR ls_snapshot-safety_stock.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_matnr = ls_snapshot-matnr
        iv_werks = ls_snapshot-werks
        iv_lgort = ls_snapshot-lgort
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_stock_risk_service=>c_status_not_configured
      act = ls_result-status ).
  ENDMETHOD.

  METHOD uses_plant_stock_for_status.
    DATA ls_snapshot TYPE zif_mm_stock_source=>ty_stock_snapshot.
    DATA lo_source TYPE REF TO zcl_mm_stock_source_demo.
    DATA lo_service TYPE REF TO zcl_mm_stock_risk_service.
    DATA ls_result TYPE zcl_mm_stock_risk_service=>ty_result.

    ls_snapshot-matnr = 'TEST_MAT_06'.
    ls_snapshot-werks = 'T001'.
    ls_snapshot-lgort = '0001'.
    ls_snapshot-mrp_type = 'VB'.
    ls_snapshot-storage_unrestricted = 5.
    ls_snapshot-plant_unrestricted = 120.
    ls_snapshot-reorder_point = 80.
    ls_snapshot-safety_stock = 20.

    CREATE OBJECT lo_source EXPORTING is_snapshot = ls_snapshot.
    CREATE OBJECT lo_service EXPORTING io_source = lo_source.

    CALL METHOD lo_service->evaluate
      EXPORTING
        iv_matnr = ls_snapshot-matnr
        iv_werks = ls_snapshot-werks
        iv_lgort = ls_snapshot-lgort
      RECEIVING
        rs_result = ls_result.

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_stock_risk_service=>c_status_ok
      act = ls_result-status ).
    cl_abap_unit_assert=>assert_equals(
      exp = 5
      act = ls_result-storage_unrestricted ).
    cl_abap_unit_assert=>assert_equals(
      exp = 120
      act = ls_result-plant_unrestricted ).
  ENDMETHOD.
ENDCLASS.
