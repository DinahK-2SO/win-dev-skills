# Parity Discrepancies — DatagramSocket (UWP → WinUI 3)

Compared the migrated WinUI 3 app against the original UWP golden (live) and the
UWP source ground truth. **No discrepancies found.**

## Ground-truth controls (from UWP source) vs WinUI 3 UIA tree

| Scenario | UWP controls (source) | Present in WinUI 3 UIA | Verdict |
|---|---|---|---|
| 1. Start Datagram Listener | ServiceNameForListener, InboundBufferSize, BindToAny, BindToAddress, BindToAdapter, AdapterList, StartListener | all 7 present | pass |
| 2. Connect to Listener | HostNameForConnect, ServiceNameForConnect, DontFragment, ConnectSocket | all 4 present | pass |
| 3. Send Data | SendHello, SendOutput | both present | pass |
| 4. Close Socket | CloseSockets | present | pass |
| 5. Multicast/Broadcast | MulticastRadioButton, Broadcast, ServiceName, RemoteAddress, StartListener, SendMessageButton, CloseListenerButton, SendOutput | all present | pass |

## Behavioral verification

- **Scenario 1 — Listen**: Invoking `StartListener` produced a live green
  `Status: Listening` banner (see `parity/winui3/screenshots/01__a01_listen.png`).
  The socket actually bound and started listening — the control is **live**, not dead.
- Remaining action buttons (Connect, Send, Close, multicast Start/Send/Close) depend on
  a prior socket/connection and could not each be exercised end-to-end in this
  non-interactive session, but all are wired to real handlers in the migrated
  code-behind (verified in source) and structurally present + enabled.

## Visual fidelity

Side-by-side of the UWP golden (Scenario 1, `parity/baseline/screenshots/01_*.png`)
and the WinUI 3 captures shows faithful layout: same scenario list, same labels,
default text (22112 / 22113), radio/toggle/combo/button arrangement. Chrome differs
(WinUI NavigationView vs UWP ListBox split-view) as expected for a framework migration;
titles are verbatim.

## Notes on measurement limits

- The UWP golden for scenarios 2–5 could not be captured as distinct frames: the legacy
  UWP CoreWindow exposes no child UIA elements and synthetic input did not reach it in
  this non-interactive session, so only Scenario 1 rendered its content. This is a
  property of the legacy app on this host, **not** a migration defect. Ground truth for
  scenarios 2–5 was taken from the UWP source XAML instead.
- The auto-extracted `checklist.json` reported 0 controls per scenario (the extractor did
  not parse the separate `ScenarioN_*.xaml` pages), so `Compare-Parity` coverage shows
  `n/a`; structural coverage was confirmed manually from the WinUI UIA dumps above.
