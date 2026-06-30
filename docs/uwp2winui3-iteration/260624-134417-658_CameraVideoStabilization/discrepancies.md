# Discrepancies — CameraVideoStabilization (WinUI 3 vs UWP golden)

Score **0 / 1 FAIL**. Builds ✅, runs ✅ (process-alive), but the page renders **blank**.

| # | Type | Severity | Description |
|---|------|----------|-------------|
| 1 | Blank render | **high** | Migrated content area is fully blank/white in two byte-identical captures (7,464 bytes). The `StatusText` fallback is present in the UIA tree with full text but **not visibly rendered**. UWP golden shows a gray preview with two visible buttons. A blank-rendering scenario is a parity FAIL. |
| 2 | Layout | medium | `VsToggleButton` + `VideoButton` anchored `HorizontalAlignment="Right"` land at x=1248 (width 120) in a 1280-wide window → clipped at the right edge. UWP golden shows them inside the window. |
| 3 | Deferred functionality | medium | Camera preview / VS toggle / recording deferred (no WinUI 3 desktop equivalent). `*_Click` handlers are empty no-ops, buttons `IsEnabled=False`. **Matches** the UWP golden (disabled on a camera-less machine), so not a *new* behavioral regression. |

## Suspected skill gap (drives the improvement)
The skill correctly says **defer `CaptureElement` and don't fake the type**
(`PATTERNS.md#capture`) and separately says **swap to a visible fallback when init
throws** (`SKILL.md` Defensive UI). But a page whose hero control was **deferred** does
not throw, so neither piece fires: the agent left the only visible content to
`OnNavigatedTo` and the page rendered blank. **Generalizable across every SDK sample
whose page is built around a single unsupported hero control** (CaptureElement,
InkCanvas, MapControl, …).
