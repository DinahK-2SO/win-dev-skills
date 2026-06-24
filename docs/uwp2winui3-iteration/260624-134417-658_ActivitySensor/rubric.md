# Parity Rubric — Activity sensor (UWP → WinUI 3)

Scenario titles and controls are derived from the UWP source checklist and verified
against the running apps.

## Scenario 1 - Current activity
- Control: `ScenarioGetCurrentActivityButton` — "Get Current Activity"
- Expected: reads default ActivitySensor and displays Activity / Confidence / Timestamp.
  With no sensor present, shows "No activity sensor available on this device."

## Scenario 2 - Activity history
- Control: `ScenarioGetActivityHistoryButton` — "Get Activity History"
- Expected: queries activity history → Count / First* / Last*. No sensor → no-sensor message / "No data".

## Scenario 3 - Events
- Controls: `ScenarioEnableReadingChangedButton` ("ReadingChanged On"),
  `ScenarioDisableReadingChangedButton` ("ReadingChanged Off")
- Expected: "On" subscribes to ReadingChanged; "Off" unsubscribes.
  **"Off" is disabled by design until "On" is pressed** (`OnNavigatedTo`).

## Scenario 4 - Background activity
- Controls: `ScenarioRegisterTaskButton` ("Register Task"),
  `ScenarioUnregisterTaskButton` ("Unregister Task")
- Expected: "Register Task" registers an ActivitySensorTrigger background task (status → "Registered");
  "Unregister Task" removes it. **"Unregister" is disabled by design until registered.**
  Outcome is gated by background-access policy and sensor availability.
