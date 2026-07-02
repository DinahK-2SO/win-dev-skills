# Lessons — ActivitySensor (iteration 0)

Outcome: score step rated the committed migration **100/100** (4/4 features pass). The
trial's own `results.json` (builds:false/score:0/timeout:true) is a **stale mid-timeout
snapshot** — the committed code builds and launches.

## Errors encountered (only two real build errors, both trace to the skill)

1. **CS0118 — `'ActivitySensor' is a namespace but is used like a type`**
   (`3_ChangeEvents.xaml.cs(33,17)`).
   Root cause: scaffolded with `dotnet new winui -n ActivitySensor` → `<RootNamespace>ActivitySensor</RootNamespace>`,
   which collides with the `Windows.Devices.Sensors.ActivitySensor` type the sample uses
   unqualified. Every UWP SDK sample is named after the WinRT API it demos, so this
   collision is systemic. Fixed by setting the namespace to the source's `SDKTemplate`.

2. **WMC0141 — `Style BasedOn property must be a Style, not 'ThemeResourceExtension'`**
   (`App.xaml(14,14)`).
   Root cause: the shared-content style `BasicTextStyle` (`BasedOn="{StaticResource BodyTextBlockStyle}"`)
   was migrated to `BasedOn="{ThemeResource BodyTextBlockStyle}"` per the over-broad
   "migrate styles to `{ThemeResource}`" guidance. `Style.BasedOn` resolves at XAML-compile
   time and requires `{StaticResource}`; `{ThemeResource}` is only for brush/value setters.

## Dev-agent struggles
- ~3 turns lost renaming the app namespace and rewriting the style before the first clean
  build. Preventable by (a) a project-file rule to set `RootNamespace` = source namespace,
  (b) a CS0118 pattern anchor, and (c) narrowing the ThemeResource guidance to exclude
  `Style.BasedOn`.

## Tool limitation
- `Initialize-UwpMigration.ps1` rewrites `Windows.UI.Xaml`→`Microsoft.UI.Xaml` but leaves a
  split namespace (scaffold `ProjectName` vs source `SDKTemplate`); the agent must
  reconcile it by hand.
