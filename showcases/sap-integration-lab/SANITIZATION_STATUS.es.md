# Estado de Sanitización Pública SAP

[English version](./SANITIZATION_STATUS.md)

**Estado: COMPLETO.**

Este registro describe el estado público del repositorio después de la sanitización. No agrega claims de capacidades técnicas.

## Evidencia incluida

- Curso 1: 16/16 unidades del currículo contabilizadas; 10 labs hands-on con 10 sources `.abap` preservados y 20 capturas propias sanitizadas de Eclipse ADT.
- Curso 2: formación hands-on de ABAP Dictionary completada y documentada sin fabricar artefactos de source.
- Curso 3: cuatro prácticas hands-on confirmadas por el propietario con source público normalizado `_fq`.
- Evidencia enterprise SAP: material sanitizado de MM, IS-U/Work Management, CRM/SD y diagnóstico técnico.
- Credenciales de formación SAP: 9 registros recruiter-facing (certificado + diploma de especialización S/4HANA, 3 certificados destacados 2026 de Logali ABAP Cloud y 5 certificados/webinar adicionales de Logali), cada uno enlazado a un único PDF público canónico bajo `docs/credentials/evidence/sap/`.
- Credencial Odoo: indexada por separado de SAP y enlazada al propio "Certificate of Achievement" del emisor bajo `docs/credentials/evidence/odoo/`.
- Otra credencial técnica: el certificado del curso de Angular está enlazado bajo `docs/credentials/evidence/other/`.
- Cada certificado publicado fue verificado individualmente (inventario SHA-256, revisión de contenido) contra la carpeta origen `certificados/`; se excluyeron archivos exactamente duplicados y finalizaciones anteriores/repetidas superadas, de modo que cada credencial corresponde a un único archivo público canónico.

## Política de certificados públicos

Los certificados seleccionados intencionalmente para el portfolio son evidencia pública. Se prefiere un único PDF o imagen original canónica por credencial y se eliminan copias duplicadas. Se conservan branding del emisor, nombre del titular, título del certificado, fecha, duración y datos públicos de verificación. Solo se redacta información realmente sensible que no esté relacionada con la verificación pública de la credencial.

## Excluido del repositorio público

- PDFs crudos de cursos y entregas Word que sean material didáctico y no evidencia de certificado del propietario;
- copias duplicadas de certificados;
- páginas/capturas del curso con branding del instructor que no pertenezcan al titular;
- identificadores privados de cuenta BTP, hostnames de tenant y usuarios técnicos SAP;
- identificadores de cliente/empleador, tickets reales, IDs de materiales/órdenes/cuentas y URLs privadas;
- credenciales, tokens, service keys y secretos;
- borradores no ejecutados de reproducibilidad y material de planificación de reejecución.

## Límite de integridad

La evidencia pública describe únicamente lo respaldado por source, formación completada, ejecución histórica documentada, visuales propios sanitizados, evidencia pública de certificados, resultados observados de CI/local o experiencia enterprise sanitizada. Las capacidades fuera de esa evidencia se omiten o se expresan únicamente como límites de claim.
