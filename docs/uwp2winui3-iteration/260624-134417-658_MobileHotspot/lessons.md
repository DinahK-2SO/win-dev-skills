# Lessons — MobileHotspot (UWP → WinUI 3)

Score **75** (feature 1 partial, feature 2 pass). Build succeeded; both scenarios
hardware-gated in UWP and WinUI alike. Only two real fidelity findings, both in
code-behind.

## Dev-agent struggles (high value)

### 1. Surgical edit silently deleted a logic statement (→ D1, cost the point)
`Scenario1_ConfigureMobileHotspot.xaml.cs / ApplyChanges_Click`. The agent's
string-replace intended **only** to add a `!` null-forgiving operator to
`m_tetheringManager`, but its `old_str` swept in the next line and the `new_str`
dropped it:

- `old_str`: `... GetCurrentAccessPointConfiguration();\n\n    configuration.Ssid = SsidTextBox.Text;`
- `new_str`: `... GetCurrentAccessPointConfiguration();`  ← **assignment deleted**

Result: an edited SSID would not persist. Clean build; neither the compiler nor the
XAML-only verbatim check (Step 4 #8) catches a dropped `.cs` statement.
**Preventable by:** a Fidelity rule that every line in an edit's match window except the
one transformed line must be reproduced verbatim, and the agent should re-read the
replaced block.

### 2. Generic defensive fallback masked the source's specific status message (→ D2, minor)
`Scenario2_ToggleMobileHotspot.xaml.cs / OnNavigatedTo`. The agent correctly added the
skill's Defensive-UI `try/catch`, but the blanket catch's generic *"could not
initialize"* text overrode the source's precise capability message
(*"This app is not configured to access Wi-Fi devices on this machine."*).
Behaviourally equivalent (both red error), verdict pass, minor.
**Preventable by:** Defensive-UI guidance to preserve a source-specific failure message
when the source already surfaces one.

## Tooling
- Bootstrap copied every file verbatim with TODO anchors — good fidelity base.
- Validator's verbatim check covers XAML only → `.cs` logic edits are unguarded.
