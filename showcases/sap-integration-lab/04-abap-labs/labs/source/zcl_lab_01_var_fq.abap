"! Lab 01 — Elementary/complex data types, structures, constants, reference objects.
"! Portfolio evidence class. See PROVENANCE.md for authorship/derivation details.
CLASS zcl_lab_01_var_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.

CLASS zcl_lab_01_var_fq IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " 1) Elementary data types
    DATA mv_purchase_date TYPE d.
    DATA mv_purchase_time TYPE t.
    mv_purchase_date = cl_abap_context_info=>get_system_date( ).
    mv_purchase_time = cl_abap_context_info=>get_system_time( ).

    DATA mv_price     TYPE f           VALUE '10.5'.
    DATA mv_tax       TYPE i           VALUE 16.
    DATA mv_increase  TYPE decfloat16  VALUE '20.5'.
    DATA mv_discounts TYPE decfloat34  VALUE '10.5'.
    DATA mv_type      TYPE c LENGTH 10 VALUE 'PC'.
    DATA mv_shipping  TYPE p LENGTH 8  DECIMALS 2 VALUE '40.36'.
    DATA mv_id_code   TYPE n LENGTH 4  VALUE '1110'.
    DATA mv_qr_code   TYPE x LENGTH 5.
    mv_qr_code = 'F5CF000000'.

    out->write( |--- Tipos elementales ---| ).
    out->write( |Fecha: { mv_purchase_date } Hora: { mv_purchase_time }| ).
    out->write( |Precio: { mv_price } Impuesto: { mv_tax }| ).
    out->write( |Aumento: { mv_increase } Descuento: { mv_discounts }| ).
    out->write( |Tipo: { mv_type } Envío: { mv_shipping }| ).
    out->write( |ID Code: { mv_id_code } QR: { mv_qr_code }| ).

    " 2) Complex data types
    TYPES: BEGIN OF mty_customer,
             id       TYPE i,
             customer TYPE c LENGTH 15,
             age      TYPE i,
           END OF mty_customer.
    DATA ls_customer TYPE mty_customer.
    ls_customer-id       = 1.
    ls_customer-customer = 'JOHN DOE'.
    ls_customer-age      = 30.
    out->write( |--- MTY_CUSTOMER ---| ).
    out->write( ls_customer ).

    " 3) Reference/dictionary-backed data types (standard demo table)
    DATA ms_employees TYPE /dmo/employee_hr.
    SELECT SINGLE * FROM /dmo/employee_hr INTO @ms_employees.
    out->write( |--- /DMO/EMPLOYEE_HR ---| ).
    out->write( ms_employees ).

    " 4) Data objects
    DATA mv_product  TYPE string  VALUE 'Laptop'.
    DATA mv_bar_code TYPE xstring.
    DATA(lv_bar_txt) = '12121 121211'.
    mv_bar_code = CONV xstring( lv_bar_txt ).
    out->write( |Bar Code (texto): 12121 121211| ).

    " 5) Constants
    CONSTANTS:
      mc_price      TYPE f           VALUE '10.5',
      mc_tax        TYPE i           VALUE 16,
      mc_increase   TYPE decfloat16  VALUE '20.5',
      mc_discounts  TYPE decfloat34  VALUE '10.5',
      mc_type       TYPE c LENGTH 10 VALUE 'PC',
      mc_shipping   TYPE p LENGTH 8  DECIMALS 2 VALUE '40.36',
      mc_id_code    TYPE n LENGTH 4  VALUE '1110',
      mc_qr_code    TYPE x LENGTH 5  VALUE 'F5CF000000',
      mc_product    TYPE string      VALUE 'Laptop',
      mc_bar_code_x TYPE xstring     VALUE '313231323120313231323131'.

    mv_price     = mc_price.
    mv_tax       = mc_tax.
    mv_increase  = mc_increase.
    mv_discounts = mc_discounts.
    mv_type      = mc_type.
    mv_shipping  = mc_shipping.
    mv_id_code   = mc_id_code.
    mv_qr_code   = mc_qr_code.
    mv_product   = mc_product.
    mv_bar_code  = mc_bar_code_x.

    " 6) Inline declarations
    DATA(lv_product)      = mv_product.
    DATA(lv_bar_code_hex) = to_upper( |{ mv_bar_code }| ).
    out->write( |--- Declaración en línea ---| ).
    out->write( |LV_PRODUCT: { lv_product }| ).
    out->write( |LV_BAR_CODE (hex): { lv_bar_code_hex }| ).

  ENDMETHOD.

ENDCLASS.
