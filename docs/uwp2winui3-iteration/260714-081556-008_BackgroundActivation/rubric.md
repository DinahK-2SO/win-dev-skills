# UWP Parity Rubric — Background Activation

Feature: **Background Activation** (6 scenarios). Derived from the UWP source
(`...\Samples\BackgroundActivation\cs`) via `Extract-UwpFeatureChecklist.ps1` and the
scenario `.xaml` sources.

Each scenario is a page reached from the `ScenarioControl` ListBox in the SplitView
pane. Every scenario shares a `Description:` header, a `Register` / `Unregister` button
pair, and a `Status` output TextBlock (`Unregistered` / `Registered [- <task status>]`).

| # | Scenario title | Expected controls | Expected output |
|---|----------------|-------------------|-----------------|
| 1 | Background Task | Register, Unregister | Status: Unregistered → Registered (Time Zone Change SystemTrigger) |
| 2 | Background Task with Condition | Register, Unregister | Status; task gated on InternetAvailable condition |
| 3 | Servicing Complete Task | Register, Unregister | Status; ServicingComplete SystemTrigger |
| 4 | Background Task with Time Trigger | Register, Unregister | Status; TimeTrigger (requires background access) |
| 5 | Background Task with Application Trigger | Register, Unregister, Signal | Status + result; ApplicationTrigger signalled in-app |
| 6 | Grouped Background Task | Register, Unregister, Unregister Ungrouped Tasks | Status; task registered under a BackgroundTaskRegistrationGroup |

## Grading dimensions
1. **Structural** — scenario reachable, renders non-blank, correct control set present in UIA tree.
2. **Visual** — layout/description text matches the UWP source page.
3. **Behavioral** — actuating `Register`/`Unregister` changes the `Status` output the way the UWP original does.

## Measurement notes
- The source-derived `checklist.json` lists 6 scenarios but 0 parsed controls, because the
  interactive buttons live in per-scenario `.xaml` files the extractor does not descend into.
  The control expectations above were recovered by reading the `.xaml` sources directly.
- Background-task registration (`BackgroundTaskBuilder.Register()` / `RequestAccessAsync`)
  is **environment-gated** and needs an interactive foreground grant, so the behavioral
  dimension may be unobservable in a headless automation context for *both* apps.
