# SAP ECC IS-U / WM — Work-Order Number Range Governance

[Versión en español](./README.es.md)

> **Evidence type:** sanitized operational configuration + preventive monitoring  
> **Standard object:** `AUFTRAG`  
> **Transactions / reports:** `SNRO` / `SNUM` · `SE38` · `RSNUMHOT`

This evidence consolidates two complementary operational activities: monitoring work-order number-range consumption and controlled maintenance of the `AUFTRAG` number-range object when exhaustion risk is detected.

The public version preserves the technical workflow while removing company codes, internal groups, real intervals, clients/mandants and operational values that could reconstruct corporate configuration.

## Demonstrated workflow

```text
RSNUMHOT
   │
   ▼
identify critical intervals
   │
   ▼
filter object AUFTRAG
   │
   ▼
record interval / group / utilization
   │
   ▼
SNRO / SNUM
   │
   ▼
interval maintenance
   │
   ▼
validate no overlap
   │
   ▼
save + document change
   │
   ▼
revalidate capacity with RSNUMHOT
```

## Preventive monitoring with `RSNUMHOT`

The standard report is used to identify intervals approaching exhaustion. The documented procedure runs `RSNUMHOT` from `SE38`, applies a utilization threshold and filters results by `AUFTRAG`.

Relevant controls:

- prioritize intervals with the highest utilization;
- do not wait for total exhaustion when an internal preventive threshold exists;
- record interval, group, upper limit and current number before any change;
- confirm environment and client before maintenance.

## Maintenance with `SNRO` / `SNUM`

For object `AUFTRAG`, the evidence shows interval maintenance, group review and controlled extension of available numeric space.

Functional safety rules:

1. verify that the new numeric segment is free;
2. never reuse consumed numbers;
3. do not manually change the current number;
4. do not create overlapping intervals;
5. preserve compatible length and format;
6. assign the interval to the correct functional group;
7. retain before/after change traceability.

## Post-change validation

After maintenance:

- run `RSNUMHOT` again;
- confirm that capacity is available;
- re-check group assignment;
- perform controlled creation of an order of the affected type when required by the change procedure.

## Transport note

Number ranges require environment-specific validation. The source procedure explicitly notes that maintenance may not behave like ordinary transportable customizing, so the applicable landscape procedure must be confirmed for each system.

## What this demonstrates

- SAP number-range configuration;
- `AUFTRAG` object administration;
- preventive capacity monitoring;
- operational exhaustion-risk analysis;
- overlap controls;
- change traceability;
- post-configuration verification.

## Confidentiality boundary

No real corporate ranges, internal groups, company codes, clients, transports or operational identifiers are published. Public evidence retains only standard SAP logic and reproducible procedure.