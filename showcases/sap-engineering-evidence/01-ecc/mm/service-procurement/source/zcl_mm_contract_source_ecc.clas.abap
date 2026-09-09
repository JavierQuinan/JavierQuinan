CLASS zcl_mm_contract_source_ecc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_mm_contract_source.
ENDCLASS.

CLASS zcl_mm_contract_source_ecc IMPLEMENTATION.
  METHOD zif_mm_contract_source~get_contract_snapshot.
    TYPES:
      BEGIN OF ty_item_target,
        ktmng TYPE ekpo-ktmng,
        zwert TYPE ekpo-zwert,
      END OF ty_item_target.

    DATA lt_items TYPE STANDARD TABLE OF ty_item_target WITH DEFAULT KEY.
    DATA ls_item TYPE ty_item_target.

    CLEAR rs_snapshot.

    SELECT SINGLE ebeln lifnr ekorg bsart kdatb kdate waers ktwrt
      FROM ekko
      INTO (rs_snapshot-ebeln,
            rs_snapshot-lifnr,
            rs_snapshot-ekorg,
            rs_snapshot-bsart,
            rs_snapshot-valid_from,
            rs_snapshot-valid_to,
            rs_snapshot-currency,
            rs_snapshot-target_value)
      WHERE ebeln = iv_ebeln
        AND bstyp = 'K'.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_mm_contract_not_found
        EXPORTING
          iv_ebeln = iv_ebeln.
    ENDIF.

    SELECT ktmng zwert
      FROM ekpo
      INTO TABLE lt_items
      WHERE ebeln = iv_ebeln
        AND loekz = space.

    DESCRIBE TABLE lt_items LINES rs_snapshot-item_count.

    CLEAR rs_snapshot-quantity_target_item_count.
    CLEAR rs_snapshot-value_target_item_count.

    LOOP AT lt_items INTO ls_item.
      IF ls_item-ktmng > 0.
        ADD 1 TO rs_snapshot-quantity_target_item_count.
      ENDIF.

      IF ls_item-zwert > 0.
        ADD 1 TO rs_snapshot-value_target_item_count.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
