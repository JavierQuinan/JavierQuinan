# Roadmap de Laboratorios Futuros

[English version](./FUTURE_LAB_ROADMAP.md)

> Solo propuesta. Ningún punto de este roadmap se presenta como implementado hasta que exista código y evidencia runtime.

## P0 — Hacer reproducibles los 10 laboratorios históricos

1. Reejecutar las 10 copias públicas en un entorno SAP actual.
2. Reemplazar la dependencia privada `ZEMP_LOGALI` por un modelo de datos o adapter sintético original con nomenclatura `_fq` en los labs afectados.
3. Recrear o eliminar la dependencia `TEXT-001` del lab-04.
4. Añadir evidencia runtime actual sanitizada únicamente después de que cada clase active y ejecute correctamente.

## P1 — Construir labs originales de ABAP Cloud moderno

5. ABAP Unit sobre una clase existente de lógica pura.
6. Fundamentos CDS sobre datos sintéticos/demo liberados.
7. Business object RAP mínimo.
8. Service definition + binding para el objeto RAP.
9. Exposición y verificación de servicio OData.

## P2 — Convertir tooling solo-formación en evidencia hands-on

10. Ejecutar ATC contra el paquete de labs y registrar hallazgos reales.
11. Crear un flujo real de paquete/repositorio con abapGit.
12. Ejecutar ABAP Cleaner sobre labs seleccionados y revisar el diff.
13. Construir un escenario de autorización adecuado al entorno ABAP elegido.
14. Añadir un lab seguro de consumo de API usando un cliente HTTP liberado.

## P3 — Profundidad opcional

15. Walkthrough de debugging.
16. Análisis runtime/performance del lab avanzado de tablas internas.
17. Evidencia de gestión de transportes donde el entorno lo permita.
18. Escenario RAP avanzado después de completar la vertical P1.

## Regla de evidencia

Cada punto futuro debe avanzar por:

`PROPOSED → SOURCE_CREATED → CURRENT_RUNTIME_VERIFIED → PUBLIC_EVIDENCE`

Ningún tema solo-formación pasa directamente a `VERIFIED`.
