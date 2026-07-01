# Rubric — CustomHidDeviceAccess (UWP → WinUI 3)

Ground truth: the **original UWP app** launched successfully (Release, pid 18220,
windowTitle `Custom HID Device Access C# UAP`) and rendered its full UI. That live
capture (`parity/baseline/screenshots/`) is what the migrated app is graded against.

| # | Scenario | Expected UI (from UWP golden) |
|---|----------|-------------------------------|
| 1 | Connecting To Device | Description, **Connect to device** btn, **Disconnect from device** btn, device ListView, status bar |
| 2 | Feature Reports | Description, feature-report read/write controls, status bar |
| 3 | Input Report Events | Description, register/unregister input-report-event controls, status bar |
| 4 | Input and Output Reports | Description, read-input / write-output report controls, status bar |

> Note: `Extract-UwpFeatureChecklist.ps1` found 4 scenarios but **0 controls/actions**
> each, so the structural coverage gate is trivially satisfied and non-diagnostic. The
> authoritative comparison is **visual** (UWP golden screenshot vs WinUI screenshot).
