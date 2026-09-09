"! Portfolio-normalized implementation derived from an own training practice
"! (Curso 3, UNIDAD_5 — Authorizations). Hands-on practice implemented by
"! Francisco Quinteros during structured training and normalized for
"! portfolio use. See README.md in this folder for full provenance and the
"! required DDIC prerequisite objects (data element, authorization field,
"! authorization object) this class depends on.
"!
"! Naming note: AUTHORITY-CHECK references the short, unsuffixed DDIC names
"! 'ZAODEPA' / 'ZAFD' exactly as found in the original exercise output —
"! consistent with the 10-character SAP authorization-object/field name
"! limit, which made the course's suggested "_USER" suffix impractical for
"! these two object types. The portfolio-normalized DDIC objects below use a
"! different, `_fq`-suffixed set of short names for the same reason — see
"! README.md for the exact mapping.
CLASS zcl_c3_04_dept_auth_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.

CLASS zcl_c3_04_dept_auth_fq IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    AUTHORITY-CHECK OBJECT 'ZAODEPTFQ' ID 'ZAFDEPTFQ' FIELD '2'.
    IF sy-subrc EQ 0.
      SELECT FROM /dmo/airport
        FIELDS *
        INTO TABLE @DATA(lt_table).
      out->write( lt_table ).
    ELSE.
      out->write( 'The user does not have the necessary permissions' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
