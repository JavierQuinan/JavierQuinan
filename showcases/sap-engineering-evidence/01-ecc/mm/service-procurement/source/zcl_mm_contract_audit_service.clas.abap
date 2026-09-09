CLASS zcl_mm_contract_audit_service DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CONSTANTS:
      c_status_active              TYPE char20 VALUE 'ACTIVE',
      c_status_expiring_soon       TYPE char20 VALUE 'EXPIRING_SOON',
      c_status_expired             TYPE char20 VALUE 'EXPIRED',
      c_status_not_yet_valid       TYPE char20 VALUE 'NOT_YET_VALID',
      c_status_invalid_validity    TYPE char20 VALUE 'INVALID_VALIDITY',
      c_status_validity_incomplete TYPE char20 VALUE 'VALIDITY_INCOMPLETE',
      c_status_no_items            TYPE char20 VALUE 'NO_ITEMS'.

    TYPES:
      BEGIN OF ty_result,
        ebeln                      TYPE ekko-ebeln,
        lifnr                      TYPE ekko-lifnr,
        ekorg                      TYPE ekko-ekorg,
        bsart                      TYPE ekko-bsart,
        valid_from                 TYPE ekko-kdatb,
        valid_to                   TYPE ekko-kdate,
        currency                   TYPE ekko-waers,
        target_value               TYPE ekko-ktwrt,
        item_count                 TYPE i,
        quantity_target_item_count TYPE i,
        value_target_item_count    TYPE i,
        days_to_expiry             TYPE i,
        status                     TYPE char20,
      END OF ty_result.

    METHODS constructor
      IMPORTING
        io_source TYPE REF TO zif_mm_contract_source.

    METHODS evaluate
      IMPORTING
        iv_ebeln        TYPE ekko-ebeln
        iv_key_date     TYPE sy-datum
        iv_warning_days TYPE i
      RETURNING
        VALUE(rs_result) TYPE ty_result
      RAISING
        zcx_mm_contract_not_found.

  PRIVATE SECTION.
    DATA mo_source TYPE REF TO zif_mm_contract_source.
ENDCLASS.

CLASS zcl_mm_contract_audit_service IMPLEMENTATION.
  METHOD constructor.
    mo_source = io_source.
  ENDMETHOD.

  METHOD evaluate.
    DATA ls_snapshot TYPE zif_mm_contract_source=>ty_contract_snapshot.
    DATA lv_warning_days TYPE i.

    CALL METHOD mo_source->get_contract_snapshot
      EXPORTING
        iv_ebeln = iv_ebeln
      RECEIVING
        rs_snapshot = ls_snapshot.

    rs_result-ebeln = ls_snapshot-ebeln.
    rs_result-lifnr = ls_snapshot-lifnr.
    rs_result-ekorg = ls_snapshot-ekorg.
    rs_result-bsart = ls_snapshot-bsart.
    rs_result-valid_from = ls_snapshot-valid_from.
    rs_result-valid_to = ls_snapshot-valid_to.
    rs_result-currency = ls_snapshot-currency.
    rs_result-target_value = ls_snapshot-target_value.
    rs_result-item_count = ls_snapshot-item_count.
    rs_result-quantity_target_item_count = ls_snapshot-quantity_target_item_count.
    rs_result-value_target_item_count = ls_snapshot-value_target_item_count.

    lv_warning_days = iv_warning_days.
    IF lv_warning_days < 0.
      CLEAR lv_warning_days.
    ENDIF.

    CLEAR rs_result-days_to_expiry.
    IF ls_snapshot-valid_to IS NOT INITIAL.
      rs_result-days_to_expiry = ls_snapshot-valid_to - iv_key_date.
    ENDIF.

    IF ls_snapshot-valid_from IS INITIAL
       OR ls_snapshot-valid_to IS INITIAL.
      rs_result-status = c_status_validity_incomplete.

    ELSEIF ls_snapshot-valid_to < ls_snapshot-valid_from.
      rs_result-status = c_status_invalid_validity.

    ELSEIF ls_snapshot-item_count = 0.
      rs_result-status = c_status_no_items.

    ELSEIF iv_key_date < ls_snapshot-valid_from.
      rs_result-status = c_status_not_yet_valid.

    ELSEIF iv_key_date > ls_snapshot-valid_to.
      rs_result-status = c_status_expired.

    ELSEIF rs_result-days_to_expiry <= lv_warning_days.
      rs_result-status = c_status_expiring_soon.

    ELSE.
      rs_result-status = c_status_active.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
