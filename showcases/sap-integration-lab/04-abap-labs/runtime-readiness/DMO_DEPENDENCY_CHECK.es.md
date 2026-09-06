# Comprobación de Dependencias /DMO/*

[English version](./DMO_DEPENDENCY_CHECK.md)

> Toda referencia `/DMO/*` encontrada en los 10 fuentes publicados, solo por lectura estática. `AVAILABILITY = UNKNOWN` para todas hasta comprobarse directamente en el sistema ABAP Cloud destino (ADT Data Preview o una prueba de `SELECT`). Nada aquí asume que el SAP Flight Reference Scenario esté instalado — normalmente lo está en sistemas trial/demo de SAP, pero esto no debe afirmarse sin comprobarlo.

## Tablas

| Objeto | Usado por lab | Propósito | Campos requeridos | Estrategia de fallback | ¿Puede sustituirse sintéticamente? | Estado |
|---|---|---|---|---|---|---|
| `/DMO/EMPLOYEE_HR` | 01 | `SELECT SINGLE *` hacia una estructura basada en Dictionary, impresa tal cual | Ninguno nombrado individualmente — toda la fila se imprime de forma genérica | Si está ausente: la clase de todos modos no activa, porque `DATA ms_employees TYPE /dmo/employee_hr` **es** una referencia de tipo en tiempo de compilación, así que la ausencia de la tabla como objeto DDIC bloquea la activación, no solo el `SELECT` | No recomendado específicamente para lab-01 — el propio punto del ejercicio en esta sección es leer una estructura real basada en Dictionary; una estructura local sintética seguiría demostrando el sistema de tipos, pero debilitaría la afirmación de "lectura desde estructura basada en Dictionary". Se prefiere verificar que `/DMO/EMPLOYEE_HR` existe antes que crear una variante de este laboratorio. | `AVAILABILITY = UNKNOWN` |
| `/DMO/CONNECTION` | 07, 07a | `SELECT` hacia `tt_connection`/`mt_airline` (tipo `STANDARD TABLE OF /dmo/connection` en tiempo de compilación en ambos labs); lectura, ordenamiento, modificación (en memoria), borrado (en memoria), agrupación en 07a | `carrier_id`, `connection_id`, `airport_from_id`, `airport_to_id`, `distance_unit`, `departure_time` | Si está ausente: ambos labs fallan al activarse (dependencia de tipo en tiempo de compilación) | No recomendado — el propósito declarado de los labs 07/07a es específicamente demostrar operaciones de tablas internas *contra datos reales de demostración del modelo de vuelos de SAP*; un sustituto sintético requeriría redefinir el alcance del propio laboratorio, lo cual queda fuera del alcance de este pase de reproducibilidad (ver Fase 11 — sin contenido de laboratorio nuevo todavía) | `AVAILABILITY = UNKNOWN` |
| `/DMO/FLIGHT` | 07a | `SELECT` hacia `mt_flights_type` (tipo `STANDARD TABLE OF /dmo/flight` en tiempo de compilación); usada en `nested_for`, `collect_records`, `use_let`, `use_base`, `use_range_tables` | `carrier_id`, `connection_id`, `client`, `seats_occupied`, `seats_max`, `flight_date`, `price` | Si está ausente: la clase falla al activarse | No recomendado, mismo razonamiento que `/DMO/CONNECTION` arriba | `AVAILABILITY = UNKNOWN` |
| `/DMO/CARRIER` | 07a | `SELECT * FROM /dmo/carrier` hacia `mt_scarr` (tipo `STANDARD TABLE OF /dmo/carrier` en tiempo de compilación); usada solo en `use_let` para buscar el nombre de una aerolínea | `carrier_id`, `name` | Si está ausente: la clase falla al activarse | No recomendado, mismo razonamiento | `AVAILABILITY = UNKNOWN` |

## Elementos de datos (usados como TYPE de campo, no como tablas)

| Objeto | Usado por lab | Propósito | Estrategia de fallback | ¿Puede sustituirse sintéticamente? | Estado |
|---|---|---|---|---|---|
| `/DMO/CARRIER_ID` | 07a | TYPE de campo para `aircode`/`carrier_id` en estructuras locales | Se entrega en el mismo paquete que `/DMO/CARRIER`/`/DMO/CONNECTION`/`/DMO/FLIGHT` — verificar en conjunto | No recomendado de forma aislada | `AVAILABILITY = UNKNOWN` |
| `/DMO/CONNECTION_ID` | 07a | TYPE de campo para `flightnum`/`connection_id` | Igual que arriba | No recomendado de forma aislada | `AVAILABILITY = UNKNOWN` |
| `/DMO/AIRPORT_FROM_ID`, `/DMO/AIRPORT_TO_ID` | 07a | TYPE de campo para los extremos de la ruta | Igual que arriba | No recomendado de forma aislada | `AVAILABILITY = UNKNOWN` |
| `/DMO/PLANE_SEATS_OCCUPIED` | 07a | TYPE de campo para `seat`/`seats` | Igual que arriba | No recomendado de forma aislada | `AVAILABILITY = UNKNOWN` |
| `/DMO/FLIGHT_DATE` | 07a | TYPE de campo para `flightdate` | Igual que arriba | No recomendado de forma aislada | `AVAILABILITY = UNKNOWN` |
| `/DMO/FLIGHT_PRICE` | 07a | TYPE de campo para `bookings`, y para el `RANGE OF /dmo/flight_price` usado en `use_range_tables` | Igual que arriba | No recomendado de forma aislada | `AVAILABILITY = UNKNOWN` |

## No es una dependencia DMO (se aclara para evitar confusión)

`LAND1` (usado en `ty_flights-key`, lab 07a) es un elemento de datos **estándar de SAP Basis** (clave de país), no forma parte del paquete `/DMO/*`. Se entrega con el Dictionary base de todo sistema SAP y no se espera que sea un riesgo de reproducibilidad — incluido aquí solo para que no se persiga por error como un objeto DMO faltante.

## Cómo comprobar (resumen — pasos completos en `ADT_EXECUTION_GUIDE.es.md`)

Para cada tabla anterior: abrirla en el Data Preview de ADT (`F8` sobre el objeto, o clic derecho → "Open With" → "Data Preview") en el sistema destino, confirmar que devuelve al menos las filas que las cláusulas `WHERE` relevantes esperan (p. ej. `carrier_id = 'LH'`/`'SQ'`, `connection_id > '0400'`, `distance_unit = 'KM'`, `airport_from_id = 'FRA'`, `price BETWEEN 200 AND 400`). Registrar el conteo real de filas y una muestra sanitizada en el archivo de evidencia propio del laboratorio según `RUNTIME_EVIDENCE_CHECKLIST.es.md` — no asumir que los filtros `WHERE` devolverán resultados no vacíos solo porque la tabla existe.

## Estado de este documento

Todas las filas son `AVAILABILITY = UNKNOWN` por diseño, según la instrucción rectora de no presuponer disponibilidad de objetos SAP. Esto debe actualizarse solo después de una comprobación real en ADT, por parte del propietario de la cuenta — no fabricado ni inferido aquí.
