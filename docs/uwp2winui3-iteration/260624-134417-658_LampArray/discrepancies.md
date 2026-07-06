# Parity discrepancies — LampArray (trial 1)

score 0 · builds=true · runs=true

| # | Feature | Status | Why |
|---|---------|--------|-----|
| 1 | LampArray Basics | fail | 6/6 controls in UIA tree, valid layout, but page paints blank white. |
| 2 | LampArray Effects | fail | 4/4 controls in UIA tree but page paints blank white. |

## Visual
- **Basics:** UWP shows the full populated page (radios, Brightness slider, Apply,
  "Attached LampArrays: 0"); WinUI shows a uniform blank white client area, only OS
  caption buttons render.
- **Effects:** UWP shows Pause/Play/Stop + image surface; WinUI blank white.

## Suspected skill gap
Blank-window guidance covers only `<Window.SystemBackdrop>`. The sibling scaffold-added
composition-dependent chrome (`ExtendsContentIntoTitleBar` + the new `TitleBar` control)
that also blanks the whole window in headless/automated capture is not covered. The agent
removed the Mica backdrop, the validator reported PASS, and a still-blank window shipped.

Action deadness (0 controls responded) is **hardware-gated** — the UWP golden also recorded
0 responses because no LampArray hardware is attached — so it is not counted as a regression.
