# SAP ECC MM — MM01 Material Extension Visual Evidence

[Versión en español](./README.es.md)

> **Evidence type:** supplied operational guide + supplied visual evidence  
> **Transaction:** `MM01`

This set documents extension of an existing material to the required plant/storage-location context using `MM01`, based on the supplied operational guide.

## Evidence guide

- [Spanish operational guide](./GUIDE.es.md)

## Visual evidence

![MM01 post-extension result supplied in the guide](./evidence/figure-09.webp)

The image corresponds to the final verification contained in the supplied guide.

## Documented operational flow

```text
Confirm the material already exists
        ↓
Check whether the required extension already exists
        ↓
MM01
        ↓
Select required views
        ↓
Enter Plant + Storage Location
        ↓
Maintain required fields
        ↓
Save
        ↓
Verify the material at the intended organizational level
```

## Official SAP references

- [Extending a Material Master Record — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/f7fddfe4caca43dd967ac4c9ce6a70e4/e614c453f57eb44ce10000000a174cb4.html)
- [Storage-Location-Specific Data — SAP Help](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/f7fddfe4caca43dd967ac4c9ce6a70e4/cc52bf53f106b44ce10000000a174cb4.html)

## What this proves

- practical `MM01` experience;
- organizational extension of an existing material;
- organizational-level selection;
- post-change validation;
- operational documentation backed by supplied visual evidence.
