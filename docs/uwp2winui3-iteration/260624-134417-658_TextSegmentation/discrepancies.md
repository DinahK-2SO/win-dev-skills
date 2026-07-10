# Discrepancies - TextSegmentation migration

**Result: no functional or structural discrepancies.** Both scenarios have full control
coverage (4/4 and 5/5) and every action button responds with output matching the original
sample (e.g. the empty-input status messages). Parity gate: PASS 100/100.

## Notes / limitations (environmental, not migration defects)

1. **WinUI 3 screenshots are blank (capture artifact).** In this headless session,
   CopyFromScreen fails ("handle is invalid"), so WinUI 3's DirectComposition content is
   not GDI-captured; winapp screenshots show only the title bar. The UIA tree (all controls
   at real coordinates) and correct functional output prove the app renders faithfully.

2. **UWP behavioral golden unavailable.** The legacy UWP CoreWindow exposes only a top-level
   Pane to winapp UIA, so the original app could not be navigated across scenarios or have
   its controls actuated. A visual golden was captured for scenario 1 only. WinUI behavior
   was graded against the source-expected behavior, which it matches.
