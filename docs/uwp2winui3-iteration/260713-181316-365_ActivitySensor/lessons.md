# Lessons — ActivitySensor (UWP → WinUI 3)

## Outcome
Build **failed**, app never launched, trial timed out → score 0/4.

## Root cause (single, build-blocking)
`dotnet new winui -n ActivitySensor` created shell files (`App`/`MainWindow`/`MainPage`)
in `namespace ActivitySensor`, while the ported scenario pages kept the UWP source
namespace `SDKTemplate`. The ported code references the WinRT type
`Windows.Devices.Sensors.ActivitySensor` **unqualified**. The scaffold's `ActivitySensor`
**namespace shadows the type**, so `Scenario3_ChangeEvents.xaml.cs:33` fails with:

```
CS0118: 'ActivitySensor' is a namespace but is used like a type
```

A cascading `XamlCompiler WMC9999` internal error follows in MarkupCompilePass2.

## Why it happened
Skill Step 0 says `dotnet new winui -n <ProjectName>` with **no** guidance to:
1. make the project name / `<RootNamespace>` / shell-file namespaces match the UWP
   source's original `<RootNamespace>` (here `SDKTemplate`), and
2. avoid a project name that equals a WinRT type the app references.

The Windows-universal-samples corpus uniformly uses `namespace SDKTemplate` for page
code while naming the app/assembly after the demonstrated API (Accelerometer, Barometer,
Compass, Gyrometer, ProximitySensor, **ActivitySensor**, …). Picking the project name =
API name reliably reproduces this collision.

## Preventable by
- Bootstrap auto-aligning the scaffold to the source `<RootNamespace>`.
- SKILL Step 0 rule + a PATTERNS.md `CS0118` entry.
