# Skill coverage gaps — WILL change skill (sharpen existing content)

## 1. Validator background-task check is blind to the in-process model
- **Problem:** `Validate-UwpMigration.ps1` passes whenever a `windows.backgroundTasks`
  extension exists. It was present here (in-process EntryPoint = task class), so the check
  went green while the Run control was dead.
- **Covered at:** `Validate-UwpMigration.ps1` section 5c (lines 373-399);
  `MIGRATION-PATTERNS.md > Background Tasks` item 2 (line 357, try/catch + surface status —
  written only for the out-of-process model).
- **Why missed:** under-emphasized — the check only asserts extension presence; the
  status-surfacing rule is scoped to the out-of-process narrative.
- **Proposed improvement:** In the same validator branch, when retained
  `BackgroundTaskBuilder` code has **no** `TaskEntryPoint` assignment (in-process), FAIL/WARN
  unless an `OnBackgroundActivated` handler exists. Broaden the PATTERNS "surface the failure"
  note to cover *both* models and warn the UWP sample's HRESULT-specific catch is too narrow
  on WinUI 3.
- **Generalizes:** Presence-only checks keep passing in-process migrations across scenarios;
  the broadened check prevents the silent dead-control class generally.
