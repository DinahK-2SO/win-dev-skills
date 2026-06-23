# Skill Defects — Accelerometer (WILL change skill)

## 1. Project-namespace ⇄ WinRT-type collision (build-breaking, absent from skill)
- **Problem:** `dotnet new winui -n Accelerometer` → `<RootNamespace>Accelerometer</RootNamespace>`;
  source references the WinRT `Accelerometer` type by simple name → `CS0118` x9 + XAML `WMC9999`.
  Entire migration unbuildable → 0/100.
- **Evidence:** `migration-score.json` `build_error`; `session-log.txt` L1290/1364/1394
  (scaffold `namespace Accelerometer` vs source `namespace SDKTemplate`).
- **Skill state:** *absent* — `Initialize-UwpMigration.ps1` only did the
  `Windows.UI.Xaml→Microsoft.UI.Xaml` rewrite; nothing addressed the namespace/type collision.
- **Fix:** Bootstrap guard renames the scaffold root namespace to `<Name>App` when it collides
  with a source-referenced type; SKILL.md Step 0 note added.
- **Generalizes:** UWP samples are habitually named after their API (Accelerometer, Compass,
  Gyrometer, Barometer, ProximitySensor, Battery, …) — the collision recurs broadly.
