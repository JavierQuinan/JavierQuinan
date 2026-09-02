# SAP ECC MM ↔ IS-U/WM — Habilitación de Materiales de Sellos

[English version](./README.md)

> **Tipo de evidencia:** caso de soporte cross-module sanitizado  
> **Estado:** `FUNCTIONAL_EVIDENCE_READY`  
> **Alcance:** disponibilidad del material → habilitación en Seal Management → uso en OT

Esta evidencia documenta un escenario cross-module donde los materiales de sellos ya existen en el maestro SAP MM, pero todavía requieren habilitación/configuración en el proceso de gestión de sellos antes de poder utilizarse operativamente en órdenes de trabajo.

El ticket fuente contenía empresa, IDs del caso y números reales de material. Ninguno se publica.

## Relación del proceso

```text
Necesidad de material para campo
          │
          ▼
Material creado/extendido en SAP MM
          │
          ▼
Validar atributos/contexto del material
          │
          ▼
Habilitar/configurar en Seal Management
          │
          ▼
Disponibilizar tipo de sello para WM
          │
          ▼
Uso en OT / ejecución de campo
          │
          ▼
Registrar/consumir material según proceso
```

## Principio de troubleshooting

Que un material exista en contexto `MM01/MM03` no significa automáticamente que todas las aplicaciones downstream puedan utilizarlo.

Cuando un material no aparece en un flujo de campo/sellos, validar dos capas:

1. **MM** — material existente y correctamente extendido/configurado para el contexto organizativo requerido.
2. **Seal/WM** — categoría/tipo/configuración correspondiente disponible para el proceso de OT.

## Checklist diagnóstico

- ¿Existe el material?
- ¿Está extendido al centro/almacén requerido?
- ¿Corresponde al proceso de gestión de sellos?
- ¿La configuración de sellos reconoce/referencia el material?
- ¿La categoría/tipo de sello está activa?
- ¿La OT expone esa opción de material/sello?
- ¿El proceso downstream de consumo/movimiento reconoce el material seleccionado?

## Insight cross-module

```text
Disponibilidad en maestro MM
        ≠
Disponibilidad en aplicación WM
```

El análisis debe seguir la dependencia completa y no recrear el material ni forzar su ingreso en una OT.

## Límite público

Nunca publicar:

- números reales de material
- IDs de tickets
- empresas/unidades de negocio
- categorías/configuración interna de sellos
- screenshots operativos
- programas o transportes custom

## Lab futuro

Podemos modelar con datos sintéticos:

- reglas de elegibilidad de material
- mapping material↔tipo de sello
- selección en OT
- validación de consumo
- reporte de consistencia de configuración

sin copiar configuración propietaria.

## Qué demuestra

- integración SAP MM ↔ IS-U/WM
- distinción maestro vs. configuración de aplicación
- troubleshooting de habilitación de materiales de campo
- razonamiento de consumo downstream
- sanitización de casos de soporte
