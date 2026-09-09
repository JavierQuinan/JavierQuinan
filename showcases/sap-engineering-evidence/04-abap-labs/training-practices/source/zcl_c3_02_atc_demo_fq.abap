"! Portfolio-normalized implementation derived from an own training practice
"! (Curso 3, UNIDAD_3 — ATC / ABAP Test Cockpit). Hands-on practice implemented
"! by Francisco Quinteros during structured training and normalized for
"! portfolio use. See README.md in this folder for full provenance.
"!
"! Intentional note: the unfiltered SELECT below is kept exactly as in the
"! original exercise, on purpose — the exercise's own teaching point is
"! running an ATC check with the ABAP_CLOUD_READINESS variant, seeing it flag
"! "Table /DMO/FLIGHT: No WHERE condition", fixing the separate
"! "Strings without text elements" finding with ##NO_TEXT, and then creating a
"! documented ATC exemption for the first finding as a deliberate false
"! positive. Adding a WHERE clause would remove the very finding the exercise
"! exists to demonstrate handling.
CLASS zcl_c3_02_atc_demo_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS get_data
      RETURNING VALUE(rv_status) TYPE string.

ENDCLASS.

CLASS zcl_c3_02_atc_demo_fq IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write( me->get_data( ) ).
  ENDMETHOD.

  METHOD get_data.
    SELECT FROM /dmo/flight
      FIELDS *
      INTO TABLE @DATA(lt_flights).
    IF sy-subrc EQ 0.
      rv_status = |Records consulted: { sy-dbcnt }| ##NO_TEXT.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
