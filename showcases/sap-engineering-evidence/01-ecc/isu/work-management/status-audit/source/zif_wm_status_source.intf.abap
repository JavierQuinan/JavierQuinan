INTERFACE zif_wm_status_source PUBLIC.

  TYPES:
    BEGIN OF ty_status_entry,
      stat        TYPE jest-stat,
      inact       TYPE jest-inact,
      chgnr       TYPE jest-chgnr,
      status_kind TYPE char10,
      txt04       TYPE char4,
      txt30       TYPE char30,
    END OF ty_status_entry,
    tt_status_entries TYPE STANDARD TABLE OF ty_status_entry WITH DEFAULT KEY,
    BEGIN OF ty_status_snapshot,
      aufnr              TYPE aufk-aufnr,
      objnr              TYPE aufk-objnr,
      stsma              TYPE jsto-stsma,
      statuses           TYPE tt_status_entries,
      change_count       TYPE i,
      latest_change_date TYPE sy-datum,
      latest_change_time TYPE sy-uzeit,
    END OF ty_status_snapshot.

  METHODS get_status_snapshot
    IMPORTING
      iv_aufnr TYPE aufk-aufnr
    RETURNING
      VALUE(rs_snapshot) TYPE ty_status_snapshot
    RAISING
      zcx_wm_order_not_found.

ENDINTERFACE.
