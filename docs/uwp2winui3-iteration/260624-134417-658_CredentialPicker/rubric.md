# CredentialPicker — Parity Rubric

Ground truth: original UWP sample `Samples/CredentialPicker/cs`, 3 scenarios.

## Scenario 1 — Message (9 controls)
Message (`Enter your credentials`), Target (`contoso.com`), **Launch**, Domain, Username,
Password, CredentialSaved, CheckboxState, Status.
Launch calls `CredentialPicker.PickAsync(target, message)` and writes the returned
credential fields + status.

## Scenario 2 — Message+Caption (10 controls)
Adds **Caption** (`WindowCaption`). Launch calls `PickAsync(target, message, caption)`.

## Scenario 3 — CredentialPickerOptions (14 controls)
Adds **SaveCheckboxSelection** (ComboBox), **ProtocolSelection** (ComboBox),
**CustomProtocol** (TextBox), **AlwaysShowDialog** (CheckBox). Launch builds a
`CredentialPickerOptions` and calls `PickAsync(options)`.

## Grading
- **pass** — reachable, full control coverage, faithful content & wired behavior.
- **partial** — recognizable but missing controls or a control dead vs. the UWP golden.
- **fail** — blank/unreachable page or a dropped scenario.
