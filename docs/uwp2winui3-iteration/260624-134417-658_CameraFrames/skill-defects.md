# Skill Defects — CameraFrames (WILL change skill)

## 1. Interactive controls migrate with no UI Automation identity (absent guidance)
- **Problem:** WinUI 3 `x:Name` is not the UIA AutomationId; migrated controls report empty
  AutomationId/Name → scenario 2 partial (parity coverage 2/5).
- **Evidence:** migration-score.json (scenario 2 = partial, "ComboBoxes lack AutomationProperties.AutomationId");
  discrepancies.json `scenario2-comboboxes-missing-automationid`.
- **Skill search:** grep for `Automation*` across the migration skill = **0 hits** (only the eval skill mentions it).
- **State:** absent.
- **Fix:** PATTERNS.md `#automation-id` section + Validate-UwpMigration check 9 (WARN) + SKILL.md Step 4 reference.
- **Generalizes:** every UWP→WinUI 3 migration has interactive controls and the same `x:Name != AutomationId`
  behaviour; accessibility + any name-based automation/parity is affected, not just this app.
