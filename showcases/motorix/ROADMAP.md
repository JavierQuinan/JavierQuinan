# MOTORIX / TecnoAuto — Product Vision Roadmap

> **Document type:** future product direction, not implementation evidence  
> **Current verified baseline:** [MOTORIX engineering case study](./README.md)  
> **Planning model:** `NEXT / LATER / EXPLORE` — no delivery dates or commercial commitments

The public case study documents current architecture and evidence. This roadmap describes potential product evolution for automotive workshops and related automotive-service businesses.

## Product vision

Evolve MOTORIX into a connected automotive workshop operating system that links customer intake, vehicle history, digital inspection, estimates, approvals, work execution, parts, invoicing, payments and multi-location analytics without weakening tenant/RBAC controls.

## NEXT — strengthen the end-to-end workshop workflow

**Desired outcome:** a workshop can move a vehicle from intake to delivery with traceable decisions, clear technician progress and minimal duplicate entry.

Strategic initiatives:

- keep tenant/branch/RBAC regression testing as a release gate after the isolation defects already found and corrected during development;
- reconcile overlapping progress/activity models so one operational source of truth drives work-order completion;
- complete catalog-driven inspection/intake flows without breaking historical work-order records;
- expand digital vehicle inspection patterns with structured findings, photos/video and technician evidence;
- support digital customer authorization for estimates/changes with immutable timestamps and audit trail;
- improve technician-first mobile/PWA workflows for assigned jobs, findings, parts and completion evidence;
- strengthen customer communications around estimate approval, job status and vehicle readiness;
- maintain server-side calculation/validation for totals, progress and tenant ownership rather than trusting client state.

## LATER — connect customer, parts and payment workflows

**Desired outcome:** workshops can reduce administrative handoffs and manage the complete service lifecycle in one system.

Candidate initiatives:

- online appointment/request intake tied to customer and vehicle history;
- customer portal for estimates, approvals, invoices, payments and service history;
- parts purchasing/vendor workflows with purchase orders, receiving and margin visibility;
- deeper inventory controls for multi-location stock, reservations, transfers and replenishment;
- integrated payments and payment-link/text-to-pay patterns where provider contracts and reconciliation are available;
- declined-service follow-up and maintenance reminders based on actual service history;
- multi-shop dashboards for throughput, technician utilization, labor/parts margin and customer retention;
- specialized workflows for tires, lubricators, detailing/car-wash and related automotive verticals where domain demand is validated.

## EXPLORE — intelligent connected workshop

**Desired outcome:** use operational history to assist decisions without turning probabilistic automation into unsupported promises.

Exploration areas:

- AI-assisted service-advisor drafts based on technician findings and approved catalog data;
- maintenance recommendations derived from verified service history rather than generic model output;
- anomaly/fraud signals around duplicated billing, unusual discounts or inventory movements;
- telematics/OEM integrations where APIs and customer consent are available;
- parts/labor marketplace integrations and financing referrals through external regulated partners;
- predictive maintenance only when sufficient vehicle/history data and measurable validation exist.

## Market signals used for the vision

- [Tekmetric](https://www.tekmetric.com/) demonstrates integrated digital vehicle inspections, estimates, inventory, payments, online booking, reminders, communications, reporting and multi-shop management.
- [Shopmonkey Estimates](https://www.shopmonkey.io/product/estimates) demonstrates photo/video inspections, digital approvals/e-signatures, audit trails and profitability-aware estimating.
- [Shopmonkey](https://www.shopmonkey.io/) demonstrates the value of connecting estimates, invoices, payments, accounting and multi-location operations.

These references validate product patterns in the category. They are not evidence that MOTORIX currently implements every referenced capability.

## Success signals

Outcome-oriented measures should include:

- estimate-to-authorization cycle time;
- percentage of work orders with complete inspection/progress evidence;
- technician throughput and rework rate;
- parts/labor gross-margin visibility;
- repeat-service/customer-retention rate;
- time from job completion to payment;
- tenant/branch authorization regression results;
- reduction in duplicate manual entry across intake, work order and invoicing.

## Roadmap governance

Roadmap items remain future direction until they are represented by source and relevant test/operational evidence. Security and tenant isolation are not treated as one-time milestones; they remain continuous product controls.

`ROADMAP.md` communicates intent. `README.md` communicates current evidence.