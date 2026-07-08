# Skill defects — Pedometer (WILL change skill)

Both are **absent** from the migration skill (grepped SKILL.md, MIGRATION-PATTERNS.md,
scripts). Both are general UWP→WinUI 3 build-error classes.

1. **CS0118 / CS0234 — project name == WinRT type name collision.**
   - Evidence: session-log.txt L3248–3250 (CS0118); fix in final Scenario1_Events.xaml.cs
     L22 (`using SensorPedometer = Windows.Devices.Sensors.Pedometer;`).
   - Skill state: **absent** (only CS0104 ambiguity and CS0101 stale-bin/obj covered).
   - Fix: document the collision + `using Alias = …;` / `global::` fix in MIGRATION-PATTERNS.md.
   - Generalizes: SDK samples named after the feature type (Pedometer, Compass,
     Accelerometer, Gyrometer, Barometer, Camera, Geolocation, …).

2. **CS0579 — duplicate assembly attributes from copied AssemblyInfo.cs.**
   - Evidence: session-log.txt L3733–3758 (CS0579); fix at L3824
     (`<GenerateAssemblyInfo>false</GenerateAssemblyInfo>`); copied file at L255.
   - Skill state: **absent**; Initialize-UwpMigration.ps1 copies all `.cs` incl. AssemblyInfo.cs.
   - Fix: Tier-1 exclude `*AssemblyInfo.cs` at copy time + Tier-3 doc of the CS0579 fix.
   - Generalizes: every UWP project ships Properties\AssemblyInfo.cs; SDK projects
     auto-generate the same attributes.
