# Skill coverage gaps — BasicMediaCasting (WILL change skill)

## 1. CastingDevicePicker / DevicePicker not named in the InitializeWithWindow list
- **Covered at:** MIGRATION-PATTERNS.md "Pickers and Win32 Surfaces" (#pickers, lines 266-279) —
  documents `InitializeWithWindow.Initialize(obj, hwnd)` and lists file/folder pickers,
  DataTransferManager, PrintManager, then a vague "and other UI surfaces that target a window".
- **Why missed:** under-emphasized — the `Show(rect, placement)`-style device/casting pickers are
  left to the catch-all instead of being named.
- **Evidence:** Scenario2 constructor adds `InitializeWithWindow.Initialize(picker, hwnd)` for a
  `CastingDevicePicker` (lines 24-26) before `picker.Show(...)` (line 62); session-log 2718.
- **Improvement:** add `CastingDevicePicker` and `DevicePicker` to the explicit surfaces list.
- **Generalizes:** any casting / device-selection UWP app needs this HWND init or hits a runtime
  COMException the build cannot see.
