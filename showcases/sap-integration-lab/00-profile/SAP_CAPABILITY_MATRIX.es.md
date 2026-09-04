# Matriz de Capacidades SAP

[English version](./SAP_CAPABILITY_MATRIX.md)

Esta matriz hace explícita la diferencia entre experiencia empresarial, evidencia pública de ingeniería y formación completada.

| Dominio | Capacidad | Clase de evidencia | Evidencia pública actual |
|---|---|---|---|
| SAP ECC MM | Análisis de inventario / riesgo de stock | Source público + experiencia sanitizada | Pack ABAP read-only sobre `MARA/MARC/MARD`, source SALV, escenarios deterministas revisados a nivel de source, guía MM01 sanitizada |
| SAP ECC MM | Contratación de servicios / diagnóstico de contratos marco | Source público + experiencia sanitizada | Source de auditoría read-only `EKKO/EKPO`, SALV, diagnóstico de vigencia y guía bilingüe de construcción |
| SAP ECC MM | Analítica de compras | Source público | Source `EBAN → EKKO/EKPO → EKET`, control de categoría PO y diagnósticos de líneas de reparto/referencias downstream |
| SAP IS-U / WM | Análisis y ciclo de vida de órdenes de trabajo | Experiencia sanitizada + source público | Guías `IW38/IW32` más `ZWM_STATUS_AUDIT_LAB` sobre tablas de estado/histórico |
| SAP IS-U / WM | Troubleshooting operativo de dispositivos / medidores | Experiencia sanitizada | Guías sanitizadas de regularización de estados de dispositivos y flujos relacionados WM/IS-U |
| SAP IS-U / CRM | Recuperación de fin contractual / DCDE e integración | Experiencia sanitizada | Guías sanitizadas CRM ↔ IS-U y evidencia de integración |
| Diagnóstico técnico SAP | Identificación de objetos, debugging, dumps y análisis de procesos | Experiencia sanitizada | Secuencia `SE93`, `SE24/37/38/80`, debugger, `ST22`, `SM21`, `SM50/66` |
| SAP CRM/SD | Facturación de servicios no energéticos | Experiencia sanitizada | Documentación sanitizada de cliente/BP, área de ventas, billing/output |
| S/4HANA MM | Integración con APIs de procurement | Evidencia pública ejecutable | Cliente TypeScript PO/PR sin dependencias, validación OData, control HTTPS, correlación de requests y 6/6 tests CI |
| S/4HANA | Conceptos de migración | Guía pública basada en documentación | Objetos de migración, staging/direct transfer, mapping, simulación, monitoreo y reconciliación |
| ABAP Cloud / Clean Core | Gobierno de APIs/objetos liberados | Guía basada en documentación + formación completada | Guía pública Clean Core más formación ABAP Cloud completada |
| RAP | Arquitectura | Guía pública basada en documentación | Arquitectura CDS → behavior → projection → service definition/binding → OData V4 |
| ABAP | Objects, SALV y estructura modular | Evidencia pública de ingeniería | Múltiples packs ABAP revisables en MM e IS-U/WM |
| ABAP | Patrones de diseño ABAP Unit | Evidencia de source público | Escenarios deterministas incluidos/revisados a nivel de source; sin afirmar ejecución runtime corporativa |
| ABAP | abapGit, ATC, ABAP Cleaner y autorizaciones | Formación completada | Credencial de aprovechamiento de tercero; los laboratorios solo se publican cuando la evidencia es suministrada y sanitizada |
| Integración | Resiliencia OData / REST / SOAP | Evidencia pública de ingeniería | Guía de idempotencia, mapeo de errores, correlation IDs, observabilidad y separación de secretos |

## Clases de evidencia

- **Experiencia sanitizada** — conocimiento operativo derivado de trabajo empresarial real, reescrito para eliminar información confidencial de empresa/cliente.
- **Source público** — existe código fuente revisable en este repositorio.
- **Evidencia pública ejecutable** — existe código más tests automatizados/evidencia CI en este repositorio.
- **Basada en documentación** — guía técnica/arquitectónica respaldada por documentación oficial y separada de afirmaciones runtime.
- **Formación completada** — se suministró una credencial de curso/diploma; la formación por sí sola no se trata como evidencia productiva.

## Resumen para recruiter

**Fortaleza funcional / procesos:** SAP ECC MM · SAP IS-U / Work Management · CRM/SD  
**Fortaleza técnica:** ABAP Objects · SALV · debugging · análisis de estados/datos · ingeniería de integración  
**SAP moderno — formación/evidencia:** ABAP Cloud · Clean Core · RAP · APIs S/4HANA · ATC · abapGit
