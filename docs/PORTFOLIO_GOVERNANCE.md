# Public Repository Portfolio Governance

This document defines how the public repositories under `JavierQuinan` are presented as professional evidence.

The objective is not to make every historical repository look production-ready. The objective is to preserve learning history while keeping the professional signal accurate, secure and easy to review.

## Classification model

| Classification | Meaning |
|---|---|
| `PROFILE` | GitHub profile and public positioning surface. |
| `FLAGSHIP` | Strong current public engineering evidence suitable for first-line review. |
| `PORTFOLIO EVIDENCE` | Verified technical evidence that supports a specific capability. |
| `HARDENING CANDIDATE` | Useful engineering evidence that needs security, reproducibility or documentation work before promotion. |
| `LEARNING / HISTORICAL` | Preserved academic or earlier-stage evidence; intentionally not presented as production-ready. |
| `ARCHIVE CANDIDATE` | Low-signal or incomplete historical repository. Kept until an explicit archive/delete decision is made. |

## Current public inventory

| Repository | Classification | Portfolio role / decision |
|---|---|---|
| `JavierQuinan` | PROFILE | Main professional profile and curated evidence index. |
| `ai-dev-team-marketplace` | FLAGSHIP | Open-source AI developer tooling, skills, agents, CI, security and evals. |
| `fullstack-javascript-project-103` | PORTFOLIO EVIDENCE | Node.js CLI, JSON/YAML processing, Jest and linting. |
| `fullstack-javascript-project-137` | PORTFOLIO EVIDENCE | Reactive frontend, RSS processing, Axios, i18n and Webpack. Automated browser-test evidence remains pending. |
| `fullstack-javascript-project-138` | PORTFOLIO EVIDENCE | Node.js CLI, HTTP/HTML processing, concurrency and Jest. |
| `fullstack-javascript-project-139` | PORTFOLIO EVIDENCE | React 18, Redux Toolkit, Socket.IO, forms and i18n. |
| `fullstack-javascript-project-141` | PORTFOLIO EVIDENCE | Fastify, SQLite, Knex/Objection, authentication, CRUD and i18n; hardening backlog documented. |
| `Listas` | HARDENING CANDIDATE | Angular 18 + PHP MVC/SQLite academic system with real functional breadth. Requires sanitization, reproducible database setup and security hardening before promotion. |
| `parqueadero_android` | HARDENING CANDIDATE | Native Android/Kotlin project under active open-source revival; architecture, network security, tests and CI roadmap published before portfolio promotion. |
| `Eva` | LEARNING / HISTORICAL | Educational Node.js/Python server comparison. |
| `Eventos_P_2` | LEARNING / HISTORICAL | Angular/backend academic project; useful historical full-stack evidence but not current first-line portfolio. |
| `fullstack-javascript-project-98` | LEARNING / HISTORICAL | Earlier Node.js CLI learning evidence. |
| `formularios` | LEARNING / HISTORICAL | Earlier PHP/MVC/form-processing work; not production-positioned. |
| `Gestion_Biblioteca` | LEARNING / HISTORICAL | Earlier PHP/MVC library-management practice. |
| `ingreso` | LEARNING / HISTORICAL | Earlier PHP authentication/MVC practice. |
| `Mini_Sistema_PDO` | LEARNING / HISTORICAL | Earlier PHP/PDO practice. |
| `Proyectos` | LEARNING / HISTORICAL | Academic/project collection; not part of first-line portfolio evidence. |
| `Unidad_Medida` | LEARNING / HISTORICAL | Earlier academic CRUD/domain practice. |
| `viajes_p2` | LEARNING / HISTORICAL | NestJS academic API. Versioned environment configuration was removed from the current tree and must not be reused from Git history. |
| `clientePedido` | ARCHIVE CANDIDATE | NestJS starter-era repository with low independent portfolio signal. |
| `cliente_pedido` | ARCHIVE CANDIDATE | NestJS starter-era repository with low independent portfolio signal. |
| `clientes_productos_proveedores` | ARCHIVE CANDIDATE | Incomplete/nested academic MVC repository with no first-line evidence value. |
| `codica-js_1` | ARCHIVE CANDIDATE | Minimal repository with essentially no technical evidence. |
| `sucursales` | ARCHIVE CANDIDATE | Incomplete repository with very limited standalone evidence. |

## Promotion gate

A repository may move to `PORTFOLIO EVIDENCE` or `FLAGSHIP` only when the following are true:

1. The README describes only capabilities verified in the current codebase.
2. Build/run instructions are reproducible from a clean checkout.
3. No real `.env` file, secret, token, private key, certificate or production connection string is committed.
4. No customer, employee or real personal data is included in source, fixtures, screenshots, databases or logs.
5. Third-party templates/libraries are correctly attributed and license requirements are respected.
6. Tests, CI, coverage and deployment claims are only stated when their evidence is versioned and reproducible.
7. Security limitations and material technical debt are documented rather than hidden.
8. Screenshots/demos, when published, contain synthetic or sanitized data only.

## Security baseline

Public repositories must use `.env.example` or equivalent placeholders. Real credentials are external to Git. A secret that has ever been committed is treated as compromised even if later deleted from the working tree.

Generated databases should not be committed unless they contain strictly synthetic data and there is a specific reason to retain the binary. Prefer schema + seed scripts that recreate the state deterministically.

Signing certificates (`.p12`, `.pfx`, `.pem` private keys), production dumps, access tokens, service-role keys and customer datasets are never public portfolio artifacts.

## Private product showcase policy

Commercial/private products remain private. Public evidence is created as a separate sanitized showcase containing only what is necessary to prove engineering capability: architecture diagrams, synthetic screenshots, selected non-sensitive code examples, tests, ADRs, public interfaces and technical decisions.

The planned showcase sequence is:

1. KOVI SaaS Showcase
2. Motorix / TecnoAuto SaaS Showcase
3. FITBA / GYMORA Mobile Showcase
4. LegalTech Platform Showcase
5. SAP Integration Lab — ABAP / ABAP Cloud

## Archive/delete policy

`ARCHIVE CANDIDATE` does not mean automatic deletion. Before any irreversible action, check links, dependency on external documentation, historical value and whether any active portfolio page references the repository.

Deletion or history rewriting is always an explicit, separate decision.
