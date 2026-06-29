# Skill defects — BluetoothLE (WILL change skill)

### 1. `Application.Suspending` / `Application.Resuming` not handled (absent)
- **Evidence:** `CS1061 Scenario4 Application.Suspending/Resuming not in WinUI 3`; session-log turn 56 wrapped `OnNavigatedTo` in try/catch but left the event registrations.
- **Skill state:** absent — lifecycle section only covers `OnLaunched`/`OnActivated`/`AppInstance`.
- **Fix:** new Common-build-errors entry — delete the registration + handlers; move work to `OnNavigatedTo`/`OnNavigatedFrom` or `Window.Closed`.
- **Generalizes:** nearly every UWP / SDK sample registers Suspending/Resuming; recurs in any lifetime-touching migration.

### 2. Member-level missing WinRT APIs left as compile errors (absent)
- **Evidence:** `CS0117/CS1061` on `UseLowEnergyUncoded{1,2}MPhyAsSecondaryPhy`, `IsLowEnergyUncoded2MPhySupported`, `UpdateAdvertisingParameters` — 16 errors, app never built.
- **Skill state:** absent — only whole-file/namespace deferral exists; no per-member strategy.
- **Fix:** new Common-build-errors entry — stub/guard the member (false for capability reads, drop the call for writes); try/catch can't fix compile errors; non-building app = zero score. Plus an API-level rule in SKILL.md ("build-ability outranks member-level fidelity").
- **Generalizes:** newer/niche WinRT members routinely fail to project into WinAppSDK across device/media/networking migrations.
