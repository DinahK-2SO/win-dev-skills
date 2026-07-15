# Dev-Agent Slips (skill already adequate → NO skill change)

## 1. Defensive-disabled Enable/Disable buttons (benign, non-scoring)
- **Problem:** WinUI disables Enable/Disable with no sensor; UWP leaves Enable clickable (same net outcome).
- **Evidence:** score notes discrepancies.json (minor, downgrade:false); both features still pass, 100/100.
- **Covered clearly at:** SKILL.md:178 (preserve controls/handlers verbatim, transform) and SKILL.md:102 (preserve structure faithfully).
- **Slip type:** one-off-mistake — benign, hardware-gated, scenario-specific. No control dropped, outcome identical, score unaffected. Not worth a skill edit.
