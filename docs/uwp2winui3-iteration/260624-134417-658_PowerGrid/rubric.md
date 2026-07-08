# PowerGrid — UWP feature rubric

Ground-truth reference for scoring the migrated WinUI 3 app.

**UWP capture status:** _partial_ — the original UWP app **launched** (`uwp-app-runner`
`ok:true`, PID 44344, window "PowerGrid C# Sample") and its **Scenario 1 default view was
captured** via winapp PrintWindow. Per-scenario navigation and per-control actuation could
**not** be automated: the .NET Native UWP CoreWindow exposes an empty UIA subtree to
automation and this session's window station cannot inject synthetic input. Expected
per-control behaviour was derived from the UWP source and verified against the WinUI app's
live UIA output.

## Navigation / Scenario navigation list

**ID:** `nav-scenario-list`
**Weight:** 1

Left-hand list exposing the two scenarios. Selecting an item swaps the content pane.

**Expected behaviour:**
- Both scenario titles appear verbatim in the navigation list
- Selecting a scenario navigates to its page and updates the content pane

**UWP reference screenshot:**
![nav-scenario-list](screenshots/01_Find_best_time.png)

## Scenario 1 - Find best time / Find best time computation

**ID:** `find-best-time`
**Weight:** 2

'Hours to look ahead' TextBox (default 12), 'Restrict to low user experience impact'
CheckBox (checked), 'Find best time' Button, and Best time / Lowest severity output Runs.
Clicking calls `PowerGridForecast.GetForecast()`; if no good time is found (or the forecast
is empty) the status reads **"Unable to find a good time to do work"**.

**Expected behaviour:**
- TextBox defaults to '12'
- CheckBox present and checked by default
- Clicking 'Find best time' produces a visible response (best time+severity OR the status)
- Best time / Lowest severity output labels present

**UWP reference screenshot:**
![find-best-time](screenshots/01_Find_best_time.png)

## Scenario 2 - Display full forecast / Full forecast list

**ID:** `display-full-forecast`
**Weight:** 2

'Get forecast' Button and a ForecastList (ListView). Clicking calls
`PowerGridForecast.GetForecast()`; if empty, status reads **"No forecast available. Try
again later."**, otherwise the list is filled with Date/Time, Severity, Low impact? rows.

**Expected behaviour:**
- 'Get forecast' button present
- Clicking produces a visible response (populated list OR the status)
- Forecast start time / block duration labels present
- ForecastList control present

**UWP reference screenshot:**
_UWP Scenario 2 screenshot not captured (UWP app not automatable in this session — see capture status)._

---

RUBRIC COMPLETE: 3 features
