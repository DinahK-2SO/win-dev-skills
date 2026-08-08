# XamlDeferLoadStrategy discrepancies

- **Navigation — wrong text:** All three migrated navigation items display `SDKTemplate.Scenario` instead of `Basic Deferral`, `Adaptive Deferral`, and `Control Template Deferral`.
- **Adaptive Deferral — unreachable:** Navigation fails and the capture remains on Basic Deferral. `AccountsList`, `MailList`, `Send`, and `Body` are absent from the UIA tree.
- **Control Template Deferral — unreachable:** Navigation fails and the captured frame shows Basic Deferral rather than the Rainier and valley `TitledImage` examples.
- **UWP baseline limitation:** The runner returned `ok:true`, but every saved UWP scenario frame shows only the splash screen; exact pixel-level layout comparison was unavailable.
