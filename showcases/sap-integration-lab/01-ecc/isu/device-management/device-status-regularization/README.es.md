# SAP ECC IS-U — Regularización de Estado Técnico de Medidor

[English version](./README.md)

> **Tipo de evidencia:** troubleshooting operativo sanitizado de Device Management  
> **Transacciones:** `IQ09` · `EG35` · `EG36` · `EG50` · `EG34` · contingencia `MIGO`

Esta evidencia documenta un caso real de regularización cuando un dispositivo aparece simultáneamente con estados incompatibles de almacén/montaje. La versión pública conserva la secuencia funcional y elimina serial, instalación, contrato, punto de suministro, ubicación, cliente, material y demás identificadores corporativos.

## Estado observado

El caso parte de un medidor que aparece con doble estado `ALMA-MONT`. El resultado funcional esperado es recuperar una secuencia consistente de Device Management y terminar con el dispositivo en estado único `MONT`.

## Secuencia demostrada

```text
IQ09
 │
 ├─ validar estado y datos del dispositivo
 └─ revisar historial de lecturas
        │
        ▼
EG35 — desmontaje para cálculo por instalación
        │
        ▼
EG36 — completar desmontaje técnico del aparato
        │
        ▼
validar estado intermedio
        │
        ▼
EG50 — anular operación de desmontaje aplicable
        │
        ▼
EG34 — montar nuevamente el dispositivo
        │
        ▼
IQ09 — verificar estado final MONT
```

## Regla temporal

La fecha de operación utilizada en las acciones técnicas debe ser coherente con el historial real de lecturas. La guía fuente valida primero la lectura más reciente y utiliza una fecha posterior para la secuencia de desmontaje/montaje.

La versión pública no conserva las fechas ni números reales del caso; sí conserva la regla: **no ejecutar la regularización ignorando la cronología de lectura y operación del dispositivo**.

## Validaciones por etapa

### `IQ09`

- confirmar el dispositivo correcto;
- registrar el estado inicial;
- revisar el historial de lectura;
- identificar la última lectura relevante.

### `EG35`

- operar sobre la instalación correcta;
- utilizar una fecha de operación válida;
- revisar dispositivo anterior, ubicación y datos de contador antes de guardar.

### `EG36`

- mantener la misma fecha operacional;
- comprobar información técnica recuperada;
- guardar únicamente cuando el contexto técnico sea consistente.

### `EG50`

- localizar la operación de desmontaje anulable;
- seleccionar la operación aplicable al aparato;
- confirmar la reversión antes del nuevo montaje.

### `EG34`

- montar nuevamente el dispositivo en la instalación correcta;
- revisar parámetros tarifarios/técnicos requeridos por el proceso;
- guardar y validar el resultado.

## Contingencia documentada

La guía fuente incluye una contingencia solo cuando `EG36` no puede completar la regularización. En ese escenario se revisa la situación logística mediante `MIGO` antes de retomar el flujo técnico.

Esto no se presenta como una receta universal: la acción logística depende del estado real del material/dispositivo y debe confirmarse funcionalmente antes de ejecutarse.

## Criterio de cierre

La actividad se considera cerrada cuando:

- el historial de lectura utilizado es coherente;
- la fecha operacional permanece consistente en la secuencia;
- `IQ09` muestra un único estado `MONT`;
- el proceso deja de estar bloqueado por el doble estado.

## Qué demuestra

- SAP IS-U Device Management operativo;
- análisis de estados de dispositivos;
- lectura de historial antes de intervención;
- secuencia de desmontaje/anulación/montaje;
- razonamiento de consistencia temporal;
- reversión funcional controlada;
- integración entre contexto técnico y logística MM cuando aplica.

## Límite de confidencialidad

No se publican seriales, equipos, instalaciones, contratos, puntos de suministro, objetos de conexión, materiales, proveedores, direcciones ni códigos organizativos reales.