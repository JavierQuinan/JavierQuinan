# SAP ECC MM — Purchasing Analytics

[Versión en español](./README.es.md)

> **Status:** `DESIGN_READY / SOURCE_NOT_YET_IMPLEMENTED`

Next ECC MM engineering milestone: a read-only requisition/order visibility lab that keeps classic ECC purchasing evidence separate from S/4HANA Clean Core APIs.

Planned standard model:

```text
EBAN — Purchase Requisition
   ↓
EKKO / EKPO — Purchase Order header/items
   ↓
EKET — Schedule-line / delivery context
```

Planned artifact:

`ZMM_PURCH_ANALYTICS`

The first version will focus on transparent read-only visibility such as PR/PO references, document dates, purchasing context, item counts and schedule-line context. It will not create/change purchasing documents, release strategies or service-entry data.

Detailed source design begins after the current WM status-audit PR is merged.
