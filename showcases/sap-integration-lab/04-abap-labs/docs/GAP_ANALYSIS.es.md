# Análisis de Gaps — Track Histórico de Laboratorios ABAP Cloud

[English version](./GAP_ANALYSIS.md)

> Este documento cubre únicamente `04-abap-labs/`. Es un análisis de gaps del track, no una afirmación de que el SAP Integration Lab global carezca de estas capacidades.

## P0 — Reproducibilidad de los laboratorios existentes

| Gap | Evidencia actual | Evidencia faltante | Acción recomendada | Verificación |
|---|---|---|---|---|
| Verificación runtime actual de los 10 labs históricos | Código + evidencia privada de ejecución histórica | Ejecución fresca en un entorno SAP actual | Reejecutar cada copia pública, recreando únicamente las dependencias documentadas | Evidencia limpia de activación/ejecución por laboratorio |
| Dependencia reproducible para labs basados en `ZEMP_LOGALI` | El código público documenta la dependencia | Reemplazo público y neutral de la tabla o un adapter | Crear una tabla/modelo sintético original con nomenclatura `_fq` y adaptar la variante pública | Ejecución actual sin dependencia de la tabla propietaria de formación |
| Dependencia de símbolo de texto en lab-04 | El código documenta `TEXT-001` | Símbolo público recreado o refactor | Recrear el símbolo o reemplazarlo por una constante autocontenida en una futura rama runtime | Ejecución actual |

## P1 — Testing y ampliación ABAP Cloud moderna

| Capacidad | Evidencia en este track | Faltante | Próximo lab recomendado |
|---|---|---|---|
| ABAP Unit | Ninguna en este conjunto histórico | Clase de test + evidencia runtime verde | Añadir una clase local de test a un lab de lógica pura como aritmética/conversiones |
| CDS | Ninguna en este conjunto histórico | Fuente CDS original + preview/runtime | Vista CDS read-only sobre datos sintéticos o demo liberados |
| RAP | Ninguna en este conjunto histórico | BO, behavior y runtime originales | Escenario RAP managed mínimo sobre datos sintéticos |
| Service definition / binding | Ninguna en este conjunto histórico | Exposición de servicio original | Extender el escenario RAP |
| OData hands-on en ABAP | Ninguna en este conjunto histórico | Evidencia de servicio/runtime | Extender el escenario RAP |

El SAP Integration Lab global ya contiene material RAP respaldado por documentación y un ejemplo ejecutable no-live de cliente OData; los puntos anteriores se refieren específicamente a crear **nuevos laboratorios ABAP hands-on**.

## P2 — Cerrar gaps formación → laboratorio

| Capacidad | Estado actual en este track | Evidencia recomendada |
|---|---|---|
| ATC | Solo guía derivada de formación | Ejecutar una variante ATC adecuada contra el paquete público y registrar hallazgos reales |
| abapGit | Solo guía derivada de formación | Vincular un paquete/repositorio real y capturar un flujo real de branch/push |
| ABAP Cleaner | Guía derivada + ilustración manual | Ejecutar la herramienta real sobre uno o dos labs y revisar el diff |
| Autorizaciones | Solo guía derivada de formación | Crear un escenario original de objeto/check adecuado al entorno objetivo |
| Consumo de API | Sin lab hands-on en este track | Consumir una API read-only segura usando un cliente HTTP liberado disponible en el entorno ABAP Cloud elegido |

## P3 — Ampliación opcional

- Walkthrough de debugging sobre un laboratorio existente.
- Análisis runtime/performance del lab de tablas internas más grande.
- Evidencia de gestión de transportes cuando el entorno disponible lo permita.
- RAP avanzado solo después de completar el escenario end-to-end P1.

## Contexto global del portfolio

Usa la [Matriz de Capacidades SAP](../../00-profile/SAP_CAPABILITY_MATRIX.es.md) para claims globales. `NOT_FOUND_IN_THIS_LAB_SET` se limita deliberadamente a este track.
