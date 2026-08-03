# Skill Coverage Gaps — CameraResolution

## 1. AutomationProperties.Name preservation is buried (skill-coverage-gap)
- **Problem:** Video Settings ComboBox absent from the WinUI UIA tree → Scenario 3 downgraded pass→partial (score 83).
- **Evidence:** `Name="VideoSettings" PlaceholderText="Video Settings"` with no `AutomationProperties.Name`; agent added it to the nav ListBox but not the placeholder ComboBoxes.
- **Covered at (buried):** MIGRATION-PATTERNS.md line ~62, only inside the `CaptureElement → Image` example.
- **Why missed:** buried in a device-specific example, not a general rule.
- **Fix:** promote to a Critical Rule in SKILL.md — every interactive control must expose a stable `AutomationProperties.Name`/`Header`; placeholder-only controls surface no UIA Name and must get an explicit one. Visible ≠ automation-discoverable.
- **Generalizes:** parity scoring everywhere depends on UIA Name; placeholder-labelled controls are a common UWP idiom, so this recurs.
