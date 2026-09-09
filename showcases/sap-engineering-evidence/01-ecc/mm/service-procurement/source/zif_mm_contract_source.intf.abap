INTERFACE zif_mm_contract_source PUBLIC.

  TYPES:
    BEGIN OF ty_contract_snapshot,
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
    END OF ty_contract_snapshot.

  METHODS get_contract_snapshot
    IMPORTING
      iv_ebeln TYPE ekko-ebeln
    RETURNING
      VALUE(rs_snapshot) TYPE ty_contract_snapshot
    RAISING
      zcx_mm_contract_not_found.

ENDINTERFACE.
