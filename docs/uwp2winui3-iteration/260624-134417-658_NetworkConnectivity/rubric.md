# Parity Rubric — NetworkConnectivity (feature: NetworkingConnectivity)

Ground truth: original UWP C# sample at `Samples/NetworkConnectivity/cs`.
The migrated WinUI 3 scenario code-behind is byte-identical to the UWP source
(only `Windows.UI.Xaml` → `Microsoft.UI.Xaml` namespace swaps).

## Scenario 1 — Query network connectivity
- **Controls:** `OptedInToNetworkUsageToggle` (ToggleSwitch), `Check network connectivity` (Button)
- **Output:** `ResultsText`
- **Expected:** Button writes `Current connectivity is <level>.`; if connected, evaluates cost/connect, else `Not attempting to connect to the Internet.`

## Scenario 2 — Get network cost information
- **Controls:** `Get network cost` (Button)
- **Output:** `ResultsText`
- **Expected:** Button writes `Network cost is <type>.` + app-behavior recommendation, or `No internet connection profile.`

## Scenario 3 — Listen to connectivity changes
- **Controls:** `OptedInToNetworkUsageToggle` (ToggleSwitch), `RegisterUnregisterButton` (Button)
- **Output:** `ResultsText`
- **Expected:** Register subscribes to `NetworkStatusChanged`, flips label to Unregister, logs registration + current connectivity.
