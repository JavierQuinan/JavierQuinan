# SAP Capability Profile

[Versión en español](./README.es.md)

This profile separates recruiter-facing claims by evidence class instead of treating every guide or course as hands-on experience.

## Positioning

**Enterprise / functional:** SAP ECC MM · SAP IS-U / Work Management · CRM/SD  
**Technical / diagnostics:** ABAP Objects · SALV · debugging · status/data analysis  
**Historical hands-on ABAP:** ABAP Core · ABAP Objects · ABAP Cloud classrun · internal tables · field symbols · Open SQL · exception handling  
**Owner-confirmed training practices:** abapGit · ATC · ABAP Cleaner · Authorizations (Course 3), normalized to portfolio `_fq` source  
**Modern SAP architecture/study:** Clean Core · RAP architecture · Migration Cockpit  
**Client-side engineering example:** S/4HANA procurement/OData client with tests, explicitly non-live

## Evidence classes

1. `ENTERPRISE_VERIFIED` — sanitized operational knowledge from real SAP work.
2. `HISTORICAL_EXECUTION_VERIFIED` — personal labs with documented historical execution evidence.
3. `OWNER_CONFIRMED_HANDS_ON_EXECUTION` — training practice the account owner confirms having personally typed, created and run during structured training.
4. `PUBLIC_NORMALIZED_SOURCE` — reviewable practice source published under the portfolio's own `_fq` naming.
5. `PUBLIC_SOURCE_EVIDENCE` — reviewable source in this repository.
6. `EXECUTABLE_NON_LIVE_EXAMPLE` — executable/tested example without a live SAP connectivity claim.
7. `DOCUMENTATION_GROUNDED` — architecture/study grounded in documentation.
8. `TRAINING_ONLY` — completed training with no saved source artifact and no runtime claim.

## Evidence indexes

- [SAP Capability Matrix](./SAP_CAPABILITY_MATRIX.md)
- [Training & Credentials](./TRAINING_AND_CREDENTIALS.md)
- [SAP Engineering Evidence Lab](../README.md)
- [Historical ABAP Cloud Labs](../04-abap-labs/README.md)
- [Course 3 Training Practices](../04-abap-labs/training-practices/README.md)
- [Visual Evidence Index](../visual-evidence/README.md)
- [Official SAP Reference Index](../OFFICIAL_SAP_REFERENCES.md)

## Claim boundary

Training is not presented as SAP-issued certification or as enterprise/runtime evidence. RAP architecture and integration concepts are documentation-grounded. The procurement client is an executable non-live example. Historical ABAP labs retain documented historical execution evidence. Course 3 practices are owner-confirmed hands-on training with public normalized `_fq` source.
