# Parity Rubric — CameraVideoStabilization (UWP → WinUI 3)

Single-page UWP sample. The original `MainPage.xaml` (in the `shared/` sibling folder)
contains one scenario with these UI elements:

## Scenario 1 — CameraVideoStabilization (MainPage)

| Control | Type | Role | Initial state |
|---|---|---|---|
| `PreviewControl` | CaptureElement | Live camera preview surface | empty until camera initializes |
| `VsToggleButton` | Button (Click) | Toggle video stabilization on/off (Off/On icon swap) | `IsEnabled=False` until camera ready |
| `VideoButton` | Button (Click) | Start/stop recording (red ellipse / white square) | `IsEnabled=False` until camera ready |

### Ground-truth behavior (observed in live UWP app on this machine — no camera present)
- The page shows a blank preview area plus the two buttons, **both disabled**
  (camera could not initialize, so neither button is actuable). This is the UWP
  golden baseline that the migration is measured against.

### Pass criteria (visual + behavioral)
- The scenario must render a **non-blank** page comparable to the UWP golden:
  the two buttons (or an explicit, visible fallback) must be visible.
- Controls present in the UIA tree with correct AutomationIds.
- Behavioral parity: a control that responds in the UWP golden but is dead in WinUI
  downgrades the scenario. (Here both buttons are disabled in UWP, so no live action
  to compare.)
