# SAP Integration Lab — Evidencia Pública de Ingeniería

> **Tipo de artefacto:** laboratorio público de evidencia técnica y funcional  
> **Estado actual:** en construcción  
> **Regla principal:** ninguna capacidad se presenta como ejecutada en SAP sin evidencia de activación, ejecución o prueba en un sistema SAP  
> **Idiomas:** Inglés + Español

Este laboratorio convierte experiencia funcional SAP y formación técnica ABAP/ABAP Cloud en evidencia pública, revisable y no confidencial.

La estructura separa explícitamente tecnologías y contextos que no deben mezclarse:

1. **SAP ECC — Materials Management (MM)**
2. **SAP ECC — IS-U / Work Management**
3. **SAP S/4HANA — MM, CDS, APIs, ABAP Cloud y RAP**
4. **Integración SAP — REST/OData/SOAP/observabilidad**

## Política de evidencia

Cada artefacto recibe uno de estos estados:

| Estado | Significado |
|---|---|
| `PLANNED` | Diseñado pero todavía no existe código/documentación completa. |
| `SOURCE_READY` | Código/documentación revisable disponible en GitHub. |
| `RUNTIME_VALIDATION_PENDING` | El código está listo para ser activado/ejecutado, pero aún no existe evidencia de ejecución en SAP. |
| `RUNTIME_VALIDATED` | Activado/ejecutado en un entorno SAP apropiado y resultado documentado. |
| `TEST_VALIDATED` | Además de ejecutarse, existen pruebas reproducibles (por ejemplo ABAP Unit) con evidencia documentada. |

`SOURCE_READY` nunca equivale a `RUNTIME_VALIDATED`.

## Estructura objetivo

```text
sap-integration-lab/
├── README.md
├── README.es.md
├── EVIDENCE_GOVERNANCE.md
├── 01-ecc/
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

## SAP ECC MM

La evidencia ECC MM cubrirá procesos clásicos de gestión de materiales y compras, manteniendo separados los ejercicios técnicos de cualquier configuración real de empleador/cliente.

Áreas previstas:

- maestro de materiales y datos por centro/almacén
- stock, punto de pedido y stock de seguridad
- solicitudes de pedido
- pedidos de compra
- posiciones y entregas
- contratación y adquisición de servicios
- reportes ALV/SALV
- ABAP Objects
- ABAP Unit

Cuando corresponda, se podrán utilizar objetos estándar ECC en escenarios controlados, por ejemplo MARA/MARC/MARD y documentos de compras, siempre con datos demo/sintéticos y sin copiar desarrollos propietarios.

## SAP ECC IS-U / Work Management

Esta línea queda separada de S/4HANA. Aquí incorporaremos tus guías reales cuando lleguemos a cada bloque funcional.

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

No se reutilizará automáticamente un patrón ECC de acceso directo a tablas para presentarlo como evidencia S/4HANA moderna.

## Integración SAP

Esta línea conectará SAP con el stack full-stack mostrado en el resto del portfolio:

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

El código usará nombres técnicos en inglés. Los escenarios funcionales podrán incluir ambos términos cuando aporte valor, por ejemplo:

- Purchase Requisition / Solicitud de pedido
- Purchase Order / Pedido de compra
- Work Order / Orden de trabajo
- Utility Installation / Instalación IS-U

## Límite de confidencialidad

Nunca se publica:

- código del empleador/cliente
- nombres de empresa o usuarios internos
- clientes, contratos, instalaciones, medidores o IDs reales
- hostnames, RFC destinations, URLs internas o credenciales
- screenshots productivos sin sanitización
- certificados P12/PFX/PEM privados

## Próximo hito

El primer paquete será:

**SAP ECC MM — Inventory & Reorder Evidence Pack**

Incluirá:

- lógica OO
- datasource desacoplado
- implementación demo/sintética
- implementación SAP ECC cuando podamos validarla correctamente
- reporte ejecutable
- ABAP Unit
- README EN/ES
- checklist de activación y evidencia runtime

Hasta completar la validación runtime, el estado será `SOURCE_READY / RUNTIME_VALIDATION_PENDING`.
