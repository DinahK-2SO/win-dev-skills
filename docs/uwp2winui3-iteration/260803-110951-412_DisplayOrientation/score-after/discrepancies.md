# Discrepancies - DisplayOrientation

No discrepancies found.

## Scenario 1 - Show and lock orientation
- Structural: 5/5 controls present in WinUI UIA tree (Prefer landscape/portrait/landscape flipped/portrait flipped checkboxes + Apply preferences button).
- Output text matches UWP golden: Native orientation: Landscape, Current orientation: Landscape, Auto-rotation preferences: None.
- Behavioral: 'Apply preferences' responded=false in BOTH UWP golden and WinUI candidate (0 new tokens). This is device-gated behavior (no physical rotation), identical between the two, so NOT a regression.
- Visual: layout, navigation list, description paragraph, footer all match the golden.
