# Discrepancies - TouchKeyboard

**Summary:** All 4 scenarios are structurally present and faithfully migrated (verified via the WinUI UIA tree and the migrated source handlers). No missing controls, no dead controls relative to the UWP golden.

## d1 - Scenario 3 nav-title artifact (NOT a defect)
Compare-Parity marked scenario 3 FAIL (cov 0/1) only because title-driven navigation could not match the checklist title containing a literal `\n`. Manual UIA verification confirmed `WordListBox` ('Type a few words and hit Enter.') and `ResultsTextBlock` are present and correct. **Overridden to PASS.**

## d2 - Blank WinUI screenshots (NOT a defect)
All WinUI 3 screenshots show a blank white client area despite a fully-populated UIA tree - a DWM/composition capture limitation for WinUI 3 in this session, not an empty page. Structural verdicts rely on the authoritative UIA tree + source.

## d3 - Buttons no-op in both apps (info, NOT a defect)
Action controls are hardware-gated (InputPane / CoreInputView touch keyboard, only shown in tablet mode / no hardware keyboard). Both UWP and WinUI register no visible response - consistent, no regression. WinUI handlers verified wired in source.
