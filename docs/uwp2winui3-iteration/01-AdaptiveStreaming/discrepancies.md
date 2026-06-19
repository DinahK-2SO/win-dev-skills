# Discrepancies — AdaptiveStreaming (iteration 1)

## Score: 21/100 | Builds: ✅ | Runs: ✅

## Summary

All 7 requirements FAIL due to a single root cause: `SharedContent/xaml/Styles.xaml` was not included in the WinUI 3 app. Every scenario page references `{StaticResource SampleHeaderTextStyle}` and `{StaticResource ScenarioDescriptionTextStyle}` → runtime XamlParseException on navigation → empty content frames.

## Requirements

| ID | Status | Reason |
|----|--------|--------|
| 1 | ❌ fail | Scenario 1 frame empty — XamlParseException from missing styles |
| 2 | ❌ fail | Scenario 2 frame empty — same root cause |
| 3 | ❌ fail | Scenario 3 frame empty — same root cause |
| 4 | ❌ fail | Scenario 4 frame empty — same root cause |
| 5 | ❌ fail | Scenario 5 frame empty — same root cause |
| 6 | ❌ fail | Scenario 6 frame empty — same root cause |
| 7 | ❌ fail | Scenario 7 frame empty — same root cause |

## Visual Discrepancies

- **Scenario content area**: UWP shows full page content (controls, media player). WinUI 3 shows blank white space. See `screenshots/winui3-scenario-navigation.png`.

## Missing Features

All scenario-level content is unreachable due to the navigation failure:
- MediaPlayerElement with transport controls
- ContentSelector (ComboBox + Load buttons)
- LogView (event logging)
- Bitrate indicators, radio buttons, ComboBoxes, sliders, seek buttons
