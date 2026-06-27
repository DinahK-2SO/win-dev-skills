# Parity Rubric — BasicMediaCasting (UWP → WinUI 3)

Ground truth derived from the live UWP app (launched via `uwp-app-runner`, PID 23300,
window title "BasicMediaCasting C# Sample") and the original source XAML.

## Scenario 1 — Basic Media Casting
Built-in casting through the `MediaElement` transport controls.
- `video` — MediaElement, `AreTransportControlsEnabled=True` (built-in Cast button)
- `loadButton` — Button "Load Video"
- `StatusBlock` — status TextBlock (collapsed by default)

## Scenario 2 — Casting Using Casting Picker
Custom Cast button that shows the system `CastingDevicePicker`.
- `video` — MediaElement
- `loadButton` — Button "Load Video"
- `castButton` — Button "Cast Button" (shows CastingDevicePicker)
- `StatusBlock` — collapsed by default

## Scenario 3 — Casting Using Custom Picker
Custom `DeviceWatcher` enumerating cast devices into a list.
- `video` — MediaElement
- `loadButton` — Button "Load Video"
- `watcherControlButton` — Button "Start Device Watcher"
- `disconnectButton` — Button "Disconnect" (collapsed until connected)
- `castingDevicesList` — ListBox of discovered devices
- `progressRing` — ProgressRing (inactive by default)
- `progressText` — TextBlock
- `StatusBlock` — collapsed by default

## Notes on measurement
- All casting actuation is **hardware-gated** (requires a real Miracast/DLNA receiver),
  so clicking Cast / Start Device Watcher produces no deterministic visible response on a
  CI box — this is not a migration defect.
- Controls marked "collapsed/inactive by default" legitimately do not appear in the idle
  UIA tree of either app until their feature path is triggered.
