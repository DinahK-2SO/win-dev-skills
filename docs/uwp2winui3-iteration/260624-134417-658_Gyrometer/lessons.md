# Gyrometer — Migration Lessons

**Outcome:** WinUI 3 app built clean and scored **100/100** structural parity (3/3 scenarios).
The migration succeeded, but the dev-agent spent ~18 turns and ~4 failed build cycles on
two **namespace** problems the skill does not document.

## Errors encountered (root cause → fix)

1. **CS0118 `'Gyrometer' is a namespace but is used like a type`** (Scenario1/2/3.xaml.cs)
   - *Root cause:* project name / `<RootNamespace>Gyrometer</RootNamespace>` creates an
     implicit `Gyrometer` namespace that shadows the WinRT type
     `Windows.Devices.Sensors.Gyrometer`. Every bare `Gyrometer` reference bound to the
     namespace.
   - *Fix:* `using GyrometerSensor = Windows.Devices.Sensors.Gyrometer;` alias in each file
     (turns 25-29).

2. **CS0103 `The name 'App' does not exist in the current context`** (9 errors)
   - *Root cause:* scaffold's `App`/`MainWindow` live in the project RootNamespace
     (`Gyrometer`), but the migrated SDK-sample files kept their original namespace
     (`GyrometerCS` / `SDKTemplate`), so bare `App.MainWindow` did not resolve.
   - *Fix:* `global::Gyrometer.App.MainWindow` qualification (turn 39).

3. **WMC0909 / WMC1111** — agent-authored `x:Bind` DataTemplate with unresolved
   `x:DataType="local:Scenario"`; reverted to `{Binding Title}` (turn 24). Self-inflicted,
   fixed same turn.

## Dev-agent struggles

- **Type/namespace collision (turns 23-30):** alias applied one file at a time → the same
  CS0118 recurred across builds. Preventable by an up-front skill entry telling the agent
  to alias/fully-qualify (or rename RootNamespace) across *all* files in one pass whenever
  the project is named after a WinRT type.
- **Cross-namespace `App` reference (turns 38-41):** preventable by skill guidance to keep
  the scaffold's `App`/`MainWindow` namespace consistent with the migrated code.

## Tools that helped
- `Get-MigrationPattern.ps1 -Anchor csproj/manifest` — reconciled csproj/manifest cleanly.
- Iterative `dotnet build -p:Platform=x64` loop — surfaced the exact CS error list.

## Env note (not a migration defect)
- WinUI 3 screenshots render blank in this headless session (PrintWindow/DirectComposition);
  score step judged fidelity from the UIA tree.
