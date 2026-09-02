# SAP ECC — Roadmap de Laboratorios de Transacciones Z

[English version](./Z_TRANSACTION_LAB_ROADMAP.md)

> Este roadmap transforma experiencia funcional real en desarrollos ABAP originales y publicables. No reproduce código, customizing ni nombres de desarrollos internos de terceros.

## Principios

1. Cada transacción Z debe resolver un escenario funcional verificable.
2. Se prefieren APIs/BAPIs estándar sobre edición directa de tablas o batch input.
3. Todo proceso con actualización debe incluir modo simulación/dry-run antes de commit.
4. Datos organizativos, clientes, órdenes, instalaciones y usuarios serán sintéticos o sanitizados.
5. Cada laboratorio tendrá documentación EN/ES, ABAP Unit cuando aplique y `EVIDENCE.md`.
6. ECC/IS-U se mantiene separado de S/4HANA/ABAP Cloud.

## Lab 01 — `ZMM_STOCK_RISK`

**Dominio:** ECC MM  
**Tipo:** Report Transaction / read-only  
**Estado:** source ready, runtime validation pending

Objetivo: diagnóstico de riesgo de stock por material/centro/almacén usando `MARC` y `MARD`, servicio OO, SALV y ABAP Unit.

## Lab 02 — `ZWM_ORDER_MONITOR_LAB`

**Dominio:** ECC IS-U / WM  
**Tipo:** read-only monitor

Objetivo: construir un monitor de órdenes inspirado en prácticas de bandeja `IW38`, con filtros por clase, status, puesto de trabajo y fechas, sin copiar layouts ni códigos organizativos reales.

Evidencia objetivo:

- selección y filtros
- status system/user
- ALV/SALV
- navegación controlada a orden estándar cuando esté autorizada
- tests sobre transformación/filtrado

## Lab 03 — `ZWM_ORDER_CREATE_LAB`

**Dominio:** ECC IS-U / WM / PM-CS order processing  
**Tipo:** transactional lab

Objetivo: creación individual y masiva de órdenes con datos sintéticos, basada en interfaces estándar disponibles en el sistema. Para órdenes de mantenimiento/servicio se evaluará `BAPI_ALM_ORDER_MAINTAIN` antes de cualquier alternativa custom.

Controles obligatorios:

- validación previa
- modo simulación
- mensajes por registro
- commit explícito solo después de validación
- rollback ante error
- sin hardcode de organización

## Lab 04 — `ZWM_RELEASE_PLAN_LAB`

**Dominio:** ECC WM / background processing  
**Tipo:** planificación y jobs

Objetivo: demostrar planificación automática de liberación con parámetros genéricos, frecuencia, horario permitido, exclusiones y monitoreo.

Evidencia objetivo:

- configuración de parámetros
- scheduling de background job
- exclusión de días/ventanas
- application log
- observabilidad mediante herramientas estándar como `SM37`

No se copiará la transacción Z ni la configuración interna observada en las guías privadas.

## Lab 05 — `ZWM_MASS_CLOSE_LAB`

**Dominio:** ECC WM / PM-CS  
**Tipo:** actualización masiva controlada

Objetivo: cierre técnico masivo de órdenes sintéticas/elegibles utilizando una API estándar cuando la release lo soporte.

Reglas de seguridad:

- dry-run obligatorio
- solo órdenes elegibles
- excluir escenarios con consumo/material pendiente hasta implementar la validación correspondiente
- log por orden
- idempotencia/reintento controlado
- commit solo al final de una unidad consistente

## Lab 06 — `ZWM_STATUS_AUDIT_LAB`

**Dominio:** ECC WM / status management  
**Tipo:** troubleshooting read-only

Objetivo: auditar estados de órdenes y su historial usando mecanismos estándar y consultas read-only. El laboratorio mostrará diferencias entre estado activo, estado histórico y texto de status sin exponer órdenes reales.

## Ruta de promoción

Cada lab atraviesa:

`PLANNED -> SOURCE_READY -> RUNTIME_VALIDATION_PENDING -> RUNTIME_VALIDATED -> TEST_VALIDATED`

No se publicará un claim de ejecución hasta comprobarlo en un sistema SAP autorizado.

## Base técnica pública

SAP documenta `SE93` para Transaction Maintenance y soporta report, dialog, OO, variant y parameter transactions. Para mantenimiento de órdenes PM/CS, SAP expone `BAPI_ALM_ORDER_MAINTAIN` como interfaz estándar en distintos escenarios de mantenimiento.
