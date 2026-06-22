# Lessons — AdvancedCasting (UWP→WinUI 3)

**Outcome:** Build succeeded (0 errors), `Validate-UwpMigration` PASSed, but the WinUI 3
app **never launched**. Score 0/1. Root cause is a single manifest line.

## The one error that mattered
- **Error:** `Package could not be registered: AppxManifest.xml(30,10) error 0x80070032
  — windows.dialProtocol extension 'The request is not supported.' (0x80073CF6)`. Both
  `winapp run` and `dotnet run` fail; build is clean.
- **Root cause:** The dev-agent carried the UWP `<uap:Extension Category="windows.dialProtocol">`
  block (generated manifest lines 40-44) into the WinUI 3 `Package.appxmanifest`. The
  packaged WinUI 3 / Windows App SDK stack cannot register this UWP-only extension.
- **Fix:** Remove the unsupported `<Extensions>` entry from the manifest.

## Why it slipped through
- `MIGRATION-PATTERNS.md:440` explicitly lists `<uap:Extension>` among UWP-manifest
  content to "merge into the scaffold's" — **no caveat** that some extension categories
  are unsupported and block registration.
- `Validate-UwpMigration.ps1` section 5b checks only TargetDeviceFamily / rescap /
  runFullTrust. It **never inspects `<Extensions>`**, so it returned PASS on a manifest
  that cannot launch.

## Generalizable takeaways
- UWP apps frequently declare app-extensions tied to the UWP activation model
  (`windows.dialProtocol`, `windows.dialReceiver`, `windows.backgroundTasks`,
  `windows.appService`, share targets, etc.). Copying them verbatim into a packaged
  WinUI 3 manifest is a recurring cause of `0x80073CF6` registration failures.
- A clean build + green validator is not proof of launch when the manifest carries
  UWP-only extensions — the validator must catch this class of failure.
