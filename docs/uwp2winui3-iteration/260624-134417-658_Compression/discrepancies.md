# Discrepancies — Compression (UWP → WinUI 3)

**Score:** 50 (PARTIAL). **Builds:** true. **Runs:** true.

| Feature | Status | Reason |
|---|---|---|
| Compression/Decompression sample | partial | Structurally + behaviorally faithful (coverage 2/2, live FileOpenPicker, ComboBox expands, verbatim logic). PARTIAL only because every WinUI 3 window capture rendered blank, so visual parity vs the UWP golden could not be confirmed. |

## Visual discrepancies
- **Main window:** UWP golden 48 KB full content vs WinUI 3 blank-white 7 KB.
- **ComboBox dropdown:** WinUI 3 PopupHost renders solid black.

## Root cause
WinUI 3 DirectComposition/swapchain content did not composite to a surface that the
PrintWindow-based capture tool could read in this headless/non-interactive session. The
UWP golden and the native file-open dialog captured fine. **This is an environment / eval
capture limitation, not a migration defect** — the migration skill produced a faithful,
live app (see lessons.md). No migration-skill change can guarantee capture in this mode;
recorded as `deferred_to_human`.
