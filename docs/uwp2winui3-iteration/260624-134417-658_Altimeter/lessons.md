# Lessons — Altimeter (UWP → WinUI 3)

Final score: **100/100**, builds + runs. But the build log shows two *generalizable*
struggles that cost build/launch cycles and would recur on other SDK-sample migrations.

## Tools that helped
- **Validate-UwpMigration.ps1** — caught every manifest defect and the startup crash with actionable hints; drove the agent to a clean PASS.
- **Test-AppLaunch.ps1 + Application event log (1000/1026)** — surfaced `0xc000027b` in `Microsoft.UI.Xaml.dll`, pointing at the XAML.

## Tool friction
- **Get-MigrationPattern.ps1** — `-Anchor manifest` and `-Anchor appxmanifest` both failed (`Anchor not found`). The manifest patterns are H3 headings with no `<a id>`, so the script can't fetch what the validator tells the agent to look up.

## Errors → root cause → fix
1. **CS9035** (`Required member 'Scenario.Title'/'ClassType' must be set`) in generated `XamlTypeInfo.g.cs`.
   - Root cause: agent added `required` to the SDK `Scenario` model (SampleConfiguration.cs) to silence nullable warnings; the XAML source generator builds `new Scenario()` with no initializer → can't satisfy `required`.
   - Fix: default initializers (`= string.Empty`, `= typeof(object)`), not `required`.
2. **Startup crash `0xc000027b`** in `Microsoft.UI.Xaml.dll`.
   - Root cause: `RelativePanel.Below="SampleTitle"` referenced a `SampleTitle` that the agent had moved out into a separate header panel. RelativePanel position/alignment attrs may only target a sibling *inside the same RelativePanel*; a dangling reference throws at XAML load.
   - Fix: move `SampleTitle` back into the RelativePanel.
   - Doc gap: the skill's `0xC000027B` row only says "defer the API" — wrong for XAML-load crashes.
3. **Manifest defects** (missing `-sdk` assets, `Windows.Universal`, no `rescap:runFullTrust`) — already covered by the skill's manifest H3s; fixed from validator hints.

## Dev-agent struggles (highest value)
- Scenario `required`/CS9035 — 2 build cycles. Preventable by a Common-build-errors pattern.
- 0xC000027B XAML-load crash — ~4 turns. Preventable by adding the XAML-load cause to the startup-crash table.
- Get-MigrationPattern anchor misses — 2 lookups. Preventable by an `<a id="manifest">` anchor.

## Env
- No altimeter device; sensor buttons disabled in both apps. Parity confirmed structurally; not a migration issue.
