# Parity Rubric — Disabling screen capture C# sample

Ground truth: original UWP app (launched via uwp-app-runner, PID 20020,
windowTitle "Disabling Screen Capture C# sample"). Candidate: migrated WinUI 3
app (`000_DisablingScreenCapture`, PID 26272).

| # | Scenario | Required controls / outputs | How graded |
|---|----------|-----------------------------|------------|
| 1 | Enabling screen capture | Description text ("Screen capture allowed", "By default, screen capture is allowed"), MediaPlayerElement, shared StatusBlock | reachable + text/control parity vs UWP |
| 2 | Disabling screen capture | Applies content protection so the window is excluded from capture; Description text; MediaPlayerElement | reachable + protection applied (blank capture is expected/correct) |
| 3 | Managing AppCapture | `AllowAppCaptureCheckBox` ToggleSwitch wired to `AppCapture.SetAllowedAsync`; status output | control present + handler wired; behavioral effect only visible during active capture |

Pass = reachable, controls present in UIA tree, text matches UWP, handlers wired.
Partial = reachable but missing controls or a control dead vs a positive UWP baseline.
Fail = unreachable / crashed / dropped scenario.

## Measurement caveats (honest record)
- **UWP behavioral baseline is weak**: the UWP CoreWindow exposed only the root
  Pane to UI Automation, so `winapp ui invoke` could not drive per-scenario nav or
  actuate the toggle on the original app. The UWP golden is a single rendered frame
  (scenario 1 view) — visually confirming nav list + description + media player.
- **WinUI screenshots are blank white** for every scenario. Not an empty page: the
  UIA tree is fully populated (45 elements) with correct, laid-out content matching
  the UWP. The blank is a winapp screenshot limitation for WinUI 3 windows that host
  a `MediaPlayerElement` (DirectComposition/overlay surface renders white under
  PrintWindow while window chrome captures normally). Scenario 2 additionally sets
  `WDA_EXCLUDEFROMCAPTURE`, for which a blank capture is the correct behavior.
