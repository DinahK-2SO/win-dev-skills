# Parity Rubric - Accelerometer

Feature: **Accelerometer C# Sample** (6 scenarios)

| # | Scenario | Controls | Actions |
|---|----------|----------|---------|
| 1 | Choose accelerometer | accelerometer selector combo box | (none) |
| 2 | Data events | Enable, Disable | Enable, Disable |
| 3 | Shake events | Enable, Disable | Enable, Disable |
| 4 | Polling | Enable, Disable | Enable, Disable |
| 5 | Orientation change | Enable, Disable | Enable, Disable |
| 6 | Data events batching | Enable, Disable | Enable, Disable |

**Hardware note:** No accelerometer device is present on this machine. Both the UWP golden
and the WinUI 3 app show `Standard accelerometer not found` and keep Enable/Disable
disabled. A non-responding action button is therefore *expected parity*, not a defect.
