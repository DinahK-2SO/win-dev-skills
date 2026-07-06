# Lessons — LampDevice (UWP → WinUI 3)

**Outcome:** score 100, all 3 scenarios pass, build clean (0 WUI analyzer warnings). The
migration is faithful; the only friction was build-time, not parity.

## What worked
- `Initialize-UwpMigration.ps1` bootstrap (copy + preserve UWP csproj + bulk namespace rewrite).
- `Validate-UwpMigration.ps1` confirmed a clean `dotnet build` (0 WUI warnings).
- Native `dotnet build -p:Platform=x64` (no BuildAndRun wrapper) surfaced the real errors.

## The one recurring skill-fixable struggle: `Windows.UI.Colors`
- After bootstrap, `dotnet build` failed with **CS0234** (`'Colors' does not exist in the
  namespace 'Windows.UI'`) and **CS0103** (`The name 'Colors' does not exist`).
- **Root cause:** the bootstrap namespace rewrite only handles `Windows.UI.Xaml`. The
  non-Xaml helper class `Windows.UI.Colors` (and `Windows.UI.ColorHelper`) also moved to
  `Microsoft.UI.*` but was left un-rewritten. The mapping table lists it, but nothing
  auto-applies it and nothing warns the agent.
- **Nuance (over-correction trap):** the `Windows.UI.Color` **struct stays** in
  `Windows.UI`; only the `Colors`/`ColorHelper` classes move. So you cannot blindly rewrite
  `using Windows.UI;` → `using Microsoft.UI;`.
- **Fix applied by agent:** `Windows.UI.Colors` → `Microsoft.UI.Colors`; `using Windows.UI;`
  → `using Microsoft.UI;`. Cost one extra build cycle.

## The self-inflicted (non-skill) struggle: DataTemplate x:Bind
- `WMC0909`/`WMC1111` — the migrated MainPage used `{x:Bind Title}` + `x:DataType`, but the
  **original UWP used plain `{Binding Title}`**. The agent added x:Bind unnecessarily, then
  reverted. A faithful copy avoids it → dev-agent slip, no skill change.

## Hardware-gated behavior (faithful, not a defect)
- `Windows.Devices.Lights.Lamp` is unchanged WinRT. With no lamp device, acquisition returns
  null, the `lampToggle` ToggleSwitch stays disabled, and Register/Unregister report
  "No lamp device was found" — identical to UWP.
