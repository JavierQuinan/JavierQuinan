# SAP Integration Lab — Evidencia Pública de Ingeniería

[English version](./README.md)

> **Tipo de artefacto:** laboratorio público de evidencia técnica y funcional  
> **Estado actual:** en construcción  
> **Regla principal:** ninguna capacidad se presenta como ejecutada en SAP sin evidencia real de activación/ejecución  
> **Idiomas:** Inglés + Español

Este laboratorio convierte experiencia funcional SAP y formación técnica ABAP/ABAP Cloud en evidencia pública, revisable y no confidencial.

La estructura separa explícitamente tecnologías y contextos que no deben mezclarse:

1. **SAP ECC — Materials Management (MM)**
2. **SAP ECC — IS-U / Work Management**
3. **SAP S/4HANA — MM, CDS, APIs, ABAP Cloud y RAP**
4. **Integración SAP — REST/OData/SOAP/observabilidad**

## Política de evidencia

Cada artefacto recibe uno o más estados verificables:

| Estado | Significado |
|---|---|
| `PLANNED` | Diseñado pero todavía no existe código/documentación completa. |
| `SOURCE_READY` | Código/documentación revisable disponible en GitHub. |
| `STATIC_VALIDATED` | La lógica fuente y los vectores deterministas fueron revisados de forma consistente; no implica ejecución en SAP. |
| `EXECUTION_PROCEDURE_READY` | Existe una guía reproducible para crear, activar, probar y ejecutar los objetos en un entorno SAP autorizado. |
| `RUNTIME_DEFERRED` | La ejecución se difiere porque el ejercicio de portafolio no dispone/usa un DEV/sandbox autorizado o permisos CTS necesarios. |
| `RUNTIME_VALIDATED` | Activado/ejecutado en un entorno SAP apropiado y resultado documentado. |
| `TEST_VALIDATED` | Además de ejecutarse, existen pruebas reproducibles con evidencia documentada. |

`STATIC_VALIDATED` nunca equivale a `RUNTIME_VALIDATED`.

## Estructura objetivo

```text
sap-integration-lab/
├── README.md
├── README.es.md
├── EVIDENCE_GOVERNANCE.md
├── 01-ecc/
│   ├── technical-diagnostics/
│   ├── mm/
│   │   ├── inventory-reorder/
│   │   ├── purchasing/
│   │   └── service-procurement/
│   └── isu/
│       ├── master-data/
│       ├── device-management/
│       ├── work-management/
│       └── crm-isu-integration/
├── 02-s4hana/
│   ├── mm/
│   ├── cds/
│   ├── released-apis/
│   ├── abap-cloud/
│   └── rap/
└── 03-integration/
    ├── odata/
    ├── rest/
    ├── soap-xml/
    └── observability/
```

## SAP ECC — Diagnóstico técnico

La nueva [Guía de debugging y diagnóstico](./01-ecc/technical-diagnostics/README.es.md) documenta un flujo sanitizado y profesional usando:

- `SE93` para identificar el objeto detrás de una transacción
- `SE24` para clases ABAP
- `SE37` para módulos de función
- `SE38` para programas/reportes
- `SE80` como Workbench integrado
- `/H`, breakpoints y ABAP Debugger
- `ST22` para dumps
- `SM21` para contexto del log del sistema
- `SM50` y `SM66` para procesos locales/globales

Esta pieza demuestra metodología de troubleshooting y conocimiento técnico sin atribuir privilegios Basis ni debugging productivo.

## SAP ECC MM

La evidencia ECC MM cubre procesos clásicos de gestión de materiales y compras, manteniendo separados los ejercicios técnicos de cualquier configuración real de empleador/cliente.

El primer paquete, **ECC MM — Inventory & Stock Risk**, se encuentra ahora en:

`STATIC_VALIDATED / EXECUTION_PROCEDURE_READY / RUNTIME_DEFERRED`

Esto significa:

- revisión y hardening de fuente completados
- seis vectores deterministas trazados correctamente contra la implementación actual
- procedimiento reproducible `SE24` / `SE38` / `SE93` documentado
- ejecución/activación ABAP Unit en SAP no atribuida hasta contar con un entorno autorizado

Áreas siguientes:

- maestro de materiales y datos por centro/almacén
- solicitudes de pedido
- pedidos de compra
- posiciones y entregas
- contratación y adquisición de servicios
- reportes ALV/SALV
- ABAP Objects
- ABAP Unit

## SAP ECC IS-U / Work Management

Esta línea queda separada de S/4HANA. Aquí incorporaremos las guías reales una por una después de sanitizarlas.

Áreas previstas:

- instalaciones y contratos
- device management
- órdenes de trabajo
- workflow/status/event handling
- CRM ↔ IS-U
- integraciones WM ↔ sistemas externos/GIS
- troubleshooting operacional

Toda guía real será sanitizada antes de publicarse.

## SAP S/4HANA

La evidencia S/4HANA se diseñará bajo principios modernos:

- CDS View Entities
- released APIs
- OData
- ABAP Cloud
- Clean Core
- RAP
- behavior definitions / implementations
- service definitions / bindings
- pruebas
- conocimiento de Migration Cockpit separado de los patrones clásicos ECC

No se reutilizará automáticamente un patrón ECC de acceso directo a tablas para presentarlo como evidencia S/4HANA moderna.

## Integración SAP

Esta línea conectará SAP con el stack full-stack mostrado en el resto del portafolio:

- REST
- OData
- SOAP/XML
- transformación de mensajes
- idempotencia
- correlation IDs
- retry/error mapping
- auditoría y observabilidad
- separación segura de secretos/configuración

## Política bilingüe

La documentación técnica principal será **English-first** para recruiters y equipos internacionales, acompañada de una versión completa en español.

Ejemplo:

- `README.md` → English
- `README.es.md` → Español

El código usará nombres técnicos en inglés. Los escenarios funcionales podrán incluir ambos términos cuando aporte valor.

## Límite de confidencialidad

Nunca se publica:

- código del empleador/cliente
- nombres de empresa o usuarios internos
- clientes, contratos, instalaciones, medidores o IDs reales
- hostnames, RFC destinations, URLs internas o credenciales
- screenshots productivos sin sanitización
- certificados P12/PFX/PEM privados
- páginas/capturas de material formativo de terceros sin derechos de publicación

## Matriz actual

| Línea | Evidencia pública | Runtime | Estado |
|---|---|---|---|
| ECC Technical Diagnostics | guía de debugging/troubleshooting | no requerido para claim metodológico | `PROCEDURE_READY` |
| ECC MM | Inventory & Stock Risk source + validación estática | diferido | `STATIC_VALIDATED / EXECUTION_PROCEDURE_READY` |
| ECC IS-U / WM | guías reales por sanitizar/incorporar | pendiente | `PLANNED` |
| S/4HANA MM | ruta de estudio/evidencia | pendiente | `PLANNED` |
| ABAP Cloud / RAP | ruta técnica | pendiente | `PLANNED` |
| SAP Integration | arquitectura/integración | pendiente | `PLANNED` |

## Próximos hitos

1. ampliar ECC MM con compras y contratación de servicios
2. incorporar guías sanitizadas IS-U / Work Management
3. construir por separado la línea S/4HANA, incluida Migration Cockpit
4. añadir evidencia runtime ABAP en el futuro cuando exista un sandbox/DEV autorizado
