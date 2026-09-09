CLASS zcx_mm_contract_not_found DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA ebeln TYPE ekko-ebeln READ-ONLY.

    METHODS constructor
      IMPORTING
        iv_ebeln TYPE ekko-ebeln.
ENDCLASS.

CLASS zcx_mm_contract_not_found IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    ebeln = iv_ebeln.
  ENDMETHOD.
ENDCLASS.
