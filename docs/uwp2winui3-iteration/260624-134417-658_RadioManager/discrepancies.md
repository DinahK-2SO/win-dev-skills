# RadioManager — Parity Discrepancies

**Score 75/100** · builds ✓ · runs ✓ · 3/4 features pass

## Requirements
- ✅ **Toggle Radios nav item** — both apps list '1) Toggle Radios' and open the page.
- ✅ **Scenario description** — 'Description:' + text present in both.
- ✅ **Radio list** — empty in both (radio access denied on this machine = ground truth).
- ❌ **Status notification area** — `StatusPanel` defined in `MainPage.xaml` but **absent
  from the WinUI render/UIA tree**; present in the UWP golden.
  - *Suspected skill gap:* SDK-sample content region places a persistent bottom status bar
    with a `RelativePanel` fill-graph (`Frame Above=StatusPanel` + `StatusPanel
    AlignBottomWithPanel`) that WinUI 3 does not reliably lay out; neither the layout
    guidance nor the render-verification guidance calls out persistent shell chrome.

## Visual discrepancies
- **status-notification (major):** UWP shows 'Status:' + error banner; WinUI shows nothing.
  (`ui/01.json`: StatusLabel present in baseline, absent in winui3.)
- **shell theme/logo (cosmetic):** UWP dark + footer logo; WinUI light, logo absent.

## Missing features
- Persistent Status/NotifyUser area.
