# Discrepancies — Geolocation (UWP → WinUI 3 migration)

## Verdict: NON-FUNCTIONAL migration — score 0/100

The migrated WinUI 3 app **builds cleanly** (0 errors, 88 warnings) but **cannot be
launched**. Both `winapp run "<build-output>"` and `dotnet run` fail at package
registration:

```
Failed to register package: The Appx package's manifest is invalid.
error 0x80080204: App manifest validation error: Line 31, Column 12,
Reason: If it is not an audio background task, it is not allowed to have
EntryPoint="BackgroundTask.GeofenceBackgroundTask" without ActivatableClassId
in windows.activatableClass.inProcessServer.
```

### Blocking defect
- **Where:** `Package.appxmanifest`, line 31.
- **What:** A background task is declared with
  `EntryPoint="BackgroundTask.GeofenceBackgroundTask"` but there is no matching
  `ActivatableClassId` under `windows.activatableClass.inProcessServer`. A non-audio
  background task must register its in-process server activatable class.
- **Effect:** Package registration is rejected → the app never starts → **all 8
  scenarios are unreachable**.

Because the app cannot launch, no candidate scenario screenshots or UIA trees could be
captured, and every scenario scores **fail** (0/N control coverage). See
`parity/winui3/PARITY-REPORT.md`.

## Per-scenario result

| # | Scenario | UWP responded | WinUI responded | Verdict | Note |
|---|----------|---------------|-----------------|---------|------|
| 1 | Track position | n/a (see below) | no | fail | app did not launch |
| 2 | Get position | n/a | no | fail | app did not launch |
| 3 | Background position | n/a | no | fail | app did not launch |
| 4 | Foreground geofencing | n/a | no | fail | app did not launch |
| 5 | Background geofencing | n/a | no | fail | app did not launch |
| 6 | Get last visit | n/a | no | fail | app did not launch |
| 7 | Foreground visit monitoring | n/a | no | fail | app did not launch |
| 8 | Background visit monitoring | n/a | no | fail | app did not launch |

## UWP ground-truth capture note

The **original UWP app launched successfully** (Release build via `uwp-app-runner`,
PID 17492, windowTitle *"Geolocation C# Sample"*) — confirming a valid ground truth
exists. A golden screenshot of the default view (Scenario 1) was captured
(`parity/baseline/screenshots/00_launch.png`, `01_Track_position.png`).

However, **per-scenario navigation and per-control actuation of the original UWP app
could not be driven on this host**:
- The legacy UWP **CoreWindow does not expose its UIA content tree** to external
  automation — `winapp ui inspect / search / invoke` return only the top-level `Pane`
  (0 interactive elements), so title-driven navigation of the checklist scenarios failed.
- **Synthetic Win32 mouse/keyboard input did not reach the desktop session**
  (`GetCursorPos` remained at `0,0` after `SetCursorPos`), so coordinate-based
  navigation of the nav ListBox ("1) Track position" … "8) Background visit monitoring")
  was not possible either.

This limits the UWP **behavioral** baseline (only Scenario 1 golden is valid), but it
does **not** change any verdict: the migrated app never launched, so there is nothing to
compare against and every scenario fails regardless.
