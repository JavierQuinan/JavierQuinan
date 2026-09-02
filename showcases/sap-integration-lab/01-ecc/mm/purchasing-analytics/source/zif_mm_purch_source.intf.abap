INTERFACE zif_mm_purch_source PUBLIC.

  TYPES:
    BEGIN OF ty_snapshot,
      banfn                  TYPE eban-banfn,
      bnfpo                  TYPE eban-bnfpo,
      pr_date                TYPE eban-badat,
      pr_delivery_date       TYPE eban-lfdat,
      pr_deleted             TYPE eban-loekz,
      material               TYPE eban-matnr,
      plant                  TYPE eban-werks,
      purchasing_group       TYPE eban-ekgrp,
      po_number              TYPE eban-ebeln,
      po_item                TYPE eban-ebelp,
      po_header_found        TYPE abap_bool,
      po_item_found          TYPE abap_bool,
      po_document_date       TYPE ekko-bedat,
      vendor                 TYPE ekko-lifnr,
      purchasing_org         TYPE ekko-ekorg,
      po_item_deleted        TYPE ekpo-loekz,
      order_quantity         TYPE ekpo-menge,
      order_unit             TYPE ekpo-meins,
      schedule_count         TYPE i,
      earliest_delivery_date TYPE eket-eindt,
      latest_delivery_date   TYPE eket-eindt,
    END OF ty_snapshot.

  METHODS get_snapshot
    IMPORTING
      iv_banfn TYPE eban-banfn
      iv_bnfpo TYPE eban-bnfpo
    RETURNING
      VALUE(rs_snapshot) TYPE ty_snapshot
    RAISING
      zcx_mm_purch_not_found.

ENDINTERFACE.
