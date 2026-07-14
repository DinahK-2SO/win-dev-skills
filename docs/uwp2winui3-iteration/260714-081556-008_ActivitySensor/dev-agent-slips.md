# Dev-agent slips — ActivitySensor (will NOT change skill)

## 1. Current-activity status string differs (both valid no-sensor states)
- **Problem:** WinUI shows "No activity sensor found" vs UWP "Access denied to activity sensors".
- **Evidence:** discrepancies.json marks this a non-discrepancy; both respond and scored pass.
- **Covered clearly at:** SKILL.md "Defensive UI for device-dependent features" (196–202).
- **Slip type:** one-off-mistake (runtime difference on a sensor-less machine).
- **Why no skill change:** not a regression; forcing identical device-access strings is neither possible nor desirable.
