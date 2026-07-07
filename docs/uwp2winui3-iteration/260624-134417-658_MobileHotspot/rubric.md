# Parity Rubric — MobileHotspot C# Sample

Source: `uwp-samples-standalone/Samples/MobileHotspot/cs`

## Scenario 1 — Configure Mobile Hotspot
UI elements: `SsidTextBox` (TextBox), `PassphraseTextBox` (TextBox), `BandComboBox`
(ComboBox), `AuthenticationComboBox` (ComboBox), **Apply changes** (Button),
**Discard changes** (Button), plus labels and a shared `StatusBlock`.
Actions: click **Apply changes**, click **Discard changes**.

## Scenario 2 — Toggle Mobile Hotspot
UI elements: `MobileHotspotToggle` (ToggleSwitch), info runs `SsidRun` / `PasswordRun`
/ `BandRun` / `AuthenticationRun`, shared `StatusBlock`.
Actions: toggle `MobileHotspotToggle`.

## Hardware gating (critical)
Both scenarios wrap every functional control in a `HotspotPanel` whose
`Visibility="Collapsed"` by default. The panel is made visible only when
`Helpers.TryGetCurrentNetworkOperatorTetheringManager()` returns non-null. On a dev
box with no Wi-Fi tethering capability this returns null (UWP) / throws (WinUI
try/catch), so the panel stays collapsed and **no feature control renders** — in the
UWP original **and** the WinUI migration alike. The visible surface in that state is:
the SDK sample frame, the scenario nav list, the "Description:" text, and a red error
status. Grade the migration against that ground-truth state plus source-level control
and handler fidelity.
