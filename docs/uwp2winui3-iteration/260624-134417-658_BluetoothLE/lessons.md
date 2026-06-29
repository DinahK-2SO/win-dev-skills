# Lessons — BluetoothLE (iteration 0)

**Outcome:** score 0. The migrated WinUI 3 app **did not build** (16 compile errors), so all 4 scenarios were unreachable. UWP golden launched fine.

## Root-cause clusters (all compile-time)
1. **`Application.Suspending` / `Application.Resuming` don't exist on WinUI 3 `Microsoft.UI.Xaml.Application`.** UWP server scenarios register them in `OnNavigatedTo`. Fix = delete the registration/unregistration + handler bodies (desktop has no suspend/resume).
2. **Member-level missing WinRT APIs on otherwise-supported types** — BLE secondary-PHY flags (`UseLowEnergyUncoded{1,2}MPhyAsSecondaryPhy`), `BluetoothAdapter.IsLowEnergyUncoded2MPhySupported`, `GattServiceProvider/Connection.UpdateAdvertisingParameters`. The type migrates; the member isn't in the projection. Fix = stub/guard the member (false for capability reads, drop the call for writes) so the file builds.
3. **WMC9999 XAML internal compiler error** — downstream symptom of the un-compilable code-behind; clears once 1 & 2 are fixed.

## Key dev-agent struggle
The agent wrapped `OnNavigatedTo` in `try/catch` (misapplying the runtime "defensive UI" pattern) — but these were **compile-time** errors that `try/catch` cannot mask. It also had no skill permission to stub a single missing member, and the skill heavily discourages deferring/fabricating, so it stalled in a build loop to turn 67 and never reached a clean build.

## Preventable by (skill changes made)
- Name `Application.Suspending`/`Resuming` removal in the Common-build-errors section.
- Add a Common-build-errors entry for member-level missing WinRT APIs: stub/guard to keep the build green; `try/catch` is useless for compile errors; a non-building app scores zero on every feature.
- Add an API-level rule: **build-ability outranks member-level fidelity** (stub the missing member, it's not a defer row and not fabrication).
