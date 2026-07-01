# Lessons — Compression (UWP → WinUI 3)

**Outcome:** Migration was clean. Build SUCCEEDED (only nullable CS8xxx warnings, 0 WUI
analyzer warnings), `Validate-UwpMigration.ps1` = PASS, parity structurally PASS. Score
= **50 / PARTIAL** — the *only* deduction is that the WinUI 3 window rendered blank in
every capture (environment swapchain limitation), so visual fidelity was unverifiable.

## What worked
- **Bootstrap → mapping → TODO markers** flow executed exactly as designed; agent did
  the mandated `Test-Path` self-check and never hand-copied files.
- **`Get-MigrationPattern.ps1`** anchors (pickers, csproj, manifest) kept context small.
- **Picker interop** (`WindowNative.GetWindowHandle` + `InitializeWithWindow.Initialize`)
  applied verbatim from `MIGRATION-PATTERNS.md#pickers` — correct, live FileOpenPicker.
- **Validator** confirmed no residue / no `Status=copied` rows before declaring done.

## Key struggle (generalizable)
- **Wholesale rewrite of a SEQUENTIAL code-behind.** `Scenario1.xaml.cs` touches
  `Windows.Storage.Compression` (Compressor/Decompressor), whose API names trip the
  output-safety filter, so the bootstrap marked it SEQUENTIAL. Rather than edit in place,
  the agent took a backup (exec #42) and **overwrote the whole file with a here-string
  piped to `Set-Content`** (exec #43). It was faithful this time only because the visible
  description text lives in `Scenario1.xaml`, not the `.cs`. The `never wholesale-overwrite`
  fidelity rule in SKILL.md is scoped only to `*.xaml`, leaving `.cs` code-behind (and the
  SEQUENTIAL temptation) uncovered.

## Environment issue (not skill-fixable)
- WinUI 3 main-window captures were blank white / popup black in this headless session
  while the UWP golden and the native file dialog captured fine. This is a
  DirectComposition/swapchain render-to-capture limitation of the capture harness — out of
  scope for the migration skill (deferred to human).
