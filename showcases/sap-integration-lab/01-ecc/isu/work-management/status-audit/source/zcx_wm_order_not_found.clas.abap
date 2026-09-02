CLASS zcx_wm_order_not_found DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA aufnr TYPE aufk-aufnr READ-ONLY.

    METHODS constructor
      IMPORTING
        iv_aufnr TYPE aufk-aufnr.
ENDCLASS.

CLASS zcx_wm_order_not_found IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    aufnr = iv_aufnr.
  ENDMETHOD.
ENDCLASS.
