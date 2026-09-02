# SAP Official Reference Index

[Versión en español](./OFFICIAL_SAP_REFERENCES.es.md)

> **Purpose:** authoritative reference index supporting the public SAP guides and engineering evidence in this repository.  
> **Source policy:** SAP Help Portal is preferred for SAP product behavior, development tooling and public API architecture. User-authored operational material is sanitized separately and is never presented as official SAP documentation.

This page connects the portfolio's original guides/source to public SAP documentation so another consultant or developer can reproduce the standard portions of the work without relying on internal company material.

## Materials Management — Material Master / MM01

### Extending an existing material

- [Extending a Material Master Record — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/f7fddfe4caca43dd967ac4c9ce6a70e4/e614c453f57eb44ce10000000a174cb4.html)
- [Extending Material Master Records — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/f7fddfe4caca43dd967ac4c9ce6a70e4/e314c453f57eb44ce10000000a174cb4.html)
- [Storage-Location-Specific Data — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/f7fddfe4caca43dd967ac4c9ce6a70e4/cc52bf53f106b44ce10000000a174cb4.html)
- [Create Material Master Data — Storage Location Data (MM01) — SAP Help](https://help.sap.com/docs/s4hana-best-practices/create-product-master-of-type-spare-parts-2j7/create-material-master-data-storage-location-data?version=2408)

Portfolio evidence:

- [MM01 sanitized visual guide](./visual-evidence/mm01-material-extension/README.md)
- [ECC MM evidence track](./01-ecc/mm/README.md)

The official documentation supports the distinction between creating a new material and extending an existing master record to additional views or organizational levels.

## ABAP development tooling

### Global classes and interfaces — Class Builder

- [Class Builder — SAP Help](https://help.sap.com/docs/SAP_ERP_SPV/142f8559883b4c11966ebfb99dd61164/cac035baa6c611d1b4790000e8a52bed.html)

SAP documents Class Builder as the tool used to create, define, change and test global ABAP classes/interfaces, accessible through `SE24` or `SE80`.

### Custom report transactions — SE93

- [Report Transactions — SAP Help](https://help.sap.com/docs/SAP_NETWEAVER_740/bd833c8355f34e96a6e83096b38bf192/430f4c879f2d6f41e10000000a422035.html)
- [Report Transactions — SAP Library](https://help.sap.com/saphelp_autoid2007/helpdata/en/eb/5fab3ed79b11d296190000e82de14a/content.htm?no_cache=true)

SAP documents `SE93` / Transaction Maintenance for assigning a transaction code to an executable report and selecting the **Program and selection screen (report transaction)** type.

Portfolio evidence:

- [ECC Z Transaction Engineering Guide](./01-ecc/Z_TRANSACTION_ENGINEERING_GUIDE.md)

### ABAP Unit

- [ABAP Unit — SAP Help](https://help.sap.com/docs/abap-cloud/abap-keyword/abap-unit)
- [CLASS ... FOR TESTING — SAP Help](https://help.sap.com/docs/abap-cloud/abap-keyword/class-for-testing?locale=en-US&state=PRODUCTION&version=latest)

These references support local test classes, `FOR TESTING` and the ABAP Unit assertion framework used in the source packs.

## ECC Work Management / Order Status Diagnostics

- [Order Status — SAP Help](https://help.sap.com/saphelp_scm700_ehp02/helpdata/en/04/4dd0532e8749aca51f9a15b43f3310/content.htm?no_cache=true)

The documented order-status datasource exposes the standard relationship used by the portfolio troubleshooting pack, including order number/object number context from `AUFK`, status records from `JEST`, and status-profile information from `JSTO`.

Portfolio evidence:

- [Work Order Status Audit](./01-ecc/isu/work-management/status-audit/README.md)
- [Sanitized WM operational evidence](./01-ecc/isu/functional-evidence/work-management-operations/README.md)

## S/4HANA Sourcing & Procurement APIs

### Purchase Requisition — OData V4

- [Purchase Requisition — OData V4 — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/91af7f8d3acd47da90d33aaacfcd0d59/dad2402e2ff543e7971d788bf35b12c1.html?locale=en-US)
- [Purchase Requisition Operations — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/91af7f8d3acd47da90d33aaacfcd0d59/de371314a0fc46e5a54b0c1cdd0d8ce4.html)

SAP identifies the service as `API_PURCHASEREQUISITION_2` and documents the OData V4 operations exposed for external consumers.

Portfolio evidence:

- [S/4HANA Procurement API Client](./02-s4hana/mm/procurement-api-lab/README.md)

The public TypeScript client is tested with deterministic local/mock behavior and CI; it does not claim a live enterprise tenant connection.

## S/4HANA Data Migration

- [Migrate Data Using Staging Tables — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/87ffdbfebd504116b497c02d51ce5b58.html?locale=en-US)
- [SAP S/4HANA Data Migration — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/6e7648c7d6a844e69ee9d24d00cfc464.html)
- [Simulating the Migration — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/0ee46d72aa734da6ba5d9285da4d7148.html)

Portfolio evidence:

- [Migration Cockpit Reference Guide](./02-s4hana/migration-cockpit/README.md)

The guide explains migration objects, staging/direct-transfer concepts, mapping, simulation, migration monitoring and reconciliation without publishing enterprise datasets.

## ABAP Cloud / Clean Core

- [Public Released APIs — SAP Help](https://help.sap.com/docs/abap-cloud/abap-cloud/public-released-apis)
- [Cloud-Optimized ABAP Language — SAP Help](https://help.sap.com/docs/abap-cloud/abap-cloud/abap-language)

SAP documents the released-API framework and release contracts such as C0, C1 and C2 used to separate stable customer consumption from unreleased SAP internals.

Portfolio evidence:

- [ABAP Cloud / Clean Core Reference](./02-s4hana/abap-cloud/README.md)

## RAP — ABAP RESTful Application Programming Model

- [ABAP RESTful Application Programming Model — SAP Help](https://help.sap.com/docs/btp/sap-business-technology-platform/abap-restful-application-programming-model?locale=en-US)
- [Service Definition — SAP Help](https://help.sap.com/docs/abap-cloud/abap-rap/service-definition)
- [Service Binding — SAP Help](https://help.sap.com/docs/abap-cloud/abap-rap/service-binding)
- [Creating a Service Definition and Service Binding — SAP Help](https://help.sap.com/docs/ABAP_PLATFORM_2020/fc4c71aa50014fd1b43721701471913d/acfdf16f491c47318175d5642b6bbd7a.html)

Portfolio evidence:

- [RAP Architecture Reference](./02-s4hana/rap/README.md)

The reference explains the current RAP architecture — CDS data model, behavior, service definition and service binding — without presenting unbuilt source as completed work.

## Evidence integrity rule

Official links validate standard SAP concepts; they do **not** convert a portfolio example into SAP-certified, productive or runtime-tested software. Runtime/test claims are stated only where actual execution evidence exists. All enterprise-specific screenshots and operational examples are sanitized before publication.
