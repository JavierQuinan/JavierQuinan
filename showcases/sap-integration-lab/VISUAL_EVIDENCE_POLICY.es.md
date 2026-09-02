# Política de Evidencia Visual — SAP Integration Lab

[English version](./VISUAL_EVIDENCE_POLICY.md)

Las capturas pueden fortalecer la evidencia, pero solo cuando están claros los derechos de publicación y los límites de confidencialidad.

## Permitido

Se pueden publicar imágenes cuando fueron creadas por el autor del portfolio o existe permiso para publicarlas, y todo contexto sensible fue eliminado.

Buenos ejemplos:

- salida SALV sintética/demo
- resultados ABAP Unit desde un sandbox autorizado usando objetos no sensibles
- pantallas `SE24`, `SE38`, `SE80` o `SE93` mostrando objetos creados para el portfolio
- diagramas de arquitectura creados específicamente para el repositorio
- extractos sanitizados de guías operativas creadas por el autor, siempre que no quede información de empresa/cliente

## Sanitización obligatoria

Eliminar o reemplazar:

- nombres/logos de empleador, cliente o empresa
- usuarios y correos
- SID, mandante y aliases del sistema
- órdenes de transporte
- URLs, hosts, destinos RFC e IP internas
- OT, contratos, materiales, proveedores, instalaciones, BP/clientes y medidores reales
- importes o fechas operativas que permitan identificar un caso
- nombres de transacciones `Z*` propietarias del empleador/cliente

Los identificadores sintéticos deben marcarse claramente como demo/synthetic.

## Material de terceros

Capturas de cursos, libros, plataformas pagadas, manuales de proveedores u otro material visual de terceros **no se republican** salvo que los derechos de publicación sean claros.

Sí pueden utilizarse privadamente como material de aprendizaje/referencia; en GitHub se recrea el concepto mediante diagramas propios, código original, ejemplos sintéticos y referencias cuando corresponda.

## Convención de carpeta

Cuando un evidence pack incorpore imágenes:

```text
evidence/
└── screenshots/
    ├── 01-object-definition-sanitized.png
    ├── 02-test-result-sanitized.png
    └── README.md
```

El `README.md` debe indicar:

- qué demuestra la captura
- si los datos son sintéticos/sanitizados
- clase de entorno cuando aplique (`DEV`, `sandbox`, `local mock`) sin revelar su identidad
- qué **no** demuestra la imagen

## Regla de evidencia

Una captura es evidencia de apoyo, no reemplaza source, tests ni documentación reproducible.
