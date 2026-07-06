# UWP Parity Rubric — Bluetooth Rfcomm Chat Sample

Ground-truth feature list derived from the original UWP source
(`...\Samples\BluetoothRfcommChat\cs`) and confirmed against the live UWP app.
Each scenario is graded pass / partial / fail on the migrated WinUI 3 app using
structural control coverage (UIA tree) **plus** behavioral actuation and textual
output evidence.

## Scenario 1 — Chat Client
- **Purpose:** Enumerate known Bluetooth RFCOMM chat services and connect to the selected one.
- **Controls (8):** `RunButton` (Start), `ConnectButton` (Connect to Selected Device),
  `RequestAccessButton` (Collapsed until needed), `resultsListView`,
  `DisconnectButton`, `MessageTextBox`, `SendButton`, `ConversationList`.
- **Visibility gating:** `RequestAccessButton` and the whole `ChatBox` grid
  (`DisconnectButton`, `MessageTextBox`, `SendButton`, `ConversationList`) start
  `Collapsed` and only appear after a device connection — **identical in the UWP source.**
- **Pass criteria:** Page renders; Start begins device enumeration; Connect validates
  selection; collapsed chat controls present and wired to their handlers.

## Scenario 2 — Foreground Chat Server
- **Purpose:** Advertise an RFCOMM chat server in the foreground; on client connect,
  exchange messages.
- **Controls (4):** `DisconnectButton`, `MessageTextBox`, `SendButton`, `ConversationListBox`.
- **Pass criteria:** Page renders with "Start Listening" + message UI; message controls
  present. Send/Disconnect require a connected client (hardware-gated) in both apps.

## Scenario 3 — Background Chat Server
- **Purpose:** Same chat server via a background task (`RfcommServerTask`).
- **Controls (4):** `DisconnectButton`, `MessageTextBox`, `SendButton`, `ConversationListBox`.
- **Pass criteria:** Page renders; message controls present; Send handler fires.

## Scoring
`score = round(100 * (pass + 0.5*partial) / features_total)`
