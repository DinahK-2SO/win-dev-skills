# Discrepancies — Pedometer (UWP → WinUI 3)

Ground truth: original UWP app launched live (window title `PedometerCS`, hosted by
ApplicationFrameHost) and captured scenario-by-scenario with each control actuated.
Candidate: migrated WinUI 3 app (`dotnet build` clean, launched via `winapp run`, PID 19636).

All four scenarios are faithful visual and behavioral replicas. The items below are
minor and do **not** drop any scenario.

## Minor / non-blocking

1. **Navigation pane defaults collapsed (all scenarios).**
   - UWP: the scenario list (ListBox) is shown expanded by default.
   - WinUI 3: the `NavigationView` pane defaults to collapsed (hamburger). Clicking the
     hamburger ("Menu") expands it and it then stays open; every scenario is reachable.
   - Impact: cosmetic startup difference only; navigation works identically once opened.
     This also caused the parity harness's title-driven nav to miss items on the first
     pass (fixed by opening the pane before capture).

2. **Scenario 3 (Current step count) — status text differs (hardware-gated).**
   - UWP golden status: `Access to pedometers is denied`.
   - WinUI 3 status: `No pedometers found`.
   - Both are legitimate no-pedometer-hardware fallbacks emitted by the sample's own
     source (different code paths: access-denied vs `GetDefaultAsync()` returning null).
     Environment-dependent, not a migration defect. The button responded in both.

## Structural gate false-negative (not a real discrepancy)

3. **Scenario 2 (History) — Compare-Parity reported 4/8 control coverage** (missing
   `FromDate`/`FromTime`/`ToDate`/`ToTime` pickers). Visual inspection of the
   `__a02_SpecificHistory` after-click frame confirms all four DatePicker/TimePicker
   controls **are present and functional**, identical to the UWP golden — they are simply
   collapsed (inside the "specific range" panel) at the moment of the initial UIA dump,
   so they don't appear in the depth-8 tree. Behaviorally `SpecificHistory` responded
   (revealing the pickers) and `Get History` responded, matching the UWP. Treated as a
   pass on visual + behavioral evidence.

## Behavioral parity (UWP golden vs WinUI 3)

| Scenario | Control | UWP responded | WinUI responded |
|----------|---------|---------------|-----------------|
| Events | Register ReadingChanged | yes (+2) | yes (+2) |
| History | AllHistory | no-op | no-op |
| History | SpecificHistory | yes (+7) | yes (+5) |
| History | Get History | yes (+1) | yes (+1) |
| Current step count | Get steps count | yes (+1) | yes (+1) |
| Background Pedometer | (no action controls) | — | — |

No dead controls in the WinUI 3 app relative to the UWP golden.
