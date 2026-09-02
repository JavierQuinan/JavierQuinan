INTERFACE zif_mm_stock_source PUBLIC.

  TYPES:
    BEGIN OF ty_stock_snapshot,
      matnr                TYPE mara-matnr,
      werks                TYPE marc-werks,
      lgort                TYPE mard-lgort,
      mrp_type             TYPE marc-dismm,
      storage_unrestricted TYPE mard-labst,
      plant_unrestricted   TYPE mard-labst,
      reorder_point        TYPE marc-minbe,
      safety_stock         TYPE marc-eisbe,
    END OF ty_stock_snapshot.

  METHODS get_stock_snapshot
    IMPORTING
      iv_matnr TYPE mara-matnr
      iv_werks TYPE marc-werks
      iv_lgort TYPE mard-lgort
    RETURNING
      VALUE(rs_snapshot) TYPE ty_stock_snapshot
    RAISING
      zcx_mm_stock_not_found.

ENDINTERFACE.
