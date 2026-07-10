# Lessons — Unicode UWP→WinUI 3 migration (trial 000)

**Outcome:** score 0 / 1 feature. Builds ✓, runs ✓, but the one scenario renders a
**completely blank white client area** (score screenshots `parity/winui3/screenshots/01_*.png`
— uniform ~9 KB white vs 65 KB dark UWP golden).

## What broke
1. **Blank render despite a fully populated, correctly-arranged UIA tree.** The score
   capture (`parity/winui3/ui/01.json`) shows every control at real on-screen coords
   (`isOffscreen:false`), yet no pixels paint below the title bar. The app trips **none**
   of the three documented blank-window triggers: no `<Window.SystemBackdrop>`, no
   `<TitleBar>`, no `ExtendsContentIntoTitleBar`, and both root `Grid`s paint an opaque
   `SolidBackgroundFillColorBaseBrush`. So this is a **fourth** blank path the static
   checks don't enumerate. (Candidate contributing factor: `MainWindow.xaml.cs` navigates
   the root `Frame` inside `Window.Activated` rather than before `Activate()`.)

2. **The agent never visually verified the render.** No `winapp ui screenshot` anywhere in
   `session-log.txt`. It stopped at build PASS + `Test-AppLaunch` PASS + `Validate-UwpMigration`
   PASS. SKILL.md L134 mandates a per-scenario render check; it was skipped.

3. **Misleading validator PASS wording enabled the slip.** `Validate-UwpMigration.ps1`
   printed `[PASS] ... window will not blank in headless/VM capture` (L740) and
   `[PASS] ... page background will resolve in WinUI 3` (L758). Both are absolute promises
   the static check cannot keep — the app satisfied both and still blanked. That green
   read as "rendering verified," so the agent didn't screenshot.

4. **Theme parity dropped.** UWP source `App.xaml` has `<Application RequestedTheme="Dark">`;
   the migrated `App.xaml` omitted it, so the WinUI app follows the system/light theme
   (white client) while the golden is dark. Separate from the blank, but a real, recurring
   parity regression for UWP SDK samples.

## Key generalizable takeaway
Static "won't blank" checks can only rule out *known* triggers; they must never claim the
window renders. The only reliable proof is a per-scenario screenshot confirmed non-blank —
and the tooling must say so instead of over-promising.
