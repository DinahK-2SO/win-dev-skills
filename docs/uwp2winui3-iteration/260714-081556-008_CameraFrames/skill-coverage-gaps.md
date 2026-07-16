# Skill coverage gaps: CameraFrames

## 1. Defensive-UI fallback renders the device-unavailable message twice
- **Problem:** the "camera not available" message shows twice — a fixed orange headline TextBlock plus a dynamic detail TextBlock set to the identical string.
- **Evidence:** `Scenario1_DisplayDepthColorIR.xaml:49` (static headline) + `.xaml.cs:102` `ShowFallback("This sample requires a camera device...")` → `FallbackMessage.Text` (`.xaml.cs:227`). See `discrepancies.json` id `s1-duplicate-fallback-message`.
- **Covered at:** SKILL.md → Critical Rules → **Defensive UI for device-dependent features** ("a centred TextBlock saying '...' plus the exception's Message underneath").
- **Why missed:** under-emphasized / ambiguous — the rule pairs a fixed headline with an exception-message line but never states the detail line is **exception-only**. On the common no-hardware path the device list returns empty (no exception), so the agent repeated the headline into the detail line.
- **Proposed improvement:** state that the headline renders **once** and the optional detail line comes **only** from the caught exception's `Message` (empty when there is no exception, e.g. the empty-list case). Don't hardcode the headline in XAML and also re-emit it dynamically.
- **Generalizes:** applies to every device-dependent page (camera/mic/location/sensors/Bluetooth/NFC) in every scenario; the no-device path is the default in the no-hardware validation environment, so this recurs broadly.
