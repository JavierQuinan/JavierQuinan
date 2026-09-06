"! Lab 08 — Field symbols: ASSIGN to a variable, ASSIGN to a table line while looping,
"! APPEND/INSERT ... ASSIGNING, READ TABLE ... ASSIGNING, and a date-field coercion cast.
"! Portfolio evidence class. See PROVENANCE.md for authorship/derivation details.
"!
"! Dependency note: reads training-environment table ZEMP_LOGALI into an internal table.
"! Changes below affect only the in-memory copy; no database write is performed.
"! ZEMP_LOGALI is not distributed with this evidence. Email literals use reserved
"! example.invalid addresses and are not real contact data.
CLASS zcl_lab_08_fieldsymbols_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.

CLASS zcl_lab_08_fieldsymbols_fq IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " Initial declarations
    DATA: lv_employee TYPE string,
          lv_date     TYPE d.
    FIELD-SYMBOLS: <lv_employee> TYPE string,
                   <ls_employee> TYPE zemp_logali,
                   <lv_date_fs>  TYPE d.

    " 1. Assign and change a scalar via field symbol
    lv_employee = 'Carlos Medina'.
    ASSIGN lv_employee TO <lv_employee>.
    <lv_employee> = 'Daniel Herrera'.
    out->write( |Employee Name: { lv_employee }| ).

    " 2. Inline declaration and bulk email update
    SELECT * FROM zemp_logali INTO TABLE @DATA(lt_employees).
    LOOP AT lt_employees ASSIGNING <ls_employee>.
      <ls_employee>-email = 'employee0@example.invalid'.
    ENDLOOP.

    " 3. Add a record with APPEND ... ASSIGNING
    APPEND VALUE #( name  = 'Andrea Torres'
                    email = 'employee1@example.invalid' )
      TO lt_employees ASSIGNING <ls_employee>.
    IF <ls_employee> IS ASSIGNED.
      out->write( |New Employee Added: { <ls_employee>-name }| ).
      UNASSIGN <ls_employee>.
    ENDIF.

    " 4. Insert a record at index 2 with INSERT ... ASSIGNING
    INSERT VALUE #( name  = 'Roberto Castillo'
                    email = 'employee2@example.invalid' )
      INTO lt_employees INDEX 2 ASSIGNING <ls_employee>.
    IF <ls_employee> IS ASSIGNED.
      out->write( |Inserted Employee: { <ls_employee>-name }| ).
      UNASSIGN <ls_employee>.
    ENDIF.

    " 5. Read a record and modify fields
    READ TABLE lt_employees ASSIGNING <ls_employee> INDEX 1.
    IF <ls_employee> IS ASSIGNED.
      <ls_employee>-name  = 'Juliana Pérez'.
      <ls_employee>-email = 'employee3@example.invalid'.
      out->write( |Updated Employee: { <ls_employee>-name }| ).
    ENDIF.

    " 6. Coercion — date-field cast
    lv_date = sy-datum.
    ASSIGN lv_date TO <lv_date_fs>.
    out->write( |Today's Date: { <lv_date_fs> }| ).

  ENDMETHOD.

ENDCLASS.
