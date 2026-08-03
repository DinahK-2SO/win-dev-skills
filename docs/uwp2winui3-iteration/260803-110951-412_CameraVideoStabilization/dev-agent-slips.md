# Dev-Agent Slips — CameraVideoStabilization

## 1. DisplayInformation orientation hard-coded to Landscape
- Skill already documents `DisplayInformation.GetForCurrentView()` →
  `XamlRoot.RasterizationScale` / `GetDpiForWindow` in the `#getforcurrentview` table.
- Agent hard-coded Landscape instead. Acceptable for a Landscape-locked desktop app;
  no skill change (read-but-ignored).
