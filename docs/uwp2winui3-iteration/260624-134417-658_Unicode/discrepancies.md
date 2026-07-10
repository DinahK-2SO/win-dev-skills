# Discrepancies — Unicode migration (000_Unicode) vs UWP golden

## Scenario 1 — Tokenize lexical identifiers within a string  →  FAIL (visual)

| Aspect | UWP golden | WinUI 3 candidate | Verdict |
|---|---|---|---|
| Page renders | Full page: nav list, "Description:" header, description text, multiline input textbox (pre-seeded Unicode sample), "Extract Identifiers" button, Microsoft footer | **Blank white client area** — nothing painted below the title bar | **FAIL** |
| Structural control coverage | n/a | 2/2 controls present in UIA tree | pass |
| Behavioral (Extract Identifiers) | Button not registerable via UWP ApplicationFrameHost UIA peer (invokeOk=false) — golden behavioral signal unreliable | Button invoked, +1 output token recorded in automation tree | inconclusive vs golden |

### Key discrepancy
The migrated WinUI 3 app **renders a completely blank window**. Confirmed across three
independent screenshots (`parity/winui3/screenshots/01_*.png`,
`screenshots/winui_recheck.png`, `screenshots/winui_repaint.png`) — all ~9 KB uniform
white frames vs the 65 KB UWP golden. The automation (UIA) tree IS populated
(Description text, nav pane, splitter, panes at real coordinates) and the Extract
Identifiers handler is functionally wired (produces an output token in the tree), but
**no pixels paint** in the client area. To a user the app shows an empty page — the input
textbox, the sample text, the button, and any output are all invisible.

This is precisely the "compiles, launches, structural gate passes, but the scenario is
visually absent" failure. Per the parity rubric, a blank frame is a FAIL regardless of the
structural/behavioral gate — the automation tree cannot substitute for a rendered UI.

### Structural gate note
`Compare-Parity.ps1` reported PASS (100/100, cov 2/2, actions 1/1 live) because it grades
the UIA tree + invoke response, not painted pixels. The gate is necessary but not
sufficient; visual judgment governs and downgrades this scenario to FAIL.
