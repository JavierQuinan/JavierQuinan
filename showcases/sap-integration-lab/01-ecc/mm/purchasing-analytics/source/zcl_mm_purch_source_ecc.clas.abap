CLASS zcl_mm_purch_source_ecc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_mm_purch_source.
ENDCLASS.

CLASS zcl_mm_purch_source_ecc IMPLEMENTATION.
  METHOD zif_mm_purch_source~get_snapshot.
    DATA lt_delivery_dates TYPE STANDARD TABLE OF eket-eindt WITH DEFAULT KEY.
    DATA lv_delivery_date TYPE eket-eindt.

    CLEAR rs_snapshot.

    SELECT SINGLE banfn bnfpo badat lfdat loekz matnr werks ekgrp ebeln ebelp
      FROM eban
      INTO (rs_snapshot-banfn,
            rs_snapshot-bnfpo,
            rs_snapshot-pr_date,
            rs_snapshot-pr_delivery_date,
            rs_snapshot-pr_deleted,
            rs_snapshot-material,
            rs_snapshot-plant,
            rs_snapshot-purchasing_group,
            rs_snapshot-po_number,
            rs_snapshot-po_item)
      WHERE banfn = iv_banfn
        AND bnfpo = iv_bnfpo.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_mm_purch_not_found
        EXPORTING
          iv_banfn = iv_banfn
          iv_bnfpo = iv_bnfpo.
    ENDIF.

    IF rs_snapshot-po_number IS INITIAL.
      RETURN.
    ENDIF.

    SELECT SINGLE bedat lifnr ekorg
      FROM ekko
      INTO (rs_snapshot-po_document_date,
            rs_snapshot-vendor,
            rs_snapshot-purchasing_org)
      WHERE ebeln = rs_snapshot-po_number.

    IF sy-subrc = 0.
      rs_snapshot-po_header_found = abap_true.
    ENDIF.

    SELECT SINGLE loekz menge meins
      FROM ekpo
      INTO (rs_snapshot-po_item_deleted,
            rs_snapshot-order_quantity,
            rs_snapshot-order_unit)
      WHERE ebeln = rs_snapshot-po_number
        AND ebelp = rs_snapshot-po_item.

    IF sy-subrc = 0.
      rs_snapshot-po_item_found = abap_true.
    ELSE.
      RETURN.
    ENDIF.

    SELECT eindt
      FROM eket
      INTO TABLE lt_delivery_dates
      WHERE ebeln = rs_snapshot-po_number
        AND ebelp = rs_snapshot-po_item.

    DESCRIBE TABLE lt_delivery_dates LINES rs_snapshot-schedule_count.

    IF rs_snapshot-schedule_count > 0.
      SORT lt_delivery_dates ASCENDING.
      READ TABLE lt_delivery_dates INTO lv_delivery_date INDEX 1.
      IF sy-subrc = 0.
        rs_snapshot-earliest_delivery_date = lv_delivery_date.
      ENDIF.

      SORT lt_delivery_dates DESCENDING.
      READ TABLE lt_delivery_dates INTO lv_delivery_date INDEX 1.
      IF sy-subrc = 0.
        rs_snapshot-latest_delivery_date = lv_delivery_date.
      ENDIF.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
