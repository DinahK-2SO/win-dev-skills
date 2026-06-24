# Discrepancies — Altimeter (score 0/2, builds ✓, runs ✓)

| # | Requirement | Status | Why |
|---|-------------|--------|-----|
| 0 | Scenario navigation list | pass | Shell nav present, verbatim titles |
| 1 | Data Events: Enable button | **fail** | Absent — hidden by fallback swap |
| 2 | Data Events: Disable button | **fail** | Absent — hidden by fallback swap |
| 3 | Data Events: Altitude output | **fail** | Hidden by fallback swap |
| 4 | Polling: Get Data button | **fail** | Absent — same defect in Scenario2 |
| 5 | Status region | partial | Present, but driving controls gone |

## Visual
- **Data Events** — UWP: Enable+Disable buttons and "Altitude change(m):"; WinUI: only
  *"This sample requires an altimeter device that is not available on this machine."*
- **Polling** — UWP: "Get Data" button; WinUI: same global fallback.

## Root cause
A fabricated device-presence fallback (`ShowFallback`) collapses `MainContent` and shows
`FallbackText` whenever `Altimeter.GetDefault()` is null. This came straight from `SKILL.md`'s
"Defensive UI" rule ("swap the page's main content for the fallback"). The original UWP keeps
controls visible and reports absence via the status line.
