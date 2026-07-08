# Discrepancies — OnDemandHotspot (WinUI 3 migration vs UWP original)

**Verdict:** The migrated WinUI 3 app **builds cleanly** but **cannot be launched**, so no
scenario is reachable. Every feature FAILs against the working UWP original. Score = 0.

## 🔴 Blocker — Migrated app does not launch

Both `dotnet run` and `winapp run <build-output>` fail during package registration:

```
Failed to register package: Package could not be registered.
error 0x80070002: While preparing to process the request, the system failed to register
the windows.capability extension due to the following error: The system cannot find the
file specified. (0x80073CF6)
```

**Root cause:** `Package.appxmanifest` declares

```xml
<uap4:CustomCapability Name="Microsoft.onDemandHotspotControl_8wekyb3d8bbwe" />
```

A `CustomCapability` requires a **signed custom capability descriptor (SCCD)** provisioned
on the machine. The sideloaded WinUI 3 package has none, so registration of the
`windows.capability` extension fails and the app never starts. This matches the migration
trial's own `results.json` (`runs: false`).

**Impact:** No UI can be captured or driven. All scenarios/controls are unverifiable →
FAIL.

## ℹ️ UWP baseline limitation (informational)

The original UWP app **launched successfully** (`uwp-app-runner` `ok:true`, windowTitle
`OnDemandHotspot C# Sample`) and a visual golden of scenario 1 was captured
(`parity/baseline/screenshots/01_Manage_Hotspot.png`). However, the UWP CoreWindow — hosted
by `ApplicationFrameHost` — exposed **no UIA subtree**, so control-level actuation returned
`invokeOk:false` for all 7 actions and no behavioral baseline could be recorded. This is
moot here because the WinUI 3 app does not launch at all.

## Per-feature summary

| Feature | UWP | WinUI 3 | Verdict |
|---|---|---|---|
| Register / Unregister background tasks | rendered (golden captured) | app will not launch | **fail** |
| Hotspot property editor | not reachable in golden (post-registration) | app will not launch | **fail** |
