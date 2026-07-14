# Lessons — AudioCategory (index 0)

**Outcome:** Migration scored **100%** (10/10 pass, 0 partial, 0 fail, 0 behavioral
regressions). No parity defects. The dev-agent handled every core API cleanly.

## What worked (clean, first-try)
- **MediaElement → MediaPlayerElement + MediaPlayer**, with
  `MediaSource.CreateFromStorageFile(file)` replacing `MediaElement.SetSource(stream, contentType)`.
- **FileOpenPicker** with `WinRT.Interop.InitializeWithWindow.Initialize(picker, hwnd)` /
  `WindowNative.GetWindowHandle(App.MainWindow)` — no COMException (PATTERNS.md#pickers).
- **CoreDispatcher.RunAsync → DispatcherQueue.TryEnqueue** across all sites.
- Deferred-navigation windowing pattern (MainWindow ctor inert) — no E_POINTER at startup.
- `Get-MigrationPattern.ps1` and the final `Validate-UwpMigration.ps1` (11 PASS checks).

## Friction (minor, both generalizable)
1. **Silent validation-skip risk (higher leverage).** The validator was invoked with a
   bare relative path with backslashes: `& ".github\skills\...\Validate-UwpMigration.ps1"`.
   PowerShell parsed the leading `.github` segment as a **module-qualified command**, so
   the script never ran — yet `$LASTEXITCODE` was left at 0 and `VALIDATE_EXIT=0` printed
   as if it had passed (session-log turn 4, lines 4617-4623). The agent noticed the `&:`
   error and retried with an absolute path (turn 5). A less careful agent keying off the
   exit code alone would have skipped validation and declared done.
2. **CS8618 nullable warnings** on the migrated `SampleConfiguration.cs` `Scenario` model
   (non-nullable `string Title` / `Type ClassType` auto-props under the scaffold's
   `<Nullable>enable</Nullable>`) — session-log turns 1-3. Fixed with default initializers
   in one edit. This `SampleConfiguration.cs` idiom ships in virtually every Microsoft UWP
   SDK sample, so the warning recurs.

## Environment note (out of scope)
The original UWP app hung on its splash during scoring, so no live golden baseline was
captured; scoring fell back to the source checklist + structural parity. This is a
measurement/eval condition, not a migration-skill issue.
