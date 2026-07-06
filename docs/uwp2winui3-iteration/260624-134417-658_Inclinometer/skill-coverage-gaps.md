# Skill coverage gaps (present but unclear → WILL change skill)

## 1. 0xC000027B guidance omits the init-order navigation race — UNDER-EMPHASIZED
- **Problem:** The `0xC000027B` startup crash was the static-window init-order race (page read `App.MainWindow` before `OnLaunched` assigned it), but the skill's `0xC000027B` guidance names only "legacy projection/activation incompatibility → defer the API".
- **Evidence:** mig turns ~70-80 — crash `0xC000027B` (module Microsoft.UI.Xaml.dll); first fix attempt navigated from `App.OnLaunched` (CS0122) before landing on `MainWindow.Activated` deferral. Skill: PATTERNS.md line 432 (0xC000027B row) and Test-AppLaunch.ps1 line 209.
- **Covered at:** The fix itself IS documented at `#windowing` (lines ~291-334) and the `E_POINTER` (0x80004003) row already links there — but the `0xC000027B` row/hint do not.
- **Improvement:** Add the init-order race as a cause on the `0xC000027B` table row and the Test-AppLaunch.ps1 `0xc000027b` hint, cross-linking `#windowing`, alongside the existing defer cause.
- **Generalizes:** A stowed exception from `Frame.Navigate` during `MainWindow` construction is a common WinUI 3 face of the same race that also appears as `E_POINTER`; the fix must be reachable from both codes.
