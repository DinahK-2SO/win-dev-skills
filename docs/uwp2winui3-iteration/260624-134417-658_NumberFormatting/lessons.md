# Lessons — NumberFormatting (UWP → WinUI 3)

**Outcome:** 100/100, builds + runs, all 7 scenarios pass. No functional discrepancies.
The migration was smooth; the only real friction was a **post-build nullable-warning
cleanup pass**.

## What worked
- `Initialize-UwpMigration.ps1` — clean bootstrap; rewrote `Windows.UI.Xaml → Microsoft.UI.Xaml`
  in 8 files, seeded `MIGRATION-MAPPING.md`, 0 deferred.
- `Validate-UwpMigration.ps1` / `winapp build` — final gate confirmed 0 WUI warnings + smoke launch.

## APIs — zero friction
- `Windows.Globalization.NumberFormatting.*` (Decimal/Percent/Permille/Currency formatters,
  `NumeralSystemTranslator`, `IncrementNumberRounder`) are fully supported in WinUI 3 unchanged.
- `GlobalizationPreferences.Currencies[0]` still available.

## Errors encountered (all recovered)
1. **CS8629 ×9** in `Scenario4_NumberParsing` — `INumberParser.ParseDouble()` returns `double?`;
   UWP code called `.Value` unchecked. Fixed with `... ?? 0` (log 3559-3565).
2. **CS8601** in `Scenario6` — `MainPage rootPage = MainPage.Current;` where `MainPage.Current`
   is nullable. Fixed with `MainPage? rootPage = MainPage.Current;` (log 3494).

Root cause of both: the WinUI 3 scaffold csproj enables `<Nullable>enable</Nullable>`, but UWP
sample code is nullable-oblivious. This produces a **predictable cluster** of CS86xx warnings on
essentially every Windows-universal-samples migration. The two dominant patterns are the
universal `MainPage.Current` static accessor and WinRT nullable-returning `Parse*`/`IReference<T>`
methods accessed via `.Value`.

## Key generalizable takeaway
Give the agent the two dominant null-safety patterns up front (in the "Common build errors after
the namespace rewrite" section) so it writes null-safe code on the first pass instead of a
separate cleanup pass.
