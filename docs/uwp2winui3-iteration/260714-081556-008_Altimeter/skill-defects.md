# Skill defects (WILL change skill) — Altimeter

1. **Incomplete namespace rewrite (CS0234 Colors).** `Initialize-UwpMigration.ps1` only
   rewrites `Windows.UI.Xaml`, leaving `Windows.UI.Colors`/`Windows.UI.ColorHelper` (which
   also moved to `Microsoft.UI`). Evidence: `MainPage.xaml.cs(80,67)` CS0234, fixed to
   `Microsoft.UI.Colors`. **Fix:** extend the rewrite loop to those two exact tokens (leave
   the `Windows.UI.Color` struct alone). Generalizes: named colors are ubiquitous.

2. **Root-namespace collision / mismatch (CS0118 + CS0103).** Absent from the skill. The
   scaffold uses the app name as root namespace; UWP samples are named after a WinRT type
   and use `namespace SDKTemplate`. Result: `Altimeter` namespace shadows the sensor type
   (CS0118) and pages can't see `App` (CS0103). **Fix:** MIGRATION-PATTERNS.md section to
   unify on the UWP source namespace and flag sensor-name/WinRT-type collisions with an
   alias fallback. Generalizes across all device/sensor samples.
