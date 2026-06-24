# Parity Rubric — ApplicationData (UWP → WinUI 3)

Ground truth derived from the original UWP source (`Samples/ApplicationData/cs`) and
the live UWP app. Each feature is graded **pass / partial / fail** on three axes:
structural presence (control exists in the UIA tree), behavioral fidelity (the control
responds and produces the same output the UWP handler does), and visual layout.

## Scenario 1 — Clear (`Scenario6_ClearScenario`)

| Control | Expected behavior (from UWP source) | Output element |
|---|---|---|
| `Clear` Button | `ApplicationData.Current.ClearAsync()`, then set OutputTextBlock to "ApplicationData has been cleared.  Visit the other scenarios to see that their data has been cleared." (or an error string on failure) | `OutputTextBlock` |

**Pass criteria:** Clear button present, invokable, and updates OutputTextBlock to the
cleared message.

## Scenario 2 — SetVersion (`Scenario7_SetVersion`)

| Control | Expected behavior (from UWP source) | Output element |
|---|---|---|
| `SetVersion0` Button ("Set version to 0") | `SetVersionAsync(0, ...)`, then `OutputTextBlock = "Version: " + Version` → "Version: 0" | `OutputTextBlock` |
| `SetVersion1` Button ("Set version to 1") | `SetVersionAsync(1, ...)`, then `OutputTextBlock = "Version: " + Version` → "Version: 1" | `OutputTextBlock` |

On navigation, `OnNavigatedTo` calls `DisplayOutput()` → initial text "Version: 0".
Setting the version to the value it already holds is a legitimate no-op (text unchanged).

**Pass criteria:** both buttons present, invokable, and OutputTextBlock reflects the
correct version number after each click.

## Scoring

`score = round(100 * (pass + 0.5*partial) / features_total)`, 0 if the migrated app
cannot run.
