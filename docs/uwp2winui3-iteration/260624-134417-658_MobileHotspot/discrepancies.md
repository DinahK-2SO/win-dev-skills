# Discrepancies — MobileHotspot (UWP → WinUI 3)

Measured with both apps launched on a machine **without Wi-Fi tethering capability**,
so `HotspotPanel` is collapsed (hardware-gated) in **both** apps and no feature control
is exposed/actuable in either. Findings come from live UIA inspection + source review.

## D1 — `Apply changes` drops the SSID assignment  (major)
**Scenario 1 – Configure Mobile Hotspot.** The UWP `ApplyChanges_Click` sets both
`configuration.Ssid = SsidTextBox.Text` **and** `configuration.Passphrase =
PassphraseTextBox.Text` before `ConfigureAccessPointAsync`. The migrated WinUI handler
**omits the `configuration.Ssid = SsidTextBox.Text;` line** (only Passphrase / Band /
AuthenticationKind are applied). Editing the SSID and pressing *Apply changes* would
silently fail to persist the new SSID. Not observable at runtime here (gated), but a
real behavioral fidelity defect.
- UWP: `cs/Scenario1_ConfigureMobileHotspot.xaml.cs:100-101`
- WinUI: `app/MobileHotspot/Scenario1_ConfigureMobileHotspot.xaml.cs:106-107`

## D2 — Gated status text differs  (minor)
The UWP app shows the capability-specific message **"This app is not configured to
access Wi-Fi devices on this machine."** (SampleConfiguration `DisabledBySystemCapability`
path, graceful `null` return). The WinUI app shows the generic **"This sample could not
initialize on this machine. &lt;ex&gt;"** from the added `OnNavigatedTo` try/catch — i.e.
the migrated `Helpers` threw before reaching the graceful capability path. Both render a
red error status (feature unavailable), so the *behavioral outcome is equivalent*; only
the wording differs. The correct message string is preserved in the migrated `Helpers`
source.

## D3 — WinUI screenshots capture blank  (instrument limitation, not a defect)
`winapp` screenshots of the WinUI 3 window are blank/white in every mode (window BitBlt
and `--capture-screen`) — the known WinUI3 DirectX-swapchain vs GDI-capture issue in
this environment. The live UIA tree (29 elements) confirms the full frame, nav list
(correct titles), description, and gated status are all present and correctly laid out.
Conversely the UWP CoreWindow is not UIA-traversable (golden UIA dumps contain only a
single `CoreWindow` Pane), so per-scenario nav could not be driven in the UWP app and
its golden frames are all the launch frame.
