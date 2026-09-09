"! Lab 06 — Control structures: IF/ENDIF, CASE/ENDCASE, DO/ENDDO, CHECK, SWITCH,
"! COND, WHILE/ENDWHILE, LOOP/ENDLOOP, TRY/ENDTRY with a real exception (CX_SY_ZERODIVIDE).
"! Portfolio evidence class. See PROVENANCE.md for authorship/derivation details.
"!
"! Dependency note: perform_loop_endloop() selects from Z table ZEMP_LOGALI, a
"! training-environment table provided as part of the Logali Group course setup
"! (see lab-05 for the same dependency). Not distributed with this evidence.
CLASS zcl_lab_06_condition_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    DATA: mv_conditional TYPE i,
          mv_string      TYPE string,
          mv_counter     TYPE i,
          mv_string_2    TYPE string,
          mv_time        TYPE t,
          mv_counter_2   TYPE i,
          mt_employees   TYPE TABLE OF zemp_logali,
          ms_employee    TYPE zemp_logali,
          mv_exception   TYPE f VALUE 5.

    METHODS perform_if_endif        IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS perform_case_endcase    IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS perform_do_enddo        IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS perform_check           IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS perform_switch          IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS perform_cond            IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS perform_while_endwhile  IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS perform_loop_endloop    IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS perform_try_endtry      IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS get_case_result
      IMPORTING iv_string        TYPE string
      RETURNING VALUE(rv_result) TYPE string.

ENDCLASS.

CLASS zcl_lab_06_condition_fq IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    me->perform_if_endif( out ).
    me->perform_case_endcase( out ).
    me->perform_do_enddo( out ).
    me->perform_check( out ).
    me->perform_switch( out ).
    me->perform_cond( out ).
    me->perform_while_endwhile( out ).
    me->perform_loop_endloop( out ).
    me->perform_try_endtry( out ).
  ENDMETHOD.

  METHOD perform_if_endif.
    me->mv_conditional = 7.
    IF me->mv_conditional = 7.
      ir_out->write( 'The variable is equal to 7' ).
    ELSE.
      ir_out->write( 'The variable is different from 7' ).
    ENDIF.
    me->mv_conditional = 5.
    IF me->mv_conditional = 7.
      ir_out->write( 'The variable is equal to 7' ).
    ELSE.
      ir_out->write( 'The variable is different from 7' ).
    ENDIF.
  ENDMETHOD.

  METHOD perform_case_endcase.
    me->mv_string = 'ACADEMY'.
    ir_out->write( me->get_case_result( me->mv_string ) ).
    me->mv_string = 'SAP'.
    ir_out->write( me->get_case_result( me->mv_string ) ).
    me->mv_string = 'OTHER'.
    ir_out->write( me->get_case_result( me->mv_string ) ).
  ENDMETHOD.

  METHOD get_case_result.
    CASE iv_string.
      WHEN 'ACADEMY'.
        rv_result = 'Academy'.
      WHEN 'SAP'.
        rv_result = 'Enterprise software'.
      WHEN OTHERS.
        rv_result = 'Unknown'.
    ENDCASE.
  ENDMETHOD.

  METHOD perform_do_enddo.
    me->mv_counter = 0.
    DO 10 TIMES.
      me->mv_counter = me->mv_counter + 1.
      ir_out->write( |Iteración { sy-index } : { me->mv_counter }| ).
    ENDDO.
  ENDMETHOD.

  METHOD perform_check.
    me->mv_counter = 0.
    DO 10 TIMES.
      me->mv_counter = me->mv_counter + 1.
      CHECK me->mv_counter LE 7.
      ir_out->write( |Iteración { sy-index } : { me->mv_counter }| ).
    ENDDO.
  ENDMETHOD.

  METHOD perform_switch.
    me->mv_string_2 = 'ACADEMY'.
    ir_out->write(
      SWITCH string( me->mv_string_2
        WHEN 'ACADEMY'   THEN 'Training Academy'
        WHEN 'SAP'      THEN 'Enterprise software'
        WHEN 'MOVISTAR' THEN 'Telephony'
        ELSE 'Unknown' )
    ).
    me->mv_string_2 = 'SAP'.
    ir_out->write(
      SWITCH string( me->mv_string_2
        WHEN 'ACADEMY'   THEN 'Training Academy'
        WHEN 'SAP'      THEN 'Enterprise software'
        WHEN 'MOVISTAR' THEN 'Telephony'
        ELSE 'Unknown' )
    ).
    me->mv_string_2 = 'MOVISTAR'.
    ir_out->write(
      SWITCH string( me->mv_string_2
        WHEN 'ACADEMY'   THEN 'Training Academy'
        WHEN 'SAP'      THEN 'Enterprise software'
        WHEN 'MOVISTAR' THEN 'Telephony'
        ELSE 'Unknown' )
    ).
    me->mv_string_2 = 'OTHER'.
    ir_out->write(
      SWITCH string( me->mv_string_2
        WHEN 'ACADEMY'   THEN 'Training Academy'
        WHEN 'SAP'      THEN 'Enterprise software'
        WHEN 'MOVISTAR' THEN 'Telephony'
        ELSE 'Unknown' )
    ).
  ENDMETHOD.

  METHOD perform_cond.
    me->mv_time = cl_abap_context_info=>get_system_time( ).
    ir_out->write(
      COND string(
        WHEN me->mv_time LT '120000' THEN |{ me->mv_time } AM|
        WHEN me->mv_time GT '120000' THEN |{ me->mv_time } PM|
        WHEN me->mv_time EQ '120000' THEN |{ me->mv_time } High Noon|
      )
    ).
  ENDMETHOD.

  METHOD perform_while_endwhile.
    me->mv_counter_2 = 0.
    WHILE me->mv_counter_2 LT 20.
      me->mv_counter_2 = me->mv_counter_2 + 1.
      IF me->mv_counter_2 > 10.
        CONTINUE.
      ENDIF.
      ir_out->write( |Iteración { me->mv_counter_2 } : { me->mv_counter_2 }| ).
    ENDWHILE.
  ENDMETHOD.

  METHOD perform_loop_endloop.
    SELECT * FROM zemp_logali INTO TABLE @me->mt_employees.
    LOOP AT me->mt_employees INTO me->ms_employee.
      ir_out->write( |{ me->ms_employee-email }| ).
    ENDLOOP.
  ENDMETHOD.

  METHOD perform_try_endtry.
    me->mv_exception = 5.
    me->mv_counter   = 5.
    DO 5 TIMES.
      TRY.
          me->mv_counter   = me->mv_counter - 1.
          me->mv_exception = me->mv_exception / me->mv_counter.
          ir_out->write( |Iteración { sy-index } : { me->mv_exception }| ).
        CATCH cx_sy_zerodivide INTO DATA(lv_exc).
          ir_out->write( |Excepción : División por cero capturada| ).
      ENDTRY.
    ENDDO.
  ENDMETHOD.

ENDCLASS.
