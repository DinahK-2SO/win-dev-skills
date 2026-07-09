# Lessons — ProximitySensor (UWP → WinUI 3)

Final score **100/100**, all 4 scenarios pass, build 0 errors. No functional
discrepancies. The value here is in the **build errors the dev-agent hit en route** —
both are generalizable and neither is documented in the migration skill.

## Errors encountered (root cause → fix)

1. **CS0579 duplicate assembly attribute** — Legacy `Tasks\Properties\AssemblyInfo.cs`
   was copied in verbatim; SDK-style WinUI projects auto-generate the same
   `[assembly: AssemblyTitle/Company/Version/...]` attributes (`GenerateAssemblyInfo`
   defaults true), so they collide. Fix: strip the conflicting attribute lines,
   keeping only `[assembly: ComVisible(false)]`.

2. **CS0118 'ProximitySensor' is a namespace but is used like a type** — the app's
   `RootNamespace` (`ProximitySensor`) equals the WinRT type
   `Windows.Devices.Sensors.ProximitySensor`, so unqualified references bind to the
   namespace. Fix: distinct alias `using WdsSensor = Windows.Devices.Sensors.ProximitySensor;`.

3. **CS0576 conflicting alias** — the agent first tried a **same-named** alias
   (`using ProximitySensor = ...`), which collides with the project's own namespace.
   Fix: use a **distinct** alias name (or `global::`).

## Dev-agent struggles

- Namespace collision took 2 build cycles (same-named alias → CS0576 → distinct alias).
- AssemblyInfo CS0579 surfaced only after all code compiled, needing a diagnose + edit.

## Measurement caveats (environment, not defects)

- WinUI pixel screenshots blank on the headless compositor; UWP per-scenario UIA/mouse
  actuation unavailable. Scoring used UIA dumps + source comparison.
