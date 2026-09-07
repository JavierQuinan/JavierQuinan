# Portfolio SAP — Estado Final

[English version](./FINAL_STATUS.md)

> **ESTADO DEL PORTFOLIO SAP: COMPLETO PARA LA EVIDENCIA ACTUAL DOCUMENTADA.** Esto afirma que el alcance actual y definido de este track de portfolio SAP está completo sobre lo que existe hoy — **no** afirma que "SAP como tecnología" esté completado, dominado, ni cubierto exhaustivamente.

## 1. Experiencia enterprise

`ENTERPRISE_VERIFIED` + `PUBLIC_SOURCE_EVIDENCE` — conocimiento operativo sanitizado y source revisable de trabajo real en SAP MM, IS-U/Work Management, y CRM/SD. Ver [SAP Engineering Evidence Lab](./README.es.md).

## 2. Curso 1 — 16 unidades, 10 laboratorios

`HISTORICAL_EXECUTION_VERIFIED` — el currículo completo de 16 unidades de Curso 1 está contabilizado: 10 unidades tienen un laboratorio hands-on personal (source + las propias capturas sanitizadas del propietario), y 6 unidades son solo-teoría (estudiadas, sin ejercicio de Laboratorio, sin entrega personal en Word — listadas como temas de currículo, no laboratorios). No se afirma ni se exige runtime actual. Ver [Laboratorios Históricos ABAP Cloud](./04-abap-labs/labs/README.es.md).

## 3. Evidencia de source de Curso 1

10 archivos de source de clase ABAP personales (`ZCL_LAB_01_VAR_FQ` hasta `ZCL_LAB_08_FIELDSYMBOLS_FQ`, incluyendo los laboratorios en dos partes 05/05a y 07/07a), sin cambios desde su entrega original de 2025.

## 4. Evidencia visual de Curso 1

21 capturas propias de Eclipse ADT del propietario, extraídas de las entregas Word originales y publicadas carpeta de laboratorio por carpeta de laboratorio, cada una con una nota de sanitización documentada (identificadores privados de cuenta, hostnames de tenant, nombres de usuario técnicos, y datos de registro del entorno de formación redactados donde estaban presentes; sin modificar en los demás casos).

## 5. Formación hands-on de Curso 2

`TRAINING_ONLY` / `NO_SAVED_SOURCE_ARTIFACT` — la práctica hands-on de ABAP Dictionary (dominios, elementos de datos, tablas, objetos de bloqueo, ajustes de persistencia, relaciones de tablas, Dynamic Cache) ocurrió según el registro de formación del propietario, pero no sobrevivió ningún artefacto de source para publicar. No se fabrica código para llenar este gap.

## 6. Prácticas hands-on de Curso 3 + sources normalizados `_fq`

`OWNER_CONFIRMED_HANDS_ON_EXECUTION` + `PUBLIC_NORMALIZED_SOURCE` — 4 prácticas (abapGit, ATC, ABAP Cleaner, Autorizaciones), ejecutadas personalmente por el propietario durante formación estructurada y normalizadas a la nomenclatura `_fq` del portfolio. Ver [Prácticas de Formación de Curso 3](./04-abap-labs/training-practices/README.es.md).

## 7. Credenciales de formación SAP

Reconciliadas directamente contra los propios archivos de certificado del propietario. Ver [Formación y Credenciales SAP](./00-profile/TRAINING_AND_CREDENTIALS.es.md).

## 8. Credencial de Odoo (separada de SAP)

Certificación Funcional de Odoo 18 (Español) — Odoo Inc., Certificate of Achievement. Ver el [Índice General de Credenciales](../../docs/CREDENTIALS.es.md).

## 9. Evidencia actual de S/4HANA

`DOCUMENTATION_GROUNDED` (Migration Cockpit, ABAP Cloud/Clean Core, arquitectura RAP) + `EXECUTABLE_NON_LIVE_EXAMPLE` (S/4HANA MM Procurement API Client, testeado, sin claim de tenant en vivo). Ver [Línea de Evidencia S/4HANA](./02-s4hana/README.es.md).

## Límites de los claims

No se afirma, en ningún archivo de este lab:

- implementación de SAP Integration Suite / CPI;
- conectividad real a APIs S/4HANA en vivo;
- implementación productiva de servicios OData o SOAP;
- runtime de integración IDoc o RFC/BAPI;
- Event Mesh;
- runtime de RAP/service-binding;
- ejecución actual de ABAP Unit, CDS, ni RAP en ningún lugar de este track;
- "SAP Certified" ni "SAP Official Certification" para ninguna credencial no emitida por SAP.
