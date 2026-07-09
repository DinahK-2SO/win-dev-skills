# Dev-Agent Slips → NO skill change

## 1. Empty radio list (not a defect)
- Empty in **both** apps — radio access denied / no controllable radios on this machine.
  WinUI `OnNavigatedTo` mirrors the UWP handler; empty state = correct ground truth.
- Covered at: SKILL.md Step 1 fidelity rules. No change.

## 2. Theme + footer logo (cosmetic)
- WinUI light vs UWP dark; footer Microsoft logo absent from tree. Not a scored requirement.
- Covered at: PATTERNS.md `DynamicResource -> ThemeResource` / theme-brush remapping;
  Package.appxmanifest asset reconciliation. No change.
