# abapGit Workflow Guide

[Versión en español](./ABAPGIT_WORKFLOW_GUIDE.es.md)

## Status

`TRAINING_DERIVED_GUIDE` — independently written from concepts covered in third-party training documented by a course-completion credential. No hands-on abapGit evidence is claimed in this track yet.

## Scope

Practical workflow for placing ABAP repository objects under Git version control with abapGit. This is a process guide, not a runtime lab.

## Core concepts

- A repository links ABAP package content with a Git repository.
- Online repositories communicate with a remote Git URL; offline repositories support ZIP-based exchange without a live remote.
- ABAP objects are serialized into repository files that can be reviewed as Git changes.
- Staging lets the developer choose which changed objects are included before committing/pushing.
- abapGit complements, but does not automatically replace, governed transport/change-management processes.

## Procedure

1. Prepare a development package dedicated to the repository.
2. Open abapGit and create/link an online repository using the intended remote URL and branch.
3. Pull to install/synchronize repository content into the ABAP package.
4. Develop and activate ABAP objects in ADT.
5. Review changed objects in the abapGit staging view.
6. Stage only the intended changes, write a clear commit message and push them to the remote.
7. Use normal Git branches and pull requests for collaborative review.
8. Before switching branch/remote, verify the target URL and branch to avoid publishing to the wrong repository.

## Verification

Not executed in this historical lab track. No own abapGit staging/push evidence is published yet.

## Common failure modes

- Wrong remote URL or branch selected before pull/push.
- Linking a repository to a package that already contains unrelated objects.
- Treating generated serialization metadata as hand-editable application source during conflict resolution.
- Assuming Git history replaces required SAP transport governance.

## Security

Git credentials, tokens or SSH material must remain outside source control. Repository permissions should follow least privilege, especially where ABAP code contains enterprise logic.

## Clean Core

abapGit is version-control tooling. Clean Core depends on the objects and APIs being used, not on the fact that the code is stored in Git.

## Provenance

Concept studied during third-party training. This guide was independently written for portfolio use and does not reproduce course screenshots, exercises or proprietary prose.

## Evidence status

`OWNER_CONFIRMED_HANDS_ON_EXECUTION` — see the [Course 3 Training Practices](../training-practices/README.md) for the normalized `_fq` source and exact provenance.

## Reference

- abapGit documentation: https://docs.abapgit.org/
