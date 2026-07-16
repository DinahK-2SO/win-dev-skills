# Skill Coverage Gaps — CameraProfile (index 0)

## 1. Interactive controls migrated without any stable automation identifier
- **Problem:** Scenario1/2/3 `<Button>` elements have only `Content` + `Click` — no `x:Name`, no `AutomationProperties.AutomationId`. UIA capture could not invoke the HDR button (`Content` ⊂ nav item `3) Query Profile for HDR Support`; matched the nav popup, `invokeOk=false`).
- **Evidence:** score `discrepancies.json` automation-metadata item; `parity-result.json` scenario 3 `actionsInvoked=0/1`; `Scenario3_EnableHdrProfile.xaml:39`.
- **Covered at (but too weakly):** `MIGRATION-PATTERNS.md:62` — only mention of `AutomationProperties`, buried in the CaptureElement→Image recipe, and only "preserve" not "add". `SKILL.md:178` fidelity rule says preserve names. Parity report footer advises setting AutomationId.
- **Why missed:** under-emphasized + narrow scope; UWP samples routinely omit names, so verbatim copy preserves the absence.
- **Proposed improvement:** general prominent rule (add a stable `AutomationProperties.AutomationId` to any interactive control lacking `x:Name`/AutomationId) + a `Validate-UwpMigration.ps1` WARN listing offenders.
- **Generalizes:** Content-only interactive controls are ubiquitous across UWP SDK samples; stable AutomationIds are required for reliable UIA parity capture and accessibility, and Content-only matches collide with same-named nav items.
