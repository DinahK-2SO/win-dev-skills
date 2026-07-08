# PowerGrid — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Find best time

- **Screenshot:** `screenshots/01_Find_best_time.png`
- **Page class:** `Scenario1_FindBest`
- **UI elements:**
  - TextBox, name=HoursAheadTextBox, label="12"
  - CheckBox, name=LowUXImpactCheckBox, label="Restrict to low user experience impact"
  - Button, name=FindBest, label="Find best time"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_FindBest.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Find best time "Find best time" (Button)
- **Output elements:** HoursAheadTextBox, BestTimeRun, LowestSeverityRun, StatusBorder, StatusBlock

## Scenario 2 - Display full forecast

- **Screenshot:** `screenshots/02_Display_full_forecast.png`
- **Page class:** `Scenario2_PrintFullForecast`
- **UI elements:**
  - Button, label="Get forecast"
  - ListView, name=ForecastList
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_PrintFullForecast.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get forecast "Get forecast" (Button)
- **Output elements:** ForecastStartTimeRun, ForecastBlockDurationRun, StatusBorder, StatusBlock

