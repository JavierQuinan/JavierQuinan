# SAP ECC Materials Management (MM) — Línea de Evidencia

> **Alcance:** solo SAP ECC / MM clásico  
> **Madurez actual:** línea de evidencia en construcción

Esta línea está separada intencionalmente de SAP S/4HANA. Documenta conocimiento funcional MM clásico y patrones de ingeniería ABAP adecuados para escenarios ECC.

## Paquetes previstos

1. **Inventario y reposición** — stock, punto de pedido, stock de seguridad, lógica OO, reporte y ABAP Unit.
2. **Analítica de compras** — solicitudes de pedido, pedidos, posiciones/programación y transformaciones analíticas.
3. **Contratación de servicios** — escenarios de adquisición de servicios, validaciones y reporting.

## Límite técnico

La evidencia ECC podrá utilizar objetos clásicos y Open SQL cuando corresponda. Cualquier implementación con acceso directo a tablas será rotulada como evidencia ECC/clásica y no será presentada como un patrón Clean Core de S/4HANA.

No se copia código ni configuración de empleador/cliente dentro de este laboratorio.

## Regla de ejecución

Un artefacto solo pasa a `RUNTIME_VALIDATED` después de documentar activación y ejecución exitosas en SAP dentro de su `EVIDENCE.md`.
