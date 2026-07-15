# UWP Feature Rubric — BluetoothAdvertisement

**UWP capture status:** _partial_ — The original UWP app launched successfully via
`uwp-app-runner` (`ok:true`, pid 10540, windowTitle "Bluetooth Advertisement C# Sample").
However, the legacy UWP **CoreWindow** UIA tree is opaque to `winapp` (inspect/search return
0 interior elements) and synthetic input could not switch the ListBox scenarios. Only
**Scenario 1** (initial view) was captured as a genuine golden; Scenarios 2–4 could not be
navigated in the UWP. Behavioral expectations for Scenarios 3–4 are derived from the UWP
source (explicit `NotifyUser` calls).

## Bluetooth Low Energy Advertisement / Scenario 1 - Foreground watcher

**ID:** `foreground-watcher`
**Weight:** 2

Foreground BLE advertisement watcher: two PHY/optimization checkboxes, Run/Stop buttons, a
received-advertisement ListBox, and a status area.

**Expected behaviour:**
- Run starts the watcher and updates the status text
- Stop stops the watcher and updates the status text
- Both checkboxes present (disabled/annotated when unsupported)
- Received advertisements list present

**UWP reference screenshot:**
![foreground-watcher](screenshots/01_Foreground_watcher.png)

## Bluetooth Low Energy Advertisement / Scenario 2 - Foreground publisher

**ID:** `foreground-publisher`
**Weight:** 2

Foreground BLE advertisement publisher: one checkbox, Run/Stop buttons, published-payload
text, and status.

**Expected behaviour:**
- Run starts the publisher and updates status (on a radio-less machine reports an
  aborted/RadioNotAvailable status)
- Stop stops the publisher and updates status
- Published payload information displayed

**UWP reference screenshot:**
_UWP screenshot not captured (CoreWindow UIA opaque; scenario nav not drivable)._

## Bluetooth Low Energy Advertisement / Scenario 3 - Background watcher

**ID:** `background-watcher`
**Weight:** 1

Background BLE watcher via BackgroundTaskBuilder + WatcherTrigger.

**Expected behaviour:**
- Run registers the background task and updates status with a success or explicit error
  message (the UWP source always `NotifyUser`s one of three outcomes)
- Stop unregisters and updates status
- Checkboxes and received-advertisement list present

**UWP reference screenshot:**
_UWP screenshot not captured (CoreWindow UIA opaque; scenario nav not drivable)._

## Bluetooth Low Energy Advertisement / Scenario 4 - Background publisher

**ID:** `background-publisher`
**Weight:** 1

Background BLE publisher via BackgroundTaskBuilder + PublisherTrigger.

**Expected behaviour:**
- Run registers the background publisher task and updates status with a success or explicit
  error message
- Stop unregisters and updates status
- Published payload information displayed

**UWP reference screenshot:**
_UWP screenshot not captured (CoreWindow UIA opaque; scenario nav not drivable)._
