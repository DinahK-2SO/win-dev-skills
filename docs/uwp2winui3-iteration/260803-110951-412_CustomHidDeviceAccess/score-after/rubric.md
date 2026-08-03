# CustomHidDeviceAccess — Parity Rubric

HID sample. Scenarios 2–4 are gated on a connected SuperMUTT HID device: the UWP
sample keeps the `SuperMuttScenario` panel collapsed and shows a not-connected status
until a device is attached. With no hardware present on the test machine, a faithful
WinUI 3 migration must reproduce that exact gated state. Behavioral actuation of the
gated buttons is impossible in **both** apps without hardware, so those scenarios are
judged on structural presence + correct fallback rather than live output.

| # | Scenario | Key controls | Gated | Expected (no device) |
|---|----------|--------------|-------|----------------------|
| 1 | Connecting To Device | Connect / Disconnect buttons, device ListBox, Status | No | Buttons + list visible, "No devices currently selected" |
| 2 | Feature Reports | Get/Set Led Blink Pattern, ComboBox 0-7 | Yes | "Device is not connected" fallback |
| 3 | Input Report Events | Register / Unregister buttons | Yes | "Device is not connected" fallback |
| 4 | Input and Output Reports | Send/Get Numeric + Boolean reports, ComboBoxes | Yes | "Device is not connected" fallback |
