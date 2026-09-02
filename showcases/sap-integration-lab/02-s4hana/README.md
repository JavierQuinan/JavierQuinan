# SAP S/4HANA — Engineering Evidence Track

[Versión en español](./README.es.md)

> **Scope:** S/4HANA MM, CDS, released APIs, ABAP Cloud and RAP  
> **Current maturity:** planned / evidence architecture defined

This track is deliberately separated from ECC. It focuses on current SAP extensibility and integration practices rather than rebranding classic ECC patterns as S/4HANA evidence.

## Target areas

- MM-oriented CDS View Entities
- released APIs
- OData services
- ABAP Cloud language/version restrictions
- Clean Core-compatible design
- RAP business objects
- behavior definitions and implementations
- service definitions / bindings
- authorization concepts
- ABAP Unit and test doubles where applicable

## Evidence rule

A direct-table ECC report does not qualify as S/4HANA evidence by itself. S/4HANA artifacts should favor released interfaces and upgrade-safe extension points.

## Planned packs

1. **MM Purchasing API Evidence** — purchase requisition / purchase order access via released interfaces.
2. **CDS Analytical Evidence** — MM-oriented CDS View Entity with documented semantic model.
3. **ABAP Cloud Evidence** — code constrained to released APIs and cloud-ready language version.
4. **RAP Evidence** — end-to-end business object from CDS through behavior and service exposure.

## Runtime gate

No artifact is described as working on S/4HANA until activation/execution evidence is captured in `EVIDENCE.md`.
