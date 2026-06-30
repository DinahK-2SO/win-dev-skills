# Skill coverage gaps — CameraResolution

## 1. Async device-init dead-control path not covered (→ change skill)
- **Problem:** Initialize Camera is dead in all 3 scenarios — button disables on click and
  never re-enables, no Status feedback; UWP shows a status message.
- **Evidence:** `migration-score.json` `winui_responded=false` (3/3 partial);
  `SampleConfiguration.cs:80` catches only `UnauthorizedAccessException` around
  `MediaCapture.InitializeAsync()`; `Scenario1_PreviewSettings.xaml.cs:77-79` disables the
  button, awaits init, re-enables — with no `finally`.
- **Covered at:** SKILL.md "Defensive UI for init-heavy and device-dependent pages"
  (~200-229) — but only for ctor/Loaded init (failure mode = blank frame).
- **Why missed:** under-emphasized — the interactive async-handler path (failure mode =
  dead control + lost status) is not addressed.
- **Improvement:** extend that section with two general rules — (a) broaden the narrow
  device-init catch to handle the device-absent throw (COMException / FileNotFoundException)
  and emit a status message; (b) restore `IsEnabled` in a `finally` around any
  disable-during-await handler.
- **Generalizes:** both are environment-driven and recur for any hardware/media or async
  button handler; access-denied is only one denial path, and disable-around-await without
  finally is a universal dead-control anti-pattern.
