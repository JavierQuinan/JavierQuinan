# SAP ECC IS-U / CRM — Consistencia de Equipamiento entre Vista Técnica y Comercial

[English version](./README.md)

> **Tipo de evidencia:** guía sanitizada de gestión de equipos/dispositivos  
> **Estado:** `FUNCTIONAL_EVIDENCE_READY`  
> **Alcance:** asignación técnica de equipos ↔ consistencia de representación comercial/contractual

Esta evidencia documenta un proceso controlado para mantener consistencia entre las asignaciones técnicas de equipamiento en IS-U y la representación comercial/contractual gestionada mediante CRM.

La guía fuente enfatiza una regla importante: una modificación local del equipamiento técnico no debe dejar inconsistente la vista contractual. Cuando cambia el significado de negocio del equipo, debe utilizarse el proceso CRM completo y no tratar la asignación técnica como un dato aislado.

## Modelo del proceso

```text
Localizar punto/contexto técnico
          │
          ▼
Revisar instalación/equipamiento técnico
          │
          ▼
Remoción/modificación autorizada cuando aplique
          │
          ▼
Guardar resultado técnico
          │
          ▼
Comparar vista comercial/contractual
          │
      ┌───┴────┐
      ▼        ▼
consistente   inconsistente/cambio de negocio requerido
      │        │
      ▼        ▼
finalizar     ejecutar flujo normal CRM de cambio de producto/tarifa
```

## Rutas de búsqueda derivadas de la fuente

La guía demuestra distintas formas de localizar el contexto técnico: datos comerciales, instalación/número de serie e identificadores del punto de servicio/notificación.

La versión pública no expone cuentas contrato, instalaciones, números de serie, puntos ni direcciones reales.

## Control de asignación técnica

El proceso fuente permite revisar los equipos asignados al punto/instalación técnica y retirar una asignación cuando el proceso autorizado lo requiere.

Se conserva una restricción esencial:

> cuando agregar/cambiar un equipo representa un cambio de producto o de negocio, debe ejecutarse el proceso CRM configurado en lugar de forzarlo desde la pantalla técnica.

## Validación cross-system

Después de la modificación, contrastar el equipamiento resultante con la vista comercial/contractual.

Preguntas:

- ¿La asignación técnica coincide con el producto/tarifa comercial?
- ¿Un cambio técnico local alteró indirectamente un atributo de negocio?
- ¿Es necesario un cambio de producto CRM para recuperar consistencia?
- ¿Ambas capas representan el mismo equipamiento esperado?

## Principio de troubleshooting

```text
Corrección técnica
       +
Corrección contractual/comercial
       =
Integridad del proceso
```

Un registro técnicamente guardado no es suficiente si la capa contractual expresa otra realidad.

## Límite operativo

- No agregar equipamiento por atajos cuando el proceso requiere CRM.
- No alterar semántica contractual desde una vista puramente técnica.
- Validar siempre ambas capas después del cambio.
- Utilizar cambio de producto/tarifa para modificaciones de negocio.

## Límite público

Eliminado:

- empresas/proyecto
- ejecutores
- IDs de puntos/instalaciones
- direcciones
- equipos/números de serie
- productos/programas específicos
- screenshots

## Qué demuestra

- troubleshooting de equipamiento IS-U
- distinción maestro técnico vs. comercial
- consistencia CRM ↔ IS-U
- integridad de procesos
- rechazo de atajos técnicos que rompen semántica de negocio
