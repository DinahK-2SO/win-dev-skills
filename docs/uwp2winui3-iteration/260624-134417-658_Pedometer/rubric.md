# Parity Rubric — Pedometer (UWP → WinUI 3)

Derived from the UWP source feature checklist (4 scenarios) and graded against the live
UWP golden capture. Each scenario is judged on: (a) structural control coverage,
(b) behavioral response of its action controls vs the UWP golden, and (c) visual layout.

| # | Scenario | Key controls | Actions to actuate | Pass criteria |
|---|----------|--------------|--------------------|---------------|
| 1 | Events | RegisterButton; 8 output TextBlocks; step-type table | Register ReadingChanged | Button present + responds; table + outputs render |
| 2 | History | AllHistory / SpecificHistory radios; From/To DatePicker+TimePicker; GetHistory; results ListView | AllHistory, SpecificHistory, Get History | Radios toggle; specific-range reveals pickers; Get History updates status |
| 3 | Current step count | GetCurrentButton; Timestamp + TotalStepCount outputs | Get steps count | Button present + responds; outputs + status render |
| 4 | Background Pedometer | Register/Unregister Task buttons; status fields | (none in checklist) | Buttons + status fields render (device-gated) |

Scoring: `round(100 * (pass + 0.5*partial) / 4)`.
