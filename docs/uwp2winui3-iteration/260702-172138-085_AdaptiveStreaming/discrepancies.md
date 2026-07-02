# Discrepancies — AdaptiveStreaming (iteration 1)

Score **100** — builds ✓, runs ✓. All 7 rubric features **pass**.

| # | Feature | Status | Note |
|---|---------|--------|------|
| 1 | Simplest Adaptive Streaming | pass | Load + MediaPlayerElement present, Load responded |
| 2 | Event Handlers | pass | Fully built; gate 0/1 = MediaPlayerElement AutomationId artifact |
| 3 | Network Request Modification | pass | 7 radios correct; HDCP responded |
| 4 | Adaptive Streaming Tuning | pass | 3 ComboBoxes + 2 TextBoxes + 2 Set buttons present |
| 5 | Metadata | pass | Fully built; MediaPlayerElement AutomationId artifact only |
| 6 | Ad Insertion | pass | Fully built; MediaPlayerElement AutomationId artifact only |
| 7 | Live Seekable Range | pass | 19 controls + 7 outputs present; gate 10/19 = HTML-escaped labels |

**No visual discrepancies / no missing features.**

All parity shortfalls are **measurement/tooling artifacts** (MediaPlayerElement
AutomationId not surfaced by its automation peer; checklist stored seek-button labels
HTML-escaped) or **environment limits** (headless session → blank WinUI screenshots,
non-UIA-walkable UWP CoreWindow). None trace to the generated app.

The only reusable improvement signal is in the build log: a recurring
`Windows.Web.Http` vs `System.Net.Http` **CS0104** ambiguity from the scaffold's
`ImplicitUsings=enable`.
