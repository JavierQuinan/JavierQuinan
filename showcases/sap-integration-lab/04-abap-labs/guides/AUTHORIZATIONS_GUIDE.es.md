# Guía de Autorizaciones ABAP

[English version](./AUTHORIZATIONS_GUIDE.md)

## Estado

`TRAINING_DERIVED_GUIDE` — redactada de forma independiente a partir de formación de terceros completada. En este track no se afirma haber creado un objeto de autorización, asignado roles ni ejecutado pruebas runtime de autorización.

## Alcance

Conceptos centrales de autorización en ABAP clásico y ABAP Cloud, manteniendo separados sus modelos y herramientas.

## Conceptos principales

- **Authorization field:** campo utilizado en checks de autorización, por ejemplo actividad.
- **Authorization object:** objeto de repositorio ABAP que agrupa hasta diez authorization fields.
- **`AUTHORITY-CHECK`:** sentencia ABAP explícita que comprueba la autorización del usuario actual contra valores de un objeto.
- **CDS access control:** mecanismo de autorización para acceso de lectura a entidades CDS.
- **RAP authorization control:** controles globales y por instancia para business objects RAP.
- **Least privilege:** conceder y comprobar únicamente el acceso requerido.

## Ruta ABAP clásica

En escenarios clásicos/on-premise, authorization fields/objects se mantienen habitualmente con transacciones como SU20/SU21, y los roles mediante PFCG.

Patrón ilustrativo:

```abap
AUTHORITY-CHECK OBJECT 'Z_MY_OBJ'
  ID 'ACTVT' FIELD '01'
  ID 'BUKRS' FIELD lv_company_code.

IF sy-subrc <> 0.
  " rechazar o lanzar una excepción específica
ENDIF.
```

Es solo una ilustración. No se afirma haber creado `Z_MY_OBJ`.

## Ruta ABAP Cloud / RAP

ABAP Cloud también soporta authorization fields/objects y checks explícitos, pero las aplicaciones cloud pueden apoyarse además en CDS access controls y en autorización global/por instancia de RAP. El diseño concreto depende de si se protege acceso a servicio, lectura de datos o comportamiento del business object.

No se debe asumir que un walkthrough clásico SU21/PFCG es automáticamente la ruta correcta para cualquier entorno ABAP Cloud.

## Verificación

No existe en este track un objeto de autorización propio, usuario de prueba ni pruebas runtime positiva/negativa.

## Consideraciones de seguridad

- Aplicar controles en la lógica backend, no solo en la navegación UI.
- Probar el caso negativo.
- No sobrescribir ni ignorar un `sy-subrc` fallido.
- Mantener reglas centralizadas/alineadas con el framework cuando sea posible.

## Procedencia

Concepto estudiado durante formación de terceros. La guía fue redactada de forma independiente y no reproduce capturas ni ejercicios del curso.

## Estado de evidencia

`TRAINING_ONLY_IN_THIS_TRACK`. Consulta el [Roadmap de Laboratorios Futuros](../docs/FUTURE_LAB_ROADMAP.es.md).

## Referencias oficiales

- SAP Help — Authorization objects: https://help.sap.com/docs/ABAP_Cloud/abap-cloud-docs_abap-keyword-documentation_abap-for-cloud-development/ABENAUTHORIZATION_OBJECT_GLOSRY.html
- SAP Help — Authorization basics en SAP BTP ABAP environment: https://help.sap.com/docs/sap-btp-abap-environment/abap-environment/authorization-basics
