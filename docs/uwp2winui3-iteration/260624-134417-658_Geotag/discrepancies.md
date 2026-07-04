# Parity Discrepancies — Geotag (UWP → WinUI 3)

Ground truth: original UWP app launched successfully (process `GeotagCSSample`,
window title "Geotag C# sample") and its golden frame was captured. The UWP initial
screen shows a nav pane ("Geotag C# Sample" / "1) Geotag a file"), a Description block,
and a **Choose file** button. (The other three buttons — Read geotag / Set geotag from
geolocator / Set geotag to Seattle Space Needle — appear only *after* a file is chosen,
in both the UWP and WinUI apps, so they are not present in the initial-state capture of
either.)

## Scenario 1 — "Geotag a file"  → FAIL

| # | Discrepancy | Severity | Evidence |
|---|-------------|----------|----------|
| 1 | **Migrated WinUI 3 window renders completely BLANK WHITE.** The entire content area is unpainted — the nav pane, "Geotag C# Sample" title, scenario list, "Description:" text, and the "Choose file" button are all invisible, even though they exist in the UIA/visual tree. The UWP golden paints all of these correctly. | **Critical** | UWP: `parity/baseline/screenshots/01_Geotag_a_file.png` (fully rendered). WinUI: `parity/winui3/screenshots/01_Geotag_a_file.png` and `notes/winui-live-recheck.png` (blank white). |
| 2 | Structural control coverage 1/4 in the initial capture. Only "Choose file" is present in the WinUI UIA tree; the remaining three buttons are file-gated in both apps and not evaluable in the initial state. | Info (capture limitation, not clearly a defect) | `parity/winui3/parity-result.json` (coverage 0.25). |

## Behavioral notes

- WinUI "Choose file" **did respond** — invoking it opened a Windows file `Open`
  dialog (`parity/winui3/screenshots/01_Geotag_a_file__a01_Choose_file.png`), and the
  capture recorded +68 new text tokens. So the control is wired up logically.
- The other three WinUI buttons could not be actuated because they are not present until
  a file is loaded (file-picker interaction is not scriptable headlessly).
- UWP golden button actuation was not possible: a UWP CoreWindow is hosted by
  `ApplicationFrameHost` and exposes no child elements through the UIA path
  (`parity/baseline/ui/01.json` shows only the CoreWindow Pane), so no UWP behavioral
  baseline for the buttons exists. This is a UWP UIA limitation, not evidence the UWP
  controls are dead — the tool did not (and could not) flag any behavioral regression.

## Verdict rationale

The dominant, decisive discrepancy is #1: the migrated app presents a **blank white
window** to the user. A page that renders empty is, per the parity rule, indistinguishable
from a crash and scores FAIL regardless of the logical control tree. The migration is
therefore not a faithful visual replica of the UWP app.
