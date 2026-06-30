# UWP Parity Rubric — Compass

Feature (ground truth) derived from the original UWP app at
`...\uwp-samples-standalone\Samples\Compass\cs`, which launched successfully
(`uwp-app-runner` → `ok:true`, windowTitle "Compass C# Sample").

The app is a standard SDK navigation sample: a left ListBox lists the scenarios,
the right pane hosts the selected scenario. On this machine there is **no compass
sensor**, so live sensor output is hardware-gated and the status bar reads
"No compass found" (see golden `00_launch.png`). Controls still exist and are the
parity target; data values are not.

## Scenario 1 - Data Events
- Controls: `Enable` button, `Disable` button
- Behavior: registers a `ReadingChanged` event handler; updates Magnetic North,
  True North, Heading Accuracy text blocks as readings arrive.
- Outputs: InputTextBlock, ScenarioOutput_MagneticNorth, ScenarioOutput_TrueNorth,
  ScenarioOutput_HeadingAccuracy, shared StatusBlock.

## Scenario 2 - Polling
- Controls: `Enable` button, `Disable` button
- Behavior: starts a DispatcherTimer that polls `GetCurrentReading()` and updates
  the same set of output text blocks.
- Outputs: same as Scenario 1.

## Scenario 3 - Calibration
- Controls: `High`, `Approximate`, `Unreliable` radio buttons
- Behavior: simulates calibration-accuracy states and updates the calibration UI.
- Outputs: InputTextBlock, shared StatusBlock.

## Scoring
Each migrated scenario is graded pass/partial/fail on structural control coverage
+ behavioral fidelity vs. the UWP golden. A present-but-dead control is at best
`partial`. A missing/unreachable scenario is `fail`.
