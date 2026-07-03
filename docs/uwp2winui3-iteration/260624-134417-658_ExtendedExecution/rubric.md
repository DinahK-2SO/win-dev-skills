# UWP Rubric — ExtendedExecution

**Scenario:** ExtendedExecution
**UWP capture status:** partial — the original UWP app launched successfully (Release,
PID 25316, window "Extended Execution C# Sample") and its scenario‑1 initial frame was
captured. Per‑scenario navigation and control actuation of the *UWP* could not be driven
because the UWP CoreWindow exposes no content subtree to UI Automation on this host, and
the agent shell has no interactive desktop (synthetic mouse input to the CoreWindow did
not register). Scenarios 2–4 golden state is derived from source; every scenario page is
structurally identical to scenario 1 apart from its description text and button labels.

## Shell / Scenario navigation list

**ID:** `nav-scenario-list`
**Weight:** 2

Left‑hand list under the "Extended Execution" header offering the four scenarios.

**Expected behaviour:**
- List shows exactly 4 items with the verbatim `1) `…`4) ` prefixed titles.
- Clicking an item navigates the content frame to the matching page.

**UWP reference screenshot:**
![nav](screenshots/01_Unspecified_Reason.png)

## Scenario 1 / Unspecified Reason page content

**ID:** `s1-unspecified-page`
**Weight:** 2

Description header, "Unspecified reason", explanatory paragraph, `Begin extended
execution` button, disabled `End extended execution` button, and
"Extended execution: Not requested" status.

**Expected behaviour:**
- RequestButton "Begin extended execution" is enabled.
- CloseButton "End extended execution" is disabled.
- Status text reads "Extended execution: Not requested".

**UWP reference screenshot:**
![s1](screenshots/01_Unspecified_Reason.png)

## Scenario 1 / Begin extended execution request

**ID:** `s1-begin-behavior`
**Weight:** 1

Clicking "Begin extended execution" requests an ExtendedExecutionSession
(Reason = Unspecified). On a desktop the request is Denied, so the status message shows
"Extended execution denied." and the buttons stay in their initial state.

**Expected behaviour:**
- Clicking RequestButton triggers RequestExtensionAsync.
- On Denied result the notification status shows "Extended execution denied.".
- RequestButton stays enabled, CloseButton stays disabled (no session held).

**UWP reference screenshot:**
![s1](screenshots/01_Unspecified_Reason.png)

## Scenario 2 / Saving Data Reason page content

**ID:** `s2-savingdata-page`
**Weight:** 1

Description‑only page for the "SavingData" reason. There are **no** Begin/End buttons in
the source — only the description header, "Saving Data Reason" text, an explanatory
paragraph, and README instructions.

**Expected behaviour:**
- Page shows the SavingData description paragraph.
- No Begin/End buttons are present (matches source).

**UWP reference screenshot:**
_UWP screenshot not captured (UWP nav could not be driven; state derived from source)._

## Scenario 3 / Location Tracking Reason page content

**ID:** `s3-location-page`
**Weight:** 1

Description header, "Location Tracking Reason" text, explanatory paragraph, Begin/End
buttons, and status.

**Expected behaviour:**
- RequestButton "Begin extended execution" enabled; CloseButton disabled.
- Status reads "Extended execution: Not requested".
- Clicking Begin yields the correct Allowed/Denied status update.

**UWP reference screenshot:**
_UWP screenshot not captured (UWP nav could not be driven; state derived from source)._

## Scenario 4 / Using Multiple Tasks page content

**ID:** `s4-multipletasks-page`
**Weight:** 1

Description header, "Using Extended Execution with Multiple Tasks", explanatory
paragraph, a "Begin extended execution and Tasks" button, a disabled "End extended
execution and Tasks" button, and status.

**Expected behaviour:**
- RequestButton labelled "Begin extended execution and Tasks" enabled.
- CloseButton labelled "End extended execution and Tasks" disabled.
- Status reads "Extended execution: Not requested".

**UWP reference screenshot:**
_UWP screenshot not captured (UWP nav could not be driven; state derived from source)._

## Shell / Status notification bar (NotifyUser)

**ID:** `status-notification-bar`
**Weight:** 1

Shared StatusBlock/StatusBorder at the bottom of the shell displays messages raised by
scenario handlers.

**Expected behaviour:**
- StatusBlock text updates when a scenario calls NotifyUser.
- After a denied request it reads "Extended execution denied.".

**UWP reference screenshot:**
![shell](screenshots/01_Unspecified_Reason.png)
