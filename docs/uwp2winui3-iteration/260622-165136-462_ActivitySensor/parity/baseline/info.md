# Activity sensor — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Current activity

- **Screenshot:** `screenshots/01_Current_activity.png`
- **Page class:** `Scenario1_CurrentActivity`
- **UI elements:**
  - Button, name=ScenarioGetCurrentActivityButton, label="Get Current Activity"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_CurrentActivity.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Current Activity "Get Current Activity" (Button)
- **Output elements:** InputTextBlock, ScenarioOutput_Activity, ScenarioOutput_Confidence, ScenarioOutput_Timestamp, StatusBorder, StatusBlock

## Scenario 2 - Activity history

- **Screenshot:** `screenshots/02_Activity_history.png`
- **Page class:** `Scenario2_History`
- **UI elements:**
  - Button, name=ScenarioGetActivityHistoryButton, label="Get Activity History"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_History.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Activity History "Get Activity History" (Button)
- **Output elements:** InputTextBlock, ScenarioOutput_Count, ScenarioOutput_Activity1, ScenarioOutput_Confidence1, ScenarioOutput_Timestamp1, ScenarioOutput_ActivityN, ScenarioOutput_ConfidenceN, ScenarioOutput_TimestampN, StatusBorder, StatusBlock

## Scenario 3 - Events

- **Screenshot:** `screenshots/03_Events.png`
- **Page class:** `Scenario3_ChangeEvents`
- **UI elements:**
  - Button, name=ScenarioEnableReadingChangedButton, label="ReadingChanged On"
  - Button, name=ScenarioDisableReadingChangedButton, label="ReadingChanged Off"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_ChangeEvents.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - ReadingChanged On "ReadingChanged On" (Button)
  - ReadingChanged Off "ReadingChanged Off" (Button)
- **Output elements:** InputTextBlock, ScenarioOutput_Activity, ScenarioOutput_Confidence, ScenarioOutput_ReadingTimestamp, StatusBorder, StatusBlock

## Scenario 4 - Background activity

- **Screenshot:** `screenshots/04_Background_activity.png`
- **Page class:** `Scenario4_BackgroundActivity`
- **UI elements:**
  - Button, name=ScenarioRegisterTaskButton, label="Register Task"
  - Button, name=ScenarioUnregisterTaskButton, label="Unregister Task"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_BackgroundActivity.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Register Task "Register Task" (Button)
  - Unregister Task "Unregister Task" (Button)
- **Output elements:** InputTextBlock, ScenarioOutput_TaskRegistration, ScenarioOutput_TaskStatus, ScenarioOutput_ReportCount, ScenarioOutput_LastActivity, ScenarioOutput_LastConfidence, ScenarioOutput_LastTimestamp, StatusBorder, StatusBlock

