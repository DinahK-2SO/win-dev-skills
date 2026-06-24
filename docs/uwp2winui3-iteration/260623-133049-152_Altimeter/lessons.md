# Lessons — Altimeter (UWP→WinUI 3)

## Headline
The migration **builds, launches, and has a correct shell tree**, but scored **0/2** because
both scenarios' controls (Enable / Disable / Get Data + altitude output) are **missing** at
runtime. Root cause is **the skill's own guidance**, not an agent slip.

## Doc error (skill defect)
- `SKILL.md` → "Defensive UI for device-dependent features" (lines 198–204) tells the agent to
  wrap device init in try/catch and **"swap the page's main content for the fallback"** with the
  sentence *"This sample requires a `<device-kind>` device that is not available on this machine."*
- The migrated `Scenario1_DataEvents.xaml.cs` followed this **verbatim**: `ShowFallback()` collapses
  `MainContent` and shows `FallbackText` with that exact sentence whenever `Altimeter.GetDefault()`
  returns null.
- The **original UWP** never hides controls — on a null sensor it calls
  `rootPage.NotifyUser("No altimeter found", …)` and **keeps every control visible**.
- Result: every scenario's defining controls are absent → parity FAIL on both features.

## Special APIs
- `Altimeter.GetDefault()` returns **null** with no sensor (normal path in the validation env). The
  whole SDK sensor-sample family (Accelerometer, Compass, Gyrometer, Barometer, …) shares this exact
  null-handling shape: report via status, keep controls.

## Errors encountered
- `CS0103: 'App' does not exist` (×5) — root-namespace guard renamed scaffold to `AltimeterApp`;
  fixed by qualifying `AltimeterApp.App.MainWindow`. Build later succeeded.

## Prevention
Correct the Defensive-UI rule: the fallback must be **additive** (report device absence via the
original status mechanism, keep controls visible) and must **never collapse/replace** controls the
original renders unconditionally. A null `GetDefault()` is the normal no-device path, not a crash.
