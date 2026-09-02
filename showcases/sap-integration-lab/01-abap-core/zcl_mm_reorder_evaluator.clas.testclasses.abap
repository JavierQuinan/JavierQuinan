CLASS ltcl_mm_reorder_evaluator DEFINITION
  FINAL
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      returns_ok_for_sufficient_stock FOR TESTING,
      requests_reorder_below_target FOR TESTING,
      marks_critical_below_safety FOR TESTING,
      handles_exact_target_boundary FOR TESTING.
ENDCLASS.

CLASS ltcl_mm_reorder_evaluator IMPLEMENTATION.
  METHOD returns_ok_for_sufficient_stock.
    DATA(result) = zcl_mm_reorder_evaluator=>evaluate(
      current_stock = 120
      reorder_point = 80
      safety_stock  = 20 ).

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_reorder_evaluator=>c_status_ok
      act = result-status ).
    cl_abap_unit_assert=>assert_equals(
      exp = 0
      act = result-shortage_qty ).
  ENDMETHOD.

  METHOD requests_reorder_below_target.
    DATA(result) = zcl_mm_reorder_evaluator=>evaluate(
      current_stock = 70
      reorder_point = 80
      safety_stock  = 20 ).

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_reorder_evaluator=>c_status_reorder
      act = result-status ).
    cl_abap_unit_assert=>assert_equals(
      exp = 30
      act = result-shortage_qty ).
  ENDMETHOD.

  METHOD marks_critical_below_safety.
    DATA(result) = zcl_mm_reorder_evaluator=>evaluate(
      current_stock = 10
      reorder_point = 80
      safety_stock  = 20 ).

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_reorder_evaluator=>c_status_critical
      act = result-status ).
    cl_abap_unit_assert=>assert_equals(
      exp = 90
      act = result-shortage_qty ).
  ENDMETHOD.

  METHOD handles_exact_target_boundary.
    DATA(result) = zcl_mm_reorder_evaluator=>evaluate(
      current_stock = 100
      reorder_point = 80
      safety_stock  = 20 ).

    cl_abap_unit_assert=>assert_equals(
      exp = zcl_mm_reorder_evaluator=>c_status_ok
      act = result-status ).
    cl_abap_unit_assert=>assert_equals(
      exp = 0
      act = result-shortage_qty ).
  ENDMETHOD.
ENDCLASS.
