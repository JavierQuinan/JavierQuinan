# Runtime Evidence Checklist

[Versión en español](./RUNTIME_EVIDENCE_CHECKLIST.es.md)

> What to capture, and what to redact, for each lab's **fresh** runtime evidence. Only new evidence is requested here — no historical screenshot from the original 2025 source documents is to be reused or referenced as if it were current. Technically defensible, not polished, is the bar.

## Minimum evidence per lab (6 items)

1. **Object name** — the exact class name as it appears in ADT's Project Explorer (e.g. `ZCL_LAB_01_VAR_FQ` or, for labs 05/06/08, the runtime-ready name `ZCL_LAB_0X_..._RT_FQ`), visible in the same screenshot as item 3, or stated in the accompanying note if cropped separately.
2. **Source visible** — at least one screenshot of the ADT source editor showing the actual code that ran (confirms the evidence matches a specific, checkable version of the class).
3. **Activation success** — the Project Explorer or Problems view showing 0 errors / a green activation state.
4. **Execution** — the action of running it (the "Console Application" launch, or simply the resulting Console view is sufficient if the launch itself isn't separately capturable).
5. **Output** — the actual Console output text, in full for short labs (01–06, 08) or covering all numbered sections for the longer ones (07, 07a — a scrolling/composite capture is fine).
6. **Date/time, if useful** — a timestamp (screenshot metadata, or a visible clock/date in the OS chrome) establishing *when* this run happened, to distinguish it from the 2025 historical run. Not mandatory if the file's own metadata already carries a capture date.

## Sanitization checklist (apply before saving or sharing any capture)

Check every item below against every screenshot before it leaves the local machine:

- [ ] No SAP user name (dialog user, technical user, or the value of `cl_abap_context_info=>get_user_technical_name( )`) is visible — **this specifically applies to lab 07a's `A01` output table**, whose `iduser` column embeds the real executing user's technical name; crop or black out that column before saving (see `RUNTIME_EXECUTION_PLAN.md`, Lab 07a).
- [ ] No system ID (e.g. a 3-character SID in a title bar or connection label) is visible.
- [ ] No tenant identifier or subaccount ID is visible.
- [ ] No BTP subaccount name/region is visible.
- [ ] No URL/hostname pointing at a private or trial system endpoint is visible (browser address bars, ADT connection properties dialogs, etc.).
- [ ] No real email address appears anywhere in the captured output — only the fixture's/historical source's own `@example.invalid` or `@example.com` literals should appear (these are already synthetic by design; do not substitute a real one while testing).
- [ ] No account ID, license key, or subscription identifier is visible.
- [ ] No transport request number, or if one is visible, confirm it does not itself leak a system/client identifier beyond a generic request number.
- [ ] No credential, token, or connection string of any kind is visible (this evidence-capture work is unrelated to the separately-tracked BTP service-key finding, but the same discipline applies).
- [ ] No private endpoint (internal load balancer address, on-premise gateway hostname, etc.) is visible.

If any checklist item cannot be satisfied by cropping alone (e.g. a system banner that cannot be removed without losing the actual evidence), do not publish that capture — retake it with the offending element out of frame, or accept that lab's evidence stays internal/unpublished until a clean capture exists.

## What is explicitly not required

- No requirement for aesthetically clean/polished screenshots — a plain, legible Console-view capture is sufficient.
- No requirement to capture every possible ADT panel — only the 6 items above, per lab.
- No requirement to capture anything for a lab that has not actually been executed — an empty or fabricated capture is never acceptable; if a lab hasn't been run, its status stays `NOT_REEXECUTED` (see `RUNTIME_EXECUTION_PLAN.md`).

## Where evidence goes once captured

This checklist does not itself define a storage location or a promotion mechanism — per Phase 10 of this task, no lab's status changes from `PENDING`/`NOT_REEXECUTED` to `CURRENT_RUNTIME_VERIFIED` here or anywhere in this local review. Once the account owner supplies sanitized evidence for a given lab, that lab can be individually proposed for promotion in a future pass — never in bulk, never without the evidence in hand.
