# SAP ECC IS-U / CRM — Alta de Servicio Fotovoltaico y Cadena de Datos Maestros

[English version](./README.md)

> **Tipo de evidencia:** guía funcional de integración sanitizada  
> **Estado:** `FUNCTIONAL_EVIDENCE_READY`  
> **Alcance:** datos maestros técnicos IS-U + alta contractual/servicio en CRM

Este evidence pack documenta la cadena de dependencias funcionales y técnicas necesaria para dar de alta un servicio especializado cuyo contrato depende de que los datos maestros técnicos IS-U estén correctamente preparados.

El material fuente corresponde a un escenario de tarifa/servicio fotovoltaico. La versión pública conserva la estructura reutilizable del proceso SAP, pero elimina nombres de empresa, IDs de objetos modelo, clientes, clases custom, códigos de tarifa, códigos organizativos y screenshots.

## Arquitectura del proceso

```text
Identificador de servicio externo/GIS
            │
            ▼
Objeto de conexión IS-U
       (flujo `ES55`)
            │
            ▼
Contexto de emplazamiento/ubicación técnica
            │
            ▼
Punto de suministro
       (flujo `ES60`)
            │
            ▼
Instalación IS-U
       (flujo `ES30`)
            │
            ▼
Contexto técnico del servicio/contrato
            │
            ▼
Interlocutor / contexto comercial CRM
            │
            ▼
Gestión de contratos CRM
            │
            ▼
Alta de servicio/tarifa especializada
```

## Precondiciones funcionales

Antes de crear el contrato:

- disponer de acceso autorizado a las funciones IS-U/CRM necesarias
- contar con el identificador externo/de servicio requerido
- utilizar únicamente modelos/referencias aprobados para el escenario
- alinear las fechas entre objetos técnicos y contractuales
- confirmar que el servicio/tarifa especializada corresponde al caso real

## Procedimiento sanitizado

### 1. Obtener identificador externo del servicio

El flujo fuente inicia con un identificador generado por un proceso externo/GIS relacionado con el servicio. Este valor debe existir antes de construir la cadena técnica SAP.

Nunca se publica el valor real.

### 2. Crear objeto de conexión — `ES55`

Crear el nuevo objeto de conexión tomando un modelo/referencia autorizado cuando el diseño del cliente lo requiera.

Mantener:

- dirección del servicio
- características técnicas requeridas
- contexto organizativo/técnico autorizado

El identificador generado se conserva únicamente dentro del proceso empresarial.

### 3. Validar emplazamiento / ubicación técnica

El material fuente incluye una revisión de ubicación técnica antes de continuar. El aprendizaje reutilizable es mantener coherencia de emplazamiento y valores organizativos entre los objetos de la cadena.

### 4. Crear punto de suministro — `ES60`

Crear el nuevo punto de suministro con el modelo/referencia autorizado y asignar el objeto de conexión creado anteriormente.

Validar ubicación y contexto del punto antes de guardar.

### 5. Crear instalación — `ES30`

Crear la instalación y vincularla con el punto de suministro.

Controles clave:

- fechas efectivas correctas para el escenario
- relación con el punto de suministro correcto
- contexto de notificación/servicio usando el identificador upstream autorizado
- atributos organizativos coherentes con el servicio

### 6. Continuar en CRM

Una vez disponibles los datos maestros técnicos:

1. crear o identificar al cliente/interlocutor;
2. crear o identificar el contexto comercial necesario;
3. resolver el identificador técnico/de servicio;
4. crear el contrato desde la gestión contractual;
5. seleccionar el producto/tarifa especializada configurada;
6. finalizar y validar el alta.

## Cambio de titular / cliente

El material también contempla cambios de titularidad. El patrón público es:

1. revisar/actualizar las características del objeto de conexión si corresponde;
2. completar el fin contractual del cliente anterior mediante el flujo normal;
3. crear/identificar nuevo cliente y contexto comercial;
4. reutilizar la cadena técnica válida;
5. dar de alta el nuevo contrato sobre el identificador de servicio correcto.

## Controles de consistencia entre sistemas

```text
Objeto de conexión
      │
      ├── dirección/características
      │
Punto de suministro
      │
      ├── relación con objeto de conexión
      │
Instalación
      │
      ├── fecha efectiva / contexto de servicio
      │
Contrato CRM
      │
      └── producto/tarifa + contexto cliente/comercial
```

El contrato downstream no debe analizarse como un objeto aislado de los datos maestros técnicos upstream.

## Preguntas de troubleshooting

Cuando el alta falla:

- ¿Existe el identificador upstream y está enlazado correctamente?
- ¿El objeto de conexión contiene las características requeridas?
- ¿El punto de suministro enlaza al objeto correcto?
- ¿La instalación enlaza al punto correcto?
- ¿Las fechas son coherentes?
- ¿CRM resuelve el mismo contexto técnico/de servicio?
- ¿El producto/tarifa contractual corresponde al escenario especializado?

## Límite de confidencialidad

Eliminado del material fuente:

- nombres de empresa/proveedor
- IDs de objetos modelo
- IDs de puntos e instalaciones modelo
- clientes/identificadores de servicio
- clases custom y valores
- códigos de tarifa/producto
- roles de negocio internos
- screenshots
- direcciones/datos personales

## Qué demuestra

- relaciones de datos maestros técnicos IS-U
- dependencia objeto de conexión / punto de suministro / instalación
- razonamiento CRM ↔ IS-U para alta contractual
- disciplina con fechas efectivas
- escenarios de cambio de titular
- controles de consistencia cross-system
- documentación operacional con confidencialidad
