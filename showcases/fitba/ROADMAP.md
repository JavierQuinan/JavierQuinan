# FITBA / GYMORA — Product Vision Roadmap

> **Document type:** future product direction, not implementation evidence  
> **Current verified baseline:** [FITBA / GYMORA engineering case study](./README.md)  
> **Planning model:** `NEXT / LATER / EXPLORE` — no delivery dates or store-release promises

The public README documents the current web/mobile evidence. This roadmap communicates product direction for gyms, studios, coaches and other training businesses without presenting planned capabilities as already implemented.

## Product vision

Evolve FITBA/GYMORA into a multi-tenant sports and fitness operating platform that can serve both organizations and independent professionals while keeping member engagement, training, nutrition, scheduling, payments and privacy in one governed product model.

## NEXT — reliable operations for organizations and coaches

**Desired outcome:** a gym, studio or independent coach can manage the core member lifecycle without maintaining separate tools for training, scheduling and engagement.

Strategic initiatives:

- keep cross-organization isolation, RLS and admin↔mobile synchronization as release gates;
- strengthen production/release discipline for admin and mobile surfaces, including real-device verification and critical-flow automation;
- formalize tenant/business profiles for gyms, studios, personal trainers, coaches and discipline-specific operators without duplicating the platform core;
- consolidate scheduling, classes, appointments, reservations, capacity and waitlist rules;
- strengthen membership/subscription lifecycle, payment state and entitlement handling;
- improve staff/trainer assignment and visibility around classes, routines and client follow-up;
- maintain versioned consent/legal state for sensitive fitness, location, progress-photo and communication data.

## LATER — member lifecycle, retention and multi-location scale

**Desired outcome:** operators can acquire, retain and serve members across one or several locations with measurable business visibility.

Candidate initiatives:

- CRM/lead pipeline from inquiry to trial, membership and renewal;
- automated engagement journeys across push/email/SMS where consent and provider integrations permit;
- check-in/access-control workflows connected to active membership/payment state;
- failed-payment recovery and self-service payment links;
- richer branded member experiences for booking, account management, payments and community;
- multi-location/franchise management with centralized reporting and organization-level governance;
- staff scheduling/performance tools and operational dashboards;
- retention, attendance, conversion and class/instructor analytics.

## EXPLORE — adaptive coaching and fitness intelligence

**Desired outcome:** assist members and coaches with useful, explainable signals while avoiding medical or nutritional-certainty claims.

Exploration areas:

- opt-in wearable/device integrations with explicit data minimization and consent;
- AI-assisted meal-photo estimation for approximate calories/macros with uncertainty ranges and manual correction;
- training-content recommendations based on goals, adherence and available program data;
- member-engagement/churn signals used as coach/operator prompts, not automatic decisions;
- coach marketplace/discovery patterns where commercial validation supports them;
- richer community/challenge mechanics across disciplines;
- integrations with access hardware and third-party fitness ecosystems through explicit contracts.

Any health-related intelligence must remain assistive, transparent and outside diagnosis/treatment claims unless a separate regulated product scope is intentionally established.

## Market signals used for the vision

- [Mindbody Fitness](https://www.mindbodyonline.com/es-es/business/fitness) demonstrates the category value of payments, marketing, staff management, booking, scheduling, reporting and business/mobile experiences.
- [ABC Glofox](https://www.glofox.com/) demonstrates an integrated member lifecycle spanning memberships, booking, billing, CRM, check-in/access control, analytics, staff management and multi-location operations.
- [ABC Glofox features](https://www.glofox.com/features/) also shows the market movement toward failed-payment recovery, branded apps, retention analytics and scalable multi-location controls.

These references are external category benchmarks only. They are not evidence that FITBA/GYMORA already implements every referenced capability.

## Success signals

Useful outcome-oriented measures include:

- member activation and renewal rates;
- booking conversion, attendance and no-show rates;
- failed-payment recovery once payment automation is enabled;
- trainer/client follow-up completion;
- admin↔mobile synchronization error rate;
- cross-tenant/RLS regression results;
- retention/churn trend quality once enough history exists;
- consent completeness for location, progress, communication and optional health-adjacent data.

## Roadmap governance

A future item is promoted into the public case-study README only after implementation and evidence exist. The roadmap deliberately omits hard dates because app-store review, payments, device integration, privacy requirements and user validation can change delivery order.

`ROADMAP.md` communicates intent. `README.md` communicates current evidence.