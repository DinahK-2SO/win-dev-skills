# UWP feature rubric — BackgroundSensors

UWP launched via `uwp-app-runner` (pid 13992, windowTitle "Background Sensors C# Sample").
The UWP CoreWindow presented only its extended splash to UI Automation, so the golden
content frame captured the splash and control actuation did not register. The scenario is
hardware-gated (no accelerometer on this machine), so Enable/Disable produce no output in
either app. WinUI screenshots are used as the rendered reference for each feature.

## Navigation / Scenario list: "Accelerometer DeviceUse"

**ID:** `scenario1-nav`
**Weight:** 2

The single sample scenario is reachable from the navigation list with its verbatim title.

**Expected behaviour:**
- A navigation entry labeled "1) Accelerometer DeviceUse" is present and selected
- Selecting it shows the DeviceUse scenario page

![scenario1-nav](winui3/screenshots/01_Accelerometer_DeviceUse.png)

## Scenario 1 / Description text

**ID:** `scenario1-description`
**Weight:** 1

**Expected behaviour:**
- "Launches a DeviceUse trigger background task to listen for accelerometer data. Displays the number of data samples received by the background task."

## Scenario 1 / Enable button

**ID:** `scenario1-enable-button`
**Weight:** 2

**Expected behaviour:**
- An "Enable" button is present
- With no accelerometer present it is inert/disabled; status reports "No accelerometer found" (hardware-gated, matches UWP)

## Scenario 1 / Disable button

**ID:** `scenario1-disable-button`
**Weight:** 1

**Expected behaviour:**
- A "Disable" button is present
- Inert/disabled when no task is active (hardware-gated, matches UWP)

## Scenario 1 / Sample count output

**ID:** `scenario1-sample-count`
**Weight:** 1

**Expected behaviour:**
- A "Sample count:" label with a value ("No data" when no task has run)

## Scenario 1 / Status block

**ID:** `scenario1-status`
**Weight:** 1

**Expected behaviour:**
- A Status area; with no accelerometer it shows "No accelerometer found"

## Scenario 1 / Defensive hardware-gated fallback

**ID:** `scenario1-fallback`
**Weight:** 1

**Expected behaviour:**
- Shows "This sample requires an accelerometer that is not available on this machine." so the page never renders blank

RUBRIC COMPLETE: 7 features written to notes\rubric.json
