CLASS zcx_mm_purch_not_found DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA banfn TYPE eban-banfn READ-ONLY.
    DATA bnfpo TYPE eban-bnfpo READ-ONLY.

    METHODS constructor
      IMPORTING
        iv_banfn TYPE eban-banfn
        iv_bnfpo TYPE eban-bnfpo.
ENDCLASS.

CLASS zcx_mm_purch_not_found IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    banfn = iv_banfn.
    bnfpo = iv_bnfpo.
  ENDMETHOD.
ENDCLASS.
