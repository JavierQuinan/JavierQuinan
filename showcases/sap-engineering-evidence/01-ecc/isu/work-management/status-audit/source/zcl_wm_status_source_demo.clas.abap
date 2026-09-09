CLASS zcl_wm_status_source_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_wm_status_source.

    METHODS constructor
      IMPORTING
        is_snapshot TYPE zif_wm_status_source=>ty_status_snapshot.

  PRIVATE SECTION.
    DATA ms_snapshot TYPE zif_wm_status_source=>ty_status_snapshot.
ENDCLASS.

CLASS zcl_wm_status_source_demo IMPLEMENTATION.
  METHOD constructor.
    ms_snapshot = is_snapshot.
  ENDMETHOD.

  METHOD zif_wm_status_source~get_status_snapshot.
    IF ms_snapshot-aufnr <> iv_aufnr.
      RAISE EXCEPTION TYPE zcx_wm_order_not_found
        EXPORTING
          iv_aufnr = iv_aufnr.
    ENDIF.

    rs_snapshot = ms_snapshot.
  ENDMETHOD.
ENDCLASS.
