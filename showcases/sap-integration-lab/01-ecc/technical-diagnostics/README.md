# SAP ECC — ABAP Debugging & Technical Diagnostics Guide

[Versión en español](./README.es.md)

> **Evidence type:** ABAP troubleshooting / SAP technical navigation  
> **Status:** `PROCEDURE_READY`  
> **Scope:** SAP GUI / classic ECC  
> **Boundary:** usage and diagnostic methodology; this does not claim administrative privileges or production execution

## Purpose

This guide documents a professional workflow for identifying the technical object behind an SAP transaction, navigating to ABAP source, testing programs or function modules, setting breakpoints, inspecting runtime state and using diagnostic transactions when runtime errors or process issues occur.

No third-party screenshots, logos or training-material images are reproduced. The document is an original sanitized portfolio reference.

## Tool map

| Tool | Primary use | Technical evidence |
|---|---|---|
| `SE24` | Create/view/maintain ABAP classes | classes, attributes, methods, inheritance, interfaces, breakpoints |
| `SE37` | View/test function modules | import/export interfaces, interactive test, debugging |
| `SE38` | Create/view/execute/debug ABAP programs | reports, source, breakpoints, execution |
| `SE80` | Integrated ABAP Workbench | navigation across programs, classes, functions, packages and dependencies |
| `SE93` | Create/view transaction codes | identify the program/dynpro/object behind a transaction |
| `/H` | Activate debugger from a dialog transaction | stop on the next executable dialog action |
| `SM50` | Work processes for one application-server instance | local process diagnostics |
| `SM66` | Work processes across application-server instances | global process diagnostics |
| `ST22` | ABAP short dumps | runtime-error root-cause analysis |
| `SM21` | System log | technical events and system context |

## Diagnostic workflow

```text
INCIDENT / UNEXPECTED BEHAVIOR
        │
        ├── Known transaction?
        │        │
        │        ▼
        │      SE93
        │        │
        │        └── underlying program / dynpro / object
        │
        ├── Program ──> SE38 / SE80
        ├── Class ─────> SE24 / SE80
        ├── Function ──> SE37 / SE80
        │
        ▼
BREAKPOINT / /H
        │
        ▼
ABAP DEBUGGER
        │
        ├── code flow
        ├── variables
        ├── internal tables
        └── call stack / context
        │
        ▼
RUNTIME ERROR?
   ├── ST22
   └── SM21

SLOW/STUCK PROCESS?
   ├── SM50 — local instance
   └── SM66 — global view
```

## SE93 — identify what a transaction executes

Use `SE93` when the transaction code is known but the underlying ABAP object is not.

1. open `SE93`
2. enter the transaction code
3. choose **Display**
4. inspect the transaction type
5. identify the associated program, dynpro or technical object when applicable
6. retain only the technical information required for troubleshooting
7. continue with `SE38`, `SE80`, `SE24` or `SE37` depending on object type

This provides an evidence-based path instead of debugging blindly.

## SE24 — ABAP classes

`SE24` is the classic Class Builder for global ABAP classes.

Relevant capabilities:

- create global classes
- inspect attributes and methods
- review inheritance
- review implemented interfaces
- navigate to method implementations
- set breakpoints in methods
- interactively test methods where supported

### Class-creation pattern

1. open `SE24`
2. enter a `Z*`/`Y*` object name
3. choose **Create**
4. add description
5. define visibility and superclass if required
6. define attributes, methods and interfaces
7. implement the methods
8. run `Syntax Check`
9. activate
10. test the method or integrate the class into an executable report

This is the pattern documented for the `ZCL_MM_STOCK_RISK_SERVICE` evidence pack.

## SE37 — function modules

`SE37` can be used to inspect and interactively test function modules.

1. enter the function-module name
2. inspect the interface
3. review `IMPORT`, `EXPORT`, `CHANGING`, `TABLES` and exceptions as applicable
4. choose **Test/Execute**
5. provide non-sensitive test input
6. execute normally or with debugging
7. inspect outputs and exceptions

A breakpoint can be placed inside the function implementation before executing the interactive test.

## SE38 — ABAP programs

`SE38` is the classic program/report editor and execution entry point.

Typical troubleshooting path:

1. enter program name
2. display/change according to authorization
3. navigate to source
4. place a breakpoint
5. execute
6. inspect control flow and variables

For a new evidence artifact:

1. create the executable program
2. define program attributes
3. implement the code
4. run `Syntax Check`
5. activate
6. execute using demo/synthetic input

## SE80 — integrated navigation

`SE80` is useful when troubleshooting crosses multiple related repository objects.

It can be used to navigate:

- packages
- programs
- classes/interfaces
- function groups/modules
- DDIC-related objects
- includes
- screens and dependent objects

Its advantage over separate transactions is maintaining application and dependency context.

## `/H` — enter debugging from a transaction

When an issue is visible only through a dialog transaction:

1. enter the transaction
2. type `/H` in the command field
3. press `Enter`
4. perform the next relevant action
5. the debugger opens before the flow continues

This is useful when the exact underlying program is not yet known.

## Breakpoints

### Session breakpoint

Best suited for the current developer/debugging session and interactive SAP GUI execution.

### External breakpoint

Useful when the ABAP execution is triggered outside the direct SAP GUI session, depending on the technical scenario.

Both types must be used only in authorized environments and with awareness of their scope.

## ABAP Debugger

The debugger supports step-by-step execution and runtime-state inspection.

Core analysis areas:

- executing source code
- local/global variables
- internal tables
- objects and references
- call stack
- breakpoints/watchpoints

Safe debugging emphasizes observation and root-cause analysis rather than changing business data or forcing runtime values in production.

## ST22 — short-dump analysis

When an ABAP runtime error occurs:

1. open `ST22`
2. locate dumps using authorized date/time/user context
3. identify error type
4. identify program/include
5. locate the failing source area
6. inspect call stack and runtime context
7. navigate to source with `SE38`/`SE80`
8. reproduce only in an authorized environment

The goal is root-cause analysis, not merely copying the dump message.

## SM50 vs. SM66

### SM50

Shows work processes for **one application-server instance**.

Useful for localized process analysis and understanding which user/program/context is active on that instance.

### SM66

Provides a **system-wide view** across application-server instances.

Useful for distributed issues, global workload visibility and identifying where a process is running.

| Characteristic | SM50 | SM66 |
|---|---|---|
| Scope | specific instance | all instances |
| View | local | global |
| Typical diagnosis | localized issue | distributed/system-wide issue |

Process cancellation or administrative intervention is outside this evidence scope unless explicitly authorized and coordinated with Basis.

## SM21 — system log

`SM21` complements `ST22` when the issue may involve broader technical/system events.

It can provide context around communication errors, system events, technical messages and infrastructure-related conditions, subject to authorization.

## Interview-ready troubleshooting scenario

Question: **“An SAP transaction fails. How would you find where to debug?”**

Structured answer:

1. reproduce and document the issue
2. check `ST22` if a runtime error/dump exists
3. use `SE93` to identify the transaction's technical target
4. navigate with `SE38`, `SE24`, `SE37` or `SE80`
5. place a breakpoint or activate `/H`
6. reproduce with controlled test data
7. inspect variables, internal tables and call stack
8. use `SM50`/`SM66` if process or performance context is relevant
9. correlate with `SM21` when system-level context is needed
10. document root cause and proposed correction

## Security and governance

This evidence does not recommend:

- debugging production without authorization
- modifying variables to alter business data
- changing SAP standard code
- terminating processes without Basis coordination
- publishing users, SIDs, clients, hostnames or internal IDs
- publishing complete dumps containing sensitive context

Public evidence demonstrates method and technical knowledge, not privileged access.
