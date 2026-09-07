"! Portfolio-normalized implementation derived from an own training practice
"! (Curso 3, UNIDAD_4 — ABAP Cleaner). Hands-on practice implemented by
"! Francisco Quinteros during structured training and normalized for
"! portfolio use. See README.md in this folder for full provenance.
"!
"! Provenance gap, disclosed rather than silently fixed: the instructor
"! solution text this was extracted from shows GET_DATA's result
"! (LV_STATUS) computed in MAIN but never printed via OUT->WRITE. This may be
"! exactly how the original "before ABAP Cleaner" exercise code looked (the
"! exercise's own point is formatting/rule cleanup, not output correctness),
"! or it may be a line lost in PDF text extraction. Preserved as found rather
"! than inventing a print statement not confirmed to have existed.
CLASS zcl_c3_03_cleaner_demo_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS get_data
      EXPORTING ev_status TYPE string.

ENDCLASS.

CLASS zcl_c3_03_cleaner_demo_fq IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA lv_status TYPE string.
    me->get_data( IMPORTING ev_status = lv_status ).
  ENDMETHOD.

  METHOD get_data.
    SELECT FROM /dmo/flight
      FIELDS *
      INTO TABLE @DATA(lt_flights).
    IF sy-subrc EQ 0.
      ev_status = |Records consulted: { sy-dbcnt }|.
    ELSE.
      ev_status = 'Error'.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
