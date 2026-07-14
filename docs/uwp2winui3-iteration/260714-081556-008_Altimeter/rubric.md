# UWP Feature Rubric — Altimeter

**Scenario:** Altimeter
**UWP capture status:** partial — the original UWP app launched (`uwp-app-runner` `ok:true`, pid/window alive) but hung on the SDK "Universal Windows Platform sample" extended-splash screen across two fresh launches (20s settle). MainPage never presented and the CoreWindow content pane stayed empty in the UIA tree, so the golden frames show only the splash and no feature controls could be exercised. The source-derived checklist is used as the structural ground truth.

## Scenarios / Scenario 1 - Data Events

**ID:** `data-events`
**Weight:** 2

Registers an event listener for altimeter data and displays the change in height in meters as reports arrive. Enable begins the subscription; Disable ends it.

**Expected behaviour:**
- Scenario list shows `1) Data Events` and it is navigable
- Description text about registering an event listener is shown
- Enable and Disable buttons present; Disable disabled until Enable pressed
- `Altitude change(m):` shows `No data` before any reading
- With no altimeter, Status shows `No altimeter found` (defensive fallback), not blank/crash

**UWP reference screenshot:**
_UWP feature screenshot not captured (app hung on extended splash; `parity/baseline/screenshots/01_Data_Events.png` shows the splash only)_

## Scenarios / Scenario 2 - Polling

**ID:** `polling`
**Weight:** 1

Polls for altimeter data on demand and displays the change in height in meters.

**Expected behaviour:**
- Scenario list shows `2) Polling` and it is navigable
- Description text about polling is shown
- Get Data button present and invokable
- `Altitude change(m):` shows `No data` before any reading
- With no altimeter, Status shows `No altimeter found` (defensive fallback), not blank/crash

**UWP reference screenshot:**
_UWP feature screenshot not captured (app hung on extended splash; `parity/baseline/screenshots/02_Polling.png` shows the splash only)_

---

RUBRIC COMPLETE: 2 features
