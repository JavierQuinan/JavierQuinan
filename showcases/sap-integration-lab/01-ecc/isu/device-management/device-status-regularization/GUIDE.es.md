**Regularización del estado ALMA-MONT mediante transacciones SAP IS-U**

| Situación inicial | El serial del medidor presenta simultáneamente los estados ALMA y MONT. |
|---|---|
| Resultado esperado | El medidor debe quedar con un único estado MONT para continuar el trámite. |
| Caso de referencia | Medidor 5212015483; instalación 4003309630; última lectura 06.04.2026. |

# Procedimiento

Aplique este procedimiento cuando un medidor permanezca con doble estatus ALMA-MONT. Antes de ejecutar las transacciones, valide el número de medidor, la instalación y las fechas del caso.

## 1. Consultar el medidor en la transacción IQ09
Ingrese a la transacción IQ09, registre el número de medidor y ejecute la consulta. Para el caso de referencia se utiliza el serial 5212015483.

Figura 1. Consulta del medidor 5212015483 en IQ09.

## 2. Revisar el resultado de lecturas
Seleccione la opción “Result.lectura” para visualizar el historial de lecturas asociado al medidor.

Figura 2. Historial de lecturas del medidor.

## 3. Identificar la última lectura registrada
Localice la lectura más reciente. En este caso, la última lectura corresponde al 06.04.2026. Esta fecha determina la fecha de operación que se utilizará en los pasos posteriores.

## 4. Ejecutar el desmontaje para cálculo en EG35
Ingrese a la transacción EG35. Registre la instalación y establezca como fecha de operación una fecha posterior a la última lectura. Para este caso se utiliza el 08.04.2026, es decir, dos días después de la lectura del 06.04.2026.

Figura 3. Datos iniciales para el desmontaje de cálculo en EG35.

Presione Enter para cargar la información relacionada con el medidor y la instalación.

Figura 4. Datos recuperados para el desmontaje de cálculo.

Verifique los datos mostrados y guarde la operación.

## 5. Completar el desmontaje para cálculo en EG36
Ingrese a la transacción EG36, registre el serial del medidor y utilice la misma fecha de operación definida en EG35. En el caso de referencia: medidor 5212015483 y fecha 08.04.2026.

Figura 5. Datos de entrada en EG36.

Presione Enter, compruebe la información técnica y guarde.

Figura 6. Información técnica previa a completar el desmontaje.

Después de guardar, valide el estado actualizado del equipo.

Figura 7. Verificación del estado del equipo después de EG36.

## 6. Anular el desmontaje mediante EG50
Para restablecer el estado necesario antes del montaje, ingrese a la transacción EG50 y registre el serial 5212015483.

Figura 8. Pantalla inicial de EG50.

Presione Enter. En la lista de operaciones seleccione la ruta “Desmontaje → Anulable → Aparato” y guarde la operación.

Figura 9. Selección de la operación anulable en EG50.

## 7. Montar nuevamente el medidor en EG34
Ingrese a la transacción EG34. Registre la instalación, la fecha de operación y el número de medidor. En el caso de referencia se utiliza la instalación 4003309630, la fecha 08.04.2026 y el medidor 5212015483.

Figura 10. Datos iniciales para el montaje en EG34.

Presione Enter. Complete los campos “Cl.tarf.” y “Gr.val.” con los valores que correspondan al caso, valide la información y guarde.

Figura 11. Datos técnicos del montaje en EG34.

## 8. Verificar el resultado final
Consulte nuevamente el serial del medidor en IQ09. Confirme que el equipo tenga un único estatus MONT y que ya no figure el doble estatus ALMA-MONT.

Figura 12. Resultado final: medidor con estatus único MONT.

# Procedimiento de contingencia

**Aplicar únicamente si EG36 presenta un impedimento:** si no es posible completar el paso 5 y el medidor continúa en estado ALMA-MONT, revise en MIGO el movimiento de mercancías. De ser procedente, efectúe la salida de mercancías necesaria para regularizar el estado a DISP-MONT, ingresando todos los parámetros requeridos.

**Validación previa obligatoria:** confirme que el medidor tenga proveedor asignado. Si no lo tiene, realice la asignación correspondiente desde MIGO antes de continuar. Una vez regularizado el estado, retome el procedimiento desde EG36.

# Validación de cierre

- La última lectura utilizada corresponde al historial real del medidor.
- La fecha de operación es posterior a la última lectura y se mantiene de forma consistente en EG35, EG36 y EG34.
- El medidor queda con un único estatus MONT en IQ09.
- El trámite puede continuar sin el bloqueo generado por el doble estatus.
