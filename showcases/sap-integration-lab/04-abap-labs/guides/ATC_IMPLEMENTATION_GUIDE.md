# ATC Implementation Guide

[Versión en español](./ATC_IMPLEMENTATION_GUIDE.es.md)

## Status

`TRAINING_DERIVED_GUIDE` — independently written from completed third-party training. No ATC result is claimed in this track yet.

## Scope

How to use ABAP Test Cockpit (ATC) as a static-analysis and governance gate. Exact checks depend on the target ABAP version, extensibility model and chosen check variant.

## Core concepts

- **Check variant:** selected collection of checks.
- **Finding:** issue produced by a check against a repository object.
- **Exemption:** reviewed acceptance of a specific finding when the process permits it.
- **Scope:** object, package, transport-related scope or central/custom-code-analysis scope depending on landscape.
- **Released API checks:** ATC/Code Inspector checks can be used to detect use of APIs or repository objects that are not released for the selected language/extensibility context.

## Procedure

1. Identify the target environment and the purpose of the run: syntax/quality, security, performance, cloud readiness, released-API usage, etc.
2. Select an appropriate check variant rather than assuming one variant fits every extensibility model.
3. Run ATC against the intended object/package scope.
4. Review each finding in ADT and fix the underlying source where appropriate.
5. Use exemptions only when justified and governed.
6. Re-run ATC after changes and record the actual result before claiming a clean gate.

## Verification

Not executed for these 10 labs yet. No result count or screenshot is published.

## Clean Core

ATC is one of SAP's standard mechanisms for checking custom code against rules such as released-API usage. The exact Clean Core conclusion depends on the selected checks and the extensibility model; a generic "ATC green" statement is not enough without naming the variant/context.

## Common failure modes

- Running an irrelevant or overly weak variant and interpreting a clean result as broad compliance.
- Publishing a stale result after code changes.
- Treating every finding as exemptible.
- Conflating style findings with released-API/upgrade-readiness findings.

## Provenance

Concept studied during third-party training. This guide was independently written for portfolio use.

## Evidence status

`TRAINING_ONLY_IN_THIS_TRACK`. See the [Future Lab Roadmap](../docs/FUTURE_LAB_ROADMAP.md).

## Official references

- SAP Help — Released APIs and ATC checks: https://help.sap.com/docs/SAP_NETWEAVER_AS_ABAP_751_IP/c238d694b825421f940829321ffa326a/c479660d07374c15a1a5fe83fdbb1337.html
