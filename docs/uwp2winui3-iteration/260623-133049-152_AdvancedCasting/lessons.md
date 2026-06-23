# Lessons — AdvancedCasting (UWP → WinUI 3)

**Outcome: score 0/100. Builds clean, validator PASS, but the app never launches.**

## Decisive root cause
The migrated `Package.appxmanifest` carried over the original UWP
`<uap:Extension Category="windows.dialProtocol"><uap:DialProtocol Name="screencasting"/></uap:Extension>`
block. That app-model extension cannot be registered for a **packaged WinUI 3 desktop**
app, so `winapp run` / `dotnet run` both fail registration:

```
AppxManifest.xml(35,10): error 0x80070032: Cannot register ... windows.dialProtocol
extension: The request is not supported. (0x80073CF6)
```

The app never launches → all 6 scenarios unreachable → 0% control coverage → all FAIL.

> Note: the extension **was** present in the original UWP manifest (the score note's
> "absent from the original" is inaccurate). The agent faithfully copied it; the lesson is
> that faithful manifest copying is wrong for UWP-only `<Extensions>`.

## Why it slipped to a false PASS
- `Test-AppLaunch.ps1` saw no AUMID from `winapp run` and classified the failure as
  `unavailable` ("Developer Mode off / missing framework / MAX_PATH — not a migration
  defect"). But the error was a **manifest-content** registration failure — a real defect.
- `Validate-UwpMigration.ps1` mapped `unavailable` → `[WARN]` (non-fatal) → overall
  **PASS**. The agent trusted PASS and declared done.

## Generalizable fixes (applied)
1. **Validate-UwpMigration.ps1** — static manifest lint flagging UWP-only `<Extensions>`
   (chiefly `windows.dialProtocol`) that block packaged WinUI 3 registration → FAIL.
2. **Test-AppLaunch.ps1** — reclassify manifest-registration HRESULTs
   (`0x80073CF6` / `AppxManifest.xml(...)` / "extension ... is not supported") as a
   defect, not an environment `unavailable`.
3. **MIGRATION-PATTERNS.md** — correct the "carry over `<uap:Extension>`" guidance; add a
   rule to strip unsupported/unneeded manifest extensions before the first `winapp run`.
