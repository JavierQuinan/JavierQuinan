# Estándar de Evidencia para Proyectos Flagship

[English version](./FLAGSHIP_ENGINEERING_STANDARD.md)

Este estándar define cómo representar en el portfolio público los proyectos privados/comerciales más fuertes sin exponer código propietario, datos de clientes ni secretos productivos.

## Proyectos objetivo

Nivel flagship actual:

- KOVI
- MOTORIX / TecnoAuto
- FITBA / GYMORA
- LegalTech Automation Platform

Los tracks enterprise como SAP Integration Lab y Odoo Engineering Lab siguen la misma filosofía evidence-first, adaptada a su dominio.

## Estructura requerida para cada caso de estudio

Cada flagship debe documentar progresivamente:

1. problema y usuarios objetivo;
2. superficies de producto y alcance de dominio verificados;
3. arquitectura y límites del sistema;
4. modelo de datos/tenancy/seguridad;
5. decisiones de ingeniería importantes y ADRs;
6. evidencia automatizada de calidad;
7. controles CI/CD y de release;
8. observabilidad y readiness operacional;
9. comportamiento ante fallos/recuperación cuando corresponda;
10. límites de deployment/runtime;
11. screenshots sintéticos o demo en video cuando sea seguro;
12. limitaciones y non-claims explícitos;
13. roadmap separado de la implementación actual.

## Política bilingüe

La documentación recruiter-facing será English-first para alcance internacional y tendrá una versión materialmente equivalente en español para LATAM. Identificadores de código, APIs y términos técnicos estándar pueden mantenerse en inglés.

Convención recomendada:

```text
README.md
README.es.md
ARCHITECTURE.md
ARCHITECTURE.es.md
IMPLEMENTATION_GUIDE.md
IMPLEMENTATION_GUIDE.es.md
OPERATIONS_GUIDE.md
OPERATIONS_GUIDE.es.md
SECURITY.md
SECURITY.es.md
```

No todos los proyectos necesitan todos los documentos inmediatamente. Solo se añaden cuando existe evidencia real que los respalde.

## Clases de evidencia

- **Private-source verified** — afirmación confirmada en el repositorio privado, sin publicar el source.
- **Sanitized operational evidence** — conocimiento real de ingeniería/operación reescrito para eliminar identificadores sensibles.
- **Public engineering evidence** — existe source, tests o artefacto ejecutable revisable públicamente.
- **CI/runtime verified** — un gate de calidad o runtime fue realmente observado en estado passing.
- **Roadmap** — dirección planificada; nunca se presenta como funcionalidad implementada.

## Gate de seguridad y privacidad para publicación

No publicar:

- credenciales, tokens o secretos de entorno;
- datos de clientes/tenants/miembros/casos;
- certificados o material privado de firma;
- endpoints productivos u hostnames internos;
- dumps de base de datos;
- source propietario de empresa/cliente;
- screenshots sensibles;
- claims no respaldados de seguridad, performance o producción.

## Gate de calidad antes de un claim fuerte

Una capacidad debe pasar de “planificada” o “prototipo” a evidencia fuerte solo cuando exista respaldo adecuado: código, tests automatizados, verificación runtime, CI, documentación operacional o demo reproducible.

## Resultado esperado en el portfolio

El objetivo no es maximizar la cantidad de proyectos, sino hacer que un grupo reducido demuestre fortalezas distintas:

- **KOVI:** SaaS regulado, queues/workers, integración fiscal y manejo de credenciales sensibles;
- **MOTORIX:** ERP/SaaS multi-tenant, RBAC, scoping por sucursal, migraciones y operaciones;
- **FITBA:** web + mobile nativo, modelo compartido, RLS, engagement/gamificación y arquitectura de consentimiento;
- **LegalTech:** ingeniería de workflows jurídicos, procesamiento documental, seguridad/privacidad y asistencia IA con límites explícitos.
