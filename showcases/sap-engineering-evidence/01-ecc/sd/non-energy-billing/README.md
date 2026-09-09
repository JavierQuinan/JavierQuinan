# SAP ECC / CRM-SD — Non-Energy Service Billing Workflow

[Versión en español](./README.es.md)

> **Evidence type:** sanitized functional billing guide  
> **Status:** `FUNCTIONAL_EVIDENCE_READY`  
> **Scope:** customer/commercial setup → sales-area context → non-energy service billing → output/tax submission

This evidence pack documents the end-to-end business preparation required before issuing a bill for non-energy services in a CRM/SD-oriented enterprise process.

The source material covers services such as technical inspections, laboratory work, network/design reviews and similar non-energy services. The public version removes company names, personal identifiers, organizational codes, customer IDs, fiscal document numbers and screenshots.

This is **source-derived enterprise process evidence**, not a claim that every SAP SD system uses the same screens or sequence.

## Process overview

```text
Identify customer / organization
          │
          ▼
Validate contact data + preferred channel
          │
          ▼
Create business partner if missing
          │
          ▼
Create/confirm commercial account/agreement context
          │
          ▼
Create/extend customer sales-area data
          │
          ▼
Validate sales organization / channel / division
          │
          ▼
Create non-energy billing document
          │
          ▼
Review amount / service / observations
          │
          ▼
Output processing
          │
          ▼
Configured fiscal submission / document completion
```

## 1. Customer identification

Locate the customer using the identification method available in the authorized CRM/customer interface.

The source process supports multiple identity types. Public documentation does not reproduce real identification numbers or customer records.

## 2. Contact-data validation

Before billing:

- confirm current contact information;
- update required fields when authorized;
- ensure an electronic-contact channel exists when the downstream notification/output process depends on it;
- confirm the preferred communication channel.

This is a key operational control because output delivery can depend on the preferred channel.

## 3. Business-partner creation when required

If the customer/business partner does not exist:

1. select the appropriate person/organization type;
2. enter the required identity data;
3. validate available official/master-data information;
4. complete mandatory contact/address fields;
5. save the business partner.

## 4. Commercial context

Create or confirm the commercial/account agreement required to link the customer to the billing flow.

The source guide explicitly records confirmation of the commercial agreement before the sales/billing preparation continues.

## 5. Sales-area extension

Create or extend the customer into the required sales-area context.

The source process includes:

- company/business context
- sales organization
- distribution channel
- division/sector
- supplying/fulfillment context where configured

The public guide deliberately omits the actual organizational codes.

## 6. Non-energy service billing

Once customer and sales-area prerequisites are valid, enter the configured non-energy billing process.

Maintain only the service/billing information required by the authorized process.

## 7. Output review

Before final output/submission:

1. open the generated billing output/message;
2. review the bill/document;
3. validate billed value;
4. validate the service/description;
5. validate relevant observations or explanatory text;
6. only then proceed with final output.

## 8. Fiscal/output completion

The source process finishes by triggering the configured output mechanism used to submit/complete the fiscal invoice workflow.

The portfolio does not claim a generic standard SAP-to-tax-authority mechanism; this step is explicitly **customer/process configuration dependent**.

## Control matrix

| Control | Why it matters |
|---|---|
| Customer identity validated | Prevents billing against the wrong party |
| Contact/preferred channel maintained | Supports reliable document notification |
| Commercial context confirmed | Ensures the customer is linked to the correct billing context |
| Sales-area data complete | Prevents downstream sales/billing setup failures |
| Amount/service reviewed before output | Reduces fiscal/document errors |
| Output completed through authorized process | Preserves traceability and configured compliance flow |

## Troubleshooting questions

When billing cannot proceed:

- Does the business partner exist and contain the required master data?
- Is the contact/preferred channel complete?
- Is the commercial/account context confirmed?
- Is the customer extended to the necessary sales area?
- Are sales organization/channel/division values consistent?
- Does the billing item/service exist in the configured process?
- Was the output generated and reviewed?
- Did the configured fiscal/output step complete successfully?

## Confidentiality boundary

Removed from the public artifact:

- company name
- customer names and identity documents
- addresses and contact information
- commercial-agreement IDs
- business-partner/customer numbers
- company/sales-organization/channel/division codes
- invoice numbers and amounts
- tax-authority identifiers/endpoints
- screenshots

## What this proves

- CRM/SD customer preparation
- business-partner lifecycle awareness
- commercial agreement/account context
- sales-area extension concepts
- non-energy service billing workflow
- output review discipline
- configured fiscal-integration awareness
- end-to-end troubleshooting checkpoints
