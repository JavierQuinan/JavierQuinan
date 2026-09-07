# SAP CRM ↔ IS-U — Contract-End Recovery for Incomplete Work-Order Generation

[Versión en español](./README.es.md)

> **Evidence type:** sanitized operational troubleshooting case  
> **Status:** `FUNCTIONAL_EVIDENCE_READY`  
> **Scope:** CRM contract process + IS-U work-order generation recovery

This evidence documents a repeatable recovery pattern for cases where a contract-end process in CRM does not complete the expected downstream disconnection work-order generation in IS-U/Work Management.

The source case shows a practical recovery approach: identify the utility/customer technical context from IS-U, reopen/cancel the incomplete contract-end state in CRM, verify that the contract becomes active again, and then repeat the intended contract-end process so the downstream work order can be generated cleanly.

## Sanitized problem statement

```text
CRM contract-end process initiated
              │
              ▼
Expected disconnection work order
              │
              ✕ incomplete / not generated correctly
              │
              ▼
Contract/process state requires recovery
```

## Recovery flow

```text
1. Identify contract/service context in IS-U
              │
              ▼
2. Resolve the corresponding CRM contract context
              │
              ▼
3. Open contract maintenance in CRM
              │
              ▼
4. Cancel/reverse the incomplete contract-end step
              │
              ▼
5. Confirm the contract is active again
              │
              ▼
6. Re-run the intended contract-end process
              │
              ▼
7. Validate downstream work-order generation/completion
```

## Step-by-step

### 1. Identify the utility context

Use an authorized IS-U contract/installation display path to resolve the customer/service context required to reach the correct CRM contract. The original guide uses `ES32` as the starting point for this lookup.

Do not publish real agreement, account, installation, notification-point or work-order identifiers.

### 2. Link to the CRM contract

Using the resolved utility context, navigate to the corresponding CRM contract management area.

### 3. Open contract modification

Select the affected contract and enter the contract-processing workflow used to manage contract termination/end-date operations.

### 4. Cancel the incomplete contract-end state

Choose the configured process that cancels/reverses the prior contract-end step. The public guide deliberately avoids publishing customer-specific process IDs or custom implementation details.

### 5. Validate restoration

Confirm that the contract is again in the expected active state and that no incomplete end-process status remains.

### 6. Execute the end process again

Run the intended contract-end process through the normal CRM flow rather than editing IS-U/WM technical data directly.

### 7. Validate the result

Observed professional pattern:

- contract restored to the expected active state before retry;
- contract-end process repeated through the normal CRM flow;
- downstream disconnection/work-order generation validated through the normal process path;
- no direct table manipulation used as the recovery method.

## Troubleshooting interpretation

This pattern is useful when the business object is left in an intermediate or inconsistent process state after an interrupted/incomplete integration flow.

The principle is:

> restore the business process to a valid functional state, then re-run the official process, instead of forcing the downstream technical object.

## Security and data boundary

The source material contained real order/account identifiers. They are removed.

Do not publish:

- work-order numbers;
- contract/agreement IDs;
- account or notification-point IDs;
- customer names;
- internal CRM URLs;
- internal role names;
- custom process IDs when they reveal proprietary configuration;
- screenshots with enterprise data.

## What this proves

- CRM ↔ IS-U process troubleshooting;
- contract lifecycle recovery;
- work-order generation dependencies;
- process-state reasoning;
- preference for functional recovery over direct technical manipulation;
- validation of upstream and downstream states.
