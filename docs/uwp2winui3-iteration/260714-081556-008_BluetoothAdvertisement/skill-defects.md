# Skill defects — WILL change skill

## 1. In-process background tasks not covered (dead Run controls)
- **Problem:** UWP in-process background tasks (`BackgroundTaskBuilder` with `TaskEntryPoint`
  omitted, dispatched via `App.OnBackgroundActivated`) were ported verbatim; Scenarios 3 & 4
  Run controls are silently dead.
- **Evidence:** `Scenario3_BackgroundWatcher.xaml.cs:165-194` (builder with no
  `TaskEntryPoint`, catch only `E_DEVICE_NOT_AVAILABLE`, `RequestAccessAsync` outside the
  try); `App.xaml.cs` has no `OnBackgroundActivated`; `migration-score.json` scenarios 3 & 4
  `partial` — "Run button DEAD".
- **Skill search:** `MIGRATION-PATTERNS.md > Background Tasks` documents only the
  out-of-process (string `TaskEntryPoint`) model. In-process variant **absent**.
- **Root cause:** `Microsoft.UI.Xaml.Application` has no `OnBackgroundActivated`; registration
  fails with an HRESULT the narrow sample catch misses, and the `async void` handler swallows
  it → no status.
- **Proposed fix:** Add an "In-process background tasks" subsection: no WinUI 3 equivalent;
  convert to out-of-process (assign a string `TaskEntryPoint`); broaden the registration catch
  to `catch(Exception)` and always surface a status (move `RequestAccessAsync` inside the guard).
- **Generalizes:** In-process background tasks recur across UWP samples (BLE, geolocation,
  device triggers); every such migration hits the same silent dead-control failure.
