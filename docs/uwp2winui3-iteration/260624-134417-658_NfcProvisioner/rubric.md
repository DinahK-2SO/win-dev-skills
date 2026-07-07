# Rubric — NfcProvisioner

Ground truth derived from the original UWP source
(`...\Samples\NfcProvisioner\cs\Scenario1.xaml`) and confirmed against the live UWP app.

## Scenario 1 — Provision Peer Device

| Control | Type | Initial visibility | Behavior expected |
|---|---|---|---|
| Browse (`BrowseButton`) | Button | Visible | Opens a file picker filtered to `.ppkg`; puts the chosen path in `ProvisioningPackagePathText`. |
| Transfer (`TransferButton`) | Button | **Collapsed** | Revealed after a package is chosen and an NFC/proximity peer is present; starts the NFC transfer. |
| Cancel Transfer (`CancelTransferButton`) | Button | **Collapsed** | Revealed during an active transfer; cancels the publish. |

Inputs: `ProvisioningPackagePathText` (read-only TextBox).
Outputs: `StatusBlock` (TextBlock status messages), `ErrorBorder` (red error border).

### Notes
- `Transfer` and `Cancel Transfer` are `Visibility="Collapsed"` in the source and are
  **hardware/state gated** (need a selected package + an NFC proximity device). Neither
  the UWP golden nor the WinUI candidate exposes them in an initial-state capture, so
  their absence from the initial UIA tree is **not** a migration defect.
- Only `Browse` is exercisable without NFC hardware.
