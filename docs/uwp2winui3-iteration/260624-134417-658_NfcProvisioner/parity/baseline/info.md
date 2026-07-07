# NfcProvisioner — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Provision Peer Device

- **Screenshot:** `screenshots/01_Provision_Peer_Device.png`
- **Page class:** `Scenario1`
- **UI elements:**
  - Button, label="Browse", events=Click
  - Button, label="Transfer", events=Click
  - Button, label="Cancel Transfer", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Browse "Browse" (Button)
  - Transfer "Transfer" (Button)
  - Cancel Transfer "Cancel Transfer" (Button)
- **Output elements:** StatusBlock, StatusBorder

