# Discrepancies — AssociationLaunching WinUI 3 migration vs UWP

## Measurement caveats (environment, not migration defects)

1. **UWP golden behavioral baseline unavailable.** The original UWP app launched
   successfully (PID 22640, window "AssociationLaunching C# sample") and was
   screenshotted, but its `CoreWindow` content is opaque to UI Automation when hosted
   by `ApplicationFrameHost` (the UIA tree exposes only a top-level Pane). Title-driven
   navigation and per-control actuation therefore could not be performed on the UWP, so
   the golden capture has no per-control "responded" data and scenario screenshots
   2–4 are copies of the scenario-1 frame. Only scenario 1 has a true UWP golden image.

2. **WinUI 3 screenshots render blank under PrintWindow in this non-interactive
   session.** The migrated app's content is drawn through a WinUI 3 composition
   swapchain, which `winapp`'s PrintWindow-based capture renders as blank white here
   (the same session captures the UWP app fine). `CopyFromScreen` also fails (no
   interactive desktop). Pixel-level visual fidelity therefore could NOT be confirmed
   from screenshots. Control presence and layout were instead verified directly from the
   live UIA tree (coordinates, names, types all correct).

## Automated parity-result corrections (navigation artifacts)

The automated `Compare-Parity` produced 75/100 (scenario 3 FAIL, scenario 2 5/6). Both
are **capture-navigation artifacts**, corrected by manual UIA navigation:

- The migrated app's navigation items carry the source "N) " prefix
  (e.g. "3) Receiving a file"), and the `NavigationView` pane is collapsed by default.
  The capture's exact-title `invoke "Receiving a file"` could not reach scenarios 2–4,
  so their UIA dumps did not reflect the actual page.

After opening the hamburger menu and selecting each item, every scenario was confirmed
fully present:

- **Scenario 2 "Launching a URI" — actually 6/6.** `UriToLaunch` TextBox
  (`value="http://www.bing.com"`) IS present, plus all 5 buttons/combo. The reported
  "missing TextBox" was the stale capture, not a real gap.
- **Scenario 3 "Receiving a file" — actually 3/3.** `Create test file`,
  `Create test file with no file extension`, `Remove test files` all present;
  `Create test file` fires via InvokePattern.

## Genuine observations

- **Conditional button no-ops (not regressions).** In the WinUI capture
  `Launch Open With` and `Launch with view preference` registered no visible response.
  These are conditional in the source (Open-With availability; view preference requires
  a previously picked file), and there is no UWP behavioral baseline to mark them dead.
  Per the parity rubric they are flagged for manual review, not failed.
- No missing scenarios, no missing controls, no dead navigation. Structural parity is
  100% across all 4 scenarios; file-launch buttons demonstrably open file pickers.
