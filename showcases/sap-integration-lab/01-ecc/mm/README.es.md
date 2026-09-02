# SAP ECC Materials Management (MM) — Línea de Evidencia

[English version](./README.md)

> **Alcance:** solo SAP ECC / MM clásico  
> **Madurez actual:** evidencia funcional publicada; paquetes técnicos en construcción

Esta línea está separada intencionalmente de SAP S/4HANA. Documenta conocimiento funcional MM clásico y patrones de ingeniería ABAP adecuados para escenarios ECC.

## Capas de evidencia

### Evidencia funcional / operativa

Ya existe una capa pública sanitizada en [`functional-evidence`](./functional-evidence/), derivada de guías operativas reales sobre extensión de materiales, consumo de materiales en órdenes de trabajo y troubleshooting de dependencias organizativas entre material, proveedor y puesto de trabajo.

Las guías originales permanecen privadas; no se publican identificadores reales, configuración del cliente, capturas ni valores propietarios.

### Evidencia técnica ABAP

Paquetes técnicos activos y previstos:

1. **Inventario y riesgo de stock** — stock, punto de pedido, stock de seguridad, abstracción de datasource, servicio OO, reporte ejecutable y ABAP Unit.
2. **Analítica de compras** — solicitudes de pedido, pedidos, posiciones/programación y transformaciones analíticas.
3. **Contratación de servicios** — escenarios de adquisición de servicios, validaciones y reporting.

## Límite técnico

La evidencia ECC puede utilizar objetos clásicos y Open SQL cuando corresponda. Cualquier implementación con acceso directo a tablas se rotula como evidencia ECC/clásica y no se presenta como un patrón Clean Core de S/4HANA.

El paquete de Inventario y Riesgo de Stock es una aplicación diagnóstica de portfolio. No pretende reproducir la lógica de planificación MRP de SAP.

No se copia código ni configuración de empleador/cliente dentro de este laboratorio.

## Regla de ejecución

Un artefacto solo pasa a `RUNTIME_VALIDATED` después de documentar activación y ejecución exitosas en SAP dentro de su `EVIDENCE.md`. Los resultados ABAP Unit son obligatorios antes de declarar `TEST_VALIDATED`.
