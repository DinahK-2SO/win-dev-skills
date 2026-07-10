# Lessons — TouchKeyboardTextInput (index 0)

Score **0/11**, app never built.

## Root cause
The UWP source ships the scenario pages' `*.xaml.cs` code-behind in the project root, but the
authored `*.xaml` markup exists **only** under `obj\x64\Release\` (build output). The bootstrap
`Initialize-UwpMigration.ps1` excludes `bin`/`obj`, so it copied only 4 files (manifest + 3 `.cs`)
and produced **orphaned code-behind** — partial classes calling `InitializeComponent()` with no
markup. The mapping gave the agent no signal. The dev agent hand-rebuilt `MainPage.xaml`, mixed
`SDKTemplate` and project namespaces, and ran out of budget before authoring the Scenario XAML or
ever running a build.

## Errors
- `WMC0909 Cannot resolve DataType local:Scenario`, `WMC1111`, `WMC9999 Xaml Internal Error` — the
  whole XAML compile pass failed because Scenario1/Scenario2 markup was missing.
- Cascading `CS0103`/`CS1061 InitializeComponent does not exist` — no `.g.cs` was generated.

## Dev-agent struggle (high value)
Re-authoring pages by hand is slow; agent never reached a build. Preventable by bootstrap
auto-recovering orphaned `.xaml` from `obj/bin` and flagging any that cannot be found.

## Tooling
- **Problematic:** bootstrap silently omitted `.xaml`, no orphan detection.
- **Doc gap:** `MIGRATION-PATTERNS.md#xaml` assumed `.xaml` always present in source.
