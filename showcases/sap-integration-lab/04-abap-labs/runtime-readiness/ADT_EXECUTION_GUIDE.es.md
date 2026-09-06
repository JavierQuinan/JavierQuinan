# Guía de Ejecución con ADT

[English version](./ADT_EXECUTION_GUIDE.md)

> Pasos prácticos para ejecutar cualquiera de estos 10 laboratorios mediante **ABAP Development Tools (ADT) para Eclipse**. Esta es la única forma soportada de compilar y ejecutar estas clases — **VS Code no ejecuta ABAP.** VS Code / el checkout local de este repositorio es solo donde vive el texto fuente; el objeto de clase real, la activación y la ejecución ocurren todos dentro de un sistema ABAP Cloud real, al que se llega mediante Eclipse ADT.

## 0. Por qué no VS Code

ABAP no es un lenguaje que se interprete o compile localmente como JavaScript o Python. Un archivo `.abap` en disco es solo texto fuente — no hay runtime local de ABAP, no existe un comando `abap run archivo.abap`, ni ninguna extensión de VS Code que ejecute ABAP contra un kernel real. La clase debe crearse como un **objeto de repositorio dentro de un sistema ABAP** (mediante ADT, que se comunica con ese sistema a través de una conexión basada en RFC/HTTP), ser compilada por el kernel propio de ese sistema, y ejecutarse allí. Cada paso a continuación asume Eclipse con el plugin ABAP Development Tools instalado, conectado a un sistema donde esté disponible un modelo de desarrollo compatible con ABAP Cloud (un sistema trial de ABAP, una instancia de BTP ABAP Environment/Steampunk, o un sistema on-premise habilitado para desarrollo ABAP Cloud).

## 1. Selección de paquete

- En el Project Explorer, expandir la conexión al sistema ABAP Cloud destino.
- Bajo `$TMP` (local, no transportable) o un paquete de cliente existente con ruta de transporte, decidir dónde vivirán las clases de laboratorio.
  - `$TMP` es la opción más rápida para un pase personal de reverificación sin intención de transportar los objetos a ningún lado — apropiado aquí, ya que esto es verificación local, no una entrega.
  - Si se usa un paquete de cliente en su lugar, se pedirá una solicitud de transporte en la primera activación; cualquier solicitud creada es local al sistema del propietario de la cuenta y no forma parte de los cambios de archivo propios de esta revisión.
- La clase fixture (`zcl_employee_fixture_fq`) y cualquier laboratorio que la consuma (variantes runtime-ready de 05/06/08) **deben crearse en el mismo paquete** para que la llamada al método estático (`zcl_employee_fixture_fq=>get_employees( )`) resuelva sin un problema de autorización/visibilidad entre paquetes.

## 2. Creación/importación de la clase

No existe un asistente de "importar un archivo `.abap`" en ADT para una clase completamente nueva — en su lugar:

1. Clic derecho sobre el paquete destino → **New → ABAP Class**.
2. Introducir el nombre exacto de la clase (p. ej. `ZCL_LAB_01_VAR_FQ`) y una descripción corta.
3. ADT genera un esqueleto mínimo `CLASS ... DEFINITION ... ENDCLASS. CLASS ... IMPLEMENTATION ... ENDCLASS.` y abre el editor de fuente.
4. Seleccionar todo el texto del esqueleto generado y reemplazarlo completamente por el contenido íntegro del archivo `.abap` correspondiente de este paquete de evidencia (fuente histórico para los labs 01–04, 05a, 07, 07a; el archivo `source/*.abap` correspondiente para las variantes runtime-ready de los labs 05/06/08, y para la propia `zcl_employee_fixture_fq`).
5. Guardar (`Ctrl+S`).

## 3. Pegado/importación del fuente

- Pegar todo el contenido del archivo, incluyendo las líneas de comentario ABAP Doc `"!` iniciales — son sintaxis ABAP Doc válida y no causarán un error de sintaxis; son útiles porque llevan las mismas notas de procedencia/dependencia que el archivo `.abap` local.
- No pegar el contenido de `PROVENANCE.md`/README — solo el propio fuente `.abap` va al editor de la clase.

## 4. Activación

- `Ctrl+F3` o el botón de la barra de herramientas Activate (flecha circular verde).
- ADT ejecuta un chequeo de sintaxis como parte de la activación. Dos resultados posibles:
  - **Éxito:** la clase se pone verde en el Project Explorer; la opción de ejecución "Execute As Console Application" se vuelve disponible.
  - **Fallo:** la vista Problems lista el error exacto. Ver Sección 5.

## 5. Errores de sintaxis — qué esperar por tipo de dependencia

| Síntoma | Causa | Qué hacer |
|---|---|---|
| `Type "ZEMP_LOGALI" is unknown` o similar, en `DATA`/`FIELD-SYMBOLS` a nivel de clase | `ZEMP_LOGALI` no existe en este sistema (labs 06/08 históricos) | Usar la variante runtime-ready en su lugar — no intentar arreglar la clase histórica |
| `"ZEMP_LOGALI" is not an active/existing database table`, solo en runtime (no en activación) | Falta la misma tabla, pero solo se referencia vía `SELECT` (lab 05 histórico, método `demo_2_concat_lines_tab`) | O bien aceptar que ese único método fallará en runtime (los otros 7 tienen éxito) o usar `zcl_lab_05_invoice_rt_fq` en su lugar |
| `Text symbol 001 is not maintained` / similar | `TEXT-001` aún no creado (lab 04) | Seguir los pasos 1–4 de `LAB04_TEXT_ELEMENT_DECISION.es.md` antes de activar |
| `Type "/DMO/CONNECTION"` (o `/DMO/FLIGHT`, `/DMO/CARRIER`, `/DMO/EMPLOYEE_HR`) `is unknown` | El contenido de demostración del SAP Flight Reference Scenario no está instalado/activado en este sistema | Confirmar mediante el propio informe de activación de datos de demostración de SAP para el tipo de sistema destino (varía entre trial vs. BTP ABAP Environment vs. on-premise) — esta es una cuestión de aprovisionamiento de sistema, fuera del alcance de esta revisión a nivel de código |
| Una construcción aparece subrayada con una advertencia/error de "release" de ABAP Cloud (p. ej. alrededor de `sy-datum`) | La construcción no está liberada para el software component al que está asignado el paquete | Es exactamente el caso `LIKELY_COMPATIBLE_NEEDS_RUNTIME` marcado en `ABAP_CLOUD_COMPATIBILITY.es.md` — registrar el mensaje exacto, no reescribir silenciosamente el fuente histórico para evitarlo |
| El nombre de la clase excede la longitud permitida | Ver la sección de longitud de nomenclatura en `RUNTIME_VARIANT_MAPPING.es.md` | El sufijo `_rt_fq`/`_rt_fqa` usado aquí se eligió específicamente para caber; si ADT igual rechaza un nombre, eso es información nueva a registrar, no a adivinar |

## 6. Ejecución en consola

- Clic derecho sobre la clase activada → **Run As → 1 Console Application** (o seleccionar la clase y presionar `F9`, o usar el botón verde "Run" de la barra de herramientas con la clase seleccionada).
- ADT abre una vista **Console**; las llamadas `out->write( )` de `if_oo_adt_classrun~main` se imprimen ahí, un bloque visual por llamada.

## 7. Log de aplicación / output

- La vista **Console** es el output principal de estas clases (usan `if_oo_adt_classrun_out`, no el Application Log clásico (`SLG1`) ni el output de lista (`WRITE` en un report) — ninguno de los 10 laboratorios es un report, todos son clases de aplicación de consola).
- Si un método lanza una excepción no capturada (p. ej. ejecutar la histórica `zcl_lab_06_condition_fq` sin `ZEMP_LOGALI`), ADT muestra un error tipo short-dump en la vista Console o en un diálogo — esto es esperado para las clases históricas conocidas como bloqueadas y es en sí mismo evidencia válida de la dependencia bloqueante, no un fallo de la herramienta.

## 8. Consola ABAP

- Misma vista que las Secciones 6/7 — "ABAP Console" y "Console" se refieren al mismo panel de output en las versiones actuales de ADT. No hay ninguna pantalla SAP GUI separada involucrada para estas clases `if_oo_adt_classrun`.

## 9. Resolución de dependencias

- Resolver las dependencias **antes** de la activación, en este orden: (a) cualquier objeto Z referenciado como TYPE en tiempo de compilación (solo `ZEMP_LOGALI`, para los labs históricos 06/08 — usar la variante runtime-ready en vez de intentar aprovisionar la tabla Z), (b) cualquier elemento de texto (lab 04), (c) la presencia real de cualquier objeto `/DMO/*` (labs 01, 05 método 2, 07, 07a — comprobar vía Data Preview, sección siguiente), (d) cualquier clase prerrequisito del mismo paquete (la fixture, para las variantes runtime-ready de los labs 05/06/08).
- Para comprobar la presencia y el contenido de una tabla `/DMO/*`: en el Project Explorer, navegar hasta ella (o usar `Navigate → Open ABAP Development Object` y escribir el nombre), clic derecho → **Open With → Data Preview** (o presionar `F8` con ella seleccionada). Esto ejecuta un `SELECT` en vivo contra el sistema destino y muestra filas reales — usarlo para confirmar los conteos de filas y valores de filtro anotados en `DMO_DEPENDENCY_CHECK.es.md` antes de confiar en el output esperado de un laboratorio.

## 10. Captura de evidencia

- Capturar el contenido de la vista **Console** después de una ejecución exitosa, y la entrada del **Project Explorer** mostrando la clase como activada, como el par mínimo de capturas por laboratorio.
- Antes de guardar/compartir cualquier captura: aplicar el checklist de sanitización de `RUNTIME_EVIDENCE_CHECKLIST.es.md` — en particular, recortar la columna `iduser` del bloque de output `A01` del lab 07a (ver `RUNTIME_EXECUTION_PLAN.es.md`, Lab 07a, ítem 9), y revisar los títulos de ventana/pestaña por cualquier ID de sistema, tenant, o alias de conexión visible en el chrome de Eclipse alrededor de la vista Console antes de recortar la imagen final.
- No incluir ninguna otra pestaña de editor abierta, rama del Project Explorer, o notificación/toast que pudiera mostrar un hostname, ID de tenant, o nombre de usuario fuera de lo que las instrucciones propias de cada laboratorio señalan.

## No cubierto aquí

Ninguna captura de pantalla de ninguna fuente de terceros (material de curso de Logali Group, material de GEM Educa, o cualquier otra parte) se incluye en esta guía ni debe incluirse jamás en evidencia capturada — ver `00_AUDIT/COPYRIGHT_CLASSIFICATION.md` en el paquete de evidencia principal para la regla rectora.
