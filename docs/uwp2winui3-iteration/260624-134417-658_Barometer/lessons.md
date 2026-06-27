# Lessons — Barometer UWP → WinUI 3 (iteration 0)

Final outcome: **score 100/100, builds=true, runs=true, 0 parity defects.** All scoring
discrepancies are eval-tool/hardware limitations (blank WinUI screenshots, no barometer
sensor, opaque UWP CoreWindow) — none are migration defects and none are in scope for the
migration skill.

The improvement value is entirely in the **build-time thrash**: the dev-agent burned
~16 turns and **3 failed build rounds** on two fully generalizable problems.

## Helpful tools
- **Initialize-UwpMigration.ps1** — copied sources + did the Windows.UI.Xaml rewrite.
- **Validate-UwpMigration.ps1** — `[PASS] dotnet build succeeded` gated completion.

## Errors encountered → root cause → fix
1. **CS0118 'Barometer' is a namespace but is used like a type** — project/root namespace
   is named after the sensor, shadowing `Windows.Devices.Sensors.Barometer`. Fix: alias
   `using BarometerSensor = Windows.Devices.Sensors.Barometer;`.
2. **CS0246 'SDKTemplate' could not be found** — sample files keep `namespace SDKTemplate`
   while the scaffold App/MainWindow are in the project-name namespace.
3. **CS0103 'App' does not exist** — scenario pages still in `SDKTemplate`; `App` is in the
   project namespace.
4. **WMC0909/WMC1111 x:Bind DataType** — `x:Class`/`xmlns:local="using:SDKTemplate"` in the
   copied XAML still pointed at the old namespace.
   → 2–4 are all one root cause: **the `SDKTemplate` sample namespace was never reconciled
   to the scaffold's root namespace.**

## Dev-agent struggle (high value)
- 3 failed builds (log lines 2412, 2799, 3280; success 3679), 33 `SDKTemplate` edits.
- Preventable by: (1) the bootstrap reconciling `SDKTemplate` → scaffold root namespace
  automatically; (2) a documented CS0118 project-name/WinRT-type collision pattern.

## Out of scope (eval/hardware limitations, recorded for honesty)
- Blank WinUI screenshots, missing barometer hardware, opaque UWP CoreWindow — all belong
  to the evaluation tools / environment, not the migration skill.
