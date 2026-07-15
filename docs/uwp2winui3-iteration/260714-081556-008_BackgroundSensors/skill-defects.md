# Skill defects — BackgroundSensors (run25)

## 1. In-process background task missing `windows.activatableClass.inProcessServer` registration
- **State:** absent (Background Tasks anchor exists but only covers *replacing* the task).
- **Evidence:** TURN 47 `Test-AppLaunch` failed with `0x80080204 ... EntryPoint=... without
  ActivatableClassId in windows.activatableClass.inProcessServer`; TURN 48 fixed by adding
  the `inProcessServer` Extension.
- **Root cause:** UWP registered the in-process task class implicitly; packaged WinUI 3
  desktop apps must register it as an in-process COM server in the manifest. Clean build hides it.
- **Fix:** document in Manifest migration checklist + Background Tasks anchor, and add a
  static `Validate-UwpMigration.ps1` check (non-audio backgroundTasks EntryPoint must have a
  matching `ActivatableClassId`).
- **Generalizes:** every UWP app with an in-process background task (deviceUse/timer/system
  trigger) migrated to packaged WinUI 3 desktop hits this build-clean/launch-fail trap.
