CLASS zcl_mm_contract_source_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_mm_contract_source.

    METHODS constructor
      IMPORTING
        is_snapshot TYPE zif_mm_contract_source=>ty_contract_snapshot.

  PRIVATE SECTION.
    DATA ms_snapshot TYPE zif_mm_contract_source=>ty_contract_snapshot.
ENDCLASS.

CLASS zcl_mm_contract_source_demo IMPLEMENTATION.
  METHOD constructor.
    ms_snapshot = is_snapshot.
  ENDMETHOD.

  METHOD zif_mm_contract_source~get_contract_snapshot.
    IF ms_snapshot-ebeln <> iv_ebeln.
      RAISE EXCEPTION TYPE zcx_mm_contract_not_found
        EXPORTING
          iv_ebeln = iv_ebeln.
    ENDIF.

    rs_snapshot = ms_snapshot.
  ENDMETHOD.
ENDCLASS.
