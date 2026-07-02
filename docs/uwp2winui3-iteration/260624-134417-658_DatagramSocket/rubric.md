# Parity Rubric — DatagramSocket (UWP → WinUI 3)

Ground-truth control list derived from the UWP source, used to grade the migrated
WinUI 3 app. A scenario passes when every listed control is present with the correct
label / default value and is wired to its handler.

## Scenario 1 - Start Datagram Listener
- `ServiceNameForListener` (TextBox) — default `22112`
- `InboundBufferSize` (TextBox) — numeric, empty
- `BindToAny` (RadioButton) — "Bind to any address", default selected
- `BindToAddress` (RadioButton) — "Bind to specific address (select from below list of IPv4 or IPv6)"
- `BindToAdapter` (RadioButton) — "Bind to adapter (select an adapter based on the GUIDs below)"
- `AdapterList` (ComboBox) — disabled
- `StartListener` (Button) — "Listen"

## Scenario 2 - Connect to Listener
- `HostNameForConnect` (TextBox) — "localhost", disabled
- `ServiceNameForConnect` (TextBox) — default `22112`
- `DontFragment` (ToggleSwitch) — "Don't fragment flag"
- `ConnectSocket` (Button) — "Connect"

## Scenario 3 - Send Data
- `SendHello` (Button) — "Send 'hello'"
- `SendOutput` (TextBlock) — status output

## Scenario 4 - Close Socket
- `CloseSockets` (Button) — "Close"

## Scenario 5 - Multicast/Broadcast
- `MulticastRadioButton` (RadioButton) — "Multicast"
- Broadcast (RadioButton) — "Broadcast"
- `ServiceName` (TextBox) — default `22113`
- `RemoteAddressLabel` (TextBlock) — "Multicast Group:" (set in code)
- `RemoteAddress` (TextBox) — "224.3.0.5" (set in code)
- `StartListener` (Button) — "Start listener and join multicast group" (set in code)
- `SendMessageButton` (Button) — "Send 'hello'"
- `CloseListenerButton` (Button) — "Close Listener"
- `SendOutput` (TextBlock) — status output
