# Lessons — AssociationLaunching (UWP → WinUI 3)

Clean migration: score 100/100, all 4 scenarios pass, build succeeded (8 benign
warnings), validator PASS. The migration tooling worked well; the only real friction
was a wrong build command in the skill.

## Helpful tools
- **Initialize-UwpMigration.ps1** — scaffolded + seeded the mapping TODO rows.
- **Get-MigrationPattern.ps1** — `-Anchor windowing`, `-Anchor pickers` gave exact fixes.
- **Validate-UwpMigration.ps1** — ran all checks incl. `dotnet build` + smoke launch → PASS.

## Problematic
- **`winapp build`** (SKILL.md L126/L138/L170) is NOT a winapp subcommand. The agent ran
  it at the end and got `'build' was not matched` (exit 1) + the winapp help dump. winapp
  only offers `run` (launch); compilation goes through `dotnet build`.

## Special API
- **FileOpenPicker** needs `WindowNative.GetWindowHandle(App.MainWindow)` +
  `InitializeWithWindow.Initialize(picker, hwnd)`. Agent applied this correctly from the
  `pickers` anchor. WUI1001 warning is analyzer-level and remains regardless.

## Dev-agent struggle
- 1 wasted turn on `winapp build`; self-recovered. Preventable by fixing SKILL.md to use
  `dotnet build`.
