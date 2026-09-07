# Matriz de Evidencia — Conjunto Histórico de Laboratorios ABAP Cloud

[English version](./EVIDENCE_MATRIX.md)

> **Regla de alcance:** esta matriz describe únicamente el material de `04-abap-labs/`. No es la matriz global de capacidades SAP. Para la vista completa, consulta la [Matriz de Capacidades SAP](../00-profile/SAP_CAPABILITY_MATRIX.es.md).

> **Conteo de unidades:** Curso 1 es un currículo de 16 unidades. 10 unidades tienen un laboratorio hands-on personal (source + capturas propias); 6 unidades son solo-teoría sin ejercicio de Laboratorio ni carpeta de laboratorio — ver el [catálogo de laboratorios](./labs/README.es.md) para el desglose exacto. "10 laboratorios" y "16 unidades" no están en tensión: describen dos cosas distintas.

`Historical Runtime Evidence: YES` significa que la entrega privada de origen contiene evidencia de ejecución consistente con la implementación entregada. `NO_CURRENT_RUNTIME_CLAIM` significa que este track no afirma reejecución en un entorno actual — es un enunciado de alcance factual y cerrado, no una tarea abierta.

| Capacidad | Contexto de formación | Lab existente en este conjunto | Código | Evidencia histórica de runtime | Claim de runtime actual | Guía | Estado del track |
|---|---|---|---|---|---|---|---|
| ABAP Core | SÍ | SÍ (8/10 laboratorios) | SÍ | SÍ | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| ABAP Objects | SÍ | SÍ (10/10) | SÍ | SÍ | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| Patrón classrun de ABAP Cloud | SÍ | SÍ (10/10) | SÍ | SÍ | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| ADT / Eclipse | SÍ | Indirecto mediante todos los labs classrun | N/A | SÍ (indirecta) | NO_CURRENT_RUNTIME_CLAIM | — | `LAB_FOUND` |
| Tablas internas | SÍ | SÍ (`lab-07`, `lab-07a`) | SÍ | SÍ | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| Field Symbols | SÍ | SÍ (`lab-08`) | SÍ | SÍ | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| Open SQL | SÍ | SÍ (`lab-05`, `lab-06`, `lab-07`, `lab-07a`) | SÍ | SÍ | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| Manejo de excepciones | SÍ | SÍ (`lab-06`) | SÍ | SÍ | NO_CURRENT_RUNTIME_CLAIM | — | `HISTORICAL_EXECUTION_VERIFIED` |
| Autoría de interfaces propias (`zif_*`) | NO | NO | NO | NO | N/A | — | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| ABAP Dictionary / DDIC | SÍ | NO | NO | NO | N/A | SÍ | `TRAINING_ONLY_IN_THIS_TRACK` |
| CDS | NO en este conjunto fuente | NO | NO | NO | N/A | NO | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| RAP | NO en este conjunto fuente | NO | NO | NO | N/A | NO | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| Behavior Definitions | NO | NO | NO | NO | N/A | NO | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| Service Definitions / Bindings | NO | NO | NO | NO | N/A | NO | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| Lab práctico OData en ABAP | NO | NO | NO | NO | N/A | NO | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| Lab ABAP Unit | NO | NO | NO | NO | N/A | NO | `NOT_EVIDENCED_IN_THIS_LAB_SET` |
| Práctica hands-on ATC | SÍ | SÍ — [`training-practices/`](./training-practices/README.es.md) (`zcl_c3_02_atc_demo_fq`) | SÍ | N/A (práctica de formación, no evidencia de lab histórico) | NO_CURRENT_RUNTIME_CLAIM | SÍ | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` |
| Práctica hands-on ABAP Cleaner | SÍ | SÍ — [`training-practices/`](./training-practices/README.es.md) (`zcl_c3_03_cleaner_demo_fq`) | SÍ | N/A (práctica de formación, no evidencia de lab histórico) | NO_CURRENT_RUNTIME_CLAIM | SÍ | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` |
| Práctica hands-on abapGit | SÍ | SÍ — [`training-practices/`](./training-practices/README.es.md) (`zcl_c3_01_projects_fq`) | SÍ | N/A (práctica de formación, no evidencia de lab histórico) | NO_CURRENT_RUNTIME_CLAIM | SÍ | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` |
| Práctica hands-on de autorizaciones | SÍ | SÍ — [`training-practices/`](./training-practices/README.es.md) (`zcl_c3_04_dept_auth_fq`) | SÍ | N/A (práctica de formación, no evidencia de lab histórico) | NO_CURRENT_RUNTIME_CLAIM | SÍ | `OWNER_CONFIRMED_HANDS_ON_EXECUTION` |
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

- `HISTORICAL_EXECUTION_VERIFIED`: existe código entregado más evidencia documentada de ejecución histórica. No se afirma ni se exige runtime actual.
- `OWNER_CONFIRMED_HANDS_ON_EXECUTION`: el propietario confirma directamente haber tecleado, creado y ejecutado personalmente esta práctica de formación; ver [Prácticas de Formación](./training-practices/README.es.md) para la redacción de procedencia exacta por práctica.
- `LAB_FOUND`: existe evidencia indirecta o parcial de laboratorio.
- `TRAINING_ONLY_IN_THIS_TRACK`: estudiado y documentado aquí, sin artefacto de source guardado y sin claim de lab práctico dentro de este conjunto histórico.
- `NOT_EVIDENCED_IN_THIS_LAB_SET`: no existe evidencia de lab/código en este conjunto histórico; **no** implica ausencia global en el portfolio.
- `NO_CURRENT_RUNTIME_CLAIM`: este track no afirma reejecución en un entorno actual.
