CLASS zcl_mm_purch_analytics_service DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CONSTANTS:
      c_result_pr_only             TYPE char24 VALUE 'PR_ONLY',
      c_result_reference_gap       TYPE char24 VALUE 'REFERENCE_GAP',
      c_result_po_without_schedule TYPE char24 VALUE 'PO_WITHOUT_SCHEDULE',
      c_result_po_with_schedule    TYPE char24 VALUE 'PO_WITH_SCHEDULE',
      c_result_pr_deleted          TYPE char24 VALUE 'PR_DELETED',
      c_result_po_item_deleted     TYPE char24 VALUE 'PO_ITEM_DELETED'.

    TYPES:
      BEGIN OF ty_result,
        banfn                  TYPE eban-banfn,
        bnfpo                  TYPE eban-bnfpo,
        pr_date                TYPE eban-badat,
        pr_delivery_date       TYPE eban-lfdat,
        material               TYPE eban-matnr,
        plant                  TYPE eban-werks,
        purchasing_group       TYPE eban-ekgrp,
        po_number              TYPE eban-ebeln,
        po_item                TYPE eban-ebelp,
        po_document_date       TYPE ekko-bedat,
        vendor                 TYPE ekko-lifnr,
        purchasing_org         TYPE ekko-ekorg,
        order_quantity         TYPE ekpo-menge,
        order_unit             TYPE ekpo-meins,
        schedule_count         TYPE i,
        earliest_delivery_date TYPE eket-eindt,
        latest_delivery_date   TYPE eket-eindt,
        diagnostic_result      TYPE char24,
      END OF ty_result.

    METHODS constructor
      IMPORTING
        io_source TYPE REF TO zif_mm_purch_source OPTIONAL.

    METHODS evaluate
      IMPORTING
        iv_banfn TYPE eban-banfn
        iv_bnfpo TYPE eban-bnfpo
      RETURNING
        VALUE(rs_result) TYPE ty_result
      RAISING
        zcx_mm_purch_not_found.

    METHODS evaluate_snapshot
      IMPORTING
        is_snapshot TYPE zif_mm_purch_source=>ty_snapshot
      RETURNING
        VALUE(rs_result) TYPE ty_result.

  PRIVATE SECTION.
    DATA mo_source TYPE REF TO zif_mm_purch_source.
ENDCLASS.

CLASS zcl_mm_purch_analytics_service IMPLEMENTATION.
  METHOD constructor.
    mo_source = io_source.
  ENDMETHOD.

  METHOD evaluate.
    DATA ls_snapshot TYPE zif_mm_purch_source=>ty_snapshot.

    CALL METHOD mo_source->get_snapshot
      EXPORTING
        iv_banfn = iv_banfn
        iv_bnfpo = iv_bnfpo
      RECEIVING
        rs_snapshot = ls_snapshot.

    CALL METHOD me->evaluate_snapshot
      EXPORTING
        is_snapshot = ls_snapshot
      RECEIVING
        rs_result = rs_result.
  ENDMETHOD.

  METHOD evaluate_snapshot.
    rs_result-banfn = is_snapshot-banfn.
    rs_result-bnfpo = is_snapshot-bnfpo.
    rs_result-pr_date = is_snapshot-pr_date.
    rs_result-pr_delivery_date = is_snapshot-pr_delivery_date.
    rs_result-material = is_snapshot-material.
    rs_result-plant = is_snapshot-plant.
    rs_result-purchasing_group = is_snapshot-purchasing_group.
    rs_result-po_number = is_snapshot-po_number.
    rs_result-po_item = is_snapshot-po_item.
    rs_result-po_document_date = is_snapshot-po_document_date.
    rs_result-vendor = is_snapshot-vendor.
    rs_result-purchasing_org = is_snapshot-purchasing_org.
    rs_result-order_quantity = is_snapshot-order_quantity.
    rs_result-order_unit = is_snapshot-order_unit.
    rs_result-schedule_count = is_snapshot-schedule_count.
    rs_result-earliest_delivery_date = is_snapshot-earliest_delivery_date.
    rs_result-latest_delivery_date = is_snapshot-latest_delivery_date.

    IF is_snapshot-pr_deleted IS NOT INITIAL.
      rs_result-diagnostic_result = c_result_pr_deleted.
    ELSEIF is_snapshot-po_number IS INITIAL.
      rs_result-diagnostic_result = c_result_pr_only.
    ELSEIF is_snapshot-po_header_found <> abap_true
       OR is_snapshot-po_item_found <> abap_true.
      rs_result-diagnostic_result = c_result_reference_gap.
    ELSEIF is_snapshot-po_item_deleted IS NOT INITIAL.
      rs_result-diagnostic_result = c_result_po_item_deleted.
    ELSEIF is_snapshot-schedule_count = 0.
      rs_result-diagnostic_result = c_result_po_without_schedule.
    ELSE.
      rs_result-diagnostic_result = c_result_po_with_schedule.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
