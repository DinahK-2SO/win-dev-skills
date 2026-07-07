# Lessons — LanguageFont (UWP → WinUI 3)

Clean migration: **100/100**, full structural parity, app built and smoke-launched.
Only one reusable skill-level signal surfaced.

## Helpful tools
- **Initialize-UwpMigration.ps1** — bootstrap seeded mapping + TODOs; self-check passed.
- **Validate-UwpMigration.ps1** — caught rows stuck at `Status=copied`; confirmed clean build + smoke launch.
- **dotnet build -p:Platform=$Platform** — clean 0/0 after nullable fixes.

## Problematic / limitation
- **Spurious DEFERRED.md WARN** on a zero-deferral migration. The validator's
  "no defer rows" **PASS** branch only fires when `MIGRATION-DEFERRED.md` contains the
  literal `No items deferred`, but the bootstrap that writes the file emits
  `| (none) | — |` and never that sentinel. Result: every migration with no deferrals
  trips `[WARN] … check consistency` (seen at session-log TURN 33 and 35).

## Special APIs (handled correctly)
- **Windows.Globalization.Fonts.LanguageFontGroup** — non-XAML WinRT API, kept verbatim
  and works as-is on WinUI 3 desktop. Reinforces: only `Windows.UI.Xaml.*` + the
  unsupported inventory need rewriting; other `Windows.*` WinRT namespaces are preserved.

## Errors encountered
- **CS8618** nullable warnings on SDK-sample idiom (`Scenario.Title/ClassType`,
  `MainPage.Current`) → made nullable + null-guarded `Find`/`Navigate` (TURN 29-31).

## Env / eval caveats (out of scope for migration skill)
- WinUI 3 blank screenshots (composition-surface capture limitation), font-only
  behavioral heuristic false-negative, and non-UIA-enumerable UWP CoreWindow golden for
  scenario 2. All are **evaluation-tool** limitations; scoring fell back to the WinUI UIA
  tree, which showed all content present.
