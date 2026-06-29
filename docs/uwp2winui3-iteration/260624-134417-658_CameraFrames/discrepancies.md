# Discrepancies — CameraFrames

- **#0 Shared mode access (color/depth/IR):** PASS — full structural + content parity via UIA tree.
- **#1 Find and display media frame sources:** PARTIAL — all 5 controls present, but the 3 ComboBoxes
  lack `AutomationProperties.AutomationId`, so parity name-matched only 2/5. Start/Stop disabled
  (no camera — same as UWP).

## Visual discrepancy
- Scenario 2 selectors render but expose empty AutomationId/Name in the UIA tree (`parity/winui3/ui/02.json`).

## Suspected skill gap
Migration skill is silent on UI Automation identity. In WinUI 3 `x:Name` is not projected as the UIA
AutomationId, so named controls migrate with no automation identity → parity undercounts and accessibility
suffers.
