# Lessons — ActivitySensor (UWP → WinUI 3)

Outcome: **score 100, builds + runs**. But the dev-agent burned ~25 turns on three
recurring, evidence-backed build/launch problems that the migration skill does not (or
not clearly) cover.

## Tools
- **Helpful:** `Validate-UwpMigration.ps1` (drove the mapping/rebuild/smoke gates to a clean
  PASS) and `Test-AppLaunch.ps1` (surfaced the real Appx registration error `0x80080204`).
- **Problematic:** `Initialize-UwpMigration.ps1` copied stale UWP build output
  (`obj/`, `bin/`, `Tasks/Properties/AssemblyInfo.cs`) into the target → **CS0579 duplicate
  assembly attribute** (turn 29) and 208 `MIGRATION-MAPPING.md` rows including
  `bin\x64\Debug\AppX\Assets\*.png`. The namespace-rewrite step already excludes
  `bin/obj` (line 106) but the **copy step (line 69) does not**.

## Errors → root cause → fix
1. **CS0579 Duplicate TargetFrameworkAttribute** — bootstrap copied UWP `obj`/`Properties`;
   SDK auto-generated attributes then collide. Fix: deleted stale folders (turn 31).
2. **CS0118 'ActivitySensor is a namespace but is used like a type'** — project/folder name
   equals the WinRT type the sample demos, so `RootNamespace=ActivitySensor` shadows the
   type. Fix: `<RootNamespace>SDKTemplate</RootNamespace>` + move types to `SDKTemplate`
   namespace + **`dotnet clean`** to regenerate stale `XamlTypeInfo.g.cs` (turns 43-45).
3. **CS0246/CS0115 OnBackgroundActivated** — WinUI 3 `Application` has no in-process
   background-activation override. Fix: removed the override (turn 37).
4. **Appx register fail 0x80080204 / 0x80073CF6** — `windows.backgroundTasks` manifest
   extension (UWP in-process task) is invalid for the WinUI 3 package. Fix: removed the
   extension; runtime `BackgroundTaskBuilder.Register()` wrapped in try/catch (turns 52-54).
5. **WMC0909/WMC1111** — DataTemplate `x:Bind`/`x:DataType` failed to resolve after the
   namespace rename. Fix: switched to `{Binding Title}` (one-turn, standard WinUI knowledge).

## Highest-value struggles (from build-events.jsonl)
- **Namespace collision** (~6 builds / 16 turns): preventable by a documented CS0118 pattern
  (rename RootNamespace to `SDKTemplate`, then `dotnet clean`).
- **Stale build output** (CS0579): preventable by excluding `bin/obj/Properties\AssemblyInfo.cs`
  in the bootstrap copy loop (Tier-1).
- **Background task** (~5 build/launch cycles): preventable by expanding the Background Tasks
  pattern (drop the `OnBackgroundActivated` override, drop the manifest extension, guard
  `Register()`).
