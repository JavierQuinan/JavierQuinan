"! Lab 04 — Text symbols, string description functions (STRLEN/NUMOFCHAR/COUNT/FIND),
"! case-conversion functions, and regex validation (CONTAINS).
"! Portfolio evidence class. See PROVENANCE.md for authorship/derivation details.
"!
"! Dependency note: TEXT-001 is an ABAP text-pool symbol maintained in the class's
"! "Text Elements" tab in ADT. It is not reproduced here because text-pool content
"! is not part of the source code file; recreate TEXT-001 with any short label
"! to compile this class as-is, or replace the reference with a literal string.
CLASS zcl_lab_04_message_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.

CLASS zcl_lab_04_message_fq IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( |--- [1] Símbolos de texto ---| ).
    out->write( |{ TEXT-001 }| ).

    DATA: lv_order_status TYPE string VALUE 'Compra Realizada Exitosamente',
          lv_char_number  TYPE i.

    out->write( |--- [2] Funciones de descripción ---| ).
    lv_char_number = strlen( lv_order_status ).
    out->write( |Longitud (STRLEN)           = { lv_char_number }| ).
    lv_char_number = numofchar( lv_order_status ).
    out->write( |Longitud (NUMOFCHAR)        = { lv_char_number }| ).
    lv_char_number = count( val = lv_order_status sub = 'A' case = abap_false ).
    out->write( |Cantidad de 'A' (case-insensitive) = { lv_char_number }| ).
    lv_char_number = -1.
    FIND FIRST OCCURRENCE OF 'Exit' IN lv_order_status MATCH OFFSET lv_char_number.
    out->write( |Posición de 'Exit'         = { lv_char_number }| ).

    out->write( |--- [3] Funciones de procesamiento ---| ).
    out->write( |UPPER    = { to_upper( lv_order_status ) }| ).
    out->write( |LOWER    = { to_lower( lv_order_status ) }| ).
    out->write( |MIXED    = { to_mixed( lv_order_status ) }| ).
    DATA(lv_shifted) = lv_order_status+9 && lv_order_status(9).
    out->write( |SHIFTED  = { lv_shifted }| ).
    DATA(lv_completed) = lv_order_status+9(9).
    out->write( |EXTRACT  = { lv_completed }| ).
    DATA(lv_reversed) = reverse( lv_order_status ).
    out->write( |REVERSE  = { lv_reversed }| ).

    out->write( |--- [4] Funciones de contenido ---| ).
    DATA: lv_pattern TYPE string VALUE '\d{3}-\d{3}-\d{4}',
          lv_phone   TYPE string VALUE 'Agregar cualquier teléfono'.
    IF contains( val = lv_phone regex = lv_pattern ).
      out->write( |Teléfono válido: { lv_phone }| ).
    ELSE.
      out->write( |Teléfono inválido: { lv_phone }| ).
    ENDIF.

    out->write( |--- [5] Validación de correo con regex ---| ).
    DATA lv_email  TYPE string VALUE 'Agregar cualquier correo'.
    DATA lv_patter TYPE string.
    lv_patter = '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'.
    IF contains( val = lv_email regex = lv_patter ).
      out->write( |Válido  : { lv_email }| ).
    ELSE.
      out->write( |Inválido: { lv_email }| ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
