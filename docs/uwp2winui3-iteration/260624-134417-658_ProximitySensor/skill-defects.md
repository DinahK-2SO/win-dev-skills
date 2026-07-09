# Skill defects — ProximitySensor (WILL change skill)

## 1. Legacy `AssemblyInfo.cs` → CS0579 duplicate-attribute errors  *(absent)*
- **Evidence:** session-log ~4226-4234 `ProximitySensor.AssemblyInfo.cs(13,12): error CS0579: Duplicate ...AssemblyCompanyAttribute`; hand-fixed at turns 63-65.
- **Root cause:** SDK-style projects auto-generate assembly attributes; copied UWP `Properties/AssemblyInfo.cs` duplicates them.
- **Fix:** Tier-1 — `Initialize-UwpMigration.ps1` strips SDK-auto-generated attribute lines from copied `AssemblyInfo.cs`; Tier-3 backstop patterns entry.
- **Generalizes:** `AssemblyInfo.cs` is boilerplate in every UWP project/sub-project → collision recurs on every migration.

## 2. RootNamespace equals a WinRT type → CS0118 / CS0576  *(absent)*
- **Evidence:** session-log ~2850 `CS0118: ProximitySensor is a namespace but is used like a type`; ~3243 `CS0576: ...conflicting with alias ProximitySensor` after a same-named alias attempt; resolved with distinct alias `WdsSensor`.
- **Root cause:** app namespace `ProximitySensor` shadows `Windows.Devices.Sensors.ProximitySensor`; a same-named alias also collides.
- **Fix:** patterns entry — use a **distinct** alias or `global::`, never a same-named alias.
- **Generalizes:** whole families of sensor/device samples are named after Windows.* types.
