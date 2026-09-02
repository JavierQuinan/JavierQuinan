# Visual Evidence Policy — SAP Integration Lab

[Versión en español](./VISUAL_EVIDENCE_POLICY.es.md)

Screenshots can strengthen evidence, but only when publication rights and confidentiality boundaries are clear.

## Allowed

Visuals may be published when they are created by the portfolio author or the author has permission to publish them, and all sensitive context has been removed.

Good examples:

- synthetic/demo SALV output
- ABAP Unit result screens from an authorized sandbox using non-sensitive objects
- `SE24`, `SE38`, `SE80` or `SE93` screens showing portfolio-created objects
- architecture diagrams created specifically for this repository
- sanitized excerpts of author-created operational guides when no customer/company data remains

## Required sanitization

Remove or replace:

- employer/customer/company names and logos
- usernames and email addresses
- SID, client/mandant and system aliases
- transport/request IDs
- internal URLs, hosts, RFC destinations and IP addresses
- real work orders, contracts, materials, vendors, installations, BP/customer IDs and meters
- monetary values or operational dates that can identify real cases
- proprietary `Z*` transaction names when they belong to an employer/customer

Use synthetic identifiers such as `4500000001`, `10000001`, `ORDER_DEMO_001` only when clearly labelled synthetic.

## Third-party material

Training-course screenshots, books, paid learning platforms, vendor manuals or other third-party visual material are **not republished** unless publication rights are clear.

They may be used privately as learning/reference material, while the public repository recreates the concept through original diagrams, original code, synthetic examples and source citations where appropriate.

## Folder convention

When visual evidence is added to an evidence pack:

```text
evidence/
└── screenshots/
    ├── 01-object-definition-sanitized.png
    ├── 02-test-result-sanitized.png
    └── README.md
```

`README.md` must explain:

- what the screenshot proves
- whether data is synthetic/sanitized
- date/environment class if relevant (`DEV`, `sandbox`, `local mock`) without exposing system identity
- what the screenshot does **not** prove

## Evidence rule

A screenshot is supporting evidence, not a substitute for source, tests or reproducible documentation.
