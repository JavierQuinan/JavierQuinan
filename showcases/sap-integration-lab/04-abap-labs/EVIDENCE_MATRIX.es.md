# Matriz de Evidencia — Conjunto Histórico de Laboratorios ABAP Cloud

[English version](./EVIDENCE_MATRIX.md)

> **Regla de alcance:** esta matriz describe únicamente el material de `04-abap-labs/`. No es la matriz global de capacidades SAP. Para la vista completa, consulta la [Matriz de Capacidades SAP](../00-profile/SAP_CAPABILITY_MATRIX.es.md).

`Historical Runtime Evidence: YES` significa que la entrega privada de origen contiene evidencia de ejecución consistente con la implementación entregada. `Current Runtime Verification: PENDING` significa que la copia pública aún no se ha reejecutado en un entorno SAP actual.

| Capacidad | Contexto de formación | Lab existente en este conjunto | Código | Evidencia histórica de runtime | Verificación runtime actual | Guía | Estado del track |
|---|---|---|---|---|---|---|---|
| ABAP Core | SÍ | SÍ (8/10 unidades) | SÍ | SÍ | PENDIENTE | — | `VERIFIED_HISTORICAL` |
| ABAP Objects | SÍ | SÍ (10/10) | SÍ | SÍ | PENDIENTE | — | `VERIFIED_HISTORICAL` |
| Patrón classrun de ABAP Cloud | SÍ | SÍ (10/10) | SÍ | SÍ | PENDIENTE | — | `VERIFIED_HISTORICAL` |
| ADT / Eclipse | SÍ | Indirecto mediante todos los labs classrun | N/A | SÍ (indirecta) | PENDIENTE | — | `LAB_FOUND` |
| Tablas internas | SÍ | SÍ (`lab-07`, `lab-07a`) | SÍ | SÍ | PENDIENTE | — | `VERIFIED_HISTORICAL` |
| Field Symbols | SÍ | SÍ (`lab-08`) | SÍ | SÍ | PENDIENTE | — | `VERIFIED_HISTORICAL` |
| Open SQL | SÍ | SÍ (`lab-05`, `lab-06`, `lab-07`, `lab-07a`) | SÍ | SÍ | PENDIENTE | — | `VERIFIED_HISTORICAL` |
| Manejo de excepciones | SÍ | SÍ (`lab-06`) | SÍ | SÍ | PENDIENTE | — | `VERIFIED_HISTORICAL` |
| Autoría de interfaces propias (`zif_*`) | NO | NO | NO | NO | N/A | — | `NOT_FOUND_IN_THIS_LAB_SET` |
| ABAP Dictionary / DDIC | SÍ | NO | NO | NO | N/A | SÍ | `TRAINING_ONLY_IN_THIS_TRACK` |
| CDS | NO en este conjunto fuente | NO | NO | NO | N/A | NO | `NOT_FOUND_IN_THIS_LAB_SET` |
| RAP | NO en este conjunto fuente | NO | NO | NO | N/A | NO | `NOT_FOUND_IN_THIS_LAB_SET` |
| Behavior Definitions | NO | NO | NO | NO | N/A | NO | `NOT_FOUND_IN_THIS_LAB_SET` |
| Service Definitions / Bindings | NO | NO | NO | NO | N/A | NO | `NOT_FOUND_IN_THIS_LAB_SET` |
| Lab práctico OData en ABAP | NO | NO | NO | NO | N/A | NO | `NOT_FOUND_IN_THIS_LAB_SET` |
| Lab ABAP Unit | NO | NO | NO | NO | N/A | NO | `NOT_FOUND_IN_THIS_LAB_SET` |
| Evidencia runtime ATC | SÍ | NO | NO | NO | N/A | SÍ | `TRAINING_ONLY_IN_THIS_TRACK` |
| Evidencia runtime ABAP Cleaner | SÍ | NO | NO | NO | N/A | SÍ | `TRAINING_ONLY_IN_THIS_TRACK` |
| Evidencia runtime abapGit | SÍ | NO | NO | NO | N/A | SÍ | `TRAINING_ONLY_IN_THIS_TRACK` |
| Lab práctico de autorizaciones | SÍ | NO | NO | NO | N/A | SÍ | `TRAINING_ONLY_IN_THIS_TRACK` |
| Debugging | SÍ (teoría) | NO | NO | NO | N/A | NO | `TRAINING_ONLY_IN_THIS_TRACK` |
| Performance | SÍ (teoría) | NO | NO | NO | N/A | NO | `TRAINING_ONLY_IN_THIS_TRACK` |
| Gestión de transportes | SÍ (tema) | NO | NO | NO | N/A | NO | `TRAINING_ONLY_IN_THIS_TRACK` |

## Contexto global del portfolio

Los estados anteriores son deliberadamente locales a este conjunto de laboratorios. En otras partes del SAP Integration Lab ya existe evidencia adicional, incluyendo:

- arquitectura RAP respaldada por documentación;
- patrones ABAP Unit revisados a nivel de código en otros packs ABAP;
- un ejemplo ejecutable no-live de cliente OData en el cliente de compras S/4HANA;
- evidencia enterprise sanitizada de debugging y flujos operativos específicos entre sistemas, sin un claim genérico de plataforma de integración.

Esos artefactos continúan clasificados por separado en la [Matriz de Capacidades SAP](../00-profile/SAP_CAPABILITY_MATRIX.es.md).

## Leyenda de estados

- `VERIFIED_HISTORICAL`: existe código entregado más evidencia histórica de ejecución; la reejecución actual sigue pendiente.
- `LAB_FOUND`: existe evidencia indirecta o parcial de laboratorio.
- `TRAINING_ONLY_IN_THIS_TRACK`: estudiado y documentado aquí, pero sin lab práctico dentro de este conjunto histórico.
- `NOT_FOUND_IN_THIS_LAB_SET`: no existe evidencia de lab/código en este conjunto histórico; **no** implica ausencia global en el portfolio.
- `PENDING`: todavía no se completó la reverificación runtime actual.
