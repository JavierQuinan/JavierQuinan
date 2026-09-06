# ABAP Authorizations Guide

[Versión en español](./AUTHORIZATIONS_GUIDE.es.md)

## Status

`TRAINING_DERIVED_GUIDE` — independently written from completed third-party training. No own authorization object, role assignment or authorization runtime test is claimed in this track.

## Scope

Core authorization concepts across classic ABAP and ABAP Cloud, keeping their tooling and implementation models distinct.

## Core concepts

- **Authorization field:** a field used in authorization checks, for example activity.
- **Authorization object:** an ABAP repository object grouping up to ten authorization fields.
- **`AUTHORITY-CHECK`:** explicit ABAP statement that checks the current user's authorization against values for an authorization object.
- **CDS access control:** authorization mechanism for read access to CDS entities.
- **RAP authorization control:** global and instance-based authorization checks for RAP business objects.
- **Least privilege:** grant and check only the access required for the business action.

## Classic ABAP path

In classic/on-premise scenarios, authorization fields and objects are commonly maintained with transactions such as SU20/SU21, and roles with PFCG.

Illustrative pattern:

```abap
AUTHORITY-CHECK OBJECT 'Z_MY_OBJ'
  ID 'ACTVT' FIELD '01'
  ID 'BUKRS' FIELD lv_company_code.

IF sy-subrc <> 0.
  " reject or raise an application-specific exception
ENDIF.
```

This is an illustration only. No `Z_MY_OBJ` object is claimed as created.

## ABAP Cloud / RAP path

ABAP Cloud also supports authorization fields/objects and explicit checks, but cloud applications may additionally rely on CDS access controls and RAP global/instance authorization mechanisms. The concrete design depends on whether the scenario is service access, data read access or business-object behavior.

Do not assume that a classic SU21/PFCG walkthrough is automatically the correct implementation path for every ABAP Cloud environment.

## Verification

No own authorization object, test user or positive/negative runtime test is present in this track.

## Security considerations

- Enforce checks in backend business logic, not only in UI navigation.
- Test the negative case.
- Do not overwrite or ignore failed `sy-subrc` results.
- Keep authorization rules centralized/framework-aligned where possible.

## Provenance

Concept studied during third-party training. This guide was independently written and does not reproduce course screenshots or exercises.

## Evidence status

`TRAINING_ONLY_IN_THIS_TRACK`. See the [Future Lab Roadmap](../docs/FUTURE_LAB_ROADMAP.md).

## Official references

- SAP Help — Authorization objects: https://help.sap.com/docs/ABAP_Cloud/abap-cloud-docs_abap-keyword-documentation_abap-for-cloud-development/ABENAUTHORIZATION_OBJECT_GLOSRY.html
- SAP Help — Authorization basics in SAP BTP ABAP environment: https://help.sap.com/docs/sap-btp-abap-environment/abap-environment/authorization-basics
