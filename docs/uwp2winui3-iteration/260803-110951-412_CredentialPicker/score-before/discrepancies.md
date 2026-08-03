# Parity Discrepancies — CredentialPicker (WinUI 3 migration)

Measured 2026-08-03. UWP golden launched successfully (`ok:true`, window
"CredentialPicker C# Sample") and is fully functional. The migrated WinUI 3 app
built (0 errors) and launched, but is **non-functional**.

## Overarching defect: scenario content frame never loads

The migrated app renders its NavigationView shell (3 nav items visible) but the
**content Frame is entirely blank on every scenario**, before and after invoking
controls. The UIA tree for each scenario contains **none** of the scenario input
controls (no Launch button, no Message/Caption/Target/Domain/Username/Password
fields, no combo boxes, no checkboxes). Navigation selects the correct nav item
(items 2 and 3 highlight) but no page content is presented.

- `anyFrameRendered = true` (the shell renders), but no scenario controls exist and
  every Launch invoke **FAILED** (target not found).
- Structural coverage: scenario 1 = 1/9, scenario 2 = 2/10, scenario 3 = 2/14 —
  the only "matched" controls are the nav-item labels themselves.

## Per-scenario

| # | Scenario | UWP | WinUI 3 | Verdict |
|---|----------|-----|---------|---------|
| 1 | Message | Full form; Launch opens Windows Security credential dialog (responded, +1 token) | Blank content frame; no controls; Launch not found | fail |
| 2 | Message+Caption | Full form incl. Caption; Launch present | Blank content frame; no controls | fail |
| 3 | CredentialPickerOptions | Full form incl. Protocol combo, Custom Protocol, Always Show? checkbox; Launch present | Blank content frame; no controls | fail |

Note: UWP scenarios 2 & 3 showed `responded:false` only because scenario 1's modal
credential dialog remained open (an artifact of the automated capture, not a UWP
defect). Scenario 1 clearly demonstrates the ground-truth behavior: Launch → native
credential dialog.

## Every control is missing/dead in WinUI

Missing in all scenarios: Message/Caption/Target TextBoxes, Launch Button, Domain/
Username/Password output fields, Save-By-API/Save-Checkbox/Protocol combos,
Custom-Protocol TextBox, Always-Show CheckBox — the entire scenario UI.
