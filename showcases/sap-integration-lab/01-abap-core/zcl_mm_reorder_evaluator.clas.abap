CLASS zcl_mm_reorder_evaluator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CONSTANTS:
      c_status_ok       TYPE string VALUE 'OK',
      c_status_reorder  TYPE string VALUE 'REORDER',
      c_status_critical TYPE string VALUE 'CRITICAL'.

    TYPES:
      BEGIN OF ty_result,
        status       TYPE string,
        shortage_qty TYPE i,
      END OF ty_result.

    CLASS-METHODS evaluate
      IMPORTING
        current_stock TYPE i
        reorder_point TYPE i
        safety_stock  TYPE i
      RETURNING
        VALUE(result) TYPE ty_result.
ENDCLASS.

CLASS zcl_mm_reorder_evaluator IMPLEMENTATION.
  METHOD evaluate.
    DATA(required_stock) = reorder_point + safety_stock.

    result-shortage_qty = required_stock - current_stock.
    IF result-shortage_qty < 0.
      result-shortage_qty = 0.
    ENDIF.

    IF current_stock < safety_stock.
      result-status = c_status_critical.
    ELSEIF current_stock < required_stock.
      result-status = c_status_reorder.
    ELSE.
      result-status = c_status_ok.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
