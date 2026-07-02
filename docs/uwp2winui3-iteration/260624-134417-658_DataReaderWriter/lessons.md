# Lessons — DataReaderWriter (UWP → WinUI 3)

Final score **100/100** (2/2 features pass). No functional parity gaps. All lessons come
from **build-loop friction** in the migration log, not from the scored outcome.

## Errors encountered (root cause → fix)
1. **CS0234 `Windows.UI.Colors` does not exist** (MainPage.xaml.cs:110,113)
   - Root cause: `Colors` (and `ColorHelper`) **moved from `Windows.UI` to `Microsoft.UI`**
     in WinApp SDK. The **`Windows.UI.Color` struct stayed**. The bootstrap namespace
     rewrite only maps `Windows.UI.Xaml → Microsoft.UI.Xaml`, so these leaked through.
   - Fix: `Windows.UI.Colors.Green/Red` → `Colors.Green/Red` (`Microsoft.UI.Colors`).
2. **XamlCompiler WMC0909/WMC1111/WMC9999** — DataTemplate `x:Bind` with
   `x:DataType="local:Scenario"` failed to resolve.
   - Fix: switched the DataTemplate to classic `{Binding Title}`.

## Dev-agent struggle
One failed build → two targeted fixes → clean build. The color-namespace failure was the
avoidable one: it is a **mechanical, well-known type move** the bootstrap could have done.

## Tool limitation (highest leverage)
`Initialize-UwpMigration.ps1` mass-rewrites `Windows.UI.Xaml` only. The other framework
types that relocated to `Microsoft.UI` (`Colors`, `ColorHelper`) are not rewritten, and
the validator's residue grep doesn't flag them either.

## Env note (not a defect)
WinUI 3 screenshots were blank in this headless session; parity was verified via UIA.
