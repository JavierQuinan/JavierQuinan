# SAP ECC / CRM-SD — Flujo de Facturación de Servicios No Energéticos

[English version](./README.md)

> **Tipo de evidencia:** guía funcional de facturación sanitizada  
> **Estado:** `FUNCTIONAL_EVIDENCE_READY`  
> **Alcance:** preparación cliente/comercial → área de ventas → facturación no energética → output/envío fiscal

Este evidence pack documenta la preparación de extremo a extremo requerida antes de emitir una factura por servicios no energéticos dentro de un proceso empresarial orientado a CRM/SD.

El material fuente incluye servicios como inspecciones técnicas, trabajos de laboratorio, revisión de redes/diseños y otros servicios no energéticos. La versión pública elimina nombres de empresa, identificaciones personales, códigos organizativos, IDs de clientes, documentos fiscales y screenshots.

Es **evidencia derivada del proceso empresarial fuente**, no una afirmación de que todos los sistemas SAP SD utilicen las mismas pantallas o secuencia.

## Flujo general

```text
Identificar cliente/organización
          │
          ▼
Validar contacto + canal preferido
          │
          ▼
Crear interlocutor si no existe
          │
          ▼
Crear/confirmar contexto comercial
          │
          ▼
Crear/extender datos de área de ventas
          │
          ▼
Validar org. ventas / canal / sector
          │
          ▼
Generar facturación de servicio no energético
          │
          ▼
Revisar valor / servicio / observaciones
          │
          ▼
Procesamiento de salida
          │
          ▼
Envío fiscal configurado / finalización
```

## 1. Identificación del cliente

Buscar el cliente mediante los criterios permitidos por la interfaz CRM/customer autorizada.

La fuente contempla distintos tipos de identificación. La versión pública nunca muestra números reales.

## 2. Validación de contacto

Antes de facturar:

- confirmar información de contacto vigente;
- actualizar campos requeridos cuando corresponda;
- asegurar que exista un canal electrónico si el proceso de notificación/output lo necesita;
- confirmar canal preferido de comunicación.

Es un control operativo importante porque la entrega/notificación del documento puede depender del canal preferido.

## 3. Crear interlocutor cuando sea necesario

Si no existe:

1. elegir persona u organización según corresponda;
2. ingresar datos identificativos requeridos;
3. validar la información maestra/oficial disponible;
4. completar dirección/contacto obligatorio;
5. grabar el interlocutor.

## 4. Contexto comercial

Crear o confirmar el acuerdo/contexto comercial necesario para enlazar al cliente con el proceso de facturación.

La guía fuente exige confirmar el acuerdo comercial antes de continuar con la preparación de ventas/facturación.

## 5. Extensión de área de ventas

Crear o extender al cliente en el contexto de área de ventas requerido.

La fuente contempla:

- contexto de sociedad/empresa
- organización de ventas
- canal de distribución
- sector/división
- contexto de suministro/expedición cuando esté configurado

Los códigos reales se eliminan de la versión pública.

## 6. Facturación de servicio no energético

Con los prerrequisitos válidos, ingresar al proceso configurado de facturación no energética y mantener únicamente la información requerida por el servicio autorizado.

## 7. Revisión de salida

Antes de la salida final:

1. abrir el mensaje/output generado;
2. visualizar el documento;
3. revisar el valor;
4. revisar el servicio/concepto facturado;
5. revisar observaciones relevantes;
6. solo entonces continuar con la salida.

## 8. Finalización fiscal/output

La fuente culmina activando el mecanismo de salida configurado para completar/enviar el documento fiscal.

No se presenta como integración SAP→autoridad tributaria universal; es un paso **dependiente de la configuración del cliente/proceso**.

## Matriz de controles

| Control | Razón |
|---|---|
| Identidad del cliente validada | Evita facturar al tercero equivocado |
| Contacto/canal preferido completo | Favorece notificación confiable |
| Contexto comercial confirmado | Enlaza al cliente con el proceso correcto |
| Área de ventas completa | Evita fallos de preparación SD |
| Valor/servicio revisados antes de salida | Reduce errores fiscales/documentales |
| Salida por proceso autorizado | Mantiene trazabilidad y compliance configurado |

## Preguntas de troubleshooting

Cuando no se puede facturar:

- ¿Existe el interlocutor y tiene datos requeridos?
- ¿Contacto/canal preferido está completo?
- ¿El acuerdo/contexto comercial está confirmado?
- ¿El cliente está extendido al área de ventas necesaria?
- ¿Organización/canal/sector son coherentes?
- ¿El servicio/posición existe en el proceso configurado?
- ¿Se generó y revisó el output?
- ¿Finalizó correctamente el paso fiscal/output configurado?

## Límite de confidencialidad

Eliminado:

- empresa
- clientes/documentos de identidad
- direcciones/contactos
- acuerdos comerciales
- IDs BP/cliente
- códigos de sociedad/ventas/canal/sector
- facturas/importes
- endpoints/IDs fiscales
- screenshots

## Qué demuestra

- preparación de cliente CRM/SD
- ciclo de vida de interlocutor
- contexto comercial
- extensión de área de ventas
- facturación de servicios no energéticos
- disciplina de revisión de output
- conocimiento de integración fiscal configurada
- checkpoints de troubleshooting end-to-end
