# Parity discrepancies — CameraResolution

| # | Feature | Status | Core issue |
|---|---------|--------|-----------|
| 0 | Change camera preview settings | partial | Initialize Camera dead in WinUI; no Status output. |
| 1 | Change preview and photo settings | partial | Initialize Camera dead in WinUI. |
| 2 | Match aspect ratios | partial | Initialize Camera dead; Video Settings combo false-negative (missing AutomationId). |

## Visual
- **Initialize Camera** — UWP: red Status panel "The app was denied access to the
  camera". WinUI: button greyed/disabled, no Status panel.
- **Status area** — UWP renders a "Status:" label + colored border after init; WinUI
  renders nothing because the uncaught-exception path never calls `NotifyUser`.

## Summary
Layout/navigation parity is good; the recurring regression is behavioral: the camera
init handler disables the button around an `await` with no `finally` and catches only
`UnauthorizedAccessException`, so on a camera-less box the init throw escapes uncaught,
the button stays disabled, and no status feedback appears.
