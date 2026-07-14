# Lessons — AssociationLaunching (score 100, builds+runs, 0 parity defects)

A clean migration: all 4 scenarios present, faithful, behaviorally live. The generalizable
signal comes from **friction that did not cost points this run but plausibly recurs**.

## What worked (skill adequate)
- **Bootstrap + Validator** drove the flow correctly. Validator caught unfinished
  `Status=copied` rows, then PASSed with a runtime smoke launch.
- **Pickers**: agent applied `WindowNative.GetWindowHandle` + `InitializeWithWindow`
  (PATTERNS.md#pickers) — picker opened live (parity pass).
- **Activation**: `AppInstance.GetCurrent().GetActivatedEventArgs()` captured in
  `OnLaunched` (PATTERNS.md#lifecycle) — correct WinUI 3 model.
- **Manifest**: `windows.fileTypeAssociation` / `windows.protocol` / `windows.appUriHandler`
  `<uap:Extension>` blocks carried over verbatim; Windows.Desktop + runFullTrust present.

## Key generalizable friction (→ skill change)
- **WUI1001 (picker) is undocumented and mis-framed.** The benchmark's `winapp build`
  emitted `WUI1001` on the picker call sites — **even though the agent had already added
  `InitializeWithWindow`** (the analyzer flags the type syntactically). PATTERNS.md only
  documented `WUI000x` and asserted "the analyzer does not produce false positives",
  which is misleading for the `WUI1xxx` advisory family. A future agent could waste turns
  trying to silence a benign warning, or worse, rip out the working interop.
- **Validator WUI gate blind spot / over-broad FAIL.** `Validate-UwpMigration.ps1` builds
  with `dotnet build` (reported "0 WUI analyzer warnings") while `winapp build` showed
  WUI1001 — different rulesets. Its FAIL regex `\bwarning WUI\d+:` would also fail a
  *correct* picker migration if the analyzer surfaced WUI1001. Pickers/share/print recur
  across many UWP samples, so both the doc gap and the validator over-broad FAIL generalize.

## Non-issues
- `Status=copied` FAIL on first validator run → one-off dev-agent slip (skill covers it
  prominently in Step 1 and Step 4). No skill change.
- `CA1416` KnownFolders min-version, `CS0414` unused field → benign, scenario-specific.
