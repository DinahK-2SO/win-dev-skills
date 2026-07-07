# Lessons — LightSensor UWP→WinUI 3 (index 0)

Outcome: **score 100/100**, builds ✅, runs ✅, both scenarios pass. The agent recovered
from every error, so the lessons here are about **efficiency/robustness** — the churn it
burned before recovering, all of which recurs across SDK-sample migrations.

## Tools
- **Helpful:** `Initialize-UwpMigration.ps1` (bulk namespace rewrite + verbatim copy);
  `Validate-UwpMigration.ps1` + `dotnet build` gate (drove to a clean, WUI-warning-free build).
- No problematic tools / limitations observed.

## Errors encountered (root cause → fix)
1. **CS0103 `The name 'App' does not exist`** (Scenario1/Scenario2 code-behind, ×4).
   Root cause: the **SDK-sample multi-namespace layout** — scaffold `App` is in the new
   project **root** namespace (`LightSensor`) while the sample's scenario pages keep their
   own namespace (`LightSensorCS`). An unqualified `App.MainWindow` can't resolve across
   namespaces. Fix: fully qualify `LightSensor.App.MainWindow` (or add `using LightSensor;`).
2. **WMC0909 `Cannot resolve DataType local:Scenario` + WMC1111** (MainPage.xaml).
   Root cause: `x:DataType="local:Scenario"` with `xmlns:local` not pointing at the
   namespace that holds the `Scenario` model (sample keeps MainPage + model in
   `SDKTemplate`). Fix: keep MainPage `x:Class`/`xmlns:local` and the `Scenario` class on
   one consistent namespace so the compiled binding resolves.
3. **CS8618/CS8602/CS8622 nullability warnings** — scaffold has `<Nullable>enable</Nullable>`,
   sample code predates it. Fix: null-forgiving (`_sensor!.`) + `object? sender`. Cosmetic.

## `Window.Current` replacement
UWP `Window.Current.Activated` (sensor pause/resume) → static `App.MainWindow` reference.
The skill's windowing pattern was correct; the friction was purely the **namespace of the
consumer**, not the pattern itself.

## Special API
- `Windows.Devices.Sensors.LightSensor` is **hardware-gated**: no sensor ⇒ both apps show
  "No light sensor found" / "LUX: No data" and Enable/Disable are no-ops. Correct parity.

## Environment (not actionable in migration skill)
- WinUI 3 parity screenshots blank = swapchain capture limitation in a non-interactive
  session; fidelity confirmed via live UIA tree.

## Highest-leverage preventable struggle
Both #1 and #2 share **one general root cause**: Windows-universal-samples keep their code
across **multiple namespaces** (`SDKTemplate` + a per-project namespace) that differ from
the scaffold's project-root namespace. Every cross-reference — code-behind → `App.MainWindow`,
and XAML `x:DataType`/`xmlns:local` → sample model types — breaks unless namespaces are kept
consistent or references are fully qualified. A short prominent note prevents this on re-runs.
