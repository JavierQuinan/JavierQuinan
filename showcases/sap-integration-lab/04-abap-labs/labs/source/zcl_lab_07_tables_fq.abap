"! Lab 07 (Part I) — Internal tables: VALUE constructor, INSERT INTO TABLE, APPEND
"! (single/VALUE/LINES OF), MOVE-CORRESPONDING, READ TABLE (INDEX/key), line_exists(),
"! line_index(), against the standard SAP flight-model demo data (/DMO/CONNECTION).
"! Portfolio evidence class. See PROVENANCE.md for authorship/derivation details.
CLASS zcl_lab_07_tables_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    TYPES: BEGIN OF ty_employee,
             id     TYPE i,
             email  TYPE string,
             ape1   TYPE string,
             ape2   TYPE string,
             name   TYPE string,
             fechan TYPE d,
             fechaa TYPE d,
           END OF ty_employee.
    TYPES tt_employee TYPE STANDARD TABLE OF ty_employee WITH EMPTY KEY.
    DATA mt_employees   TYPE tt_employee.
    DATA mt_employees_1 TYPE tt_employee.
    DATA mt_employees_2 TYPE tt_employee.
    DATA ms_employee    TYPE ty_employee.

    TYPES tt_connection TYPE STANDARD TABLE OF /dmo/connection WITH EMPTY KEY.
    DATA mt_spfli   TYPE tt_connection.
    DATA ms_spfli   TYPE /dmo/connection.
    DATA ms_spfli_2 TYPE /dmo/connection.

ENDCLASS.

CLASS zcl_lab_07_tables_fq IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " ================== 1. ADD RECORDS (synthetic demo data, not real employees) ==================
    mt_employees = VALUE #(
      ( id = 1 email = 'employee1@example.invalid' ape1 = 'perez' ape2 = 'gomez'
        name = 'juan' fechan = '19900101' fechaa = '20220101' )
      ( id = 2 email = 'employee2@example.invalid' ape1 = 'lopez' ape2 = 'martinez'
        name = 'ana' fechan = '19920202' fechaa = '20220202' )
    ).
    mt_employees_1 = mt_employees.
    out->write( EXPORTING data = mt_employees name = '1) Add records' ).

    " ================== 2. INSERT RECORD ==================
    CLEAR ms_employee.
    ms_employee-id     = 3.
    ms_employee-email  = 'employee3@example.invalid'.
    ms_employee-ape1   = 'lopez'.
    ms_employee-ape2   = 'martinez2'.
    ms_employee-name   = 'ana'.
    ms_employee-fechan = '19920202'.
    ms_employee-fechaa = '20220202'.
    INSERT ms_employee INTO TABLE mt_employees.
    out->write( EXPORTING data = mt_employees name = '2) Insert record' ).

    " ================== 3. APPEND VARIANTS ==================
    ms_employee = VALUE #( id = 5 email = 'employee5@example.invalid'
                           ape1 = 'torres' ape2 = 'ruiz' name = 'carlos'
                           fechan = '19590505' fechaa = '20220505' ).
    APPEND ms_employee TO mt_employees_2.
    APPEND VALUE #( id = 6 email = 'employee6@example.invalid'
                    ape1 = 'hernandez' ape2 = 'jimenez' name = 'laura'
                    fechan = '19960606' fechaa = '20220606' )
           TO mt_employees_2.
    IF lines( mt_employees_1 ) >= 3.
      APPEND LINES OF mt_employees_1 FROM 2 TO 3 TO mt_employees_2.
    ENDIF.
    out->write( EXPORTING data = mt_employees_2 name = '3) Append records' ).

    " ================== 4. CORRESPONDING (standard demo data: /DMO/CONNECTION) ==================
    SELECT * FROM /dmo/connection
      WHERE carrier_id = 'LH'
      INTO TABLE @mt_spfli.
    READ TABLE mt_spfli INTO ms_spfli INDEX 1.
    IF sy-subrc = 0.
      MOVE-CORRESPONDING ms_spfli TO ms_spfli_2.
      out->write( EXPORTING data = ms_spfli_2 name = '4) Corresponding demo' ).
    ENDIF.

    " ================== 5. READ TABLE INDEX ==================
    READ TABLE mt_spfli INTO ms_spfli INDEX 1.
    IF sy-subrc = 0.
      out->write( |5) Departure airport at index 1: { ms_spfli-airport_from_id }| ).
    ENDIF.

    " ================== 6. READ TABLE KEY ==================
    READ TABLE mt_spfli INTO ms_spfli WITH KEY airport_to_id = 'FRA'.
    IF sy-subrc = 0.
      out->write( |6) Departure city for FRA: { ms_spfli-airport_from_id }| ).
    ENDIF.

    " ================== 7. CHECK RECORDS ==================
    SELECT * FROM /dmo/connection
      WHERE connection_id > '0400'
      INTO TABLE @mt_spfli.
    out->write( EXPORTING data = mt_spfli name = '7) Connections > 0400' ).
    IF line_exists( mt_spfli[ connection_id = '0407' ] ).
      out->write( |7) Flight 0407 exists| ).
    ELSE.
      out->write( |7) Flight 0407 does not exist| ).
    ENDIF.

    " ================== 8. GET INDEX ==================
    DATA(lv_index) = line_index( mt_spfli[ connection_id = '0407' ] ).
    out->write( |8) Flight index 0407: { lv_index }| ).

    " ================== 9. LOOP KM ==================
    DATA lt_km TYPE tt_connection.
    SELECT * FROM /dmo/connection
      WHERE distance_unit = 'KM'
      INTO TABLE @lt_km.
    out->write( EXPORTING data = lt_km name = '9) Connections with KM' ).

  ENDMETHOD.

ENDCLASS.
