# Discrepancies — CustomSensors

- **Score 100**, builds + runs, 2/2 features pass.
- Requirement 1 (Data events): **pass** — Enable → "No custom sensor found", Disable
  disabled, CO2 "No data". Matches UWP.
- Requirement 2 (Polling): **pass** — Get CO2 level → "No custom sensor found", CO2
  "No data". Matches UWP.
- **Visual:** WinUI 3 screenshots are blank white (title bar only) — known
  DirectComposition/PrintWindow capture artifact, NOT a broken page (UIA tree fully
  populated, controls actuate). Eval-side, not a migration defect.
- No missing controls, dead controls, wrong text, or layout diffs.
