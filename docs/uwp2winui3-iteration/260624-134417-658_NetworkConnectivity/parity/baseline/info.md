# NetworkingConnectivity — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Query network connectivity

- **Screenshot:** `screenshots/01_Query_network_connectivity.png`
- **Page class:** `Scenario1_NetworkConnectivity`
- **UI elements:**
  - ToggleSwitch, name=OptedInToNetworkUsageToggle
  - Button, label="Check network connectivity"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_NetworkConnectivity.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - OptedInToNetworkUsageToggle (ToggleSwitch)
  - Check network connectivity "Check network connectivity" (Button)
- **Output elements:** ResultsText, StatusBorder, StatusBlock

## Scenario 2 - Get network cost information

- **Screenshot:** `screenshots/02_Get_network_cost_information.png`
- **Page class:** `Scenario2_NetworkCost`
- **UI elements:**
  - Button, label="Get network cost"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_NetworkCost.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get network cost "Get network cost" (Button)
- **Output elements:** ResultsText, StatusBorder, StatusBlock

## Scenario 3 - Listen to connectivity changes

- **Screenshot:** `screenshots/03_Listen_to_connectivity_changes.png`
- **Page class:** `Scenario3_NetworkConnectivityChanges`
- **UI elements:**
  - ToggleSwitch, name=OptedInToNetworkUsageToggle
  - Button, name=RegisterUnregisterButton
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_NetworkConnectivityChanges.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - OptedInToNetworkUsageToggle (ToggleSwitch)
  - RegisterUnregisterButton (Button)
- **Output elements:** EventStatusText, ResultsText, StatusBorder, StatusBlock

