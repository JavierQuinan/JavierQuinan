# Índice de Referencias Oficiales SAP

[English version](./OFFICIAL_SAP_REFERENCES.md)

> **Propósito:** índice de referencias autoritativas que respaldan las guías públicas y la evidencia técnica SAP de este repositorio.  
> **Política de fuentes:** se prioriza SAP Help Portal para comportamiento estándar, herramientas de desarrollo y arquitectura de APIs. El material operativo propio se sanitiza por separado y nunca se presenta como documentación oficial SAP.

Esta página conecta las guías y el source original del portafolio con documentación pública SAP para que otro consultor o desarrollador pueda reproducir las partes estándar sin depender de material interno de una empresa.

## Materials Management — Maestro de Materiales / MM01

### Extensión de un material existente

- [Extending a Material Master Record — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/f7fddfe4caca43dd967ac4c9ce6a70e4/e614c453f57eb44ce10000000a174cb4.html)
- [Extending Material Master Records — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/f7fddfe4caca43dd967ac4c9ce6a70e4/e314c453f57eb44ce10000000a174cb4.html)
- [Storage-Location-Specific Data — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/f7fddfe4caca43dd967ac4c9ce6a70e4/cc52bf53f106b44ce10000000a174cb4.html)
- [Create Material Master Data — Storage Location Data (MM01) — SAP Help](https://help.sap.com/docs/s4hana-best-practices/create-product-master-of-type-spare-parts-2j7/create-material-master-data-storage-location-data?version=2408)

Evidencia del portafolio:

- [Guía visual MM01 sanitizada](./visual-evidence/mm01-material-extension/README.es.md)
- [Línea ECC MM](./01-ecc/mm/README.es.md)

La documentación oficial respalda la diferencia entre crear un material nuevo y extender un registro maestro existente a vistas o niveles organizativos adicionales.

## Herramientas de desarrollo ABAP

### Clases e interfaces globales — Class Builder

- [Class Builder — SAP Help](https://help.sap.com/docs/SAP_ERP_SPV/142f8559883b4c11966ebfb99dd61164/cac035baa6c611d1b4790000e8a52bed.html)

SAP documenta Class Builder como herramienta para crear, definir, modificar y probar clases/interfaces ABAP globales, accesible mediante `SE24` o `SE80`.

### Transacciones Z para reportes — SE93

- [Report Transactions — SAP Help](https://help.sap.com/docs/SAP_NETWEAVER_740/bd833c8355f34e96a6e83096b38bf192/430f4c879f2d6f41e10000000a422035.html)
- [Report Transactions — SAP Library](https://help.sap.com/saphelp_autoid2007/helpdata/en/eb/5fab3ed79b11d296190000e82de14a/content.htm?no_cache=true)

SAP documenta `SE93` / Transaction Maintenance para asociar un código de transacción con un programa ejecutable y seleccionar el tipo **Program and selection screen (report transaction)**.

Evidencia del portafolio:

- [Guía de Ingeniería de Transacciones Z](./01-ecc/Z_TRANSACTION_ENGINEERING_GUIDE.es.md)

### ABAP Unit

- [ABAP Unit — SAP Help](https://help.sap.com/docs/abap-cloud/abap-keyword/abap-unit)
- [CLASS ... FOR TESTING — SAP Help](https://help.sap.com/docs/abap-cloud/abap-keyword/class-for-testing?locale=en-US&state=PRODUCTION&version=latest)

Estas referencias respaldan clases locales de prueba, `FOR TESTING` y el framework de assertions usado en los packs de source.

## ECC Work Management / Diagnóstico de Estados de Órdenes

- [Order Status — SAP Help](https://help.sap.com/saphelp_scm700_ehp02/helpdata/en/04/4dd0532e8749aca51f9a15b43f3310/content.htm?no_cache=true)

El datasource estándar documentado expone la relación utilizada por el pack de troubleshooting: contexto de orden/objeto desde `AUFK`, registros de estado desde `JEST` y perfil de estados desde `JSTO`.

Evidencia del portafolio:

- [Auditoría de Estados de OT](./01-ecc/isu/work-management/status-audit/README.es.md)
- [Evidencia operativa WM sanitizada](./01-ecc/isu/functional-evidence/work-management-operations/README.es.md)

## S/4HANA Sourcing & Procurement APIs

### Purchase Requisition — OData V4

- [Purchase Requisition — OData V4 — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/91af7f8d3acd47da90d33aaacfcd0d59/dad2402e2ff543e7971d788bf35b12c1.html?locale=en-US)
- [Purchase Requisition Operations — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/91af7f8d3acd47da90d33aaacfcd0d59/de371314a0fc46e5a54b0c1cdd0d8ce4.html)

SAP identifica el servicio como `API_PURCHASEREQUISITION_2` y documenta las operaciones OData V4 para consumidores externos.

Evidencia del portafolio:

- [Cliente S/4HANA Procurement API](./02-s4hana/mm/procurement-api-lab/README.es.md)

El cliente TypeScript público está probado mediante comportamiento local/mock determinista y CI; no atribuye una conexión a un tenant empresarial real.

## Migración de Datos S/4HANA

- [Migrate Data Using Staging Tables — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/87ffdbfebd504116b497c02d51ce5b58.html?locale=en-US)
- [SAP S/4HANA Data Migration — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/6e7648c7d6a844e69ee9d24d00cfc464.html)
- [Simulating the Migration — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/0ee46d72aa734da6ba5d9285da4d7148.html)

Evidencia del portafolio:

- [Guía de Referencia Migration Cockpit](./02-s4hana/migration-cockpit/README.es.md)

La guía explica migration objects, staging/direct transfer, mapping, simulación, monitoreo y reconciliación sin publicar datasets empresariales.

## ABAP Cloud / Clean Core

- [Public Released APIs — SAP Help](https://help.sap.com/docs/abap-cloud/abap-cloud/public-released-apis)
- [Cloud-Optimized ABAP Language — SAP Help](https://help.sap.com/docs/abap-cloud/abap-cloud/abap-language)

SAP documenta el framework de APIs liberadas y contratos como C0, C1 y C2 para separar consumo estable de objetos SAP frente a objetos no liberados.

Evidencia del portafolio:

- [Referencia ABAP Cloud / Clean Core](./02-s4hana/abap-cloud/README.es.md)

## RAP — ABAP RESTful Application Programming Model

- [ABAP RESTful Application Programming Model — SAP Help](https://help.sap.com/docs/btp/sap-business-technology-platform/abap-restful-application-programming-model?locale=en-US)
- [Service Definition — SAP Help](https://help.sap.com/docs/abap-cloud/abap-rap/service-definition)
- [Service Binding — SAP Help](https://help.sap.com/docs/abap-cloud/abap-rap/service-binding)
- [Creating a Service Definition and Service Binding — SAP Help](https://help.sap.com/docs/ABAP_PLATFORM_2020/fc4c71aa50014fd1b43721701471913d/acfdf16f491c47318175d5642b6bbd7a.html)

Evidencia del portafolio:

- [Referencia de Arquitectura RAP](./02-s4hana/rap/README.es.md)

La referencia explica la arquitectura RAP actual —modelo CDS, behavior, service definition y service binding— sin presentar source inexistente como trabajo realizado.

## Regla de integridad

Los enlaces oficiales respaldan conceptos estándar SAP; **no** convierten un ejemplo de portafolio en software certificado, productivo o probado en runtime SAP. Los claims de ejecución/pruebas se expresan únicamente cuando existe evidencia real. Toda captura empresarial se sanitiza antes de publicarse.
