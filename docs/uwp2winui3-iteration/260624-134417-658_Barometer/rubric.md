# Parity Rubric — Barometer C# Sample

Ground truth: original UWP app (launched in Release, window title "Barometer C# Sample").

## Scenario 1 — Data Events
- Description text: "Registers an event listener for barometer data and displays the pressure in hPa values as they are reported."
- Controls: **Enable** (Button, enabled by default), **Disable** (Button, disabled by default)
- Output: `hPa: <value>` (shows "No data" until a reading arrives)
- Status bar message

## Scenario 2 — Polling
- Description text: "Polls for barometer data and displays the pressure in hPa values."
- Controls: **Get Data** (Button)
- Output: `hPa: <value>`
- Status bar message

## Common chrome
- Header "Universal Windows Platform sample"
- Title "Barometer C# Sample"
- Navigation list: "1) Data Events", "2) Polling"
- Footer: © Microsoft Corporation, Trademarks, Privacy

## Hardware gate
This machine has **no barometer sensor**. Both the original UWP app and the migrated
WinUI 3 app display **"No barometer found"** and the action buttons produce no live
reading. Dead-on-this-hardware behaviour is identical across both apps, so it does NOT
count as a behavioural regression.
