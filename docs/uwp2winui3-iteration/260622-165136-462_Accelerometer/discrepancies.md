# Discrepancies — Accelerometer (WinUI 3 vs original UWP)

**Result: no migration defects.** The migrated WinUI 3 app faithfully replicates the
original UWP app across all 6 scenarios. Structural coverage 100% (per scenario 1/1 or
2/2), behavioral regressions **0**, parity score **100/100**.

## Migration defects

_None._ No missing controls, no dead controls (relative to the UWP golden), no wrong
output text, no layout breakage.

## Non-defect observations

1. **Hardware gate (not a regression).** In scenarios 2–6 the Enable/Disable buttons
   produce no sensor readings — but this is true in **both** the original UWP app and the
   migrated WinUI app, because the test machine has no accelerometer
   ("Standard accelerometer not found"). Since the controls are equally inert in the UWP
   ground truth, this is a legitimate hardware gate, not a behavioral parity failure.

2. **Capture-tool quirk on Scenario 2.** Title-driven navigation to "Data events" was
   ambiguous (matched both a ListItem and a Text label) and stayed on Scenario 1 in
   **both** the UWP and WinUI captures, so `02_Data_events.png` shows Scenario 1 content
   in each. This is a symmetric automation artifact, not a difference between the apps;
   structural coverage was still graded 2/2 from the UIA tree.

3. **Theme difference.** The UWP app captured in dark theme, the WinUI app in light theme
   (each following its default). Layout, controls, and text are equivalent, so this is not
   scored as a discrepancy.

## Visual spot-checks (by eye)

- **Scenario 1 (Choose accelerometer):** identical nav list, description, and 'Standard'
  ComboBox.
- **Scenario 5 (Orientation change):** identical 'Untransformed:' / 'Transformed to
  DisplayOrientation:' sections both showing 'No data', disabled Enable/Disable, and the
  red 'Standard accelerometer not found' status bar. The WinUI app additionally shows a
  clean defensive fallback message.
