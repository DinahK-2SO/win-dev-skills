# Lessons — BackgroundTask (run19)

## Outcome
- `dotnet build`: success (0 warnings, 0 errors).
- Launch: **FAILED** — MSIX registration error `0x80080204` at `Package.appxmanifest` line 37.
- Score: **0** (6/6 features fail — app never renders, so every scenario is unreachable).

## Root cause (single, high-leverage)
The migrated manifest kept the UWP background-task declarations verbatim:
```xml
<Extension Category="windows.backgroundTasks" EntryPoint="Tasks.SampleBackgroundTask"> ... </Extension>
<Extension Category="windows.backgroundTasks" EntryPoint="Tasks.ServicingComplete"> ... </Extension>
```
This out-of-process WinRT background-task server model is **invalid for a packaged WinUI 3
desktop (Win32) app**. The registrar rejects it: *"not allowed to have EntryPoint … without
ActivatableClassId in windows.activatableClass.inProcessServer."* Package registration fails,
so nothing launches.

## Why nothing caught it
- **Build** is green — it's a manifest/registration error, not a compile error.
- **Step 7 runtime smoke launch** can't catch it: 0x80080204 means the app never registers
  (no AUMID, no PID) → `Test-AppLaunch.ps1` returns `status=unavailable` → smoke launch only
  **WARNs**, never FAILs.
- **Manifest check 5b** only verifies `Windows.Desktop` + rescap + `runFullTrust`; it does not
  look at `windows.backgroundTasks` Extensions.

## Doc gap
`MIGRATION-PATTERNS.md > Background Tasks` covers only the **code** swap (`IBackgroundTask` →
`BackgroundTaskBuilder`). It never mentions the **manifest** side, so the agent had no signal to
remove the extension.

## Generalizes
The standard UWP background-task pattern (separate `Tasks` WinRT Component + in-manifest
`windows.backgroundTasks` Extension) is common. Any such app migrated to WinUI 3 will hit
0x80080204 unless the manifest extension is removed/reworked.
