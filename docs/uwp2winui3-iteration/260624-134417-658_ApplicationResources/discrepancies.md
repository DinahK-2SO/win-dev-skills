# Discrepancies — ApplicationResources (iteration 1)

- **Requirement #1 — FAIL.** Build OK, launch OK, UIA tree complete (Compare-Parity 4/4 structural), but the window renders **visually blank** (solid white client area, only caption buttons). Confirmed by winapp screenshot (11KB) + PrintWindow PW_RENDERFULLCONTENT (5.7KB) vs UWP golden (145KB).
  - *Suspected skill gap:* scaffold `<Window.SystemBackdrop><MicaBackdrop/>` was kept; backdrop-composited content is not captured by PrintWindow/BitBlt and diverges from the UWP's opaque background. The migration skill has no guidance to remove it / set an opaque background.

## Visual discrepancy
- **UWP:** full content (title, 13-item scenario ListBox, output, logo, footer links) — 145KB.
- **WinUI:** blank solid-white client area — 11KB (winapp) / 5.7KB (PrintWindow).

## Summary
Structurally perfect migration sunk by one generalizable defect — the scaffold MicaBackdrop makes content non-capturable and unfaithful to the UWP's opaque background.
