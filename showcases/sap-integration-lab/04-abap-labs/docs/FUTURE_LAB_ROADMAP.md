# Future Lab Roadmap

[Versión en español](./FUTURE_LAB_ROADMAP.es.md)

> Proposal only. Nothing in this roadmap is claimed as implemented until source and runtime evidence exist.

## P0 — Make the 10 historical labs reproducible

1. Re-execute all 10 public lab copies in a current SAP environment.
2. Replace the private `ZEMP_LOGALI` dependency with an original synthetic `_fq` data model or adapter for the affected labs.
3. Recreate or remove the `TEXT-001` dependency in lab-04.
4. Add sanitized current-runtime evidence only after each class activates and runs successfully.

## P1 — Build original modern ABAP Cloud labs

5. ABAP Unit on a pure-logic existing class.
6. CDS fundamentals over synthetic/released demo data.
7. Minimal RAP business object.
8. Service definition + binding for the RAP object.
9. OData service exposure and verification.

## P2 — Convert training-only tooling into hands-on evidence

10. Run ATC against the lab package and record actual findings.
11. Create a real abapGit package/repository workflow.
12. Run ABAP Cleaner on selected labs and review the resulting diff.
13. Build an authorization scenario appropriate to the chosen ABAP environment.
14. Add a safe API-consumption lab using a released HTTP client.

## P3 — Optional depth

15. Debugging walkthrough.
16. Runtime/performance analysis of the advanced internal-table lab.
17. Transport-management evidence where the environment supports it.
18. Advanced RAP scenario after the P1 slice is complete.

## Evidence rule

Every future item must be promoted through:

`PROPOSED → SOURCE_CREATED → CURRENT_RUNTIME_VERIFIED → PUBLIC_EVIDENCE`

No training-only topic is promoted directly to `VERIFIED`.
