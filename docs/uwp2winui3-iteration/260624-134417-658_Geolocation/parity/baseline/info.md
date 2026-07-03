# Geolocation — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Track position

- **Screenshot:** `screenshots/01_Track_position.png`
- **Page class:** `Scenario1_TrackPosition`
- **UI elements:**
  - Button, name=StartTrackingButton, label="Start Tracking"
  - Button, name=StopTrackingButton, label="Stop Tracking"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_TrackPosition.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start Tracking "Start Tracking" (Button)
  - Stop Tracking "Stop Tracking" (Button)
- **Output elements:** ScenarioOutput_Status, ScenarioOutput_Latitude, ScenarioOutput_Longitude, ScenarioOutput_Accuracy, ScenarioOutput_Source, ScenarioOutput_IsRemoteSource, LocationDisabledMessage, StatusBorder, StatusBlock

## Scenario 2 - Get position

- **Screenshot:** `screenshots/02_Get_position.png`
- **Page class:** `Scenario2_GetPosition`
- **UI elements:**
  - TextBox, name=DesiredAccuracyInMeters, label="0"
  - Button, name=GetGeolocationButton, label="Get Geolocation"
  - Button, name=CancelGetGeolocationButton, label="Cancel"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_GetPosition.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Geolocation "Get Geolocation" (Button)
  - Cancel "Cancel" (Button)
- **Output elements:** DesiredAccuracyInMeters, Label_DilutionOfPrecision, Label_PosPrecision, Label_HorzPrecision, Label_VertPrecision, Label_GeomPrecision, Label_TimePrecision, ScenarioOutput_Latitude, ScenarioOutput_Longitude, ScenarioOutput_Accuracy, ScenarioOutput_Source, ScenarioOutput_IsRemoteSource, ScenarioOutput_PosPrecision, ScenarioOutput_HorzPrecision, ScenarioOutput_VertPrecision, ScenarioOutput_GeomPrecision, ScenarioOutput_TimePrecision, LocationDisabledMessage, StatusBorder, StatusBlock

## Scenario 3 - Background position

- **Screenshot:** `screenshots/03_Background_position.png`
- **Page class:** `Scenario3_BackgroundTask`
- **UI elements:**
  - Button, name=RegisterBackgroundTaskButton, label="Register"
  - Button, name=UnregisterBackgroundTaskButton, label="Unregister"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_BackgroundTask.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Register "Register" (Button)
  - Unregister "Unregister" (Button)
- **Output elements:** InputTextBlock, ScenarioOutput_Latitude, ScenarioOutput_Longitude, ScenarioOutput_Accuracy, StatusBorder, StatusBlock

## Scenario 4 - Foreground geofencing

- **Screenshot:** `screenshots/04_Foreground_geofencing.png`
- **Page class:** `Scenario4_ForegroundGeofence`
- **UI elements:**
  - TextBox, name=Id, label="(Required)"
  - Button, name=SetPositionToHereButton, label="Set to Here"
  - TextBox, name=Latitude, label="(Required)"
  - TextBox, label="(Required)"
  - TextBox, name=Radius, label="(Required)"
  - TextBox, name=DwellTime
  - RadioButton, name=StartImmediately
  - RadioButton, name=StartAtSpecificTime
  - DatePicker, name=StartDate
  - TimePicker, name=StartTime
  - CheckBox, name=SingleUse, label="Single Use"
  - Button, name=CreateGeofenceButton, label="Create Geofence"
  - ListBox, name=RegisteredGeofenceListBox
  - Button, name=RemoveGeofenceItem, label="Remove Geofence"
  - ListBox, name=GeofenceEventsListBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_ForegroundGeofence.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Set to Here "Set to Here" (Button)
  - StartImmediately (RadioButton)
  - StartAtSpecificTime (RadioButton)
  - Create Geofence "Create Geofence" (Button)
  - Remove Geofence "Remove Geofence" (Button)
- **Output elements:** Id, Latitude, Radius, DwellTime, StatusBorder, StatusBlock

## Scenario 5 - Background geofencing

- **Screenshot:** `screenshots/05_Background_geofencing.png`
- **Page class:** `Scenario5_GeofenceBackgroundTask`
- **UI elements:**
  - Button, name=RegisterBackgroundTaskButton, label="Register"
  - Button, name=UnregisterBackgroundTaskButton, label="Unregister"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario5_GeofenceBackgroundTask.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Register "Register" (Button)
  - Unregister "Unregister" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 6 - Get last visit

- **Screenshot:** `screenshots/06_Get_last_visit.png`
- **Page class:** `Scenario6_GetLastVisit`
- **UI elements:**
  - Button, name=GetLastVisitButton, label="Get last Visit"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario6_GetLastVisit.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get last Visit "Get last Visit" (Button)
- **Output elements:** ScenarioOutput_VisitStateChange, ScenarioOutput_Timestamp, ScenarioOutput_Latitude, ScenarioOutput_Longitude, ScenarioOutput_Accuracy, ScenarioOutput_IsRemoteSource, LocationDisabledMessage, StatusBorder, StatusBlock

## Scenario 7 - Foreground visit monitoring

- **Screenshot:** `screenshots/07_Foreground_visit_monitoring.png`
- **Page class:** `Scenario7_ForegroundVisits`
- **UI elements:**
  - Button, name=StartMonitoringButton, label="Start Monitoring"
  - Button, name=StopMonitoringButton, label="Stop Monitoring"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario7_ForegroundVisits.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start Monitoring "Start Monitoring" (Button)
  - Stop Monitoring "Stop Monitoring" (Button)
- **Output elements:** ScenarioOutput_VisitStateChange, ScenarioOutput_Timestamp, ScenarioOutput_Latitude, ScenarioOutput_Longitude, ScenarioOutput_Accuracy, ScenarioOutput_IsRemoteSource, LocationDisabledMessage, StatusBorder, StatusBlock

## Scenario 8 - Background visit monitoring

- **Screenshot:** `screenshots/08_Background_visit_monitoring.png`
- **Page class:** `Scenario8_VisitsBackgroundTask`
- **UI elements:**
  - Button, name=RegisterBackgroundTaskButton, label="Register"
  - Button, name=UnregisterBackgroundTaskButton, label="Unregister"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario8_VisitsBackgroundTask.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Register "Register" (Button)
  - Unregister "Unregister" (Button)
- **Output elements:** InputTextBlock, StatusBorder, StatusBlock

