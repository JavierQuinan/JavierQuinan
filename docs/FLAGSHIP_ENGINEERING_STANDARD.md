# Flagship Engineering Evidence Standard

[Versión en español](./FLAGSHIP_ENGINEERING_STANDARD.es.md)

This standard defines how the strongest private/commercial projects are represented in the public engineering portfolio without exposing proprietary source code, customer data or production secrets.

## Target projects

Current flagship tier:

- KOVI
- MOTORIX / TecnoAuto
- FITBA / GYMORA
- LegalTech Automation Platform

Enterprise evidence tracks such as SAP Integration Lab and Odoo Engineering Lab follow the same evidence-first philosophy, with domain-specific adaptations.

## Required case-study structure

A flagship should progressively document:

1. problem and target users;
2. verified product surfaces and domain scope;
3. architecture and system boundaries;
4. data/tenancy/security model;
5. important engineering decisions and ADRs;
6. automated quality evidence;
7. CI/CD and release controls;
8. observability and operational readiness;
9. failure/recovery behavior when relevant;
10. deployment/runtime boundary;
11. synthetic screenshots or demo video when safe;
12. explicit limitations and non-claims;
13. roadmap separated from current implementation.

## Bilingual policy

Recruiter-facing flagship documentation is English-first for international reach and must have a materially equivalent Spanish version for LATAM. Code identifiers, APIs and standard technical terms may remain in English.

Recommended naming:

```text
README.md
README.es.md
ARCHITECTURE.md
ARCHITECTURE.es.md
IMPLEMENTATION_GUIDE.md
IMPLEMENTATION_GUIDE.es.md
OPERATIONS_GUIDE.md
OPERATIONS_GUIDE.es.md
SECURITY.md
SECURITY.es.md
```

Not every project needs every document immediately. Files are added only when the underlying evidence exists.

## Evidence classes

- **Private-source verified** — statement confirmed in the private repository but source is not published.
- **Sanitized operational evidence** — real engineering/operational knowledge rewritten to remove sensitive identifiers.
- **Public engineering evidence** — reviewable public source, tests or executable artifact exists.
- **CI/runtime verified** — a quality or runtime gate was actually observed passing.
- **Roadmap** — planned direction only; never presented as implemented functionality.

## Security and privacy publication gate

Do not publish:

- credentials, tokens or environment secrets;
- customer/tenant/client/member/case data;
- private signing material or certificates;
- production endpoints or internal hostnames;
- database dumps;
- employer/customer proprietary source;
- sensitive screenshots;
- unsupported security, performance or production claims.

## Quality gate before a strong recruiter claim

A capability should be promoted from “planned” or “prototype” only when the repository contains appropriate evidence such as code, automated tests, runtime verification, CI output, operational documentation or a reproducible demo.

## Portfolio outcome

The goal is not to maximize the number of projects. The goal is to make a smaller group of projects demonstrate different engineering strengths:

- **KOVI:** regulated SaaS, queues/workers, fiscal integration, security-sensitive credential handling;
- **MOTORIX:** multi-tenant ERP/SaaS, RBAC, branch scoping, migrations and operations;
- **FITBA:** web + native mobile, shared data model, RLS, engagement/gamification and consent architecture;
- **LegalTech:** legal workflow/domain engineering, document processing, security/privacy and bounded AI assistance.
