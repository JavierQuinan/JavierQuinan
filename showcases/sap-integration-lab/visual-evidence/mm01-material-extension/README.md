# SAP ECC MM — MM01 Material Extension Visual Evidence

[Versión en español](./README.es.md)

> **Evidence type:** sanitized SAP GUI screenshots + operational explanation

This evidence set documents the standard operational idea of extending an existing material to additional organizational levels using `MM01`.

The screenshots originate from an operational guide supplied for this portfolio. Material numbers, center/storage values, descriptions and usernames are replaced or removed.

## 1. Access / material selection

![Sanitized MM01 access](./mm01-01-access-sanitized.png)

What it demonstrates:

- access to material creation/extension flow;
- existing-material reference;
- branch/material-type context;
- separation between material identity and organizational extension.

## 2. View selection

![MM01 view selection](./mm01-02-view-selection.png)

What it demonstrates:

- selection of the material-master views required for the extension;
- awareness that views define which data segments are maintained for the new organizational context.

## 3. Organizational levels

![Sanitized organizational levels](./mm01-03-org-levels-sanitized.png)

What it demonstrates:

- center/plant selection;
- storage-location context;
- organizational-level assignment before maintaining the selected views.

## 4. Verification

![Sanitized material index verification](./mm01-04-verification-sanitized.png)

What it demonstrates:

- post-process verification that the material is visible in the intended organizational context;
- validation as a separate step instead of assuming the extension succeeded merely because data was saved.

## Operational guide

```text
Confirm material already exists
        ↓
Check whether organizational extension already exists
        ↓
MM01
        ↓
Select required views
        ↓
Enter plant/storage organizational levels
        ↓
Maintain required fields
        ↓
Save
        ↓
Verify material extension
```

## Evidence boundary

These images demonstrate SAP GUI interaction and the operational extension workflow. They do not publish enterprise master-data values or claim access to a specific company's SAP environment.
