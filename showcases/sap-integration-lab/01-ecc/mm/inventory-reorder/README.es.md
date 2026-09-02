# SAP ECC MM — Paquete de Evidencia de Inventario y Reposición

> **Línea:** SAP ECC / Materials Management  
> **Estado del artefacto:** `SOURCE_READY / RUNTIME_VALIDATION_PENDING`  
> **Claim de ejecución:** ninguno todavía

Este paquete es el primer artefacto técnico del SAP Integration Lab.

Demuestra una regla de dominio MM pequeña y testeable alrededor de stock actual, punto de pedido y stock de seguridad usando ABAP Objects y ABAP Unit.

## Lo que este código sí demuestra

- diseño de clase ABAP Objects
- estructura de retorno tipada
- reglas de estado de negocio explícitas
- lógica determinista
- estructura de clase de pruebas ABAP Unit
- separación entre evidencia de código y claims de ejecución

## Lo que todavía no demuestra

- activación en un sistema SAP ECC real
- ejecución contra MARC/MARD u otra fuente estándar SAP
- ejecución exitosa de ABAP Unit dentro de SAP
- estado production-ready

Esos claims quedan bloqueados hasta documentar el resultado en `EVIDENCE.md`.

## Escenario funcional

Para un contexto sintético material/centro:

- `current_stock` = stock disponible
- `reorder_point` = punto que dispara reposición
- `safety_stock` = stock mínimo de protección

El evaluador retorna:

- `OK` — stock igual o superior al objetivo
- `REORDER` — stock por debajo del objetivo pero no por debajo del safety stock
- `CRITICAL` — stock por debajo del safety stock

También calcula la cantidad faltante para recuperar el nivel objetivo.

## Próxima promoción técnica

La siguiente versión añadirá una abstracción de datasource y dos implementaciones:

1. datasource demo/sintético para pruebas deterministas
2. datasource ECC sobre stock estándar cuando exista un entorno SAP apropiado para validar runtime

Luego se añadirá un reporte ejecutable/SALV por encima del servicio de dominio.

## Regla de validación

No describir este paquete como “ejecutándose en SAP” hasta completar:

1. creación/importación de la clase
2. syntax check
3. activación
4. ejecución de ABAP Unit
5. registro del resultado en `EVIDENCE.md`
