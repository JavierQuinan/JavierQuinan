# SAP ECC MM — MM01 Material Extension Visual Evidence

[Versión en español](./README.es.md)

> **Evidence type:** sanitized SAP GUI screenshots + reproducible operational guide  
> **Source:** user-authored operational material supplied for this portfolio

This evidence set documents the standard operational pattern for extending an existing material to additional organizational levels with `MM01`.

The screenshots were sanitized before publication. Material numbers, plant/storage-location values, descriptions, usernames and enterprise-specific identifiers are removed or replaced.

## 1. Access / existing-material selection

![Sanitized MM01 access](./mm01-01-access-sanitized.jpg)

Demonstrates:

- access to the material creation/extension flow;
- use of an existing material as the object being extended;
- material-type/industry context where applicable;
- separation between material identity and organizational extension.

## 2. View selection

![MM01 view selection](./mm01-02-view-selection.jpg)

Demonstrates:

- selection of the material-master views required for the organizational extension;
- understanding that selected views determine which data segments are maintained.

## 3. Organizational levels

![Sanitized organizational levels](./mm01-03-org-levels-sanitized.jpg)

Demonstrates:

- plant selection;
- storage-location context;
- organizational-level assignment before maintaining the selected views.

## 4. Verification

![Sanitized material extension verification](./mm01-04-verification-sanitized.jpg)

Demonstrates:

- post-process verification that the material is available in the intended organizational context;
- validation as a separate control rather than assuming that a save operation proves the extension.

## Reproducible operational guide

```text
Confirm the material already exists
        ↓
Check whether the required organizational extension exists
        ↓
MM01
        ↓
Enter/reference the existing material
        ↓
Select the required material-master views
        ↓
Enter Plant + Storage Location
        ↓
Maintain the required fields for those views
        ↓
Save
        ↓
Verify the material at the intended organizational level
```

### Practical controls

- Do not create a duplicate material when the business requirement is an organizational extension.
- Confirm the target plant/storage location before saving.
- Select only the views required by the process and authorization scope.
- Validate the result after saving.
- Do not expose productive identifiers when documenting the procedure publicly.

## Official SAP references

The procedure is independently supported by SAP Help documentation:

- [Extending a Material Master Record — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/f7fddfe4caca43dd967ac4c9ce6a70e4/e614c453f57eb44ce10000000a174cb4.html)
- [Storage-Location-Specific Data — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/f7fddfe4caca43dd967ac4c9ce6a70e4/cc52bf53f106b44ce10000000a174cb4.html)
- [Create Material Master Data — Storage Location Data (MM01) — SAP Help](https://help.sap.com/docs/s4hana-best-practices/create-product-master-of-type-spare-parts-2j7/create-material-master-data-storage-location-data?version=2408)

SAP Help explicitly documents the pattern `MM01 → Select Views → Organizational Levels → Plant/Storage Location` and the case where an existing material is extended rather than recreated.

## Evidence boundary

These images demonstrate SAP GUI interaction and a sanitized operational workflow. They do not disclose a company environment, productive master-data values or proprietary source code.
