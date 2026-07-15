# Barometer — Migration Lessons

**Outcome:** score 100/100, 2/2 features pass, builds=true, runs=true. Clean parity. All findings below are build-time friction that did not lower the score but recur across scenarios.

## Tools
- **Helpful:** `Initialize-UwpMigration.ps1` (scaffold + Windows.UI.Xaml rewrite), `Validate-UwpMigration.ps1` (residue + smoke launch), `Get-MigrationPattern.ps1` (anchor lookup).
- **Limitation:** bootstrap namespace rewrite only maps `Windows.UI.Xaml` → `Microsoft.UI.Xaml`; sibling relocations (`Windows.UI.Colors`, `Windows.UI.ColorHelper`) are left behind and break compile. Validator's `residueOnly` also only flags leftover `Windows.UI.Xaml.*`.

## Errors → root cause → fix
1. **CS0234 `'Colors' does not exist in namespace 'Windows.UI'`** — `Windows.UI.Colors` relocated to `Microsoft.UI.Colors` (needs `using Microsoft.UI;`); bootstrap never rewrote it. Fix: `Windows.UI.Colors` → `Microsoft.UI.Colors`.
2. **WMC0909/WMC1111/WMC1509/WMC9999 XAML errors on `x:Bind`/`x:DataType`** — a **cascade** from error #1. With the assembly failing to compile, the markup compiler cannot resolve the project-local `local:Scenario` DataType. The x:Bind markup was correct. The agent needlessly downgraded `{x:Bind Title}`+`x:DataType` to `{Binding Title}`; the real fix was CS0234 alone.

## Dev-agent struggle (high value)
Turns 27-30: agent saw 1 real CS error + 4 cascade WMC errors and misattributed the WMC errors to an x:Bind problem, downgrading compiled bindings to classic bindings. Preventable by a skill note: **fix all CS#### errors first, rebuild, then judge remaining WMC errors — never downgrade x:Bind to silence a cascade.**
