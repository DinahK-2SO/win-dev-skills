# Pedometer — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Events

- **Screenshot:** `screenshots/01_Events.png`
- **Page class:** `Scenario1_Events`
- **UI elements:**
  - Button, name=RegisterButton, label="Register ReadingChanged", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_Events.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Register ReadingChanged "Register ReadingChanged" (Button)
- **Output elements:** ScenarioOutput_Timestamp, ScenarioOutput_TotalStepCount, ScenarioOutput_UnknownCount, ScenarioOutput_WalkingCount, ScenarioOutput_RunningCount, ScenarioOutput_UnknownDuration, ScenarioOutput_WalkingDuration, ScenarioOutput_RunningDuration, StatusBlock, StatusBorder

## Scenario 2 - History

- **Screenshot:** `screenshots/02_History.png`
- **Page class:** `Scenario2_History`
- **UI elements:**
  - RadioButton, name=AllHistory, events=Checked
  - RadioButton, name=SpecificHistory, events=Checked
  - DatePicker, name=FromDate
  - TimePicker, name=FromTime
  - DatePicker, name=ToDate
  - TimePicker, name=ToTime
  - Button, name=GetHistory, label="Get History", events=Click
  - ListView, name=historyRecordsList
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_History.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - AllHistory (RadioButton)
  - SpecificHistory (RadioButton)
  - Get History "Get History" (Button)
- **Output elements:** StatusBlock, StatusBorder

## Scenario 3 - Current step count

- **Screenshot:** `screenshots/03_Current_step_count.png`
- **Page class:** `Scenario3_CurrentStepCount`
- **UI elements:**
  - Button, name=GetCurrentButton, label="Get steps count", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_CurrentStepCount.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get steps count "Get steps count" (Button)
- **Output elements:** ScenarioOutput_Timestamp, ScenarioOutput_TotalStepCount, StatusBlock, StatusBorder

## Scenario 4 - Background Pedometer

- **Screenshot:** `screenshots/04_Background_Pedometer.png`
- **Page class:** `Scenario4_BackgroundPedometer`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_BackgroundPedometer.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

