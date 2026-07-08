# Discrepancies — Package (iteration 1)

Score **100**, builds ✓, runs ✓. All 3 requirements PASS.

| # | Requirement | Status | Note |
|---|-------------|--------|------|
| 1 | Identity | pass | Full identity + superset fields, UWP values matched |
| 2 | Installed Location | pass | Path points at WinUI package's own AppX folder (correct) |
| 3 | Dependencies | pass | Live list; WindowsAppRuntime dep vs UWP native deps (expected) |

**Visual:** global theme — UWP dark vs WinUI light (cosmetic; capture-environment default; source set no RequestedTheme).

**Missing features:** none.

The only actionable improvement is a validator false-WARN (see `skill-defects.json`), not an app-output gap.
