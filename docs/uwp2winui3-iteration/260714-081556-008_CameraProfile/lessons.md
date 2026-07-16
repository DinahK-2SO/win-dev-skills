# Lessons — CameraProfile (index 0)

**Outcome:** clean migration, `dotnet build` succeeded first-class, parity score **100/100** (3/3 pass). No build or runtime errors. No `defer` rows needed.

## What worked
- `Initialize-UwpMigration.ps1` bulk `Windows.UI.Xaml → Microsoft.UI.Xaml` rewrite (session-log.txt:270).
- Native `dotnet build` — BUILD SUCCEEDED, zero CS/WMC/WUI warnings.
- Camera-profile query APIs (`MediaCapture.FindConcurrentProfiles/FindAllVideoProfiles/IsVideoProfileSupported`) are WinRT, not XAML — they migrated verbatim. Only `Windows.UI.Xaml` and `CoreDispatcher.RunAsync` needed adapting.

## The one generalizable struggle — unnamed interactive controls
- Every migrated `<Button>` (Scenario1/2/3) has only `Content` + `Click`; none has `x:Name` or `AutomationProperties.AutomationId`.
- In scoring, the Scenario 3 button `Query Profile for HDR Support` could not be auto-invoked: its `Content` is a substring of the nav item `3) Query Profile for HDR Support`, and with no AutomationId the UIA driver matched the nav popup instead (`invokeOk=false`, parity `actionsInvoked 0/1`).
- Root cause: verbatim XAML copy is correct, but the UWP source buttons had no stable id, and the skill never says to **add** one. Unnamed controls are unaddressable by UIA and invisible to assistive tech.
- Preventable by: a general skill rule + a validator WARN flagging interactive controls with neither `x:Name` nor `AutomationProperties.AutomationId`.

## Non-actionable notes
- Light vs dark theme = host system theme, cosmetic.
- UWP CoreWindow could not be driven by winapp UIA (ApplicationFrameHost) — an eval-tool limitation, not a migration defect.
