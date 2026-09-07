# Matriz de Capacidades SAP

[English version](./SAP_CAPABILITY_MATRIX.md)

Esta matriz contiene únicamente capacidades respaldadas por evidencia pública actual, ejecución histórica documentada, formación completada o experiencia enterprise real.

| Dominio | Capacidad | Clase de evidencia | Evidencia pública actual / límite |
|---|---|---|---|
| SAP ECC MM | Análisis de inventario / riesgo de stock | `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Pack ABAP read-only `MARA/MARC/MARD`, SALV, escenarios revisados y guía MM01 sanitizada |
| SAP ECC MM | Contratación de servicios / diagnóstico de contratos marco | `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Source read-only `EKKO/EKPO`, SALV, vigencia y guía bilingüe de construcción |
| SAP ECC MM | Analítica de compras | `PUBLIC_SOURCE_EVIDENCE` | Source `EBAN → EKKO/EKPO → EKET`, control de categoría PO y diagnósticos downstream/repartos |
| SAP IS-U / WM | Análisis y ciclo de vida de OT | `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Conocimiento sanitizado `IW38/IW32` más source `ZWM_STATUS_AUDIT_LAB` |
| SAP IS-U / WM | Troubleshooting de dispositivos / medidores | `ENTERPRISE_VERIFIED` | Guías operativas sanitizadas de estados de dispositivos y flujos WM/IS-U |
| SAP IS-U / CRM | Recuperación fin contractual / DCDE | `ENTERPRISE_VERIFIED` | Evidencia sanitizada CRM ↔ IS-U; sin claim genérico de plataforma de integración |
| Diagnóstico técnico SAP | Identificación de objetos, debugging, dumps y procesos | `ENTERPRISE_VERIFIED` | Secuencia `SE93`, `SE24/37/38/80`, debugger, `ST22`, `SM21`, `SM50/66` |
| SAP CRM/SD | Facturación de servicios no energéticos | `ENTERPRISE_VERIFIED` | Flujo sanitizado cliente/BP, área de ventas y billing/output |
| Labs históricos ABAP Cloud | Core / Objects / classrun / tablas internas / field symbols / Open SQL / excepciones | `HISTORICAL_EXECUTION_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Curso 1: 16 unidades contabilizadas, 10 labs hands-on personales, 10 sources públicos y 20 capturas ADT propias sanitizadas |
| Tooling ABAP | abapGit / ATC / ABAP Cleaner / autorizaciones | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` + `PUBLIC_NORMALIZED_SOURCE` | Cuatro prácticas de Curso 3 con source normalizado `_fq` y procedencia formativa explícita |
| ABAP Cloud Dictionary / DDIC | Dominios, elementos de datos, tablas, lock objects, persistencia, relaciones, Dynamic Cache | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` + `TRAINING_ONLY` | Formación hands-on de Curso 2 completada; no se representa un artefacto de source guardado |
| S/4HANA MM | Cliente Procurement API | `EXECUTABLE_NON_LIVE_EXAMPLE` | Cliente TypeScript PO/PR, validación OData, HTTPS, correlación y 6/6 tests CI observados; sin claim de tenant S/4 real |
| S/4HANA | Conceptos de migración | `DOCUMENTATION_GROUNDED` | Objetos de migración, staging/direct transfer, mapping, simulación, monitoreo y reconciliación |
| ABAP Cloud / Clean Core | Gobierno de APIs/objetos liberados | `DOCUMENTATION_GROUNDED` + formación completada | Guía Clean Core + formación ABAP Cloud completada; sin claim de compliance runtime derivado de los labs históricos |
| RAP | Arquitectura | `DOCUMENTATION_GROUNDED` | CDS → behavior → projection → service definition/binding → OData V4; sin claim runtime RAP |
| ABAP | Patrones ABAP Unit en otros packs públicos | `PUBLIC_SOURCE_EVIDENCE` | Escenarios deterministas revisados a nivel de source; sin claim de ejecución runtime actual |
| Arquitectura de integración | Patrones de resiliencia OData / REST / SOAP | `DOCUMENTATION_GROUNDED` + `EXECUTABLE_NON_LIVE_EXAMPLE` | Guía de arquitectura + cliente S/4 no-live; no es evidencia de una integración SAP productiva |

## Límite de claims

Esta matriz no afirma runtime de SAP Integration Suite/CPI, conectividad live a APIs S/4HANA, OData/SOAP productivo, runtime IDoc/RFC/BAPI, Event Mesh ni runtime RAP/service-binding. Esas capacidades simplemente quedan fuera de la evidencia representada aquí.

## Resumen para recruiter

**Fortaleza funcional / procesos:** SAP ECC MM · SAP IS-U / Work Management · CRM/SD  
**Fortaleza técnica:** ABAP Objects · SALV · debugging · análisis de estados/datos · 10 labs hands-on históricos ABAP Cloud · 4 prácticas de tooling de Curso 3  
**Límite de evidencia SAP moderno:** ABAP Cloud hands-on histórico · formación DDIC/tooling completada · Clean Core/RAP basado en documentación · ejemplo client-side S/4HANA no-live
