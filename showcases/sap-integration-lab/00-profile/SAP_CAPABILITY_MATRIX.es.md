# Matriz de Capacidades SAP

[English version](./SAP_CAPABILITY_MATRIX.md)

Esta matriz distingue experiencia enterprise real, labs hands-on históricos, source público, ejemplos ejecutables no-live, estudio basado en documentación y formación.

| Dominio | Capacidad | Clase de evidencia | Evidencia pública actual / límite |
|---|---|---|---|
| SAP ECC MM | Análisis de inventario / riesgo de stock | `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Pack ABAP read-only `MARA/MARC/MARD`, SALV, escenarios revisados, guía MM01 sanitizada |
| SAP ECC MM | Contratación de servicios / diagnóstico de contratos marco | `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Source read-only `EKKO/EKPO`, SALV, vigencia y guía bilingüe de construcción |
| SAP ECC MM | Analítica de compras | `PUBLIC_SOURCE_EVIDENCE` | Source `EBAN → EKKO/EKPO → EKET`, control de categoría PO y diagnósticos downstream/repartos |
| SAP IS-U / WM | Análisis y ciclo de vida de OT | `ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` | Conocimiento sanitizado `IW38/IW32` más source `ZWM_STATUS_AUDIT_LAB` |
| SAP IS-U / WM | Troubleshooting de dispositivos / medidores | `ENTERPRISE_VERIFIED` | Guías operativas sanitizadas de estados de dispositivos y flujos WM/IS-U |
| SAP IS-U / CRM | Recuperación fin contractual / DCDE | `ENTERPRISE_VERIFIED` | Evidencia sanitizada CRM ↔ IS-U; esto no implica un claim genérico de plataforma de integración |
| Diagnóstico técnico SAP | Identificación de objetos, debugging, dumps y procesos | `ENTERPRISE_VERIFIED` | Secuencia `SE93`, `SE24/37/38/80`, debugger, `ST22`, `SM21`, `SM50/66` |
| SAP CRM/SD | Facturación de servicios no energéticos | `ENTERPRISE_VERIFIED` | Flujo sanitizado cliente/BP, área de ventas y billing/output |
| Labs históricos ABAP Cloud | Core / Objects / classrun / tablas internas / field symbols / Open SQL / excepciones | `HANDS_ON_HISTORICAL` + `PUBLIC_SOURCE_EVIDENCE` | 10 sources personales con evidencia histórica de ejecución; **0/10 revalidados en runtime actual** |
| S/4HANA MM | Cliente Procurement API | `EXECUTABLE_NON_LIVE_EXAMPLE` | Cliente TypeScript PO/PR, validación OData, HTTPS, correlación y 6/6 tests CI observados; **sin claim de tenant S/4 real** |
| S/4HANA | Conceptos de migración | `DOCUMENTATION_GROUNDED` | Objetos de migración, staging/direct transfer, mapping, simulación, monitoreo y reconciliación |
| ABAP Cloud / Clean Core | Gobierno de APIs/objetos liberados | `DOCUMENTATION_GROUNDED` + contexto `TRAINING_ONLY` | Guía Clean Core + formación completada; los labs históricos no prueban runtime Clean Core |
| RAP | Arquitectura | `DOCUMENTATION_GROUNDED` | CDS → behavior → projection → service definition/binding → OData V4; **sin claim runtime RAP** |
| ABAP | Patrones ABAP Unit en otros packs públicos | `PUBLIC_SOURCE_EVIDENCE` | Escenarios deterministas revisados a nivel de source; sin claim de ejecución corporativa/actual |
| Tooling ABAP | abapGit / ATC / ABAP Cleaner / autorizaciones | `TRAINING_ONLY` en el track histórico | Guías derivadas de formación; evidencia hands-on independiente queda como trabajo futuro |
| Arquitectura de integración | Patrones de resiliencia OData / REST / SOAP | `DOCUMENTATION_GROUNDED` + `EXECUTABLE_NON_LIVE_EXAMPLE` | Guía de arquitectura + cliente S/4 no-live; **no es evidencia de una integración SAP productiva** |
| SAP Integration Suite / CPI | Implementación runtime | `NOT_YET_EVIDENCED` | No existe actualmente evidencia hands-on/runtime publicada |
| APIs/interfaces SAP productivas | Runtime OData/SOAP/IDoc/RFC/BAPI real | `NOT_YET_EVIDENCED` | No se publica actualmente claim de integración live |

## Resumen para recruiter

**Fortaleza funcional / procesos:** SAP ECC MM · SAP IS-U / Work Management · CRM/SD  
**Fortaleza técnica:** ABAP Objects · SALV · debugging · análisis de estados/datos · labs históricos ABAP Cloud  
**Límite de evidencia SAP moderno:** ABAP Cloud hands-on histórico · Clean Core/RAP basado en documentación · ejemplo client-side S/4HANA no-live
