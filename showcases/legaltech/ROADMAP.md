# LegalTech Automation Platform — Product Vision Roadmap

> **Document type:** future product direction, not implementation evidence  
> **Current verified baseline:** [LegalTech engineering case study](./README.md)  
> **Planning model:** `NEXT / LATER / EXPLORE` — no delivery dates or production claims

This roadmap is intentionally separated from the case study. The README describes what is verifiable today; this file describes strategic direction that may change after technical, legal, privacy and user validation.

## Product vision

Build a legal-operations platform where matters, clients, documents, communications, deadlines, auditability and AI-assisted work share one governed workspace.

The intended product principle remains:

> **Workflow first. AI assists the professional; it does not replace legal judgment.**

## NEXT — make the platform auditable and reproducible

**Desired outcome:** the core legal workflow can be tested, reviewed and demonstrated with synthetic data without relying on unverifiable AI behavior.

Strategic initiatives:

- establish backend unit/integration tests for authentication, authorization and matter/client/document access boundaries;
- add deterministic synthetic demo data and a reproducible CI baseline;
- formalize upload validation, file policy, malware-scanning integration points and storage boundaries;
- implement audit-log redaction and privacy-oriented tests;
- introduce an AI-provider abstraction so workflow code is not coupled to one model vendor;
- add mocked-provider contract tests, evaluation datasets and explicit fallback/error behavior;
- create a document/privacy threat model covering confidential, privileged and personal-data workflows.

## LATER — connected legal workspace

**Desired outcome:** lawyers and clients can collaborate around a matter without fragmenting documents, communications and workflow state across unrelated tools.

Candidate initiatives:

- secure client portal for status updates, document exchange and structured intake;
- document automation using matter/client data, templates and controlled generation;
- e-signature/document-approval workflows with immutable audit evidence;
- matter-centric search across documents, contracts, consultations and communications;
- legal knowledge retrieval with jurisdiction-aware sources, provenance and citations;
- workflow automation for recurring legal processes, deadlines and review queues;
- time/billing and payment workflows only where they fit the intended practice-management scope;
- role/permission models for firms, teams, clients and external collaborators.

## EXPLORE — professional-class legal AI

**Desired outcome:** augment high-value legal work while preserving reviewability, confidentiality and human approval.

Exploration areas:

- matter-aware agents for bounded research, first-pass review, drafting and checklist execution;
- secure document vault/review-table patterns for bulk analysis;
- institutional knowledge connectors with source-level provenance;
- contract intelligence against firm playbooks and approved clause libraries;
- regulatory-change monitoring with jurisdiction-specific sources;
- multi-model evaluation/routing where measurable quality or confidentiality requirements justify it;
- retrieval-augmented generation only after source quality, citation accuracy, access controls and failure modes are tested.

The roadmap does **not** include autonomous legal advice or unvalidated judicial-outcome prediction as portfolio claims.

## Market signals used for the vision

- [Clio Manage](https://www.clio.com/manage/) demonstrates the value of unified matter management, document automation, secure communication, client experience, billing and reporting.
- [Clio for Clients](https://www.clio.com/features/legal-client-portal-software/) demonstrates secure client-portal patterns for communication and document exchange.
- [Harvey](https://www.harvey.ai/) demonstrates the market direction toward agents, secure document workspaces, knowledge/research and contract intelligence.
- [Harvey for law firms](https://www.harvey.ai/solutions/law-firms) reinforces a human-review model for research, drafting and large-scale document review.

These are external benchmark signals, not evidence of equivalent current functionality in this project.

## Success signals

Useful outcome-oriented measures include:

- authorization/access-control test coverage across sensitive domains;
- percentage of AI outputs with verifiable source provenance where citations are required;
- evaluation performance against curated legal tasks before enabling a workflow for users;
- audit completeness for document access, changes and approvals;
- reduction in manual document preparation for validated workflows;
- client-response and intake-cycle improvements once a portal exists;
- zero real client/case data in public demos and development fixtures.

## Roadmap governance

No roadmap item is described in the public README as implemented until source and relevant verification exist. Public evidence must use synthetic or explicitly sanitized data and preserve legal-professional confidentiality boundaries.

`ROADMAP.md` communicates intent. `README.md` communicates current evidence.