CLASS zcl_wm_status_source_ecc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_wm_status_source.
ENDCLASS.

CLASS zcl_wm_status_source_ecc IMPLEMENTATION.
  METHOD zif_wm_status_source~get_status_snapshot.
    TYPES:
      BEGIN OF ty_change,
        udate TYPE jcds-udate,
        utime TYPE jcds-utime,
        chgnr TYPE jcds-chgnr,
      END OF ty_change.

    DATA lt_statuses TYPE zif_wm_status_source=>tt_status_entries.
    DATA ls_status TYPE zif_wm_status_source=>ty_status_entry.
    DATA lt_changes TYPE STANDARD TABLE OF ty_change WITH DEFAULT KEY.
    DATA ls_change TYPE ty_change.

    CLEAR rs_snapshot.

    SELECT SINGLE objnr
      FROM aufk
      INTO rs_snapshot-objnr
      WHERE aufnr = iv_aufnr.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_wm_order_not_found
        EXPORTING
          iv_aufnr = iv_aufnr.
    ENDIF.

    rs_snapshot-aufnr = iv_aufnr.

    SELECT SINGLE stsma
      FROM jsto
      INTO rs_snapshot-stsma
      WHERE objnr = rs_snapshot-objnr.

    SELECT stat inact chgnr
      FROM jest
      INTO CORRESPONDING FIELDS OF TABLE lt_statuses
      WHERE objnr = rs_snapshot-objnr.

    LOOP AT lt_statuses INTO ls_status.
      CLEAR: ls_status-status_kind,
             ls_status-txt04,
             ls_status-txt30.

      IF ls_status-stat+0(1) = 'I'.
        ls_status-status_kind = 'SYSTEM'.

        SELECT SINGLE txt04 txt30
          FROM tj02t
          INTO (ls_status-txt04, ls_status-txt30)
          WHERE istat = ls_status-stat
            AND spras = sy-langu.

      ELSEIF ls_status-stat+0(1) = 'E'.
        ls_status-status_kind = 'USER'.

        IF rs_snapshot-stsma IS NOT INITIAL.
          SELECT SINGLE txt04 txt30
            FROM tj30t
            INTO (ls_status-txt04, ls_status-txt30)
            WHERE stsma = rs_snapshot-stsma
              AND estat = ls_status-stat
              AND spras = sy-langu.
        ENDIF.

      ELSE.
        ls_status-status_kind = 'OTHER'.
      ENDIF.

      MODIFY lt_statuses FROM ls_status.
    ENDLOOP.

    rs_snapshot-statuses = lt_statuses.

    SELECT udate utime chgnr
      FROM jcds
      INTO TABLE lt_changes
      WHERE objnr = rs_snapshot-objnr.

    DESCRIBE TABLE lt_changes LINES rs_snapshot-change_count.

    SORT lt_changes BY udate DESCENDING
                       utime DESCENDING
                       chgnr DESCENDING.

    READ TABLE lt_changes INTO ls_change INDEX 1.
    IF sy-subrc = 0.
      rs_snapshot-latest_change_date = ls_change-udate.
      rs_snapshot-latest_change_time = ls_change-utime.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
