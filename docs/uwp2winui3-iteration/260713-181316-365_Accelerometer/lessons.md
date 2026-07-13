# Lessons — Accelerometer UWP→WinUI 3 migration

**Outcome:** score 100/100, builds=true, runs=true, full parity (6/6). The score is clean
because the validation host has no accelerometer, so all Enable/Disable buttons are disabled
in both apps and screenshots match. That masks a **latent regression** the process should
still have caught.

## Highest-value finding — leftover `DisplayInformation.GetForCurrentView()` shipped silenced

`Scenario4_OrientationChanged.xaml.cs` line 49 still calls `DisplayInformation.GetForCurrentView()`,
wrapped in a `try { ... } catch { displayInformation = null; }` (lines 47-55). On WinUI 3 desktop
that call throws, so `OrientationChanged` never fires and `ReadingTransform` alignment is dead —
but the empty catch hides it. Every gate missed it:

- **Residue grep PASS** (log 3504) — the grep only loads inventory `unsupported` + `residueOnly`
  patterns (`Validate-UwpMigration.ps1` L69-70); `GetForCurrentView()` is in `adaptable`, so a
  leftover call is never enforced. The agent deleted the injected TODO but not the call.
- **WUI healthcheck PASS with "0 WUI analyzer warning(s)"** (log 3521) — the validator's plain
  `dotnet build` doesn't reference `Microsoft.WindowsAppSDK.Analyzers`; only the benchmark's
  `winapp build` does, and it flagged `WUI0004` on that exact line (build-output.txt L24).

## Doc errors

- **WUI0004 row** (`MIGRATION-PATTERNS.md` L515) hard-codes the symptom as
  `SystemNavigationManager.GetForCurrentView()` and the fix as "Drop the system back button
  hookup." WUI0004 actually fires for **any** `*.GetForCurrentView()` singleton — the row misleads
  an agent whose WUI0004 came from `DisplayInformation`/`UIViewSettings`/`ApplicationView`.
- **`getforcurrentview` table** (L262) maps `DisplayInformation.GetForCurrentView()` only to a DPI
  replacement (`XamlRoot.RasterizationScale`). It says nothing about the **orientation** members
  (`CurrentOrientation`, `OrientationChanged`, `AutoRotationPreferences`) that samples actually use.

## Namespace-vs-type collision (CS0118)

`CS0118: 'Accelerometer' is a namespace but is used like a type` (log 3114) — the WinUI project
namespace equals the WinRT type it demos. Fixed with `using SensorAccelerometer = Windows.Devices.Sensors.Accelerometer;`.
Recurs for every device/sensor SDK sample named after its API (Compass, Gyrometer, Barometer, …).
Not covered anywhere in the skill.

## Slips (no skill change)

- First validate FAIL: 8 rows still `Status=copied` — validator caught it prominently; fixed on
  a second pass.
- Transient CS8803/CS0106/CS1022 from a momentarily malformed edit — re-edited and recovered.
- `Splash-sdk.png` missing in manifest — resolved; validator Section 5 already checks this.
