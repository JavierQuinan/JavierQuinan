# SAP ECC IS-U / Work Management — Sanitized Functional Evidence

> **Type:** functional evidence derived from real operational experience  
> **Publication status:** sanitized  
> **Excluded:** company names, people, IDs, work orders, contract accounts, installations, plants, company codes, work centers, screenshots and internal configuration.

## Documented capabilities

### 1. Work-order inbox management with IW38
Use of IW38 to build and save layouts, select columns, filter by status/order type/work center/date/location criteria, sort results, apply in-list filters and export results when appropriate.

### 2. Work-order lifecycle
Operational interpretation of user and system statuses across the work-order flow, including equivalents of unassigned, assigned, in process, finalized and technically completed. The evidence distinguishes final user status from technical completion.

### 3. Individual and mass work-order creation
Use of a custom operational tool to create work orders individually or from a structured upload file. The process covers technical/contractual context, order type, PM activity, planning group and result validation. Internal transaction names and customizing codes are intentionally omitted.

### 4. Assignment, release and completion with IW32
Use of IW32 to open a work order, record execution information, assign responsibility, release the order, complete technical/IS-U data, finalize user status and perform technical completion when the functional process allows it.

### 5. Controlled mass completion
Evidence of a mass-completion flow based on structured input and background processing. A key control from the source procedure is preserved: mass completion must only be used for orders whose process does not require material consumption. Internal custom-program names are not published.

### 6. Automated release planning
Functional use of a custom planner that automatically releases work orders to work centers based on organizational and operational filters. It supports daily/weekly/monthly or custom intervals, execution windows, allowed weekdays, holidays and operational exclusions. Jobs can be started/stopped from the planner and monitored afterwards.

### 7. Background job monitoring with SM37
Use of SM37 to review background execution by user, date/time range and status, including job summary, log and processing results. This capability applies to both automated release and mass-processing scenarios.

### 8. CRM ↔ WM process flow
Understanding of the handoff between Front Office/CRM and Work Management: commercial process initiation, work-order generation, release/assignment, field execution, finalization and technical completion. The public evidence keeps the process model while excluding organization-specific objects and configuration.

### 9. Temporary/occasional service with metering
Evidence of an integrated process that starts in CRM, creates temporary commercial/technical context and a work order, continues in IS-U/WM for technical execution and completion, and returns to CRM to complete the contractual process. Only the reusable functional integration pattern is published.

### 10. Equipment assignment at the point of consumption
Use of ES62/ES32 for controlled consultation and maintenance of technical assignments, with a key consistency rule: technical assignment must remain aligned with commercial/contractual information; if the change affects the contracted product, it should be handled through the appropriate commercial process rather than an isolated technical edit.

## Operational principles demonstrated

- prefer authorized functional processes over direct data editing;
- preserve traceability across CRM, IS-U and WM;
- distinguish active processing, final user status and technical completion;
- validate restrictions before mass processing;
- monitor background jobs and results;
- maintain consistency between commercial and technical information;
- use real data only in authorized environments and access scopes.

## Public evidence boundary

This documentation demonstrates functional and operational experience. It is not ABAP source code, productive configuration or a replication guide for organization-specific custom developments. Custom transaction names, internal class/codes and organizational identifiers remain outside the public repository.
