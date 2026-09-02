# SAP ECC — Guía de Ingeniería de Transacciones Z

[English version](./Z_TRANSACTION_ENGINEERING_GUIDE.md)

Esta guía explica el patrón de ingeniería utilizado por los **artefactos custom de reporte/transacción que ya existen** en este portafolio. No contiene una lista especulativa de laboratorios.

## Artefactos existentes

| Artefacto | Dominio | Tipo | Evidencia revisable |
|---|---|---|---|
| `ZMM_STOCK_RISK` | ECC MM | Report Transaction read-only | ABAP OO · `MARA/MARC/MARD` · SALV · 6 escenarios revisados |
| `ZMM_CONTRACT_AUDIT` | ECC MM Servicios | Report Transaction read-only | `EKKO/EKPO` · diagnóstico contractual · SALV · 8 escenarios revisados |
| `ZMM_PURCH_ANALYTICS` | ECC MM Purchasing | Report Transaction read-only | `EBAN/EKKO/EKPO/EKET` · SALV · 7 escenarios revisados |
| `ZWM_STATUS_AUDIT_LAB` | ECC IS-U / WM | Report Transaction read-only | `AUFK/JSTO/JEST/TJ02T/TJ30T/JCDS` · SALV · 6 escenarios revisados |

## Patrón de ingeniería

```text
Escenario funcional/diagnóstico
          ↓
Interfaz datasource
     ┌────┴────┐
     ▼         ▼
Fuente ECC   Fuente demo
     └────┬────┘
          ▼
Servicio ABAP Objects
          ↓
Escenarios deterministas
          ↓
Reporte ejecutable / SALV
          ↓
Definición Report Transaction en SE93
```

La estructura separa:

- acceso a datos/API SAP;
- lógica funcional/diagnóstica;
- datos sintéticos deterministas;
- presentación/salida.

## SE24 — objetos globales

Los packs existentes utilizan clases de excepción, interfaces y clases de servicio/datasource globales. Las guías de construcción definen un orden de dependencias reproducible.

Secuencia típica:

1. clase de excepción;
2. interfaz datasource;
3. datasource demo;
4. datasource ECC;
5. servicio de dominio;
6. clases locales ABAP Unit.

## SE38 — reporte ejecutable

Cada pack incluye source de reporte ejecutable con selección acotada y salida SALV. El reporte delega lógica de dominio al servicio, evitando concentrar acceso a datos y reglas dentro de `START-OF-SELECTION`.

## SE93 — Report Transaction

Patrón documentado:

```text
SE93
  ↓
Crear código de transacción
  ↓
Report Transaction / Programa y pantalla de selección
  ↓
Asignar reporte Z ejecutable
  ↓
Paquete / transporte según gobierno del entorno
```

El portafolio no publica objetos de autorización propios de clientes ni IDs de transporte.

## Política read-only

Los cuatro artefactos existentes son evidencia diagnóstica/read-only. Su source no contiene actualizaciones de documentos de negocio ni commits transaccionales.

El portafolio evita deliberadamente la edición directa de tablas como patrón de troubleshooting o desarrollo.

## Redacción de evidencia de pruebas

Los packs incluyen source ABAP Unit. Los escenarios deterministas se describen como **revisados a nivel de source** cuando no existe evidencia de ejecución SAP. Esto evita presentar revisión estática como runtime ejecutado.

## Política de datos públicos

El source y las capturas usan identificadores sintéticos o sanitizados. Nunca incluir:

- nombres de empresa/cliente;
- materiales, proveedores, contratos o documentos de compras reales;
- OT, instalaciones, cuentas contrato o medidores reales;
- usuarios/SID/mandante/transportes;
- URLs internas/destinos RFC;
- source Z propietario de clientes;
- credenciales o certificados privados.

## Enlaces de evidencia

- [Inventario y Riesgo de Stock](./mm/inventory-reorder/README.es.md)
- [Contratación de Servicios y Contract Audit](./mm/service-procurement/README.es.md)
- [Purchasing Analytics](./mm/purchasing-analytics/README.es.md)
- [Auditoría de Estados de OT](./isu/work-management/status-audit/README.es.md)
