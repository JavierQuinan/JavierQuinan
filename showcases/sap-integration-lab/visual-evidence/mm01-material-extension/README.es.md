# SAP ECC MM — Evidencia Visual de Extensión de Material con MM01

[English version](./README.md)

> **Tipo de evidencia:** capturas SAP GUI sanitizadas + guía operativa reproducible  
> **Fuente:** material operativo propio suministrado para este portafolio

Este set documenta el patrón operativo para extender un material existente a niveles organizativos adicionales mediante `MM01`.

Las capturas fueron sanitizadas antes de publicarse. Se eliminaron o reemplazaron número de material, centro/almacén, descripción, usuario e identificadores empresariales específicos.

## 1. Acceso / selección de material existente

![Acceso MM01 sanitizado](./mm01-01-access-sanitized.jpg)

Demuestra:

- acceso al flujo de creación/extensión del maestro;
- uso de un material existente como objeto a extender;
- contexto de ramo/tipo de material cuando aplica;
- diferencia entre identidad del material y extensión organizativa.

## 2. Selección de vistas

![Selección de vistas MM01](./mm01-02-view-selection.jpg)

Demuestra:

- selección de vistas requeridas del maestro de materiales;
- comprensión de que las vistas seleccionadas determinan los segmentos que serán mantenidos.

## 3. Niveles organizativos

![Niveles organizativos sanitizados](./mm01-03-org-levels-sanitized.jpg)

Demuestra:

- selección de centro;
- contexto de almacén;
- asignación del nivel organizativo antes de mantener las vistas seleccionadas.

## 4. Verificación

![Verificación sanitizada de extensión](./mm01-04-verification-sanitized.jpg)

Demuestra:

- verificación posterior de disponibilidad del material en el contexto organizativo esperado;
- validación como control independiente, sin asumir que guardar equivale a una extensión correcta.

## Guía operativa reproducible

```text
Confirmar que el material ya existe
        ↓
Verificar si la extensión organizativa requerida ya existe
        ↓
MM01
        ↓
Ingresar/referenciar el material existente
        ↓
Seleccionar las vistas requeridas
        ↓
Ingresar Centro + Almacén
        ↓
Mantener los campos requeridos de esas vistas
        ↓
Guardar
        ↓
Verificar el material en el nivel organizativo esperado
```

### Controles prácticos

- No crear un material duplicado si la necesidad es únicamente una extensión organizativa.
- Confirmar centro y almacén destino antes de guardar.
- Seleccionar únicamente las vistas necesarias para el proceso y alcance autorizado.
- Verificar el resultado después del guardado.
- Nunca utilizar identificadores productivos en documentación pública.

## Referencias oficiales SAP

El procedimiento está respaldado de forma independiente por SAP Help:

- [Extending a Material Master Record — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/f7fddfe4caca43dd967ac4c9ce6a70e4/e614c453f57eb44ce10000000a174cb4.html)
- [Storage-Location-Specific Data — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/f7fddfe4caca43dd967ac4c9ce6a70e4/cc52bf53f106b44ce10000000a174cb4.html)
- [Create Material Master Data — Storage Location Data (MM01) — SAP Help](https://help.sap.com/docs/s4hana-best-practices/create-product-master-of-type-spare-parts-2j7/create-material-master-data-storage-location-data?version=2408)

SAP Help documenta expresamente el patrón `MM01 → selección de vistas → niveles organizativos → centro/almacén` y el caso en que el material ya existe y se extiende en vez de recrearlo.

## Límite de evidencia

Las imágenes demuestran interacción SAP GUI y un flujo operativo sanitizado. No exponen un entorno empresarial identificable, datos maestros productivos ni código propietario.
