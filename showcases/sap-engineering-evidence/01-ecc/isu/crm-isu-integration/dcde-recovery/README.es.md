# SAP CRM ↔ IS-U — Recuperación de Fin de Contrato para Generación Incompleta de OT

[English version](./README.md)

> **Tipo de evidencia:** caso operativo de troubleshooting sanitizado  
> **Estado:** `FUNCTIONAL_EVIDENCE_READY`  
> **Alcance:** proceso contractual CRM + recuperación de generación de OT en IS-U/WM

Esta evidencia documenta un patrón reproducible para recuperar casos donde un proceso de fin/baja contractual iniciado en CRM no completa correctamente la generación esperada de una orden de desconexión en IS-U / Work Management.

El caso fuente muestra un enfoque funcional: identificar el contexto del servicio desde IS-U, cancelar/revertir el estado incompleto del fin de contrato en CRM, verificar que el contrato vuelva a quedar activo y ejecutar nuevamente el proceso normal para que la orden downstream pueda generarse correctamente.

## Problema sanitizado

```text
Se inicia fin/baja contractual en CRM
              │
              ▼
Se espera OT de desconexión
              │
              ✕ generación incompleta
              │
              ▼
El contrato/proceso requiere recuperación
```

## Flujo de recuperación

```text
1. Identificar contexto contractual/técnico en IS-U
              │
              ▼
2. Resolver el contrato correspondiente en CRM
              │
              ▼
3. Abrir modificación/gestión contractual
              │
              ▼
4. Cancelar/revertir el fin de contrato incompleto
              │
              ▼
5. Confirmar que el contrato queda activo nuevamente
              │
              ▼
6. Ejecutar otra vez el proceso normal de baja
              │
              ▼
7. Validar generación/completitud de la OT downstream
```

## Paso a paso

### 1. Identificar el contexto IS-U

Utilizar una ruta autorizada de consulta contractual/instalación para resolver el contexto que permita llegar al contrato correcto en CRM. La guía fuente utiliza `ES32` como punto inicial de consulta.

No publicar identificadores reales de acuerdo, cuenta, instalación, punto de notificación ni OT.

### 2. Enlazar con CRM

Con el contexto identificado, acceder a la gestión contractual del contrato correspondiente en CRM.

### 3. Abrir modificación de contrato

Seleccionar el contrato afectado e ingresar al flujo de procesamiento que gestiona el fin/baja contractual.

### 4. Cancelar el estado incompleto

Ejecutar el proceso configurado para cancelar/revertir el fin de contrato anterior. La versión pública no expone IDs de procesos internos ni configuración propia del cliente.

### 5. Validar restauración

Confirmar que el contrato vuelve al estado activo esperado y que no permanece un estado de fin incompleto.

### 6. Ejecutar nuevamente la baja

Repetir la baja desde el flujo funcional CRM normal, sin forzar datos técnicos directamente en IS-U/WM.

### 7. Validar resultado

Patrón profesional observado:

- contrato restaurado al estado activo esperado antes del reintento;
- fin/baja repetido mediante el flujo CRM normal;
- generación downstream de desconexión/OT validada a través del proceso normal;
- sin manipulación directa de tablas como método de recuperación.

## Interpretación de troubleshooting

El patrón aplica cuando el business object queda en un estado intermedio/inconsistente luego de una ejecución incompleta.

Principio:

> restaurar primero el proceso de negocio a un estado funcional válido y luego repetir el flujo oficial, en lugar de forzar directamente el objeto técnico downstream.

## Seguridad y confidencialidad

El caso fuente contenía identificadores reales, eliminados de esta versión.

No publicar:

- números de OT;
- acuerdos/contratos;
- cuentas o puntos de notificación;
- clientes;
- URLs internas CRM;
- roles internos;
- IDs de procesos custom cuando revelen configuración propietaria;
- screenshots empresariales.

## Qué demuestra

- troubleshooting CRM ↔ IS-U;
- recuperación de ciclo de vida contractual;
- dependencias de generación de OT;
- razonamiento de estados de proceso;
- preferencia por recuperación funcional sobre manipulación técnica;
- validación de estados upstream/downstream.
