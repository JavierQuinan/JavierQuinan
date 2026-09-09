# SAP ECC — Guía técnica de debugging y diagnóstico

[English version](./README.md)

> **Tipo de evidencia:** troubleshooting ABAP / navegación técnica SAP  
> **Estado:** `PROCEDURE_READY`  
> **Ámbito:** SAP GUI / ECC clásico  
> **Límite:** guía de uso y diagnóstico; no representa permisos administrativos ni ejecución productiva

## Objetivo

Esta guía consolida un flujo profesional para identificar el objeto técnico detrás de una transacción SAP, navegar al código ABAP, ejecutar programas o funciones en modo de prueba, establecer breakpoints, inspeccionar variables y utilizar herramientas de diagnóstico cuando existe un error de ejecución o rendimiento.

No reproduce capturas, logos ni material visual de terceros. El contenido se presenta como referencia técnica original y sanitizada para portafolio.

## Mapa rápido de herramientas

| Herramienta | Uso principal | Evidencia técnica |
|---|---|---|
| `SE24` | Crear, visualizar y mantener clases ABAP | clases, atributos, métodos, herencia, interfaces, breakpoints |
| `SE37` | Visualizar/probar módulos de función | import/export, ejecución interactiva, debugging |
| `SE38` | Crear, visualizar, ejecutar y depurar programas ABAP | reportes, código fuente, breakpoints, ejecución |
| `SE80` | Workbench integrado | navegación entre programas, clases, funciones, paquetes y objetos relacionados |
| `SE93` | Crear/visualizar códigos de transacción | identificación del programa/dynpro/objeto asociado a una transacción |
| `/H` | Activar debugger desde una transacción de diálogo | detención en la siguiente acción ejecutable |
| `SM50` | Procesos de trabajo de una instancia | diagnóstico local de procesos |
| `SM66` | Procesos de trabajo de todas las instancias | diagnóstico global de procesos |
| `ST22` | Dumps ABAP | análisis de errores de tiempo de ejecución |
| `SM21` | Log del sistema | eventos, errores técnicos y contexto del sistema |

## Flujo profesional de diagnóstico

```text
INCIDENTE / COMPORTAMIENTO
        │
        ├── ¿Conozco la transacción?
        │        │
        │        ▼
        │      SE93
        │        │
        │        └── programa / dynpro / objeto asociado
        │
        ├── Programa ──> SE38 / SE80
        ├── Clase ─────> SE24 / SE80
        ├── Función ───> SE37 / SE80
        │
        ▼
BREAKPOINT / /H
        │
        ▼
ABAP DEBUGGER
        │
        ├── flujo de código
        ├── variables
        ├── tablas internas
        └── call stack / contexto
        │
        ▼
¿ERROR RUNTIME?
   ├── ST22
   └── SM21

¿PROCESO BLOQUEADO/LENTO?
   ├── SM50 — instancia local
   └── SM66 — visión global
```

## 1. SE93 — identificar qué ejecuta una transacción

Usar `SE93` cuando se conoce el código de transacción pero no el objeto ABAP subyacente.

Procedimiento:

1. abrir `SE93`
2. introducir el código de transacción
3. seleccionar **Visualizar**
4. revisar tipo de transacción
5. identificar programa, dynpro u objeto asociado cuando aplique
6. documentar únicamente el nombre técnico necesario para el análisis
7. navegar después con `SE38`, `SE80`, `SE24` o `SE37` según el tipo de objeto

Este patrón evita empezar el debugging a ciegas.

## 2. SE24 — clases ABAP

`SE24` permite trabajar con clases globales ABAP.

Usos relevantes:

- crear una clase
- revisar atributos
- revisar métodos
- inspeccionar herencia
- revisar interfaces implementadas
- navegar a la implementación de un método
- establecer breakpoints en métodos
- probar métodos cuando la interfaz de la clase lo permite

### Patrón de creación de clase

1. abrir `SE24`
2. informar nombre `Z*`/`Y*`
3. seleccionar **Crear**
4. completar descripción
5. definir visibilidad y superclase si aplica
6. crear atributos/métodos/interfaces
7. implementar métodos
8. ejecutar `Syntax Check`
9. activar
10. probar el método o integrarlo en un reporte

Este es el patrón utilizado por el Evidence Pack `ZCL_MM_STOCK_RISK_SERVICE`.

## 3. SE37 — módulos de función

`SE37` permite inspeccionar y probar módulos de función.

Flujo:

1. introducir nombre del módulo
2. visualizar la interfaz
3. revisar parámetros `IMPORT`, `EXPORT`, `CHANGING`, `TABLES` y excepciones según aplique
4. utilizar **Test/Ejecutar**
5. introducir parámetros de prueba no sensibles
6. ejecutar normalmente o con debugging
7. analizar salida y excepciones

Para debugging se puede fijar un breakpoint en el código del módulo y ejecutar la prueba interactiva.

## 4. SE38 — programas ABAP

`SE38` centraliza el trabajo con programas/reportes ABAP.

Procedimiento típico:

1. introducir programa
2. seleccionar visualizar/modificar según autorización
3. navegar al código fuente
4. fijar breakpoint en la línea relevante
5. ejecutar
6. inspeccionar flujo y variables

Para un artefacto nuevo:

1. crear el programa
2. definir atributos/tipo de programa
3. escribir código
4. `Syntax Check`
5. activar
6. ejecutar con datos demo

## 5. SE80 — navegación integrada

`SE80` es útil cuando el análisis involucra varios objetos relacionados.

Puede utilizarse para:

- navegar paquetes
- programas
- clases
- interfaces
- grupos/módulos de función
- objetos DDIC relacionados
- includes
- pantallas y objetos dependientes

La ventaja frente a abrir transacciones individuales es conservar el contexto de la aplicación y sus dependencias.

## 6. Activar debugging con `/H`

Cuando el problema solo aparece durante una transacción de diálogo:

1. entrar a la transacción
2. escribir `/H` en la barra de comandos
3. pulsar `Enter`
4. ejecutar la siguiente acción relevante
5. SAP abre el debugger antes de continuar el flujo

Esto permite entrar al flujo sin conocer previamente el programa exacto.

## 7. Breakpoints

### Breakpoint de sesión

Adecuado para una ejecución interactiva propia y temporal.

Características:

- afecta la sesión/usuario de debugging correspondiente
- útil para reportes y transacciones SAP GUI
- puede fijarse desde el editor de código

### Breakpoint externo

Útil cuando la llamada ABAP se produce fuera de la sesión SAP GUI directa, por ejemplo determinadas aplicaciones web/RFC según el escenario.

Debe utilizarse únicamente dentro de una sesión autorizada y con conocimiento de su alcance.

## 8. ABAP Debugger

El debugger permite ejecutar código paso a paso e inspeccionar estado de ejecución.

Elementos fundamentales:

- código fuente en ejecución
- variables locales/globales
- tablas internas
- objetos y referencias
- call stack
- watchpoints/breakpoints

Una práctica segura consiste en observar el estado y la lógica sin alterar datos de negocio ni forzar valores en un sistema productivo.

## 9. ST22 — análisis de dumps

Cuando existe un error ABAP de tiempo de ejecución:

1. abrir `ST22`
2. buscar dumps por fecha/hora/usuario autorizado
3. identificar tipo de error
4. identificar programa/Include
5. localizar línea o sección del fallo
6. revisar call stack/contexto
7. navegar al código mediante `SE38`/`SE80`
8. reproducir únicamente en ambiente autorizado

El dump debe utilizarse para encontrar causa raíz, no solo para copiar el mensaje de error.

## 10. SM50 vs SM66

### SM50

Visión de procesos de trabajo de **una instancia específica**.

Útil para:

- diagnóstico localizado
- revisar procesos activos/en espera
- identificar usuario/programa/contexto
- analizar una instancia concreta

### SM66

Visión **global** de procesos de trabajo de todas las instancias disponibles.

Útil para:

- problemas distribuidos
- visión global de carga
- localizar en qué instancia corre un proceso
- análisis transversal

Resumen:

| Característica | SM50 | SM66 |
|---|---|---|
| Alcance | instancia específica | todas las instancias |
| Vista | local | global |
| Diagnóstico | problema localizado | problema sistémico/distribuido |

La gestión/cancelación de procesos es una acción administrativa y no forma parte de esta evidencia salvo autorización explícita.

## 11. SM21 — log del sistema

Complementa a ST22 cuando el problema puede estar relacionado con eventos técnicos del sistema.

Permite revisar, según autorización:

- errores de comunicación
- eventos del sistema
- contexto de sesión
- mensajes técnicos
- eventos relacionados con estabilidad o infraestructura

## Caso de entrevista técnica

Pregunta: **“Una transacción Z o estándar falla; ¿cómo encontrarías dónde debuggear?”**

Respuesta estructurada:

1. reproduzco y documento el error
2. si existe dump, reviso `ST22`
3. uso `SE93` para identificar el objeto subyacente de la transacción
4. navego con `SE38`, `SE24`, `SE37` o `SE80`
5. fijo un breakpoint o activo `/H`
6. reproduzco el escenario con datos de prueba
7. inspecciono variables, tablas internas y call stack
8. si sospecho proceso/rendimiento, reviso `SM50` y `SM66`
9. correlaciono con `SM21` cuando se requiere contexto del sistema
10. documento causa raíz y corrección propuesta

## Seguridad y gobernanza

Esta evidencia no recomienda:

- debuggear productivo sin autorización
- alterar variables para modificar datos de negocio
- cambiar código estándar SAP
- finalizar procesos sin coordinación Basis
- publicar usuarios, SID, mandante, hostnames o identificadores internos
- compartir dumps completos que contengan información sensible

La evidencia pública debe demostrar metodología y conocimiento técnico, no acceso privilegiado.
