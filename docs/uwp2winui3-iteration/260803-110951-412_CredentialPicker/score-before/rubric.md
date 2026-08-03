# Parity Rubric — CredentialPicker

Ground truth: original UWP `CredentialPicker` C# sample (3 scenarios). Each scenario
has input controls and a **Launch** button that invokes the OS `CredentialPicker`
API, which surfaces a native "Windows Security" credential dialog.

| # | Scenario | Key controls | Action | Expected effect |
|---|----------|--------------|--------|-----------------|
| 1 | Message | Message TextBox, Target TextBox, Launch, Domain/Username/Password outputs, Save By API?, Save Checkbox | Launch | Native credential dialog appears; on OK the returned Domain/User/Password/checkbox fields populate |
| 2 | Message+Caption | Message + Caption TextBoxes, Target, Launch, output fields | Launch | Credential dialog with custom caption; outputs populate |
| 3 | CredentialPickerOptions | Message, Caption, Target, Custom Protocol, Auth protocol combo, Always Show?, Launch, output fields | Launch | Credential dialog honoring options; outputs populate |

Scoring: pass = control present + responds like UWP; partial = present but dead/blank
initial frame; fail = missing/blank-throughout/non-functional.
