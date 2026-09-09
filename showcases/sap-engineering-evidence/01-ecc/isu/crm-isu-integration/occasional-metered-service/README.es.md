# SAP CRM ↔ IS-U/WM — Flujo End-to-End de Servicio Ocasional con Medición

[English version](./README.md)

> **Tipo de evidencia:** guía funcional end-to-end sanitizada  
> **Estado:** `FUNCTIONAL_EVIDENCE_READY`  
> **Alcance:** preparación cliente/contrato CRM → ejecución OT WM → finalización contractual CRM

Esta evidencia documenta un proceso empresarial para crear un servicio temporal/ocasional con medición y completar su ciclo técnico y contractual entre CRM e IS-U / Work Management.

La guía original contiene empresa, cliente, contrato, punto de servicio y OT reales. La versión pública conserva únicamente la arquitectura reutilizable del proceso.

## Flujo end-to-end

```text
CRM — identificar/crear interlocutor
          │
          ▼
Crear contexto de servicio virtual/referencia
          │
          ▼
Crear + confirmar acuerdo comercial
          │
          ▼
Crear contrato / elegir producto configurado
          │
          ▼
Mantener configuración del servicio
          │
          ▼
Crear OT para instalación de medidor
          │
          ▼
Guardar contrato/proceso en estado intermedio
          │
          ▼
IS-U / IW32 — ejecutar trabajo técnico
          │
          ├── contexto de cierre/grupo
          ├── tarifa/contexto verificado
          ├── datos de acometida
          ├── carga instalada
          ├── acción sobre medidor
          ├── responsable
          └── estado final de procesamiento
          │
          ▼
Cierre técnico
          │
          ▼
Retornar a CRM
          │
          ▼
Completar proceso contractual
          │
          ▼
Generar/finalizar paso de OT posterior cuando esté configurado
          │
          ▼
Instalar/confirmar medidor + cerrar OT restante
```

## Fase CRM — preparación cliente/contrato

### 1. Identificar o crear interlocutor

Buscar al cliente mediante los criterios autorizados. Si no existe, crearlo por el flujo normal de onboarding.

### 2. Crear contexto temporal/virtual del servicio

El proceso fuente deriva un identificador temporal/virtual desde un contexto de referencia aprobado. La versión pública no reproduce la implementación custom ni identificadores reales.

### 3. Crear y confirmar acuerdo comercial

Crear el acuerdo/contexto comercial requerido y confirmarlo antes de continuar con el contrato.

### 4. Crear contrato

En gestión contractual, crear el contrato, seleccionar el producto configurado y mantener parámetros como carga contratada, período/días de uso y condiciones comerciales requeridas.

### 5. Crear OT técnica

Generar desde CRM la OT necesaria para instalar el medidor/ejecutar el trabajo y registrar la instrucción operativa mediante el proceso autorizado.

La guía fuente deja el contrato en un estado intermedio hasta que la actividad técnica avance.

## Fase IS-U / Work Management

Abrir la OT generada mediante la transacción autorizada de mantenimiento, `IW32` en el proceso fuente.

Mantener/validar categorías de datos técnicos como:

- contexto de grupo/cierre
- tarifa aplicada vs. verificada
- datos de acometida
- carga instalada
- acción de equipo/medidor
- datos del responsable
- estado operativo final

No se publican códigos de cierre, grupos, productos ni valores de equipo propios del cliente.

### Cierre técnico

Con los datos completos, guardar el estado final esperado y realizar el cierre técnico por el ciclo normal de la OT.

## Retorno a CRM

Después del cierre técnico:

1. localizar acuerdo/contrato;
2. volver a gestión contractual;
3. ejecutar el proceso configurado para completar contrato;
4. completar generación de OT posterior si el proceso lo requiere;
5. validar datos de pago/cuenta/resumen;
6. culminar la instalación/OT restante mediante el flujo autorizado.

## Checkpoints de integración

| Checkpoint | Consistencia esperada |
|---|---|
| Interlocutor | Existe antes de preparar contrato |
| Identificador servicio | Contexto temporal/referencia resuelve correctamente |
| Acuerdo comercial | Confirmado antes de activar contrato |
| Configuración contrato | Producto/parámetros coherentes |
| OT | Generada desde CRM, no desacoplada manualmente |
| Medidor/equipos | Coinciden con ejecución técnica |
| Estado OT | Alcanza estado final/cierre técnico esperado |
| Contrato CRM | Se completa solo después de satisfacer dependencia técnica |

## Modelo de troubleshooting

Cuando el proceso se detiene, localizar la transición que no ocurrió:

```text
Cliente
→ acuerdo
→ contrato
→ OT
→ datos técnicos
→ estado final
→ cierre técnico
→ finalización CRM
```

Evitar corregir un objeto downstream sin revisar primero el estado de negocio upstream que lo generó.

## Límite público

Eliminado:

- empresa/proyecto
- identificaciones personales
- direcciones
- CUEN/identificadores virtuales
- acuerdos/contratos
- números de OT
- tarifas/productos
- códigos de cierre/grupo
- datos de medidor/responsable
- screenshots

## Qué demuestra

- razonamiento end-to-end CRM ↔ IS-U/WM
- ciclo interlocutor/acuerdo/contrato
- dependencia de generación de OT
- conocimiento de datos de ejecución de medidor
- disciplina de estados/cierre técnico
- secuencia de retorno a CRM
- troubleshooting cross-system
