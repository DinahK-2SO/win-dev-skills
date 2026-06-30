# CameraProfile — UWP→WinUI 3 Migration Rubric

Ground-truth feature checklist derived from the original UWP source and verified
against the **live** UWP app (the golden baseline).

## Scenario 1 — Locate Record Specific Profile
- **Controls:** `Find 640x480 30FPS Recording Profile` (button), `Find Custom Recording Profile` (button), `outputBox` (output)
- **Actions:** click each button.
- **Expected output:** `Looking for all video capture devices` → `Number of video capture devices found: 0` → `ERROR: No Video Device Id found, verify your device supports profiles` (red status bar mirrors the error). Hardware-gated: no camera present → error path.

## Scenario 2 — Query Profile for Concurrency
- **Controls:** `Query for Concurrent Profile` (button), `outputBox` (output)
- **Actions:** click the button.
- **Expected output:** front/back panel enumeration → `Number of video capture devices found: 0` (×2) → `ERROR: A capture device doesn't support Video Profile`.

## Scenario 3 — Query Profile for HDR Support
- **Controls:** `Query Profile for HDR Support` (button), `outputBox` (output)
- **Actions:** click the button.
- **Expected output:** `Querying for video capture device on back of the device that supports Video Profile` → device enumeration → `ERROR: No Video Device Id found, verify your device supports profiles`.

All three scenarios are hardware-gated (this machine has 0 camera devices), so the
"golden" behavior is the deterministic error/status path — which both the UWP app and
the migrated WinUI 3 app must reproduce verbatim.
