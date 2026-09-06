"! Lab 05 (Part I) — RUNTIME-READY VARIANT of the historical zcl_lab_05_invoice_fq.
"! Only change: demo_2_concat_lines_tab() no longer selects from the course-specific
"! ZEMP_LOGALI table; it now calls zcl_employee_fixture_fq=>get_employees( ) instead.
"! Every other method, every string literal, and all business logic are unchanged
"! from the historical source. See ../RUNTIME_VARIANT_MAPPING.md for the full diff
"! and rationale, and the historical class's own PROVENANCE.md for authorship.
"!
"! Prerequisite: zcl_employee_fixture_fq must exist in the same package.
CLASS zcl_lab_05_invoice_rt_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS demo_1_concat            IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
    METHODS demo_2_concat_lines_tab  IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
    METHODS demo_3_condense          IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
    METHODS demo_4_split             IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
    METHODS demo_5_shift             IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
    METHODS demo_6_strlen_numofchar  IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
    METHODS demo_7_translate         IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
    METHODS demo_8_insert_reverse    IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
    METHODS struct_to_line
      IMPORTING any_struct    TYPE any
      RETURNING VALUE(line)   TYPE string.

ENDCLASS.

CLASS zcl_lab_05_invoice_rt_fq IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write( |--- LAB 05 (runtime-ready): String ops en facturación ---| ).
    demo_1_concat(            out ).
    demo_2_concat_lines_tab(  out ).
    demo_3_condense(          out ).
    demo_4_split(             out ).
    demo_5_shift(             out ).
    demo_6_strlen_numofchar(  out ).
    demo_7_translate(         out ).
    demo_8_insert_reverse(    out ).
  ENDMETHOD.

  METHOD demo_1_concat.
    " 1) Concatenation
    DATA: mv_exercise     TYPE n LENGTH 4,
          mv_invoice_no   TYPE n LENGTH 8,
          mv_invoice_code TYPE string.
    mv_exercise   = '0005'.
    mv_invoice_no = '20240123'.
    CONCATENATE mv_exercise mv_invoice_no INTO mv_invoice_code SEPARATED BY '/'.
    out->write( |[1] CONCAT -> MV_INVOICE_CODE = { mv_invoice_code }| ).
  ENDMETHOD.

  METHOD demo_2_concat_lines_tab.
    " 2) CONCATENATE LINES OF, fed by the synthetic fixture (no ZEMP_LOGALI dependency)
    DATA(lt_employees) = zcl_employee_fixture_fq=>get_employees( ).
    IF lt_employees IS INITIAL.
      out->write( |[2] No hay registros en la fixture de empleados.| ).
      RETURN.
    ENDIF.
    DATA lt_lines TYPE STANDARD TABLE OF string.
    FIELD-SYMBOLS <row> TYPE any.
    LOOP AT lt_employees ASSIGNING <row>.
      APPEND struct_to_line( <row> ) TO lt_lines.
    ENDLOOP.
    DATA(big_text) = ``.
    CONCATENATE LINES OF lt_lines INTO big_text SEPARATED BY ` `.
    out->write( |[2] CONCATENATE LINES OF ->| ).
    out->write( big_text ).
  ENDMETHOD.

  METHOD demo_3_condense.
    " 3) CONDENSE and REPLACE
    DATA: mv_case1 TYPE string VALUE `Sales invoice with  status    in    process`,
          mv_case2 TYPE string VALUE `***ABAP*Cloud***`.
    CONDENSE mv_case1.
    out->write( |[3] CONDENSE -> MV_CASE1 = "{ mv_case1 }"| ).
    REPLACE ALL OCCURRENCES OF `*` IN mv_case2 WITH ``.
    out->write( |[3] REPLACE '*' -> MV_CASE2 = "{ mv_case2 }"| ).
  ENDMETHOD.

  METHOD demo_4_split.
    " 4) SPLIT
    DATA: mv_data        TYPE string VALUE `0001111111;TRAINING GROUP;2024`,
          mv_id_customer TYPE string,
          mv_customer    TYPE string,
          mv_year        TYPE string.
    SPLIT mv_data AT `;`
      INTO mv_id_customer
           mv_customer
           mv_year.
    out->write( |[4] SPLIT -> ID={ mv_id_customer } CUSTOMER="{ mv_customer }" YEAR={ mv_year }| ).
  ENDMETHOD.

  METHOD demo_5_shift.
    " 5) SHIFT — remove 2 chars from the start and 2 from the end
    DATA mv_invoice_num TYPE string VALUE `2015ABCD`.
    SHIFT mv_invoice_num LEFT  BY 2 PLACES.
    SHIFT mv_invoice_num RIGHT BY 2 PLACES.
    out->write( |[5] SHIFT -> MV_INVOICE_NUM = { mv_invoice_num }| ).
  ENDMETHOD.

  METHOD demo_6_strlen_numofchar.
    " 6) STRLEN and NUMOFCHAR
    DATA: mv_response TYPE string VALUE ` Generating Invoice `,
          mv_count    TYPE i.
    DATA(len_strlen)   = strlen( mv_response ).
    DATA(len_numchars) = numofchar( mv_response ).
    out->write( |[6] STRLEN  (incl. espacios)  -> { len_strlen }| ).
    out->write( |[6] NUMOFCHAR(incl. espacios) -> { len_numchars }| ).
  ENDMETHOD.

  METHOD demo_7_translate.
    " 7) TRANSLATE to UPPER then LOWER
    DATA mv_translate_invoice TYPE string VALUE `Report the issuance of this invoice`.
    DATA mv_upper TYPE string.
    DATA mv_lower TYPE string.
    mv_upper = mv_translate_invoice.
    TRANSLATE mv_upper TO UPPER CASE.
    out->write( |[7] TRANSLATE -> UPPER: "{ mv_upper }"| ).
    mv_lower = mv_upper.
    TRANSLATE mv_lower TO LOWER CASE.
    out->write( |[7] TRANSLATE -> LOWER: "{ mv_lower }"| ).
  ENDMETHOD.

  METHOD demo_8_insert_reverse.
    " 8) Append ' to client' at the end, then reverse
    DATA mv_translate_invoice TYPE string VALUE `Report the issuance of this invoice`.
    mv_translate_invoice = mv_translate_invoice && ` to client`.
    out->write( |[8] INSERT -> "{ mv_translate_invoice }"| ).
    DATA(reversed) = reverse( mv_translate_invoice ).
    out->write( |[8] REVERSE -> "{ reversed }"| ).
  ENDMETHOD.

  METHOD struct_to_line.
    " Converts a structure into a single space-separated string line
    FIELD-SYMBOLS: <s> TYPE any, <c> TYPE any.
    ASSIGN any_struct TO <s>.
    DATA(desc) = cl_abap_typedescr=>describe_by_data( <s> ).
    DATA(line_builder) = ``.
    IF desc->kind = cl_abap_typedescr=>kind_struct.
      DATA(sd) = CAST cl_abap_structdescr( desc ).
      LOOP AT sd->components INTO DATA(comp).
        ASSIGN COMPONENT comp-name OF STRUCTURE <s> TO <c>.
        IF sy-subrc = 0.
          IF line_builder IS INITIAL.
            line_builder = |{ <c> }|.
          ELSE.
            line_builder = |{ line_builder } { <c> }|.
          ENDIF.
        ENDIF.
      ENDLOOP.
    ELSE.
      line_builder = |{ <s> }|.
    ENDIF.
    line = line_builder.
  ENDMETHOD.

ENDCLASS.
