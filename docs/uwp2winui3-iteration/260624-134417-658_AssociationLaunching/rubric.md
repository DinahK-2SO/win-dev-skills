# Parity Rubric — AssociationLaunching (UWP → WinUI 3)

Ground truth: original UWP C# sample "Association Launching C# Sample" (4 scenarios).
Each scenario is graded on **structural control coverage** and **behavioral wiring**
(handlers fire), confirmed against the live UWP and the migrated WinUI 3 app via UI
Automation.

## Scenario 1 — Launching a file
Required controls: `Launch default handler`, `Launch Open With`, `Pick and launch`,
`Launch with warning`, `ViewPreference` (ComboBox), `Launch with view preference`.
Shared output: `StatusBorder` / `StatusBlock`.
Pass = all 6 controls present and launch handlers wired (file picker / launch invoked).

## Scenario 2 — Launching a URI
Required controls: `UriToLaunch` (TextBox, default `http://www.bing.com`),
`Launch default handler`, `Launch Open With`, `Launch with warning`,
`ViewPreference` (ComboBox), `Launch with view preference`.
Pass = all 6 controls present and launch handlers wired.

## Scenario 3 — Receiving a file
Required controls: `Create test file`, `Create test file with no file extension`,
`Remove test files`.
Pass = all 3 controls present and handlers wired.

## Scenario 4 — Receiving a URI
Display-only page (no interactive controls; shows a status message when the app is
activated via protocol). Pass = page reachable in navigation.

## Scoring
`score = round(100 * (pass + 0.5*partial) / 4)`.
A control present-but-dead (responds in UWP, dead in WinUI) is at best `partial`.
