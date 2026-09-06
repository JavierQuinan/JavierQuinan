"! Lab 07 (Part II) — Advanced internal table operations against the standard SAP
"! flight-model demo data (/DMO/FLIGHT, /DMO/CONNECTION, /DMO/CARRIER): FOR expressions,
"! nested FOR, multi-line SELECT, SORT, MODIFY, DELETE, CLEAR/FREE, COLLECT, LET, BASE,
"! three GROUP BY variants (simple key / VALUE key / FOR GROUPS), RANGE tables, ENUM types.
"! Portfolio evidence class. See PROVENANCE.md for authorship/derivation details.
"!
"! Note: add_flights_with_for() calls cl_abap_context_info=>get_user_technical_name( )
"! and embeds it into a demo field (iduser). That call returns the *current* system's
"! technical user name at runtime — it does not hardcode any identifier from the
"! original training system, so this class carries no personal/system identifier itself.
CLASS zcl_lab_07_tables_fqa DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    "---------------------- Local types ----------------------
    TYPES: BEGIN OF ty_flights,
             iduser     TYPE c LENGTH 40,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights.
    TYPES: BEGIN OF ty_airlines,
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
           END OF ty_airlines.
    TYPES: BEGIN OF ty_seats,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             seats         TYPE /dmo/plane_seats_occupied,
             bookings      TYPE /dmo/flight_price,
           END OF ty_seats.
    TYPES: BEGIN OF ty_range,
             sign   TYPE c LENGTH 1,
             option TYPE c LENGTH 2,
             low    TYPE i,
             high   TYPE i,
           END OF ty_range.

    " ENUM (activity 15)
    TYPES ty_currency TYPE c LENGTH 3.
    TYPES: BEGIN OF ENUM mty_currency BASE TYPE ty_currency,
             c_initial VALUE IS INITIAL,
             c_dollar  VALUE 'USD',
             c_euros   VALUE 'EUR',
             c_colpeso VALUE 'COP',
             c_mexpeso VALUE 'MEX',
           END OF ENUM mty_currency.

    "---------------------- Work tables ------------------
    DATA: lt_flights       TYPE STANDARD TABLE OF ty_flights WITH EMPTY KEY,
          lt_flights_info  TYPE STANDARD TABLE OF ty_flights WITH EMPTY KEY,
          mt_flights_type  TYPE STANDARD TABLE OF /dmo/flight     WITH EMPTY KEY,
          mt_airline       TYPE STANDARD TABLE OF /dmo/connection WITH EMPTY KEY,
          mt_scarr         TYPE STANDARD TABLE OF /dmo/carrier    WITH EMPTY KEY.

    "---------------------- Methods (15 activities) ----------
    METHODS add_flights_with_for   IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS nested_for             IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS add_multiple_lines     IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS sort_records           IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS modify_records         IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS delete_records         IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS clear_free_memory      IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS collect_records        IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS use_let                IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS use_base               IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS group_records          IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS group_by_key           IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS for_groups             IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS use_range_tables       IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS use_enumerations       IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.

CLASS zcl_lab_07_tables_fqa IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    me->add_flights_with_for(   out ).
    me->nested_for(             out ).
    me->add_multiple_lines(     out ).
    me->sort_records(           out ).
    me->modify_records(         out ).
    me->delete_records(         out ).
    me->clear_free_memory(      out ).
    me->collect_records(        out ).
    me->use_let(                out ).
    me->use_base(               out ).
    me->group_records(          out ).
    me->group_by_key(           out ).
    me->for_groups(             out ).
    me->use_range_tables(       out ).
    me->use_enumerations(       out ).
  ENDMETHOD.

  METHOD add_flights_with_for.
    "==================== 1) FOR ====================
    DATA(lv_user) = cl_abap_context_info=>get_user_technical_name( ).
    lt_flights = VALUE #( FOR i = 1 UNTIL i > 15
                          ( iduser     = |1234{ i }-{ lv_user }|
                            aircode    = 'SQ'
                            flightnum  = |{ i WIDTH = 4 PAD = '0' }|
                            key        = 'US'
                            seat       = i
                            flightdate = cl_abap_context_info=>get_system_date( ) + i ) ).
    ir_out->write( EXPORTING data = lt_flights name = 'A01 - LT_FLIGHTS (15 registros)' ).
    " Copy to INFO adjusting fields
    CLEAR lt_flights_info.
    LOOP AT lt_flights INTO DATA(ls_f).
      DATA(ls_i) = ls_f.
      ls_i-aircode = 'CL'.
      DATA(lv_conn) = CONV i( ls_f-flightnum ) + 10.
      ls_i-flightnum = |{ lv_conn WIDTH = 4 PAD = '0' }|.
      ls_i-key = 'COP'.
      APPEND ls_i TO lt_flights_info.
    ENDLOOP.
    ir_out->write( EXPORTING data = lt_flights_info name = 'A01 - LT_FLIGHTS_INFO' ).
  ENDMETHOD.

  METHOD nested_for.
    "==================== 2) Nested FOR ====================
    DATA: lt_final TYPE SORTED TABLE OF ty_flights WITH NON-UNIQUE KEY aircode.
    SELECT * FROM /dmo/flight INTO TABLE @mt_flights_type.
    SELECT * FROM /dmo/connection WHERE carrier_id = 'SQ' INTO TABLE @mt_airline.
    lt_final = VALUE #(
                FOR ls_flights_type IN mt_flights_type WHERE ( carrier_id = 'SQ' )
                FOR ls_airline IN mt_airline WHERE ( connection_id = ls_flights_type-connection_id )
                ( iduser     = ls_flights_type-client
                  aircode    = ls_flights_type-carrier_id
                  flightnum  = ls_airline-connection_id
                  key        = ls_airline-airport_from_id
                  seat       = ls_flights_type-seats_occupied
                  flightdate = ls_flights_type-flight_date ) ).
    ir_out->write( data = lt_final name = 'A02 - Nested For Table' ).
  ENDMETHOD.

  METHOD add_multiple_lines.
    "==================== 3) Multi-line SELECT ====================
    DATA mt_airlines TYPE STANDARD TABLE OF ty_airlines.
    SELECT carrier_id, connection_id, airport_from_id, airport_to_id
      FROM /dmo/connection
      WHERE airport_from_id = 'FRA'
      INTO TABLE @mt_airlines.
    ir_out->write( EXPORTING data = mt_airlines name = 'A03 - Multiple lines (FRA)' ).
  ENDMETHOD.

  METHOD sort_records.
    "==================== 4) SORT ====================
    SORT mt_airline BY connection_id DESCENDING.
    ir_out->write( EXPORTING data = mt_airline name = 'A04 - Sorted by connection_id (DESC)' ).
  ENDMETHOD.

  METHOD modify_records.
    "==================== 5) MODIFY ====================
    LOOP AT mt_airline INTO DATA(ls_s).
      IF ls_s-departure_time GT '12:00:00'.
        ls_s-departure_time = cl_abap_context_info=>get_system_time( ).
        MODIFY mt_airline FROM ls_s TRANSPORTING departure_time.
      ENDIF.
    ENDLOOP.
    ir_out->write( EXPORTING data = mt_airline name = 'A05 - Modify departure_time (>12:00)' ).
  ENDMETHOD.

  METHOD delete_records.
    "==================== 6) DELETE ====================
    DELETE mt_airline WHERE airport_to_id = 'FRA'.
    ir_out->write( EXPORTING data = mt_airline name = 'A06 - Delete airport_to_id = FRA' ).
  ENDMETHOD.

  METHOD clear_free_memory.
    "==================== 7) CLEAR / FREE ====================
    CLEAR mt_airline.
    FREE  mt_airline.
    ir_out->write( |A07 - CLEAR/FREE aplicado a MT_AIRLINE| ).
  ENDMETHOD.

  METHOD collect_records.
    "==================== 8) COLLECT ====================
    DATA lt_seats   TYPE HASHED TABLE OF ty_seats WITH UNIQUE KEY carrier_id connection_id.
    DATA lt_seats_2 TYPE STANDARD TABLE OF ty_seats.
    " Filtered load (seats_max = 140)
    SELECT carrier_id, connection_id, seats_occupied AS seats, price AS bookings
      FROM /dmo/flight
      WHERE seats_max = 140
      INTO TABLE @lt_seats.
    " Second read without filter
    SELECT carrier_id, connection_id, seats_occupied AS seats, price AS bookings
      FROM /dmo/flight
      INTO TABLE @lt_seats_2.
    LOOP AT lt_seats_2 INTO DATA(ls2).
      COLLECT ls2 INTO lt_seats.  " Sums seats and bookings per key
    ENDLOOP.
    ir_out->write( EXPORTING data = lt_seats name = 'A08 - COLLECT (agregado)' ).
  ENDMETHOD.

  METHOD use_let.
    "==================== 9) LET ====================
    " Reuse mt_flights_type and mt_scarr
    SELECT * FROM /dmo/flight INTO TABLE @mt_flights_type.
    SELECT * FROM /dmo/carrier INTO TABLE @mt_scarr.
    LOOP AT mt_flights_type INTO DATA(ls_flight_let).
      DATA(lv_flights) = CONV string(
        LET
          ly_airline_name = mt_scarr[ carrier_id = ls_flight_let-carrier_id ]-name
          ly_flight_price = mt_flights_type[ carrier_id = ls_flight_let-carrier_id
                                            connection_id = ls_flight_let-connection_id ]-price
          lv_carrid = mt_scarr[ carrier_id = ls_flight_let-carrier_id ]-carrier_id
        IN
          |{ lv_carrid } / Airline name: { ly_airline_name } / flight_price: { ly_flight_price }| ).
      EXIT.
    ENDLOOP.
    ir_out->write( data = lv_flights name = 'Let data' ).
  ENDMETHOD.

  METHOD use_base.
    "==================== 10) BASE ====================
    DATA lt_flights_base TYPE STANDARD TABLE OF /dmo/flight.
    lt_flights_base = VALUE #( BASE mt_flights_type ( ) ).
    ir_out->write( EXPORTING data = lines( lt_flights_base ) name = 'A10 - BASE lines count' ).
  ENDMETHOD.

  METHOD group_records.
    "==================== 11) GROUP BY (simple key) ====================
    SELECT * FROM /dmo/connection INTO TABLE @mt_airline.
    DATA: lt_summary TYPE TABLE OF string.
    LOOP AT mt_airline INTO DATA(ls_conn) GROUP BY ls_conn-airport_from_id.
      DATA(lv_count) = 0.
      LOOP AT GROUP ls_conn INTO DATA(ls_group).
        lv_count = lv_count + 1.
      ENDLOOP.
      APPEND |Airport { ls_conn-airport_from_id }: { lv_count } connections| TO lt_summary.
    ENDLOOP.
    ir_out->write( EXPORTING data = lt_summary name = 'A11 - Group summary' ).
  ENDMETHOD.

  METHOD group_by_key.
    "==================== 12) GROUP BY (VALUE key) ====================
    SELECT * FROM /dmo/connection INTO TABLE @mt_airline.
    TYPES: BEGIN OF ty_key,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
           END OF ty_key.
    DATA: lt_summary TYPE TABLE OF string.
    LOOP AT mt_airline INTO DATA(ls_conn)
         GROUP BY VALUE ty_key(
           airport_from_id = ls_conn-airport_from_id
           airport_to_id   = ls_conn-airport_to_id ).
      DATA(lv_count) = 0.
      LOOP AT GROUP ls_conn INTO DATA(ls_group).
        lv_count = lv_count + 1.
      ENDLOOP.
      APPEND |Route { ls_conn-airport_from_id }->{ ls_conn-airport_to_id }: { lv_count } flights| TO lt_summary.
    ENDLOOP.
    ir_out->write( EXPORTING data = lt_summary name = 'A12 - Group by key summary' ).
  ENDMETHOD.

  METHOD for_groups.
    "==================== 13) FOR GROUPS ====================
    SELECT * FROM /dmo/connection INTO TABLE @mt_airline.
    DATA: lt_summary TYPE TABLE OF string.
    LOOP AT mt_airline INTO DATA(ls_conn)
         GROUP BY ( carrier_id      = ls_conn-carrier_id
                    airport_from_id = ls_conn-airport_from_id
                    airport_to_id   = ls_conn-airport_to_id ).
      DATA(lv_count) = 0.
      LOOP AT GROUP ls_conn INTO DATA(ls_group).
        lv_count = lv_count + 1.
      ENDLOOP.
      APPEND |Carrier { ls_conn-carrier_id } - { ls_conn-airport_from_id }->{ ls_conn-airport_to_id }: { lv_count }| TO lt_summary.
    ENDLOOP.
    ir_out->write( EXPORTING data = lt_summary name = 'A13 - FOR GROUPS summary' ).
  ENDMETHOD.

  METHOD use_range_tables.
    "==================== 14) Range tables ====================
    TYPES ty_price TYPE RANGE OF /dmo/flight_price.
    DATA(lt_range) = VALUE ty_price( ( sign = 'I' option = 'BT' low = 200 high = 400 ) ).
    CLEAR mt_flights_type.
    SELECT * FROM /dmo/flight
      WHERE price IN @lt_range
      INTO TABLE @mt_flights_type.
    ir_out->write( EXPORTING data = lines( mt_flights_type ) name = 'A14 - Range tables count (price 200..400)' ).
    ir_out->write( EXPORTING data = mt_flights_type name = 'A14 - Range tables details' ).
  ENDMETHOD.

  METHOD use_enumerations.
    "==================== 15) Enumerations ====================
    DATA: lt_currencies TYPE TABLE OF string.
    APPEND |Initial value: { c_initial }| TO lt_currencies.
    APPEND |Dollar: { c_dollar }| TO lt_currencies.
    APPEND |Euros: { c_euros }| TO lt_currencies.
    APPEND |Colombian Peso: { c_colpeso }| TO lt_currencies.
    APPEND |Mexican Peso: { c_mexpeso }| TO lt_currencies.
    DATA(lv_currency) = c_dollar.
    APPEND |Current currency: { lv_currency }| TO lt_currencies.
    ir_out->write( EXPORTING data = lt_currencies name = 'A15 - Currency enumerations' ).
  ENDMETHOD.

ENDCLASS.
