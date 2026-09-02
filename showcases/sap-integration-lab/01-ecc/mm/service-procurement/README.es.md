# SAP ECC MM — Contratación de Servicios y Contratos Marco

[English version](./README.md)

> **Línea:** SAP ECC / Materials Management / Compras y Servicios  
> **Estado:** `FUNCTIONAL_EVIDENCE_READY / TECHNICAL_LAB_PLANNED`  
> **Claim runtime:** este paquete no afirma ejecución de un desarrollo ABAP propio

Este evidence pack documenta de forma sanitizada un procedimiento profesional para acuerdos de compras de largo plazo utilizados para adquisiciones recurrentes de materiales o servicios.

El material fuente describe el contrato marco como un acuerdo de largo plazo con un proveedor, con vigencia, condiciones y límites por cantidad o valor, que posteriormente puede ser referenciado por nuevas compras o prestaciones de servicio.

La guía operativa recibida utiliza un flujo de creación ingresado por `ME31` y una validación previa mediante `ME33K`. Esta evidencia conserva ese flujo como dato derivado de la fuente. Para evitar presentarlo como regla universal, se documenta por separado que SAP ECC estándar identifica `ME31K`, `ME32K` y `ME33K` para crear, modificar y visualizar contratos de compras.

## Escenario funcional

```text
Necesidad de compra/servicio recurrente
              │
              ▼
Verificar si ya existe contrato
              │
              ▼
Proveedor + organización de compras + vigencia
              │
              ▼
Cabecera del acuerdo
              │
              ▼
Posición de material/servicio
              │
              ▼
Cantidad / valor / condiciones comerciales
              │
              ▼
Catálogo de prestaciones / actividades contratadas
              │
              ▼
Guardar + comunicar referencia
              │
              ▼
Compras posteriores referencian el acuerdo
```

## Controles operativos derivados de la guía

1. Verificar primero si ya existe un contrato para evitar duplicidad.
2. Seleccionar el proveedor y el contexto organizativo de compras.
3. Definir fechas de inicio y fin de vigencia.
4. Mantener valor ofertado/contratado y referencia comercial.
5. Crear posiciones de servicio cuando el objeto del acuerdo sea prestación de servicios.
6. Mantener unidad, cantidad y precio dentro del contexto del contrato.
7. Registrar las actividades/servicios contratados y sus cantidades en el área de catálogo de prestaciones.
8. Guardar y comunicar la referencia generada mediante el proceso autorizado.

No se publican proveedor real, empresa, número de contrato, organización de compras, centro, almacén, empleado, correo ni configuración particular.

## Qué demuestra profesionalmente

- acuerdos marco / contratos de compras
- contexto de proveedor
- vigencia contractual
- contratos por cantidad y por valor
- posiciones de servicio
- catálogo de prestaciones
- controles contra duplicados
- condiciones comerciales
- compras posteriores referenciadas a un acuerdo vigente

## Laboratorio técnico ECC — siguiente artefacto

El siguiente desarrollo será un **auditor de contratos de solo lectura**, no un programa que cree o modifique documentos de compras.

```text
ZMM_CONTRACT_AUDIT
        │
        ▼
ZMM_CONTRACT_AUDIT_REPORT
        │
        ▼
ZCL_MM_CONTRACT_AUDIT_SERVICE
        │
        ▼
ZIF_MM_CONTRACT_SOURCE
      /                      \
Datasource ECC             Datasource demo
EKKO / EKPO               datos sintéticos
```

Primera versión prevista:

- vigencia del acuerdo
- contexto del proveedor
- número de posiciones
- clasificación cantidad/valor cuando pueda determinarse con seguridad
- riesgo de vencimiento
- vigencia ausente/expirada
- SALV de solo lectura
- vectores ABAP Unit deterministas

Los detalles de paquetes de servicios se añadirán únicamente después de verificar las relaciones exactas de documentos de servicio para la release ECC objetivo.

## Límite de evidencia

Este documento es **evidencia funcional profesional**. No es prueba de que un desarrollo propio de compras haya sido ejecutado en SAP.

Nunca se publica:

- nombres de empresa o cliente
- IDs de proveedor
- números de contrato
- códigos organizativos reales
- precios o importes reales
- capturas del sistema corporativo
- transacciones Z internas
- credenciales o transportes

## Terminología bilingüe

| English | Español |
|---|---|
| Outline agreement | Acuerdo marco / contrato marco |
| Purchase contract | Contrato de compras |
| Vendor | Proveedor |
| Validity period | Período de vigencia |
| Quantity contract | Contrato por cantidad |
| Value contract | Contrato por valor |
| Service item | Posición de servicio |
| Service catalog | Catálogo de prestaciones/servicios |

## Nota de fuente

Documento público creado a partir de una guía operativa aportada por el usuario. La versión pública no reproduce capturas, marcas, identificadores organizativos ni formato propietario del documento fuente.
