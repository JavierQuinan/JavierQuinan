# SAP Public Sanitization Status

[Versión en español](./SANITIZATION_STATUS.es.md)

**Status: COMPLETE.**

This record describes the public repository state after sanitization. It does not add technical capability claims.

## Included evidence

- Curso 1: 16/16 curriculum units accounted for; 10 hands-on labs with 10 preserved `.abap` sources and 20 owned, sanitized Eclipse ADT screenshots.
- Curso 2: completed hands-on ABAP Dictionary training documented without fabricated source artifacts.
- Curso 3: four owner-confirmed hands-on practices with public normalized `_fq` source.
- SAP enterprise evidence: sanitized MM, IS-U/Work Management, CRM/SD and technical-diagnostics material.
- SAP training credentials: 9 recruiter-facing credential records (S/4HANA specialization certificate + diploma, 3 featured 2026 Logali ABAP Cloud certificates and 5 additional Logali certificates/webinar), each linked to one canonical public certificate PDF under `docs/credentials/evidence/sap/`.
- Odoo credential: indexed separately from SAP and linked to the issuer's own "Certificate of Achievement" PDF under `docs/credentials/evidence/odoo/`.
- Other technical credential: the Angular course certificate is linked under `docs/credentials/evidence/other/`.
- Every published credential file was verified individually (SHA-256 inventory, content review) against the source `certificados/` folder; exact-duplicate files and superseded/earlier repeat completions were excluded so each credential maps to exactly one canonical public file.

## Public certificate policy

Certificate evidence intentionally selected for the portfolio is public. Prefer one canonical original PDF or image per credential and remove duplicate copies. Keep issuer branding, holder name, certificate title, date, duration and public verification data intact. Redact only genuinely sensitive information that is unrelated to public credential verification.

## Excluded from the public repository

- raw course PDFs and Word submissions that are teaching material rather than the account owner's certificate evidence;
- duplicate certificate copies;
- instructor-branded course pages/screenshots not owned by the account holder;
- private BTP account identifiers, tenant hostnames and SAP technical usernames;
- enterprise customer/employer identifiers, real tickets, material/order/account IDs and private URLs;
- credentials, tokens, service keys and secrets;
- unexecuted reproducibility drafts and re-execution planning material.

## Integrity boundary

Public evidence describes only what is already supported by source, completed training, documented historical execution, owned sanitized visuals, public certificate evidence, observed CI/local results, or sanitized enterprise experience. Capabilities outside that evidence are omitted or stated only as claim boundaries.
