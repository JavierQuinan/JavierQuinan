# SAP ECC MM — Evidencia Visual de Extensión de Material con MM01

[English version](./README.md)

> **Tipo de evidencia:** capturas SAP GUI sanitizadas + explicación operativa

Este set documenta el concepto operativo estándar de extender un material existente a niveles organizativos adicionales mediante `MM01`.

Las capturas provienen de una guía operativa suministrada para este portafolio. Se reemplazan o eliminan número de material, centro/almacén, descripción y usuario.

## 1. Acceso / selección de material

![Acceso MM01 sanitizado](./mm01-01-access-sanitized.png)

Qué demuestra:

- acceso al flujo de creación/extensión;
- referencia a un material existente;
- contexto de ramo/tipo de material;
- diferencia entre identidad del material y extensión organizativa.

## 2. Selección de vistas

![Selección de vistas MM01](./mm01-02-view-selection.png)

Qué demuestra:

- selección de vistas requeridas del maestro de materiales;
- comprensión de que las vistas determinan qué segmentos de datos se mantienen para el nuevo contexto organizativo.

## 3. Niveles organizativos

![Niveles organizativos sanitizados](./mm01-03-org-levels-sanitized.png)

Qué demuestra:

- selección de centro;
- contexto de almacén;
- asignación de niveles organizativos antes de completar las vistas seleccionadas.

## 4. Verificación

![Verificación sanitizada en índice de materiales](./mm01-04-verification-sanitized.png)

Qué demuestra:

- verificación posterior de que el material aparece en el contexto organizativo esperado;
- validación como paso independiente en lugar de asumir que el guardado fue suficiente.

## Guía operativa

```text
Confirmar que el material ya existe
        ↓
Verificar si la extensión organizativa ya existe
        ↓
MM01
        ↓
Seleccionar vistas requeridas
        ↓
Ingresar centro/almacén
        ↓
Completar campos obligatorios
        ↓
Guardar
        ↓
Verificar la extensión
```

## Límite de evidencia

Las imágenes demuestran interacción SAP GUI y el flujo operativo de extensión. No publican valores reales de datos maestros ni atribuyen el acceso a una empresa específica.
