# SAP ECC IS-U — Device Status Regularization

[Versión en español](./README.es.md)

> **Evidence type:** sanitized operational Device Management troubleshooting  
> **Transactions:** `IQ09` · `EG35` · `EG36` · `EG50` · `EG34` · `MIGO` contingency

This evidence documents a real regularization case where a device appeared simultaneously with incompatible warehouse/mounted statuses. The public version preserves the functional sequence while removing serial, installation, contract, supply point, location, customer, material and other corporate identifiers.

## Observed state

The case starts with a meter showing the combined status `ALMA-MONT`. The expected functional result is a consistent Device Management sequence ending with a single `MONT` state.

## Demonstrated sequence

```text
IQ09
 │
 ├─ validate device state and master data
 └─ review meter-reading history
        │
        ▼
EG35 — installation-based removal for billing
        │
        ▼
EG36 — complete technical device removal
        │
        ▼
validate intermediate state
        │
        ▼
EG50 — reverse the applicable removal operation
        │
        ▼
EG34 — install the device again
        │
        ▼
IQ09 — verify final MONT status
```

## Time-consistency rule

The operational date used for technical actions must be coherent with the actual reading history. The source procedure first validates the latest meter reading and then uses a later operation date for the removal/reinstallation sequence.

## Stage validations

- `IQ09`: verify device, initial status and reading history.
- `EG35`: validate installation, operation date, previous device and counter data.
- `EG36`: preserve the same operation date and verify recovered technical information.
- `EG50`: select the applicable reversible removal operation.
- `EG34`: reinstall the device and validate required tariff/technical parameters.

## Documented contingency

The source guide includes a contingency only when `EG36` cannot complete the regularization. In that scenario the logistics situation is reviewed through `MIGO` before resuming the technical flow. This is not presented as a universal recipe; the logistics action depends on the actual material/device state.

## Closure criteria

- reading history is coherent;
- operation date remains consistent across the sequence;
- `IQ09` shows a single `MONT` state;
- the process is no longer blocked by the double status.

## What this demonstrates

- SAP IS-U Device Management operations;
- device-status troubleshooting;
- reading-history analysis before intervention;
- removal/reversal/reinstallation sequence;
- temporal consistency reasoning;
- controlled functional reversal;
- MM logistics context when applicable.

## Confidentiality boundary

No real serials, equipment, installations, contracts, supply points, connection objects, materials, vendors, addresses or organizational codes are published.