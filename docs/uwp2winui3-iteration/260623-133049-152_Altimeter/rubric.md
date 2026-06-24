# UWP Feature Rubric — Altimeter

**Capture status:** partial. The original UWP app launched (`uwp-app-runner` `ok:true`,
windowTitle "Altimeter C# Sample") and rendered correctly. The initial **Data Events**
frame is valid ground truth. The UWP **CoreWindow** UIA subtree is not externally
traversable (winapp inspect returns only a top-level `Pane` with no children), so
title-driven navigation to **Polling** and per-control actuation could not be driven via
UI Automation — the Polling golden therefore still shows the Data Events page and the
`__aNN` after-click frames are duplicates. The sensor is hardware-gated on this machine
(status reads "No altimeter found"), but the UWP app still renders all scenario controls.

## Shell / Scenario navigation list

**ID:** `scenario-navigation`
**Weight:** 1

Left-hand list switches scenarios: "1) Data Events" and "2) Polling".

**Expected behaviour:**
- A selectable list shows "1) Data Events" and "2) Polling"
- Selecting an item navigates the content pane to that scenario

**UWP reference screenshot:**
![scenario-navigation](screenshots/01_Data_Events.png)

## Scenario 1 - Data Events / Enable button

**ID:** `data-events-enable`
**Weight:** 2

The Enable button registers an altimeter ReadingChanged handler.

**Expected behaviour:**
- An "Enable" button is visible and enabled on the Data Events page
- A "Disable" button is visible (disabled until Enable is clicked)
- Clicking Enable wires up the altimeter event handler (or reports "No altimeter found")

**UWP reference screenshot:**
![data-events-enable](screenshots/01_Data_Events.png)

## Scenario 1 - Data Events / Disable button

**ID:** `data-events-disable`
**Weight:** 1

The Disable button unsubscribes and re-enables Enable.

**Expected behaviour:**
- A "Disable" button is visible on the Data Events page
- Clicking Disable unsubscribes and re-enables the Enable button

**UWP reference screenshot:**
![data-events-disable](screenshots/01_Data_Events.png)

## Scenario 1 - Data Events / Altitude change output

**ID:** `data-events-output`
**Weight:** 1

Text block "Altitude change(m):" with live value ("No data" before any reading).

**Expected behaviour:**
- An "Altitude change(m):" label with a value field is visible
- It updates as ReadingChanged events arrive

**UWP reference screenshot:**
![data-events-output](screenshots/01_Data_Events.png)

## Scenario 2 - Polling / Get Data button

**ID:** `polling-getdata`
**Weight:** 2

"Get Data" reads the altimeter once and displays the current altitude change.

**Expected behaviour:**
- A "Get Data" button is visible on the Polling page
- Clicking it reads the altimeter once and updates the altitude output (or reports "No altimeter found")

**UWP reference screenshot:**
_UWP screenshot not captured (CoreWindow UIA not traversable, so nav to Polling could not be driven)._

## Shell / Status output region

**ID:** `status-bar`
**Weight:** 1

Bottom status region shows "Status:" plus a colored message (e.g. "No altimeter found").

**Expected behaviour:**
- A "Status:" region is visible
- It reflects the current scenario state / error

**UWP reference screenshot:**
![status-bar](screenshots/01_Data_Events.png)
