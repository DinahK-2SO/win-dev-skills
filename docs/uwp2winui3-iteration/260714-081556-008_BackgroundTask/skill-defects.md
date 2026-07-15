# Skill defects — BackgroundTask (WILL change skill)

## D1 — Background-task manifest declaration is missing from the skill
- **Problem:** Keeping the classic `BackgroundTaskBuilder`/`TaskEntryPoint` model makes
  `Register()` throw because the build `Package.appxmanifest` has no
  `<Extension Category="windows.backgroundTasks">`. Dead Register → 6× partial → score 50.
- **Skill state:** *wrong/incomplete.* The `Background Tasks` section only says "use the WinAppSDK
  BackgroundTaskBuilder or move to Task Scheduler" — it never states that the retained classic model
  needs the `windows.backgroundTasks` `<Extension>` in the build manifest.
- **Fix:**
  1. Expand the `Background Tasks` pattern with the manifest-declaration requirement + a try/catch
     note (silent dead control otherwise).
  2. Add a `Validate-UwpMigration.ps1` FAIL when retained classic-model code has no matching manifest
     extension.
- **Generalizes:** every UWP app using classic background tasks needs this extension; identical
  silent-dead-control symptom across scenarios.
