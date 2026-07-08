# Lessons — OnDemandHotspot (UWP→WinUI 3)

**Outcome:** builds=true, runs=false, score=0. Single blocker: the migrated app cannot be
registered/launched.

## Root cause
`Package.appxmanifest` retained the UWP sample's custom capability:

```xml
<uap4:CustomCapability Name="Microsoft.onDemandHotspotControl_8wekyb3d8bbwe" />
```

A `uap4:CustomCapability` requires a **signed custom capability descriptor (SCCD)**
provisioned on the machine. A sideloaded WinUI 3 package ships no SCCD, so registration of
the `windows.capability` extension fails:

```
Failed to register package ... 0x80073CF6
error 0x80070002 ... failed to register the windows.capability extension
```

Both `dotnet run` and `winapp run` fail identically. The **build stays clean**, so nothing
during the migration caught it (the migration agent never launches the app), and the score
silently drops to 0.

## Why it generalizes
UWP SDK samples routinely declare `uap4:CustomCapability` and other SCCD-gated / restricted
capabilities for privileged hardware or enterprise features (cellular/hotspot control, custom
device access, etc.). Any such sample, once migrated to a sideloaded WinUI 3 package, will hit
the same `0x80073CF6 / 0x80070002 windows.capability` registration failure unless the
capability is removed. This is the exact same failure *class* as the existing background-task
extension pitfall (checklist item 5): a copied UWP manifest element that a packaged WinUI 3
app cannot honor, invisible at build time, fatal at registration time.

## Doc error
`MIGRATION-PATTERNS.md` manifest checklist item 3 says, unconditionally, "Keep any UWP
`<Capability>` entries you actually use." That guidance is what the agent followed into
failure — it needs an explicit carve-out for SCCD-gated custom/restricted capabilities.

## Fix (applied to skill)
1. `Validate-UwpMigration.ps1` — new check 5d flags `uap4:CustomCapability` (and SCCD-gated
   restricted capabilities) and instructs removal.
2. `MIGRATION-PATTERNS.md` — new checklist item 6 documenting the SCCD failure + removal.
3. `SKILL.md` — item 5 pre-flight note extended to mention SCCD custom capabilities.
