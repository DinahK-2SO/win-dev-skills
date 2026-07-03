# Discrepancies — DpiScaling (index 0)

Score **100**, builds ✅, runs ✅. No structural/behavioral discrepancies.

| # | Requirement | Status | Note |
|---|-------------|--------|------|
| 0 | Scenario navigation list | pass | Both items present, navigation works |
| 1 | Load images for different scales | pass | Scale/DPI readout + all image demos present |
| 2 | Override default scaling | pass | All Default*/Override* DPI values correct |

**Measurement caveats (eval-instrument limits, not migration defects):**
- WinUI 3 swap-chain screenshots blank in headless session → fidelity verified via UIA.
- UWP Scenario-2 golden not capturable (opaque CoreWindow UIA + no mouse injection).

Only skill-relevant finding: driver self-derived the DPI-specific `DisplayInformation` mappings because the skill documents only the orientation path.
