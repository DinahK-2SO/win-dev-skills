# Skill-defects — TouchKeyboardTextInput (index 0)

## 1. Bootstrap does not detect/recover orphaned code-behind (missing page .xaml) → WILL change skill
- **Problem:** `*.xaml.cs` copied without its `*.xaml` (markup lived only under source `obj/bin`) →
  orphaned code-behind → WMC0909/WMC1111/WMC9999 + cascading `InitializeComponent` CS0103/CS1061;
  whole app fails to build. No signal to the agent.
- **Evidence:** BOOTSTRAP "Copied 4 source files"; mapping has zero `.xaml` rows; source `.xaml`
  only at `obj\x64\Release\`; `migration-score.json` build failed with those exact codes.
- **Skill state:** absent (no orphan detection/recovery in either script; PATTERNS assumes `.xaml`
  are present in source).
- **Fix:** `Initialize-UwpMigration.ps1` step 1b recovers orphaned `.xaml` from `obj/bin`, adds
  mapping rows, warns on unresolved; new `MIGRATION-PATTERNS.md#missing-xaml` + SKILL Step 1 pointer.
- **Generalizes:** orphaned code-behind always breaks the build; common in archived/pre-built UWP
  checkouts across scenarios.
