# Public Repository Portfolio Governance

This document defines how the public repositories under `JavierQuinan` are presented as professional engineering evidence.

The objective is not to make every historical repository look production-ready. The objective is to preserve useful learning history while keeping the professional signal accurate, secure, reviewable and easy to navigate.

## Classification model

| Classification | Meaning |
|---|---|
| `PROFILE` | GitHub profile and curated public evidence surface. |
| `FLAGSHIP` | Strong current public engineering evidence suitable for first-line review. |
| `PORTFOLIO EVIDENCE` | Verified technical evidence that supports a specific capability. |
| `HARDENING CANDIDATE` | Useful evidence that still needs material security, reproducibility or documentation work before promotion. |
| `LEARNING / HISTORICAL` | Preserved academic or earlier-stage evidence; intentionally not production-positioned. |
| `ARCHIVE CANDIDATE` | Low-signal or incomplete historical repository. Kept until an explicit archive/delete decision is made. |

## Documentation rule: evidence vs. roadmap

Active engineering repositories may keep an ambitious `ROADMAP.md`. A roadmap is useful product/engineering evidence when it is clearly separated from implemented capability.

Preferred model:

- `README.md` — what exists now, how it works and how to verify it;
- `ENGINEERING_EVIDENCE.md` when useful — observed CI/test/build/security evidence and technical boundaries;
- `ROADMAP.md` — future product/architecture direction, explicitly marked as future;
- GitHub Issues / Projects — executable future work when the project becomes actively maintained as a product.

Recommended roadmap status labels:

- ✅ implemented/evidenced;
- 🔄 priority engineering direction;
- 🧭 strategic evolution / possible future capability.

Future roadmap items must never be described in the README as present-tense implementation until the source and relevant verification exist.

## Current public inventory — audited September 2026

The public surface contains **24 repositories**.

| Repository | Classification | Portfolio role / decision |
|---|---|---|
| `JavierQuinan` | PROFILE | Main professional profile, private-product case studies and SAP evidence index. |
| `ai-dev-team-marketplace` | FLAGSHIP | Open-source AI developer tooling: reusable skills/agents, documentation, quality and security-oriented engineering workflow. |
| `fullstack-javascript-project-103` | PORTFOLIO EVIDENCE | Node.js CLI, JSON/YAML diff processing, multiple output formats, Jest and linting. Strong clean supporting evidence. |
| `fullstack-javascript-project-137` | PORTFOLIO EVIDENCE | Reactive JavaScript RSS client, Axios/i18n/Webpack, lint and real Playwright Chromium smoke evidence. Dependency/performance modernization is documented. |
| `fullstack-javascript-project-138` | PORTFOLIO EVIDENCE | Node.js CLI, HTTP/HTML processing, Axios/Cheerio, concurrency and Jest. |
| `fullstack-javascript-project-139` | PORTFOLIO EVIDENCE | React 18, Redux Toolkit, Socket.IO, Formik/Yup, i18n, 2 test suites / 3 tests observed passing and production frontend build in CI. Backend dependency is explicitly external. |
| `fullstack-javascript-project-141` | PORTFOLIO EVIDENCE | Fastify 5, SQLite, Knex/Objection, bcrypt/auth, CRUD, i18n and independent CI. Dependency/security modernization remains documented. |
| `Listas` | PORTFOLIO EVIDENCE | Angular 18 + PHP MVC + SQLite billing/inventory evidence with password hashing, CORS allowlist, deterministic DB bootstrap, auth smoke tests and successful Angular/PHP CI gate. |
| `parqueadero_android` | PORTFOLIO EVIDENCE | Native Android/Kotlin evidence with environment-aware networking, pure Kotlin fee/validation domain rules, 14 versioned unit-test methods and successful Android lint/test/build CI gate. |
| `Eva` | LEARNING / HISTORICAL | Educational Node.js/Python server comparison. |
| `Eventos_P_2` | LEARNING / HISTORICAL | Angular/backend academic project; useful historical evidence but not first-line portfolio. |
| `fullstack-javascript-project-98` | LEARNING / HISTORICAL | Earlier Node.js CLI learning evidence. |
| `formularios` | LEARNING / HISTORICAL | Earlier PHP/MVC/form-processing work. |
| `Gestion_Biblioteca` | LEARNING / HISTORICAL | Earlier PHP/MVC library-management practice. |
| `ingreso` | LEARNING / HISTORICAL | Earlier PHP authentication/MVC practice. |
| `Mini_Sistema_PDO` | LEARNING / HISTORICAL | Earlier PHP/PDO practice; tracked local config was removed and README claims were sanitized. |
| `Proyectos` | LEARNING / HISTORICAL | Academic/project collection; public phpinfo artifacts were removed from the current tree. |
| `Unidad_Medida` | LEARNING / HISTORICAL | Earlier academic CRUD/domain practice. |
| `viajes_p2` | LEARNING / HISTORICAL | NestJS academic API. A previously versioned environment secret was removed from the current tree; old history must not be treated as a safe credential source. |
| `clientePedido` | ARCHIVE CANDIDATE | NestJS starter-era repository with low independent portfolio signal. |
| `cliente_pedido` | ARCHIVE CANDIDATE | NestJS starter-era repository with low independent portfolio signal. |
| `clientes_productos_proveedores` | ARCHIVE CANDIDATE | Incomplete/nested academic MVC repository with no first-line evidence value. |
| `codica-js_1` | ARCHIVE CANDIDATE | Minimal repository with essentially no technical evidence. |
| `sucursales` | ARCHIVE CANDIDATE | Incomplete repository with very limited standalone evidence. |

### Classification totals

- `PROFILE`: 1
- `FLAGSHIP`: 1
- `PORTFOLIO EVIDENCE`: 7
- `HARDENING CANDIDATE`: 0
- `LEARNING / HISTORICAL`: 10
- `ARCHIVE CANDIDATE`: 5

## Promotion gate

A repository may move to `PORTFOLIO EVIDENCE` or `FLAGSHIP` only when the following are true:

1. The README describes capabilities verified in the current codebase.
2. Build/run instructions are reproducible from a clean checkout where applicable.
3. No real `.env` file, secret, token, private key, certificate or production connection string is committed in the current public tree.
4. No customer, employee or real personal data is included in public source, fixtures, screenshots, databases or logs.
5. Third-party templates/libraries are correctly attributed and license requirements are respected.
6. Tests, CI, coverage and deployment claims are only stated when their evidence is versioned and reproducible.
7. Security limitations and material technical debt are documented rather than hidden.
8. Screenshots/demos, when published, contain synthetic or sanitized data only.
9. Future roadmap capabilities are clearly distinguished from current implementation.

## Public security baseline

Public repositories use `.env.example` or equivalent placeholders where configuration examples are needed. A secret that has ever been committed is treated as compromised even if later deleted from the working tree.

Generated databases should not be committed unless they contain strictly synthetic data and there is a specific reason to retain the binary. Prefer schema + seed scripts that recreate state deterministically.

Signing certificates (`.p12`, `.pfx`, `.pem` private keys), production dumps, access tokens, service-role keys and customer datasets are never public portfolio artifacts.

### September 2026 public-tree scan

A targeted search across the 24 public repositories found **no matches** in their current default-branch code for the reviewed high-risk patterns including:

- OpenAI `sk-proj-` key prefix;
- PEM private-key marker;
- AWS `AKIA` access-key prefix;
- GitHub `ghp_` PAT prefix;
- Slack `xoxb-` bot-token prefix;
- MongoDB SRV connection prefix;
- `SUPABASE_SERVICE_ROLE_KEY`;
- `JWT_SECRET=`;
- PostgreSQL connection-string prefix.

This is a targeted repository-content check, not a claim that Git history has been rewritten or that every possible secret format is covered.

## Private product showcase policy

Commercial/private products remain private. Public evidence is created as sanitized documentation/case studies containing only what is necessary to prove engineering capability: architecture, synthetic screenshots when appropriate, non-sensitive interfaces/examples, tests, ADRs and technical decisions.

Published profile case studies/evidence include:

1. KOVI electronic invoicing platform
2. Motorix / TecnoAuto workshop SaaS
3. FITBA / GYMORA web + mobile platform
4. LegalTech workflow platform
5. SAP Integration Lab / enterprise systems evidence

## Recommended six pinned repositories

For the current Full Stack / enterprise-software positioning, the strongest balanced six are:

1. `ai-dev-team-marketplace` — flagship AI/developer-tooling signal.
2. `Listas` — Angular + backend/database/security/CI breadth.
3. `parqueadero_android` — native Kotlin/mobile/domain/testing evidence.
4. `fullstack-javascript-project-103` — clean Node.js/Jest/CLI engineering evidence.
5. `fullstack-javascript-project-139` — React/Redux/Socket.IO market-relevant frontend evidence; dependency modernization is documented.
6. `fullstack-javascript-project-141` — Fastify/SQLite/auth/backend/full-stack evidence; dependency/security modernization is documented.

`fullstack-javascript-project-137` is the first alternate because it now has real Playwright CI evidence. `fullstack-javascript-project-138` is a second alternate when stronger CLI/HTTP-processing representation is desired.

Pinned selection should be revisited when a new public enterprise SaaS or SAP source repository becomes stronger than the supporting educational projects.

## Archive/delete policy

`ARCHIVE CANDIDATE` does not mean automatic deletion. Before any irreversible action, check links, dependencies, historical value and whether any active profile/portfolio page references the repository.

Deletion, history rewriting, visibility changes and archival are explicit separate decisions.
