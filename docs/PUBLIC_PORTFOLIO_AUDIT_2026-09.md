# Public GitHub Portfolio Audit — September 2026

## Scope

This audit reviews the **24 public repositories** currently visible under `JavierQuinan` as a professional engineering portfolio.

Primary goals:

1. strengthen first-line recruiter signal;
2. distinguish current engineering evidence from future roadmaps;
3. verify current public-tree credential hygiene using targeted high-risk patterns;
4. classify repositories consistently;
5. define the strongest six repositories to pin for the current Full Stack / enterprise-software positioning.

This audit does not rewrite Git history, archive repositories, change visibility or claim that every possible dependency/security issue has been eliminated.

## Executive result

The public portfolio now has a clear professional hierarchy:

- **1 profile repository**;
- **1 flagship public engineering repository**;
- **7 portfolio-evidence repositories**;
- **0 hardening candidates** after the latest promotions;
- **10 learning/historical repositories**;
- **5 archive candidates**.

The strongest change since the previous review is that `Listas` and `parqueadero_android` now have enough real source/test/CI evidence to move from hardening candidates to `PORTFOLIO EVIDENCE`.

`fullstack-javascript-project-137`, `139` and `141` also now have independent/current CI evidence and documentation that separates present capability from roadmap direction.

## First-line recruiter surface

### Flagship

**`ai-dev-team-marketplace`**

Best public signal for reusable developer tooling, AI-assisted engineering workflows, agents/skills, documentation and open-source engineering maturity.

### Strong supporting evidence

**`Listas`**

- Angular 18 frontend;
- PHP MVC-style backend;
- SQLite/PDO;
- CRUD billing/inventory domains;
- password hashing and verification;
- CORS allowlist;
- deterministic database bootstrap;
- authentication smoke checks;
- successful GitHub Actions PHP/auth + Angular production-build gate;
- roadmap separated from current evidence.

**`parqueadero_android`**

- native Android/Kotlin;
- Android SDK 34 / minSdk 24;
- environment-aware API configuration;
- release/debug network-policy separation;
- pure Kotlin parking-fee and input-validation domain rules;
- 14 versioned unit-test methods;
- observed successful `testDebugUnitTest`, `assembleDebug` and `lintDebug` quality gate;
- evidence-first product/engineering roadmap.

**`fullstack-javascript-project-103`**

- Node.js CLI;
- JSON/YAML processing;
- nested diff generation;
- multiple render formats;
- Jest/lint evidence;
- clean, focused engineering problem.

**`fullstack-javascript-project-139`**

- React 18;
- Redux Toolkit;
- Socket.IO client;
- Formik/Yup;
- i18n;
- observed CI: 2 suites / 3 tests passing and production build successful;
- external backend dependency is documented honestly;
- dependency/toolchain modernization remains a documented engineering boundary.

**`fullstack-javascript-project-141`**

- Fastify 5;
- SQLite / Knex / Objection.js;
- bcrypt/authenticated flows;
- task/status/label CRUD;
- server-rendered Pug UI and i18n;
- independent CI with observed Mocha/build success;
- dependency/session/static-serving modernization remains documented.

**`fullstack-javascript-project-137`**

- reactive JavaScript without a frontend framework;
- RSS parsing and polling;
- Axios/i18next/Webpack;
- ESLint;
- real Playwright Chromium smoke test in CI;
- external RSS proxy and bundle/dependency boundaries documented.

**`fullstack-javascript-project-138`**

- Node.js CLI;
- Axios/Cheerio HTTP/HTML processing;
- asset processing/concurrency;
- Jest.

## Recommended six pinned repositories

Recommended order for the current profile:

1. **`ai-dev-team-marketplace`** — flagship / differentiator.
2. **`Listas`** — Angular + backend/database/auth/CI breadth.
3. **`parqueadero_android`** — native Kotlin/mobile/domain/testing signal.
4. **`fullstack-javascript-project-103`** — focused Node/Jest engineering quality.
5. **`fullstack-javascript-project-139`** — market-relevant React/realtime evidence.
6. **`fullstack-javascript-project-141`** — backend/full-stack Fastify evidence.

First alternate: **`fullstack-javascript-project-137`** for Playwright/reactive-JS evidence.

Second alternate: **`fullstack-javascript-project-138`** for Node CLI/HTTP-processing evidence.

### Why this selection

The six are intentionally complementary rather than repetitive:

- AI/developer tooling;
- Angular full stack;
- Android/Kotlin;
- Node/Jest CLI quality;
- React/realtime frontend;
- backend/full-stack Fastify.

Private enterprise products remain represented through sanitized profile case studies, so the public pins do not need to pretend private commercial source is public.

## Public-tree security audit

A targeted code search was executed across the **24 public repositories only**.

Reviewed high-risk patterns included:

- `sk-proj-`;
- `BEGIN PRIVATE KEY`;
- `AKIA`;
- `ghp_`;
- `xoxb-`;
- `mongodb+srv://`;
- `SUPABASE_SERVICE_ROLE_KEY`;
- `JWT_SECRET=`;
- `postgresql://`.

### Result

**No matches were returned for these patterns in the current default-branch code of the 24 public repositories.**

Important scope note: this is a targeted current-tree scan. It is not equivalent to a full-history secret scan and does not erase previously remediated historical exposure. In particular, old Git history must never be treated as a safe source for credentials that were once versioned.

## Documentation architecture

For active public projects, the preferred pattern is now:

```text
README.md
  └── current implementation + reproducible usage + honest boundaries

ENGINEERING_EVIDENCE.md
  └── observed tests / CI / build / technical evidence when useful

ROADMAP.md
  └── future product and architecture evolution
      ✅ implemented
      🔄 priority direction
      🧭 strategic future
```

This is intentionally different from deleting roadmaps. A good roadmap demonstrates technical judgment and product thinking; the key requirement is that future features cannot be mistaken for implemented evidence.

## Repositories to keep public but out of the first line

### Learning / historical

- `Eva`
- `Eventos_P_2`
- `fullstack-javascript-project-98`
- `formularios`
- `Gestion_Biblioteca`
- `ingreso`
- `Mini_Sistema_PDO`
- `Proyectos`
- `Unidad_Medida`
- `viajes_p2`

These repositories preserve educational chronology but should not compete visually with the selected engineering evidence.

## Archive candidates

- `clientePedido`
- `cliente_pedido`
- `clientes_productos_proveedores`
- `codica-js_1`
- `sucursales`

No repository was archived or deleted by this audit. Archive/visibility changes remain explicit manual decisions because they can affect links and historical context.

## Known current constraints

### Dependency/toolchain debt

The recent CI reviews for `137`, `139` and `141` observed dependency-audit findings. Their README/evidence documentation therefore avoids a production-ready claim. These repositories remain valid portfolio evidence because the implemented features, tests and builds are real, but dependency modernization is a maintenance priority before any production-security positioning.

### Historical secrets

A current-tree cleanup does not remove old Git objects. Previously versioned credentials must be considered compromised and never reused. History rewriting is intentionally outside this audit because it is destructive and requires a separate decision.

### GitHub settings outside the current connector

The repository connector used for this audit does not expose all profile/repository UI settings. The following remain manual GitHub UI actions:

- select/reorder the six pinned repositories;
- archive the five archive candidates if approved;
- edit repository topics/descriptions where needed;
- change visibility or repository names;
- perform destructive Git-history rewrites.

## Final assessment

The public GitHub surface is now suitable as a **curated engineering portfolio rather than a raw academic repository dump**.

The strongest professional signal is no longer only the profile README: recruiters can now move from the profile into public repositories that contain real source, reproducible checks, current documentation and clearly separated roadmaps.

The next portfolio phase should focus on presentation rather than inventing more GitHub claims: final pin ordering, repository metadata/topics and the premium portfolio website can consume the evidence that is already versioned here.
