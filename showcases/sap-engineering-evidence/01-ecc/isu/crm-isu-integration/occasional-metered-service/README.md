# SAP CRM ↔ IS-U/WM — Occasional Metered Service End-to-End Flow

[Versión en español](./README.es.md)

> **Evidence type:** sanitized end-to-end functional process guide  
> **Status:** `FUNCTIONAL_EVIDENCE_READY`  
> **Scope:** CRM customer/contract setup → WM order completion → CRM contract completion

This evidence documents an enterprise process for creating a temporary/occasional metered service and completing the technical and contractual lifecycle across CRM and IS-U/Work Management.

The original guide contains real company, customer, contract, service-point and work-order data. The public version keeps only the reusable process architecture.

## End-to-end flow

```text
CRM — identify/create business partner
          │
          ▼
Create virtual/reference service context
          │
          ▼
Create + confirm commercial agreement
          │
          ▼
Create new contract / choose configured product
          │
          ▼
Maintain service configuration
          │
          ▼
Create work order for meter installation
          │
          ▼
Save contract/process at intermediate state
          │
          ▼
IS-U / IW32 — execute technical work
          │
          ├── closure/group context
          ├── verified tariff/context
          ├── connection data
          ├── installed load
          ├── meter action
          ├── responsible-party data
          └── final processing status
          │
          ▼
Technical completion
          │
          ▼
Return to CRM
          │
          ▼
Complete contract process
          │
          ▼
Create/finalize follow-on work-order step when configured
          │
          ▼
Install/confirm meter + close remaining work order
```

## CRM phase — customer and contract preparation

### 1. Identify or create the business partner

Search the customer using the authorized CRM criteria. If no business partner exists, create it through the standard customer onboarding path.

### 2. Create the temporary/virtual service context

The source process derives a temporary/virtual service identifier from an approved reference context. Public evidence does not reproduce the custom implementation or any real identifier.

### 3. Create and confirm the commercial agreement

Create the commercial/account agreement required by the service process and explicitly confirm/save it before contract creation.

### 4. Create the service contract

Open contract management, create a new contract, select the configured service product and maintain its required business parameters such as contracted load, duration/use period and configured commercial terms.

### 5. Create the technical work order

Trigger the work-order creation required for meter installation/technical execution and record the operational instruction text through the authorized CRM process.

The source workflow intentionally leaves the contract/process in an intermediate state until the technical activity is completed.

## IS-U / Work Management phase

Open the generated work order through the authorized maintenance/work-order transaction, such as `IW32` in the source process.

Maintain/validate the technical execution data required by the business flow. The source demonstrates these categories:

- closure/group context
- applied vs. verified tariff/service context
- connection/service-drop characteristics
- installed load
- equipment/meter action
- responsible-person/service data
- final operational status

The public guide does not publish customer-specific closure codes, product codes, group codes or equipment values.

### Technical completion

Once required data is complete, save the final processing state and execute technical completion through the normal order lifecycle.

## Return to CRM

After technical completion:

1. locate the commercial agreement/contract;
2. reopen contract management;
3. execute the configured contract-completion process;
4. complete any follow-on work-order generation required by that business process;
5. validate payment/account/summary information;
6. complete the remaining meter-installation/work-order process through the approved operational flow.

## Integration checkpoints

| Checkpoint | Expected consistency |
|---|---|
| Business partner | Customer context exists before contract setup |
| Service identifier | Temporary/reference context resolves consistently |
| Commercial agreement | Confirmed before contract activation |
| Contract configuration | Product and service parameters are coherent |
| Work order | Generated from the CRM process, not manually disconnected from it |
| Meter/equipment data | Matches field/technical execution |
| Work-order status | Reaches the expected final/technical-completion state |
| CRM contract | Completed only after required technical dependency is satisfied |

## Troubleshooting model

When the process stalls, identify the boundary where the expected state transition stopped:

```text
Customer
→ agreement
→ contract
→ work order
→ technical data
→ final status
→ technical completion
→ CRM completion
```

Avoid repairing a downstream object without checking the upstream business state that generated it.

## Public boundary

Removed:

- company/implementation names
- personal/customer IDs
- addresses
- virtual service/CUEN identifiers
- commercial-agreement and contract numbers
- work-order numbers
- tariff/product codes
- closure/group codes
- meter values and responsible-party data
- screenshots

## What this proves

- CRM ↔ IS-U/WM end-to-end process reasoning
- customer/commercial agreement/contract lifecycle
- work-order generation dependency
- meter-installation execution data awareness
- final-status and technical-completion discipline
- return-to-CRM completion sequencing
- cross-system troubleshooting checkpoints
