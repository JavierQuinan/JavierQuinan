"! Lab 05 (Part II) — continuation of string operations: OVERLAY, SUBSTRING/
"! SUBSTRING_BEFORE/SUBSTRING_AFTER, FIND with offset, REPLACE, regex validation,
"! REPLACE REGEX (strip leading zeros), REPEAT, ESCAPE (URL/JSON/string template).
"! Portfolio evidence class. See PROVENANCE.md for authorship/derivation details.
"!
"! Note: the sample email 'learner@example.com' used in regex_validation() is a
"! synthetic training-environment value from the course, not a real address.
CLASS zcl_lab_05_invoice_fqa DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    DATA: mv_sale        TYPE string,
          mv_sale_status TYPE string,
          mv_result      TYPE string,
          mv_status      TYPE string,
          mv_count       TYPE i,
          mv_request     TYPE string,
          mv_regex       TYPE string,
          mv_email       TYPE string,
          mv_idcustome   TYPE string,
          mv_format      TYPE string.

  PRIVATE SECTION.
    METHODS overlay_string       IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS substring_string     IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS find_string          IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS replace_string       IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS regex_validation     IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS remove_leading_zeros IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS repeat_string        IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS escape_string        IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.

CLASS zcl_lab_05_invoice_fqa IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    overlay_string(       out ).
    substring_string(     out ).
    find_string(          out ).
    replace_string(       out ).
    regex_validation(     out ).
    remove_leading_zeros( out ).
    repeat_string(        out ).
    escape_string(        out ).
  ENDMETHOD.

  METHOD overlay_string.
    me->mv_sale        = 'Purchase Completed'.
    me->mv_sale_status = 'Invoice'.
    OVERLAY me->mv_sale WITH me->mv_sale_status.
    ir_out->write( |{ me->mv_sale }| ).
  ENDMETHOD.

  METHOD substring_string.
    me->mv_result = 'SAP-ABAP-32-PE'.
    me->mv_result = substring( val = me->mv_result off = 9 len = 5 ).
    ir_out->write( |{ me->mv_result }| ).
    me->mv_result = 'SAP-ABAP-32-PE'.
    me->mv_result = substring_before( val = me->mv_result sub = 'ABAP' ).
    ir_out->write( |{ me->mv_result }| ).
    me->mv_result = 'SAP-ABAP-32-PE'.
    me->mv_result = substring_after( val = me->mv_result sub = 'ABAP' ).
    ir_out->write( |{ me->mv_result }| ).
  ENDMETHOD.

  METHOD find_string.
    me->mv_status = 'INVOICE GENERATED SUCCESSFULLY'.
    FIND 'GEN' IN me->mv_status MATCH OFFSET me->mv_count.
    ir_out->write( |Position of "GEN": { me->mv_count }| ).
    me->mv_count = count( val = me->mv_status sub = 'A' ).
    ir_out->write( |Count of "A": { me->mv_count }| ).
  ENDMETHOD.

  METHOD replace_string.
    me->mv_request = 'SAP-ABAP-32-PE'.
    REPLACE ALL OCCURRENCES OF '-' IN me->mv_request WITH '/'.
    ir_out->write( |{ me->mv_request }| ).
  ENDMETHOD.

  METHOD regex_validation.
    me->mv_regex = '^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$'.
    me->mv_email = 'learner@example.com'.
    FIND REGEX me->mv_regex IN me->mv_email MATCH OFFSET me->mv_count.
    IF sy-subrc = 0.
      ir_out->write( |Valid email: { me->mv_email }| ).
    ELSE.
      ir_out->write( |Invalid email: { me->mv_email }| ).
    ENDIF.
  ENDMETHOD.

  METHOD remove_leading_zeros.
    me->mv_idcustome = '0000012345'.
    me->mv_regex     = '0*'.
    REPLACE REGEX me->mv_regex IN me->mv_idcustome WITH ''.
    ir_out->write( |{ me->mv_idcustome }| ).
  ENDMETHOD.

  METHOD repeat_string.
    me->mv_idcustome = '12345'.
    me->mv_idcustome = repeat( val = me->mv_idcustome occ = 3 ).
    ir_out->write( |{ me->mv_idcustome }| ).
  ENDMETHOD.

  METHOD escape_string.
    me->mv_format = 'Send payment data via Internet'.
    ir_out->write( escape( val = me->mv_format format = cl_abap_format=>e_url_full ) ).
    ir_out->write( escape( val = me->mv_format format = cl_abap_format=>e_json_string ) ).
    ir_out->write( escape( val = me->mv_format format = cl_abap_format=>e_string_tpl ) ).
  ENDMETHOD.

ENDCLASS.
