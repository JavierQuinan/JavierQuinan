CLASS zcl_mm_purch_source_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_mm_purch_source.
ENDCLASS.

CLASS zcl_mm_purch_source_demo IMPLEMENTATION.
  METHOD zif_mm_purch_source~get_snapshot.
    CLEAR rs_snapshot.

    IF iv_banfn <> '10000001' OR iv_bnfpo <> '00010'.
      RAISE EXCEPTION TYPE zcx_mm_purch_not_found
        EXPORTING
          iv_banfn = iv_banfn
          iv_bnfpo = iv_bnfpo.
    ENDIF.

    rs_snapshot-banfn = iv_banfn.
    rs_snapshot-bnfpo = iv_bnfpo.
    rs_snapshot-pr_date = '20260110'.
    rs_snapshot-pr_delivery_date = '20260215'.
    rs_snapshot-material = 'MATDEMO001'.
    rs_snapshot-plant = 'D001'.
    rs_snapshot-purchasing_group = 'D01'.
    rs_snapshot-po_number = '4500000001'.
    rs_snapshot-po_item = '00010'.
    rs_snapshot-po_header_found = abap_true.
    rs_snapshot-po_item_found = abap_true.
    rs_snapshot-po_document_date = '20260112'.
    rs_snapshot-vendor = '0000900001'.
    rs_snapshot-purchasing_org = 'D001'.
    rs_snapshot-order_quantity = '10'.
    rs_snapshot-order_unit = 'EA'.
    rs_snapshot-schedule_count = 2.
    rs_snapshot-earliest_delivery_date = '20260201'.
    rs_snapshot-latest_delivery_date = '20260215'.
  ENDMETHOD.
ENDCLASS.
