# Parity discrepancies — BluetoothLE (iteration 0)

- **score:** 0 | **builds:** false | **runs:** false
- **4/4 scenarios FAIL**, all `unreachable` — the migrated app never built or launched.

| # | Feature | Status | Why |
|---|---------|--------|-----|
| 1 | Client: Discover servers | fail | App did not build/run; Start enumerating + Pair dead |
| 2 | Client: Connect to a server | fail | App did not build/run; Connect/Read/Subscribe/Write dead |
| 3 | Server: Publish foreground | fail | App did not build/run; Start Service dead |
| 4 | Server: Publish background | fail | App did not build/run; Start Service dead |

**Single root cause:** the WinUI 3 app failed to compile (16 errors) — WinUI-3-removed `Application.Suspending`/`Resuming` events and member-level missing BLE WinRT APIs (`UseLowEnergyUncoded{1,2}MPhyAsSecondaryPhy`, `IsLowEnergyUncoded2MPhySupported`, `UpdateAdvertisingParameters`), plus a downstream WMC9999 XAML compiler crash. No feature behaviour was reachable. No WinUI screenshots exist.
