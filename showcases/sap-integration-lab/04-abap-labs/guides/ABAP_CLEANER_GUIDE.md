# ABAP Cleaner Guide

[Versión en español](./ABAP_CLEANER_GUIDE.es.md)

## Status

`TRAINING_DERIVED_GUIDE` — independently written from completed third-party training. No actual ABAP Cleaner run is claimed in this track.

## Scope

How to use ABAP Cleaner as a source-cleanup/refactoring aid while keeping behavioral verification separate.

## Workflow

1. Choose or define a rule profile.
2. Run the tool against a small, reviewable scope.
3. Inspect the generated diff instead of accepting a bulk rewrite blindly.
4. Apply only the intended transformations.
5. Activate the affected ABAP objects.
6. Re-run relevant tests and ATC checks.

## Illustration

A simple manual illustration of a style transformation:

```abap
" Before
DATA mv_purchase_date TYPE d.
mv_purchase_date = cl_abap_context_info=>get_system_date( ).

" After
DATA(mv_purchase_date) = cl_abap_context_info=>get_system_date( ).
```

This example was **not** produced by running ABAP Cleaner; it only illustrates the kind of source cleanup a configured rule can perform.

## Verification

No actual ABAP Cleaner execution evidence exists in this track.

## Common failure modes

- Applying a large profile to an entire codebase before reviewing it on a small scope.
- Mixing formatting-only changes with functional changes in the same review.
- Assuming cleaner code automatically means Clean Core compliance.

## Security and Clean Core

ABAP Cleaner primarily changes source form/style. Security and released-API compliance still require normal review, tests and appropriate ATC checks.

## Provenance

Concept studied during third-party training. The guide and illustration were independently written from this portfolio's own source examples; no course material is reproduced.

## Evidence status

`TRAINING_ONLY_IN_THIS_TRACK`. See the [Future Lab Roadmap](../docs/FUTURE_LAB_ROADMAP.md).
