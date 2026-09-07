"! Portfolio-normalized implementation derived from an own training practice
"! (Curso 3, UNIDAD_2 — abapGit). Hands-on practice implemented by Francisco
"! Quinteros during structured training and normalized for portfolio use.
"! See README.md in this folder for full provenance and the exact diff from
"! the original exercise.
CLASS zcl_c3_01_projects_fq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS create_project
      IMPORTING iv_project_name        TYPE string
                iv_project_description TYPE string
      EXPORTING ev_project             TYPE string.

ENDCLASS.

CLASS zcl_c3_01_projects_fq IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    me->create_project(
      EXPORTING
        iv_project_name        = 'Students'
        iv_project_description = 'abapGit Project'
      IMPORTING
        ev_project              = DATA(lv_project) ).
    out->write( lv_project ).
  ENDMETHOD.

  METHOD create_project.
    ev_project = |{ iv_project_name } - { iv_project_description }|.
  ENDMETHOD.

ENDCLASS.
